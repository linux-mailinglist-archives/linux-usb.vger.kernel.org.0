Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115422AF73D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 18:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgKKROL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 12:14:11 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:36885 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgKKROL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 12:14:11 -0500
Received: (qmail 18582 invoked by uid 484); 11 Nov 2020 17:07:27 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.087927 secs); 11 Nov 2020 17:07:27 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <balbi@kernel.org>; 11 Nov 2020 17:07:26 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 1/2] usb: gadget: ffs: Implement user URBs for USB bulk endpoints
Date:   Wed, 11 Nov 2020 18:07:17 +0100
Message-Id: <20201111170718.3381-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
References: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

URB aka USB Request Block: This patch offers similar functionality as
USBDEVFS_SUBMITURB / USBDEVFS_REAPURB, for USB FunctionFS.  This is
intended to be used by user space programs, which want to implement a
user space gadget driver.

Only bulk endpoints are currently supported.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/gadget/function/f_fs.c  | 478 ++++++++++++++++++++++++++++
 include/uapi/linux/usb/functionfs.h |  14 +
 2 files changed, 492 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 046f770a76da..194d45d94031 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -135,6 +135,26 @@ struct ffs_epfile {
 
 	struct dentry			*dentry;
 
+	/* wake up when an async_bulkurb completed */
+	wait_queue_head_t async_waitq;
+
+	/* protects the async URB lists */
+	spinlock_t async_lock;
+
+	/* P: async_lock */
+	/*
+	 *  URB lists:
+	 *  async_pending
+	 *    Not yet passed to UDC driver
+	 *  async_active
+	 *    Passed to UDC driver already, but not yet completed
+	 *  async_completed
+	 *    Completed URBs
+	 */
+	struct list_head  async_pending;
+	struct list_head  async_active;
+	struct list_head  async_completed;
+
 	/*
 	 * Buffer for holding data from partial reads which may happen since
 	 * we’re rounding user read requests to a multiple of a max packet size.
@@ -207,6 +227,35 @@ struct ffs_buffer {
 	char storage[];
 };
 
+/*
+ * async_bulkurb: handling of
+ *    FUNCTIONFS_SUBMITBULKURB
+ *    FUNCTIONFS_REAPBULKURB
+ */
+enum {
+	FFS_BULKURB_STATE_COMPLETE = 0,
+	FFS_BULKURB_STATE_PENDING  = 1,
+	FFS_BULKURB_STATE_ACTIVE   = 2
+};
+DEFINE_SPINLOCK(async_bulkurb_active_lock);
+struct async_bulkurb {
+	struct ffs_epfile *epfile;
+	struct list_head urblist;
+
+	int status;
+	int orig_length;
+	int buffer_length;
+	int actual_length;
+	int num_sgs;
+	struct scatterlist *sg;
+
+	struct usb_ep      *usbep;
+	struct usb_request *usbreq;
+
+	void __user *userurb;
+	void __user *userdata_outep;
+};
+
 /*  ffs_io_data structure ***************************************************/
 
 struct ffs_io_data {
@@ -1262,6 +1311,380 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	return res;
 }
 
+static void ffs_async_bulkurb_free(struct async_bulkurb *as)
+{
+	int i;
+
+	if (as->usbreq)
+		usb_ep_free_request(as->usbep, as->usbreq);
+	for (i = 0; i < as->num_sgs; i++) {
+		if (sg_page(&as->sg[i]))
+			kfree(sg_virt(&as->sg[i]));
+	}
+	kfree(as->sg);
+	kfree(as);
+}
+
+static void ffs_async_bulkurb_completion(
+	struct usb_ep *_ep, struct usb_request *req
+)
+{
+	struct async_bulkurb *as = req->context;
+	struct ffs_epfile *epfile;
+	unsigned long flags;
+
+	// avoid race condition with ffs_epfile_async_release()
+	spin_lock_irqsave(&async_bulkurb_active_lock, flags);
+	epfile = as->epfile;
+	if (!epfile) {
+		// as->epfile was released: just free URB to drop it
+		ffs_async_bulkurb_free(as);
+		spin_unlock_irqrestore(&async_bulkurb_active_lock, flags);
+		return;
+	}
+	spin_lock(&epfile->async_lock);
+	spin_unlock(&async_bulkurb_active_lock);
+	if (req->status < 0) {
+		as->status = req->status; // error code
+		as->actual_length = 0;
+	} else {
+		as->status = FFS_BULKURB_STATE_COMPLETE;
+		as->actual_length = req->actual;
+	}
+	list_move_tail(&as->urblist, &epfile->async_completed);
+	spin_unlock_irqrestore(&epfile->async_lock, flags);
+	wake_up(&epfile->async_waitq);
+}
+
+static struct async_bulkurb *ffs_async_bulkurb_getcompleted(
+	struct ffs_epfile *epfile
+)
+{
+	struct async_bulkurb *as = NULL;
+
+	spin_lock_irq(&epfile->async_lock);
+	if (!list_empty(&epfile->async_completed)) {
+		as = list_first_entry(
+			&epfile->async_completed,
+			struct async_bulkurb,
+			urblist
+		);
+		list_del_init(&as->urblist);
+	}
+	spin_unlock_irq(&epfile->async_lock);
+	return as;
+}
+
+static struct async_bulkurb *ffs_async_bulkurb_reap(
+	struct ffs_epfile *epfile
+)
+{
+	DECLARE_WAITQUEUE(wait, current);
+	struct async_bulkurb *as = NULL;
+
+	add_wait_queue(&epfile->async_waitq, &wait);
+	for (;;) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		as = ffs_async_bulkurb_getcompleted(epfile);
+		if (as)
+			break;
+		if (signal_pending(current))
+			break;
+		schedule();
+	}
+	set_current_state(TASK_RUNNING);
+	remove_wait_queue(&epfile->async_waitq, &wait);
+
+	return as;
+}
+
+static long ffs_async_bulburb_copy_outep(
+	void __user *userdata, int data_len,
+	struct scatterlist *sg, int num_sgs
+)
+{
+	int i, sz;
+	long err;
+
+	for (i = 0; i < num_sgs && data_len > 0; i++) {
+		sz = data_len;
+		if (sz > PAGE_SIZE)
+			sz = PAGE_SIZE;
+		err = copy_to_user(userdata, sg_virt(sg), sz);
+		if (err)
+			return err;
+		userdata += sz;
+		data_len -= sz;
+		sg++;
+	}
+	return 0;
+}
+
+static long ffs_epfile_reapbulkurb(
+	struct file *file, void __user * __user *p
+)
+{
+	struct ffs_epfile *epfile = (struct ffs_epfile *)file->private_data;
+	struct async_bulkurb *as;
+	struct usb_functionfs_bulkurb __user *uurb;
+	long err;
+
+	as = ffs_async_bulkurb_reap(epfile);
+	if (!as)
+		return -EINTR;
+	err = 0;
+	uurb = as->userurb;
+	if (put_user(as->status, &uurb->status)) {
+		err = -EFAULT;
+		goto funcend;
+	}
+	if (as->userdata_outep && as->actual_length > 0) {
+		void __user *userdata;
+		int data_len;
+
+		userdata = as->userdata_outep;
+		data_len = as->actual_length;
+		if (data_len > as->orig_length)
+			data_len = as->orig_length;
+		err = ffs_async_bulburb_copy_outep(
+			userdata, data_len,
+			as->sg, as->num_sgs
+		);
+		if (err) {
+			err = -EFAULT;
+			goto funcend;
+		}
+	}
+	if (put_user(as->actual_length, &uurb->actual_length)) {
+		err = -EFAULT;
+		goto funcend;
+	}
+	if (put_user(as->userurb, p)) {
+		err = -EFAULT;
+		goto funcend;
+	}
+
+funcend:
+	ffs_async_bulkurb_free(as);
+	return err;
+}
+
+static int ffs_async_bulkurb_alloc_sg(
+	struct scatterlist *sg, int num_sgs,
+	void __user *userdata, int data_len
+)
+{
+	int i, sz;
+	void *buf;
+
+	// allocate num_sgs*PAGE_SIZE bytes for data
+	// but make sure only data_len bytes are used
+	sg_init_table(sg, num_sgs);
+	for (i = 0; i < num_sgs; i++) {
+		buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		sz = data_len;
+		if (sz > PAGE_SIZE)
+			sz = PAGE_SIZE;
+		sg_set_buf(&sg[i], buf, sz);
+		if (userdata && data_len > 0) {
+			// transfer device -> host:
+			// copy user data to kernel memory
+			if (copy_from_user(buf, userdata, sz))
+				return -EFAULT;
+			userdata += sz;
+		}
+		data_len -= sz;
+	}
+	return 0;
+}
+
+static long ffs_async_bulkurb_prepare(
+	struct async_bulkurb *as,
+	struct ffs_epfile *epfile,
+	void __user *userurb
+)
+{
+	int num_sgs;
+	int data_len;
+	int err;
+	struct usb_functionfs_bulkurb urb;
+
+	if (copy_from_user(&urb, userurb, sizeof(urb)))
+		return -EFAULT;
+	data_len = urb.buffer_length;
+	if (data_len <= 0)
+		return -EINVAL;
+	as->orig_length = data_len;
+	num_sgs = DIV_ROUND_UP(data_len, PAGE_SIZE);
+	as->epfile = epfile;
+	as->sg = kmalloc_array(
+		num_sgs, sizeof(struct scatterlist), GFP_KERNEL
+	);
+	if (!as->sg)
+		return -ENOMEM;
+	as->num_sgs = num_sgs;
+	as->buffer_length = num_sgs*PAGE_SIZE;
+	err = ffs_async_bulkurb_alloc_sg(
+		as->sg, num_sgs,
+		(epfile->in) ? urb.buffer : NULL, data_len
+	);
+	if (err)
+		return err;
+	as->userurb = userurb;
+	if (!epfile->in)
+		as->userdata_outep = urb.buffer;
+	as->status = FFS_BULKURB_STATE_PENDING;
+	return 0;
+}
+
+// you must hold as->epfile->ffs->epslock,
+// when calling ffs_async_bulkurb_activate.
+// IRQs should be disabled.
+static void ffs_async_bulkurb_activate(struct async_bulkurb *as)
+{
+	struct ffs_epfile *epfile = as->epfile;
+	struct ffs_ep *ep = epfile->ep;
+	struct usb_gadget *gadget = epfile->ffs->gadget;
+	struct usb_request *req;
+	ssize_t data_len;
+	int err;
+
+	if (!ep) {
+		as->status = -ENODEV;
+		goto error;
+	}
+	if (!gadget->sg_supported || epfile->isoc) {
+		as->status = -EPERM;
+		goto error;
+	}
+	data_len = as->orig_length;
+	if (!epfile->in) {
+		/* transfer host -> device */
+		data_len = usb_ep_align_maybe(gadget, ep->ep, data_len);
+		if (data_len > as->buffer_length) {
+			as->status = -ENOMEM;
+			goto error;
+		}
+	}
+	req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
+	if (!req) {
+		as->status = -ENOMEM;
+		goto error;
+	}
+	req->context = as;
+	req->length = data_len;
+	req->buf = NULL;
+	req->num_sgs = as->num_sgs;
+	req->sg = as->sg;
+	req->complete = ffs_async_bulkurb_completion;
+	err = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
+	if (unlikely(err)) {
+		as->status = err;
+		goto error;
+	}
+	as->status = FFS_BULKURB_STATE_ACTIVE;
+	as->usbep = ep->ep;
+	as->usbreq = req;
+	spin_lock(&epfile->async_lock);
+	list_add_tail(&as->urblist, &epfile->async_active);
+	spin_unlock(&epfile->async_lock);
+	return;
+
+error:
+	spin_lock(&epfile->async_lock);
+	list_add_tail(&as->urblist, &epfile->async_completed);
+	spin_unlock(&epfile->async_lock);
+}
+
+
+static long ffs_epfile_submitbulkurb(struct file *file, void __user *p)
+{
+	struct ffs_epfile *epfile = file->private_data;
+	struct async_bulkurb *as;
+	long err;
+
+	as = kzalloc(sizeof(struct async_bulkurb), GFP_KERNEL);
+	if (!as)
+		return -ENOMEM;
+	err = ffs_async_bulkurb_prepare(as, epfile, p);
+	if (err) {
+		ffs_async_bulkurb_free(as);
+		return err;
+	}
+	spin_lock_irq(&epfile->ffs->eps_lock);
+	if (epfile->ep)
+		ffs_async_bulkurb_activate(as);
+	else {
+		spin_lock(&epfile->async_lock);
+		list_add_tail(&as->urblist, &epfile->async_pending);
+		spin_unlock(&epfile->async_lock);
+	}
+	spin_unlock_irq(&epfile->ffs->eps_lock);
+	return 0;
+}
+
+static __poll_t ffs_epfile_poll(
+	struct file *file, struct poll_table_struct *wait
+)
+{
+	struct ffs_epfile *epfile = file->private_data;
+	__poll_t mask = 0;
+
+	poll_wait(file, &epfile->async_waitq, wait);
+	spin_lock_irq(&epfile->async_lock);
+	if (
+		(file->f_mode & FMODE_WRITE) &&
+		!list_empty(&epfile->async_completed)
+	)
+		mask |= EPOLLOUT | EPOLLWRNORM;
+	spin_unlock_irq(&epfile->async_lock);
+	return mask;
+}
+
+static void ffs_epfile_async_release(struct ffs_epfile *epfile)
+{
+	struct async_bulkurb *as;
+	unsigned long flags;
+
+	// avoid race condition with ffs_async_bulkurb_completion()
+	// we will modify as->epfile of active URBs
+	spin_lock_irqsave(&async_bulkurb_active_lock, flags);
+	spin_lock(&epfile->async_lock);
+	while (!list_empty(&epfile->async_active)) {
+		as = list_first_entry(
+			&epfile->async_active,
+			struct async_bulkurb,
+			urblist
+		);
+		list_del_init(&as->urblist);
+		as->epfile = NULL;
+		// "as" will be freed in completion handler
+	}
+	// done with all active URBs: release lock for them
+	spin_unlock(&async_bulkurb_active_lock);
+	while (!list_empty(&epfile->async_pending)) {
+		as = list_first_entry(
+			&epfile->async_pending,
+			struct async_bulkurb,
+			urblist
+		);
+		list_del_init(&as->urblist);
+		ffs_async_bulkurb_free(as);
+	}
+	while (!list_empty(&epfile->async_completed)) {
+		as = list_first_entry(
+			&epfile->async_completed,
+			struct async_bulkurb,
+			urblist
+		);
+		list_del_init(&as->urblist);
+		ffs_async_bulkurb_free(as);
+	}
+	spin_unlock_irqrestore(&epfile->async_lock, flags);
+}
+
 static int
 ffs_epfile_release(struct inode *inode, struct file *file)
 {
@@ -1269,6 +1692,7 @@ ffs_epfile_release(struct inode *inode, struct file *file)
 
 	ENTER();
 
+	ffs_epfile_async_release(epfile);
 	__ffs_epfile_read_buffer_free(epfile);
 	ffs_data_closed(epfile->ffs);
 
@@ -1287,6 +1711,22 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
+	// The following ioctls should work even without an enabled endpoint
+	switch (code) {
+	case FUNCTIONFS_SUBMITBULKURB:
+	{
+		ret = ffs_epfile_submitbulkurb(file, (void __user *)value);
+		return ret;
+	}
+	case FUNCTIONFS_REAPBULKURB:
+	{
+		ret = ffs_epfile_reapbulkurb(
+			file, (void __user * __user *)value
+		);
+		return ret;
+	}
+	}
+
 	/* Wait for endpoint to be enabled */
 	ep = epfile->ep;
 	if (!ep) {
@@ -1359,6 +1799,7 @@ static const struct file_operations ffs_epfile_operations = {
 	.write_iter =	ffs_epfile_write_iter,
 	.read_iter =	ffs_epfile_read_iter,
 	.release =	ffs_epfile_release,
+	.poll =  ffs_epfile_poll,
 	.unlocked_ioctl =	ffs_epfile_ioctl,
 	.compat_ioctl = compat_ptr_ioctl,
 };
@@ -1881,6 +2322,13 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 	for (i = 1; i <= count; ++i, ++epfile) {
 		epfile->ffs = ffs;
 		mutex_init(&epfile->mutex);
+
+		spin_lock_init(&epfile->async_lock);
+		init_waitqueue_head(&epfile->async_waitq);
+		INIT_LIST_HEAD(&epfile->async_pending);
+		INIT_LIST_HEAD(&epfile->async_active);
+		INIT_LIST_HEAD(&epfile->async_completed);
+
 		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
 		else
@@ -1906,6 +2354,7 @@ static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
 
 	for (; count; --count, ++epfile) {
 		BUG_ON(mutex_is_locked(&epfile->mutex));
+		ffs_epfile_async_release(epfile);
 		if (epfile->dentry) {
 			d_delete(epfile->dentry);
 			dput(epfile->dentry);
@@ -1972,6 +2421,35 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 		++epfile;
 	}
 
+	/*
+	 * loop through all epfiles and convert
+	 * pending async requests into active async requests
+	 */
+	epfile = ffs->epfiles;
+	count  = ffs->eps_count;
+	while (count--) {
+		if (!epfile->ep) {
+			++epfile;
+			continue;
+		}
+		spin_lock(&epfile->async_lock);
+		while (!list_empty(&epfile->async_pending)) {
+			struct async_bulkurb *as;
+
+			as = list_first_entry(
+				&epfile->async_pending,
+				struct async_bulkurb,
+				urblist
+			);
+			list_del_init(&as->urblist);
+			spin_unlock(&epfile->async_lock);
+			ffs_async_bulkurb_activate(as);
+			spin_lock(&epfile->async_lock);
+		}
+		spin_unlock(&epfile->async_lock);
+		++epfile;
+	}
+
 	wake_up_interruptible(&ffs->wait);
 	spin_unlock_irqrestore(&func->ffs->eps_lock, flags);
 
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
index d77ee6b65328..09e19cdd1604 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -288,6 +288,20 @@ struct usb_functionfs_event {
 #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
 					     struct usb_endpoint_descriptor)
 
+/*
+ * Submit an USB Request Block for a bulk endpoint
+ */
+struct usb_functionfs_bulkurb {
+	int status;
+	int buffer_length;
+	int actual_length;
+	void __user *buffer;
+};
+
+#define FUNCTIONFS_SUBMITBULKURB  \
+	_IOW('g', 131, struct usb_functionfs_bulkurb)
 
+#define FUNCTIONFS_REAPBULKURB  \
+	_IOW('g', 132, void *)
 
 #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */
-- 
2.17.1

