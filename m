Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2541C492E45
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 20:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348537AbiARTPz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 14:15:55 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:50721 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348345AbiARTPz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 14:15:55 -0500
Received: (qmail 20692 invoked by uid 484); 18 Jan 2022 19:09:13 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.065371 secs); 18 Jan 2022 19:09:13 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <balbi@kernel.org>; 18 Jan 2022 19:09:12 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 1/1] usb: gadget: f_fs: Support zerocopy transfers via mmap.
Date:   Tue, 18 Jan 2022 20:08:49 +0100
Message-Id: <20220118190849.22084-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118190849.22084-1-ingo.rohloff@lauterbach.com>
References: <20220118190849.22084-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch implements the same functionality for USB Gadget FunctionFS as
commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
did for USB host devio.c

This patch allows user space to mmap USB transfer buffers via
USB FunctionFS endpoint 0.

User space might then use these buffers in conjunction with
Linux native AsyncIO (via libaio) to avoid data copying by the kernel.

Standard read() and write() operations to bulk USB endpoints will NOT be
zerocopy.  Especially for reads, the expected USB transfer length is
unclear; whereas an AsyncIO request clearly specifies the maximum transfer
length.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c | 230 ++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 25ad1e97a458..a8fac065b9b4 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -201,6 +201,16 @@ struct ffs_epfile {
 	unsigned char			_pad;
 };
 
