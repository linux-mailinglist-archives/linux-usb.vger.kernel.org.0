Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD324A76B8
	for <lists+linux-usb@lfdr.de>; Wed,  2 Feb 2022 18:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239915AbiBBRVH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Feb 2022 12:21:07 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:48973 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiBBRVG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Feb 2022 12:21:06 -0500
Received: (qmail 12763 invoked by uid 484); 2 Feb 2022 17:21:05 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.064593 secs); 02 Feb 2022 17:21:05 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 2 Feb 2022 17:21:04 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 1/1] usb: gadget: f_fs: Support zerocopy transfers via mmap.
Date:   Wed,  2 Feb 2022 18:20:56 +0100
Message-Id: <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202172056.44722-1-ingo.rohloff@lauterbach.com>
References: <20220202172056.44722-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch implements the same functionality for FunctionFS as
commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
did for USB host devio.c

For FunctionFS, each "struct file *" for an endpoint (except EP0), keeps
a list of mmapped buffers. User space might use these buffers to avoid
copying of data by the kernel, by employing Linux native AsyncIO via
libaio.

Standard read() and write() operations will NOT be zerocopy.
Especially for reads, the expected USB transfer length is unclear;
whereas an AIO request clearly specifies the maximum transfer length.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 269 ++++++++++++++++++++++++++++-
 drivers/usb/gadget/function/u_fs.h |   4 +
 2 files changed, 267 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 7461d27e9604..a2e46704426f 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -201,6 +201,23 @@ struct ffs_epfile {
 	unsigned char			_pad;
 };
 