+struct ffs_memory {
+	struct list_head memlist;
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
@@ -227,6 +237,7 @@ struct ffs_io_data {
 	bool use_sg;
 
 	struct ffs_data *ffs;
+	struct ffs_memory *ffsm;
 };
 
 struct ffs_desc_helper {
@@ -262,6 +273,135 @@ static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
 static char *ffs_prepare_buffer(const char __user *buf, size_t len)
 	__attribute__((warn_unused_result, nonnull));
 
+/* Handling of mmapped transfers *******************************/
+
+static LIST_HEAD(ffsm_list);
+static DEFINE_SPINLOCK(ffsm_lock);
+
+/* Limit on the total amount of memory ffs can allocate via mmap */
+static u32 ffsm_memory_mb = 16;
+module_param(ffsm_memory_mb, uint, 0644);
+MODULE_PARM_DESC(ffsm_memory_mb,
+		"maximum MB allowed for ffs mmap buffers (0 = no limit)");
+
+/* Total memory currently allocated via mmap */
+static atomic64_t ffsm_memory_usage;
+
+/* Check whether it's okay to allocate more memory for mmap */
+static int ffsm_increase_memory_usage(u64 amount)
+{
+	u64 lim;
+
+	lim = READ_ONCE(ffsm_memory_mb);
+	lim <<= 20;
+
+	atomic64_add(amount, &ffsm_memory_usage);
+
+	if (lim > 0 && atomic64_read(&ffsm_memory_usage) > lim) {
+		atomic64_sub(amount, &ffsm_memory_usage);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Memory for mmap is being deallocated */
+static void ffsm_decrease_memory_usage(u64 amount)
+{
+	atomic64_sub(amount, &ffsm_memory_usage);
+}
+
+static char *ffsm_is_mmapped(struct ffs_io_data *io_data, ssize_t data_len)
+{
+	struct iov_iter *i = &io_data->data;
+	struct ffs_memory *ffsm;
+	char *kmem;
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
+	kmem = NULL;
+	user_data_start = (unsigned long)i->iov->iov_base;
+
+	spin_lock_irq(&ffsm_lock);
+	list_for_each_entry(ffsm, &ffsm_list, memlist) {
+		if (
+			user_data_start >= ffsm->vm_start &&
+			user_data_start < ffsm->vm_start + ffsm->size
+		) {
+			if (
+				data_len <= ffsm->vm_start + ffsm->size -
+					user_data_start
+			) {
+				ffsm->aio_use_count++;
+				kmem  = ffsm->kmem;
+				kmem += user_data_start - ffsm->vm_start;
+				io_data->ffsm   = ffsm;
+				io_data->use_sg = false;
+			}
+			break;
+		}
+	}
+	spin_unlock_irq(&ffsm_lock);
+	return kmem;
+}
+
+static void ffsm_dec_use_count(struct ffs_memory *ffsm, int *count)
+{
+	size_t size;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ffsm_lock, flags);
+	*count = *count - 1;
+	if (ffsm->aio_use_count != 0 || ffsm->vma_use_count != 0) {
+		spin_unlock_irqrestore(&ffsm_lock, flags);
+		return;
+	}
+
+	list_del(&ffsm->memlist);
+	spin_unlock_irqrestore(&ffsm_lock, flags);
+
+	size = ffsm->size;
+	kfree(ffsm->kmem);
+	kfree(ffsm);
+	ffsm_decrease_memory_usage(size + sizeof(struct ffs_memory));
+}
+
+static void ffsm_vm_open(struct vm_area_struct *vma)
+{
+	struct ffs_memory *ffsm = vma->vm_private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ffsm_lock, flags);
+	++ffsm->vma_use_count;
+	spin_unlock_irqrestore(&ffsm_lock, flags);
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
 
 /* Control file aka ep0 *****************************************************/
 
@@ -691,6 +831,71 @@ static __poll_t ffs_ep0_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static int ffs_ep0_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct ffs_memory *ffsm = NULL;
+	size_t size = vma->vm_end - vma->vm_start;
+	char *kmem;
+	int rc, ret;
+
+	if (!IS_ALIGNED(size, PAGE_SIZE))
+		return -EFAULT;
+
+	rc = ffsm_increase_memory_usage(size + sizeof(struct ffs_memory));
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
+		virt_to_phys(kmem) >> PAGE_SHIFT,
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
+	ffsm->kmem = kmem;
+	ffsm->vm_start = vma->vm_start;
+	ffsm->size = size;
+	ffsm->vma_use_count = 1;
+
+	vma->vm_flags |= VM_IO;
+	vma->vm_flags |= (VM_DONTEXPAND | VM_DONTDUMP);
+	vma->vm_ops = &ffsm_vm_ops;
+	vma->vm_private_data = ffsm;
+
+	spin_lock_irq(&ffsm_lock);
+	list_add_tail(&ffsm->memlist, &ffsm_list);
+	spin_unlock_irq(&ffsm_lock);
+
+	return 0;
+
+error_decrease_mem:
+	ffsm_decrease_memory_usage(size + sizeof(struct ffs_memory));
+	return ret;
+}
+
 static const struct file_operations ffs_ep0_operations = {
 	.llseek =	no_llseek,
 
@@ -700,6 +905,7 @@ static const struct file_operations ffs_ep0_operations = {
 	.release =	ffs_ep0_release,
 	.unlocked_ioctl =	ffs_ep0_ioctl,
 	.poll =		ffs_ep0_poll,
+	.mmap =         ffs_ep0_mmap,
 };
 
 
@@ -824,8 +1030,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
 	int ret = io_data->req->status ? io_data->req->status :
 					 io_data->req->actual;
 	bool kiocb_has_eventfd = io_data->kiocb->ki_flags & IOCB_EVENTFD;
+	struct ffs_memory *ffsm = io_data->ffsm;
 
-	if (io_data->read && ret > 0) {
+	if (!ffsm && io_data->read && ret > 0) {
 		kthread_use_mm(io_data->mm);
 		ret = ffs_copy_to_iter(io_data->buf, ret, &io_data->data);
 		kthread_unuse_mm(io_data->mm);
@@ -840,7 +1047,10 @@ static void ffs_user_copy_worker(struct work_struct *work)
 
 	if (io_data->read)
 		kfree(io_data->to_free);
-	ffs_free_buffer(io_data);
+	if (ffsm)
+		ffsm_dec_use_count(ffsm, &ffsm->aio_use_count);
+	else
+		ffs_free_buffer(io_data);
 	kfree(io_data);
 }
 
@@ -1014,6 +1224,10 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		io_data->use_sg = gadget->sg_supported && data_len > PAGE_SIZE;
 		spin_unlock_irq(&epfile->ffs->eps_lock);
 
+		data = ffsm_is_mmapped(io_data, data_len);
+		if (data)
+			goto start_request;
+
 		data = ffs_alloc_buffer(io_data, data_len);
 		if (!data) {
 			ret = -ENOMEM;
@@ -1026,6 +1240,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		}
 	}
 
+start_request:
 	spin_lock_irq(&epfile->ffs->eps_lock);
 
 	if (epfile->ep != ep) {
@@ -1136,8 +1351,15 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 error_mutex:
 	mutex_unlock(&epfile->mutex);
 error:
-	if (ret != -EIOCBQUEUED) /* don't free if there is iocb queued */
-		ffs_free_buffer(io_data);
+	if (ret != -EIOCBQUEUED) {
+		struct ffs_memory *ffsm = io_data->ffsm;
+
+		/* Transfer is not queued. Free transfer buffer. */
+		if (ffsm)
+			ffsm_dec_use_count(ffsm, &ffsm->aio_use_count);
+		else
+			ffs_free_buffer(io_data);
+	}
 	return ret;
 }
 
-- 
2.17.1