+struct ffs_ep_listener {
+	struct ffs_epfile *epfile;
+	struct list_head ffsm_list;
+	spinlock_t       ffsm_lock;
+};
+
+struct ffs_memory {
+	struct list_head memlist;
+	struct ffs_ep_listener *listener;
+	char *kmem;
+	unsigned long vm_start;
+	u32 size;
+
+	int vma_use_count;
+	int aio_use_count;
+};
+
 struct ffs_buffer {
 	size_t length;
 	char *data;
@@ -227,6 +244,7 @@ struct ffs_io_data {
 	bool use_sg;
 
 	struct ffs_data *ffs;
+	struct ffs_memory *ffsm;
 };
 
 struct ffs_desc_helper {
@@ -702,6 +720,200 @@ static const struct file_operations ffs_ep0_operations = {
 	.poll =		ffs_ep0_poll,
 };
 
+/* Handling of mmapped transfers *******************************/
+
+/* Check whether it's okay to allocate more memory for mmap */
+static int ffsm_increase_mmap_mem_usage(struct ffs_data *ffs, u64 amount)
+{
+	u64 lim;
+
+	lim = READ_ONCE(ffs->mmap_memory_mb);
+	lim <<= 20;
+
+	atomic64_add(amount, &ffs->mmap_mem_usage);
+
+	if (lim > 0 && atomic64_read(&ffs->mmap_mem_usage) > lim) {
+		atomic64_sub(amount, &ffs->mmap_mem_usage);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Memory for mmap is being deallocated */
+static void ffsm_decrease_mmap_mem_usage(struct ffs_data *ffs, u64 amount)
+{
+	atomic64_sub(amount, &ffs->mmap_mem_usage);
+}
+
+static char *ffsm_is_mmapped(
+	struct ffs_ep_listener *listener,
+	struct ffs_io_data *io_data,
+	ssize_t data_len
+)
+{
+	struct iov_iter *i = &io_data->data;
+	struct ffs_memory *ffsm;
+	char *data;
+	unsigned long user_data_start;
+
+	// direct transfer into user memory only allowed for
+	// * AIO    (Async IO via libaio)
+	// * IOVEC  (must be an IO vector)
+	// * Single AIO transfers (NOT for PREADV, PWRITEV)
+	// * Transfer size must not have been modified
+	if (!io_data->aio)
+		return NULL;
+	if (!iter_is_iovec(i))
+		return NULL;
+	if (i->nr_segs != 1)
+		return NULL;
+	if (i->iov->iov_len != data_len)
+		return NULL;
+
+	// Now check if this is an mmapped segment
+	data = NULL;
+	user_data_start = (unsigned long)i->iov->iov_base;
+
+	spin_lock_irq(&listener->ffsm_lock);
+	list_for_each_entry(ffsm, &listener->ffsm_list, memlist) {
+		if (
+			user_data_start >= ffsm->vm_start &&
+			user_data_start < ffsm->vm_start + ffsm->size
+		) {
+			if (
+				data_len <= ffsm->vm_start + ffsm->size -
+					user_data_start
+			) {
+				ffsm->aio_use_count++;
+				data  = ffsm->kmem;
+				data += user_data_start - ffsm->vm_start;
+				io_data->ffsm   = ffsm;
+				io_data->use_sg = false;
+			}
+			break;
+		}
+	}
+	spin_unlock_irq(&listener->ffsm_lock);
+	return data;
+}
+
+static void ffsm_dec_use_count(struct ffs_memory *ffsm, int *count)
+{
+	struct ffs_ep_listener *listener = ffsm->listener;
+	size_t size;
+	unsigned long flags;
+	struct ffs_data *ffs;
+
+	spin_lock_irqsave(&listener->ffsm_lock, flags);
+	*count = *count - 1;
+	if (ffsm->aio_use_count != 0 || ffsm->vma_use_count != 0) {
+		spin_unlock_irqrestore(&listener->ffsm_lock, flags);
+		return;
+	}
+
+	list_del(&ffsm->memlist);
+	spin_unlock_irqrestore(&listener->ffsm_lock, flags);
+
+	ffs = listener->epfile->ffs;
+	size = ffsm->size;
+	kfree(ffsm->kmem);
+	kfree(ffsm);
+	ffsm_decrease_mmap_mem_usage(ffs, size + sizeof(struct ffs_memory));
+}
+
+static void ffsm_vm_open(struct vm_area_struct *vma)
+{
+	struct ffs_memory *ffsm = vma->vm_private_data;
+	struct ffs_ep_listener *listener = ffsm->listener;
+	unsigned long flags;
+
+	spin_lock_irqsave(&listener->ffsm_lock, flags);
+	++ffsm->vma_use_count;
+	spin_unlock_irqrestore(&listener->ffsm_lock, flags);
+}
+
+static void ffsm_vm_close(struct vm_area_struct *vma)
+{
+	struct ffs_memory *ffsm = vma->vm_private_data;
+
+	ffsm_dec_use_count(ffsm, &ffsm->vma_use_count);
+}
+
+static const struct vm_operations_struct ffsm_vm_ops = {
+	.open  = ffsm_vm_open,
+	.close = ffsm_vm_close
+};
+
+static int ffs_epfile_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct ffs_ep_listener *listener = file->private_data;
+	struct ffs_memory *ffsm = NULL;
+	size_t size = vma->vm_end - vma->vm_start;
+	char *kmem;
+	int rc, ret;
+
+	if (!IS_ALIGNED(size, PAGE_SIZE))
+		return -EFAULT;
+
+	rc = ffsm_increase_mmap_mem_usage(
+		listener->epfile->ffs,
+		size + sizeof(struct ffs_memory)
+	);
+	if (rc)
+		return -ENOMEM;
+
+	ret = 0;
+	ffsm = kzalloc(sizeof(struct ffs_memory), GFP_KERNEL);
+	if (!ffsm) {
+		ret = -ENOMEM;
+		goto error_decrease_mem;
+	}
+
+	kmem = kzalloc(size, GFP_USER | __GFP_NOWARN);
+	if (!kmem) {
+		kfree(ffsm);
+		ret = -ENOMEM;
+		goto error_decrease_mem;
+	}
+
+	rc = remap_pfn_range(
+		vma,
+		vma->vm_start,
+		PHYS_PFN(virt_to_phys(kmem)),
+		size,
+		vma->vm_page_prot
+	);
+	if (rc < 0) {
+		kfree(kmem);
+		kfree(ffsm);
+		ret = -EAGAIN;
+		goto error_decrease_mem;
+	}
+
+
+	INIT_LIST_HEAD(&ffsm->memlist);
+	ffsm->listener = listener;
+	ffsm->kmem = kmem;
+	ffsm->vm_start = vma->vm_start;
+	ffsm->size = size;
+	ffsm->vma_use_count = 1;
+
+	vma->vm_ops = &ffsm_vm_ops;
+	vma->vm_private_data = ffsm;
+
+	spin_lock_irq(&listener->ffsm_lock);
+	list_add_tail(&ffsm->memlist, &listener->ffsm_list);
+	spin_unlock_irq(&listener->ffsm_lock);
+	return 0;
+
+error_decrease_mem:
+	ffsm_decrease_mmap_mem_usage(
+		listener->epfile->ffs,
+		size + sizeof(struct ffs_memory)
+	);
+	return ret;
+}
 
 /* "Normal" endpoints operations ********************************************/
 
@@ -824,8 +1036,12 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	int ret = io_data->req->status ? io_data->req->status :
 					 io_data->req->actual;
 	bool kiocb_has_eventfd = io_data->kiocb->ki_flags & IOCB_EVENTFD;
+	struct ffs_memory *ffsm = io_data->ffsm;
 
-	if (io_data->read && ret > 0) {
+	if (ffsm) {
+		ffsm_dec_use_count(ffsm, &ffsm->aio_use_count);
+		io_data->buf = NULL;
+	} else if (io_data->read && ret > 0) {
 		kthread_use_mm(io_data->mm);
 		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
 		kthread_unuse_mm(io_data->mm);
@@ -940,7 +1156,8 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 
 static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 {
-	struct ffs_epfile *epfile = file->private_data;
+	struct ffs_ep_listener *listener = file->private_data;
+	struct ffs_epfile *epfile = listener->epfile;
 	struct usb_request *req;
 	struct ffs_ep *ep;
 	char *data = NULL;
@@ -1014,6 +1231,10 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		io_data->use_sg = gadget->sg_supported && data_len > PAGE_SIZE;
 		spin_unlock_irq(&epfile->ffs->eps_lock);
 
+		data = ffsm_is_mmapped(listener, io_data, data_len);
+		if (data)
+			goto start_request;
+
 		data = ffs_alloc_buffer(io_data, data_len);
 		if (!data) {
 			ret = -ENOMEM;
@@ -1026,6 +1247,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		}
 	}
 
+start_request:
 	spin_lock_irq(&epfile->ffs->eps_lock);
 
 	if (epfile->ep != ep) {
@@ -1136,14 +1358,27 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 error_mutex:
 	mutex_unlock(&epfile->mutex);
 error:
-	if (ret != -EIOCBQUEUED) /* don't free if there is iocb queued */
+	if (ret != -EIOCBQUEUED) {
+		struct ffs_memory *ffsm = io_data->ffsm;
+
+		/* Transfer is not queued. So free transfer buffer. */
+		if (ffsm) {
+			/*
+			 * Transfer would have been done via mmapped memory.
+			 * Decrease the use count, since we DID NOT queue.
+			 */
+			ffsm_dec_use_count(ffsm, &ffsm->aio_use_count);
+			io_data->buf = NULL;
+		}
 		ffs_free_buffer(io_data);
+	}
 	return ret;
 }
 
 static int
 ffs_epfile_open(struct inode *inode, struct file *file)
 {
+	struct ffs_ep_listener *listener;
 	struct ffs_epfile *epfile = inode->i_private;
 
 	ENTER();
@@ -1151,7 +1386,14 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
-	file->private_data = epfile;
+	listener = kmalloc(sizeof(*listener), GFP_KERNEL);
+	if (!listener)
+		return -ENOMEM;
+	listener->epfile = epfile;
+	INIT_LIST_HEAD(&listener->ffsm_list);
+	spin_lock_init(&listener->ffsm_lock);
+
+	file->private_data = listener;
 	ffs_data_opened(epfile->ffs);
 
 	return stream_open(inode, file);
@@ -1160,7 +1402,8 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 static int ffs_aio_cancel(struct kiocb *kiocb)
 {
 	struct ffs_io_data *io_data = kiocb->private;
-	struct ffs_epfile *epfile = kiocb->ki_filp->private_data;
+	struct ffs_ep_listener *listener = kiocb->ki_filp->private_data;
+	struct ffs_epfile *epfile = listener->epfile;
 	unsigned long flags;
 	int value;
 
@@ -1268,10 +1511,12 @@ static int
 ffs_epfile_release(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
+	struct ffs_ep_listener *listener = file->private_data;
 
 	ENTER();
 
 	__ffs_epfile_read_buffer_free(epfile);
+	kfree(listener);
 	ffs_data_closed(epfile->ffs);
 
 	return 0;
@@ -1280,7 +1525,8 @@ ffs_epfile_release(struct inode *inode, struct file *file)
 static long ffs_epfile_ioctl(struct file *file, unsigned code,
 			     unsigned long value)
 {
-	struct ffs_epfile *epfile = file->private_data;
+	struct ffs_ep_listener *listener = file->private_data;
+	struct ffs_epfile *epfile = listener->epfile;
 	struct ffs_ep *ep;
 	int ret;
 
@@ -1366,6 +1612,7 @@ static const struct file_operations ffs_epfile_operations = {
 	.release =	ffs_epfile_release,
 	.unlocked_ioctl =	ffs_epfile_ioctl,
 	.compat_ioctl = compat_ptr_ioctl,
+	.mmap = ffs_epfile_mmap,
 };
 
 
@@ -1444,6 +1691,7 @@ struct ffs_sb_fill_data {
 	umode_t root_mode;
 	const char *dev_name;
 	bool no_disconnect;
+	u32 mmap_memory_mb;
 	struct ffs_data *ffs_data;
 };
 
@@ -1488,6 +1736,7 @@ enum {
 	Opt_mode,
 	Opt_uid,
 	Opt_gid,
+	Opt_mmap_memory_mb,
 };
 
 static const struct fs_parameter_spec ffs_fs_fs_parameters[] = {
@@ -1497,6 +1746,7 @@ static const struct fs_parameter_spec ffs_fs_fs_parameters[] = {
 	fsparam_u32	("mode",		Opt_mode),
 	fsparam_u32	("uid",			Opt_uid),
 	fsparam_u32	("gid",			Opt_gid),
+	fsparam_u32	("mmap_memory_mb",	Opt_mmap_memory_mb),
 	{}
 };
 
@@ -1537,6 +1787,9 @@ static int ffs_fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		if (!gid_valid(data->perms.gid))
 			goto unmapped_value;
 		break;
+	case Opt_mmap_memory_mb:
+		data->mmap_memory_mb = result.uint_32;
+		break;
 
 	default:
 		return -ENOPARAM;
@@ -1567,6 +1820,7 @@ static int ffs_fs_get_tree(struct fs_context *fc)
 		return -ENOMEM;
 	ffs->file_perms = ctx->perms;
 	ffs->no_disconnect = ctx->no_disconnect;
+	ffs->mmap_memory_mb = ctx->mmap_memory_mb;
 
 	ffs->dev_name = kstrdup(fc->source, GFP_KERNEL);
 	if (!ffs->dev_name) {
@@ -1616,6 +1870,8 @@ static int ffs_fs_init_fs_context(struct fs_context *fc)
 	ctx->perms.gid = GLOBAL_ROOT_GID;
 	ctx->root_mode = S_IFDIR | 0500;
 	ctx->no_disconnect = false;
+	/* Per default allow 16MiB of mmap buffers per FunctionFS mount */
+	ctx->mmap_memory_mb = 16;
 
 	fc->fs_private = ctx;
 	fc->ops = &ffs_fs_context_ops;
@@ -1752,6 +2008,7 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 
 	refcount_set(&ffs->ref, 1);
 	atomic_set(&ffs->opened, 0);
+	atomic64_set(&ffs->mmap_mem_usage, 0);
 	ffs->state = FFS_READ_DESCRIPTORS;
 	mutex_init(&ffs->mutex);
 	spin_lock_init(&ffs->eps_lock);
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
index f102ec23f3af..d3489cfab98c 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -278,6 +278,10 @@ struct ffs_data {
 	struct eventfd_ctx *ffs_eventfd;
 	struct workqueue_struct *io_completion_wq;
 	bool no_disconnect;
+	/* Limit on the total amount of memory we can allocate via mmap */
+	u32  mmap_memory_mb;
+	/* Total memory currently allocated for mmap */
+	atomic64_t mmap_mem_usage;
 	struct work_struct reset_work;
 
 	/*
-- 
2.17.1

