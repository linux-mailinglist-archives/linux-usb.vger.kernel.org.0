Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646C8400457
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 19:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349713AbhICRyO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 13:54:14 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47431 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231483AbhICRyN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 13:54:13 -0400
Received: (qmail 468934 invoked by uid 1000); 3 Sep 2021 13:53:12 -0400
Date:   Fri, 3 Sep 2021 13:53:12 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v2] USB: core: Make do_proc_control() and do_proc_bulk()
 killable
Message-ID: <20210903175312.GA468440@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USBDEVFS_CONTROL and USBDEVFS_BULK ioctls invoke
usb_start_wait_urb(), which contains an uninterruptible wait with a
user-specified timeout value.  If timeout value is very large and the
device being accessed does not respond in a reasonable amount of time,
the kernel will complain about "Task X blocked for more than N
seconds", as found in testing by syzbot:

INFO: task syz-executor.0:8700 blocked for more than 143 seconds.
      Not tainted 5.14.0-rc7-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:23192 pid: 8700 ppid:  8455 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:4681 [inline]
 __schedule+0xc07/0x11f0 kernel/sched/core.c:5938
 schedule+0x14b/0x210 kernel/sched/core.c:6017
 schedule_timeout+0x98/0x2f0 kernel/time/timer.c:1857
 do_wait_for_common+0x2da/0x480 kernel/sched/completion.c:85
 __wait_for_common kernel/sched/completion.c:106 [inline]
 wait_for_common kernel/sched/completion.c:117 [inline]
 wait_for_completion_timeout+0x46/0x60 kernel/sched/completion.c:157
 usb_start_wait_urb+0x167/0x550 drivers/usb/core/message.c:63
 do_proc_bulk+0x978/0x1080 drivers/usb/core/devio.c:1236
 proc_bulk drivers/usb/core/devio.c:1273 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2547 [inline]
 usbdev_ioctl+0x3441/0x6b10 drivers/usb/core/devio.c:2713
...

To fix this problem, this patch replaces usbfs's calls to
usb_control_msg() and usb_bulk_msg() with special-purpose code that
does essentially the same thing (as recommended in the comment for
usb_start_wait_urb()), except that it always uses a killable wait and
it uses GFP_KERNEL rather than GFP_NOIO.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Oliver Neukum <oneukum@suse.com>
Reported-and-tested-by: syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com

---

v2: Don't make usb_start_wait_urb() interruptible.  Instead copy the
code into usbfs and make it killable.


[as1964b]


 drivers/usb/core/devio.c |  144 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 111 insertions(+), 33 deletions(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -32,6 +32,7 @@
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
 #include <linux/usb/hcd.h>	/* for usbcore internals */
+#include <linux/usb/quirks.h>
 #include <linux/cdev.h>
 #include <linux/notifier.h>
 #include <linux/security.h>
@@ -1102,14 +1103,55 @@ static int usbdev_release(struct inode *
 	return 0;
 }
 
+static void usbfs_blocking_completion(struct urb *urb)
+{
+	complete((struct completion *) urb->context);
+}
+
+/*
+ * Much like usb_start_wait_urb, but returns status separately from
+ * actual_length and uses a killable wait.
+ */
+static int usbfs_start_wait_urb(struct urb *urb, int timeout,
+		unsigned int *actlen)
+{
+	DECLARE_COMPLETION_ONSTACK(ctx);
+	unsigned long expire;
+	int rc;
+
+	urb->context = &ctx;
+	urb->complete = usbfs_blocking_completion;
+	*actlen = 0;
+	rc = usb_submit_urb(urb, GFP_KERNEL);
+	if (unlikely(rc))
+		return rc;
+
+	expire = (timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT);
+	rc = wait_for_completion_killable_timeout(&ctx, expire);
+	if (rc <= 0) {
+		usb_kill_urb(urb);
+		*actlen = urb->actual_length;
+		if (urb->status != -ENOENT)
+			;	/* Completed before it was killed */
+		else if (rc < 0)
+			return -EINTR;
+		else
+			return -ETIMEDOUT;
+	}
+	*actlen = urb->actual_length;
+	return urb->status;
+}
+
 static int do_proc_control(struct usb_dev_state *ps,
 		struct usbdevfs_ctrltransfer *ctrl)
 {
 	struct usb_device *dev = ps->dev;
 	unsigned int tmo;
 	unsigned char *tbuf;
-	unsigned wLength;
+	unsigned int wLength, actlen;
 	int i, pipe, ret;
+	struct urb *urb = NULL;
+	struct usb_ctrlrequest *dr = NULL;
 
 	ret = check_ctrlrecip(ps, ctrl->bRequestType, ctrl->bRequest,
 			      ctrl->wIndex);
@@ -1122,51 +1164,63 @@ static int do_proc_control(struct usb_de
 			sizeof(struct usb_ctrlrequest));
 	if (ret)
 		return ret;
+
+	ret = -ENOMEM;
 	tbuf = (unsigned char *)__get_free_page(GFP_KERNEL);
-	if (!tbuf) {
-		ret = -ENOMEM;
+	if (!tbuf)
 		goto done;
-	}
+	urb = usb_alloc_urb(0, GFP_NOIO);
+	if (!urb)
+		goto done;
+	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
+	if (!dr)
+		goto done;
+
+	dr->bRequestType = ctrl->bRequestType;
+	dr->bRequest = ctrl->bRequest;
+	dr->wValue = cpu_to_le16(ctrl->wValue);
+	dr->wIndex = cpu_to_le16(ctrl->wIndex);
+	dr->wLength = cpu_to_le16(ctrl->wLength);
+
 	tmo = ctrl->timeout;
 	snoop(&dev->dev, "control urb: bRequestType=%02x "
 		"bRequest=%02x wValue=%04x "
 		"wIndex=%04x wLength=%04x\n",
 		ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
 		ctrl->wIndex, ctrl->wLength);
-	if ((ctrl->bRequestType & USB_DIR_IN) && ctrl->wLength) {
+
+	if ((ctrl->bRequestType & USB_DIR_IN) && wLength) {
 		pipe = usb_rcvctrlpipe(dev, 0);
-		snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT, NULL, 0);
+		usb_fill_control_urb(urb, dev, pipe, (unsigned char *) dr, tbuf,
+				wLength, NULL, NULL);
+		snoop_urb(dev, NULL, pipe, wLength, tmo, SUBMIT, NULL, 0);
 
 		usb_unlock_device(dev);
-		i = usb_control_msg(dev, pipe, ctrl->bRequest,
-				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
-				    tbuf, ctrl->wLength, tmo);
+		i = usbfs_start_wait_urb(urb, tmo, &actlen);
 		usb_lock_device(dev);
-		snoop_urb(dev, NULL, pipe, max(i, 0), min(i, 0), COMPLETE,
-			  tbuf, max(i, 0));
-		if ((i > 0) && ctrl->wLength) {
-			if (copy_to_user(ctrl->data, tbuf, i)) {
+		snoop_urb(dev, NULL, pipe, actlen, i, COMPLETE, tbuf, actlen);
+		if (!i && actlen) {
+			if (copy_to_user(ctrl->data, tbuf, actlen)) {
 				ret = -EFAULT;
-				goto done;
+				goto recv_fault;
 			}
 		}
 	} else {
-		if (ctrl->wLength) {
-			if (copy_from_user(tbuf, ctrl->data, ctrl->wLength)) {
+		if (wLength) {
+			if (copy_from_user(tbuf, ctrl->data, wLength)) {
 				ret = -EFAULT;
 				goto done;
 			}
 		}
 		pipe = usb_sndctrlpipe(dev, 0);
-		snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT,
-			tbuf, ctrl->wLength);
+		usb_fill_control_urb(urb, dev, pipe, (unsigned char *) dr, tbuf,
+				wLength, NULL, NULL);
+		snoop_urb(dev, NULL, pipe, wLength, tmo, SUBMIT, tbuf, wLength);
 
 		usb_unlock_device(dev);
-		i = usb_control_msg(dev, pipe, ctrl->bRequest,
-				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
-				    tbuf, ctrl->wLength, tmo);
+		i = usbfs_start_wait_urb(urb, tmo, &actlen);
 		usb_lock_device(dev);
-		snoop_urb(dev, NULL, pipe, max(i, 0), min(i, 0), COMPLETE, NULL, 0);
+		snoop_urb(dev, NULL, pipe, actlen, i, COMPLETE, NULL, 0);
 	}
 	if (i < 0 && i != -EPIPE) {
 		dev_printk(KERN_DEBUG, &dev->dev, "usbfs: USBDEVFS_CONTROL "
@@ -1174,8 +1228,15 @@ static int do_proc_control(struct usb_de
 			   current->comm, ctrl->bRequestType, ctrl->bRequest,
 			   ctrl->wLength, i);
 	}
-	ret = i;
+	ret = (i < 0 ? i : actlen);
+
+ recv_fault:
+	/* Linger a bit, prior to the next control message. */
+	if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+		msleep(200);
  done:
+	kfree(dr);
+	usb_free_urb(urb);
 	free_page((unsigned long) tbuf);
 	usbfs_decrease_memory_usage(PAGE_SIZE + sizeof(struct urb) +
 			sizeof(struct usb_ctrlrequest));
@@ -1195,10 +1256,11 @@ static int do_proc_bulk(struct usb_dev_s
 		struct usbdevfs_bulktransfer *bulk)
 {
 	struct usb_device *dev = ps->dev;
-	unsigned int tmo, len1, pipe;
-	int len2;
+	unsigned int tmo, len1, len2, pipe;
 	unsigned char *tbuf;
 	int i, ret;
+	struct urb *urb = NULL;
+	struct usb_host_endpoint *ep;
 
 	ret = findintfep(ps->dev, bulk->ep);
 	if (ret < 0)
@@ -1206,14 +1268,17 @@ static int do_proc_bulk(struct usb_dev_s
 	ret = checkintf(ps, ret);
 	if (ret)
 		return ret;
+
+	len1 = bulk->len;
+	if (len1 < 0 || len1 >= (INT_MAX - sizeof(struct urb)))
+		return -EINVAL;
+
 	if (bulk->ep & USB_DIR_IN)
 		pipe = usb_rcvbulkpipe(dev, bulk->ep & 0x7f);
 	else
 		pipe = usb_sndbulkpipe(dev, bulk->ep & 0x7f);
-	if (!usb_maxpacket(dev, pipe, !(bulk->ep & USB_DIR_IN)))
-		return -EINVAL;
-	len1 = bulk->len;
-	if (len1 >= (INT_MAX - sizeof(struct urb)))
+	ep = usb_pipe_endpoint(dev, pipe);
+	if (!ep || !usb_endpoint_maxp(&ep->desc))
 		return -EINVAL;
 	ret = usbfs_increase_memory_usage(len1 + sizeof(struct urb));
 	if (ret)
@@ -1223,17 +1288,29 @@ static int do_proc_bulk(struct usb_dev_s
 	 * len1 can be almost arbitrarily large.  Don't WARN if it's
 	 * too big, just fail the request.
 	 */
+	ret = -ENOMEM;
 	tbuf = kmalloc(len1, GFP_KERNEL | __GFP_NOWARN);
-	if (!tbuf) {
-		ret = -ENOMEM;
+	if (!tbuf)
 		goto done;
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb)
+		goto done;
+
+	if ((ep->desc.bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) ==
+			USB_ENDPOINT_XFER_INT) {
+		pipe = (pipe & ~(3 << 30)) | (PIPE_INTERRUPT << 30);
+		usb_fill_int_urb(urb, dev, pipe, tbuf, len1,
+				NULL, NULL, ep->desc.bInterval);
+	} else {
+		usb_fill_bulk_urb(urb, dev, pipe, tbuf, len1, NULL, NULL);
 	}
+
 	tmo = bulk->timeout;
 	if (bulk->ep & 0x80) {
 		snoop_urb(dev, NULL, pipe, len1, tmo, SUBMIT, NULL, 0);
 
 		usb_unlock_device(dev);
-		i = usb_bulk_msg(dev, pipe, tbuf, len1, &len2, tmo);
+		i = usbfs_start_wait_urb(urb, tmo, &len2);
 		usb_lock_device(dev);
 		snoop_urb(dev, NULL, pipe, len2, i, COMPLETE, tbuf, len2);
 
@@ -1253,12 +1330,13 @@ static int do_proc_bulk(struct usb_dev_s
 		snoop_urb(dev, NULL, pipe, len1, tmo, SUBMIT, tbuf, len1);
 
 		usb_unlock_device(dev);
-		i = usb_bulk_msg(dev, pipe, tbuf, len1, &len2, tmo);
+		i = usbfs_start_wait_urb(urb, tmo, &len2);
 		usb_lock_device(dev);
 		snoop_urb(dev, NULL, pipe, len2, i, COMPLETE, NULL, 0);
 	}
 	ret = (i < 0 ? i : len2);
  done:
+	usb_free_urb(urb);
 	kfree(tbuf);
 	usbfs_decrease_memory_usage(len1 + sizeof(struct urb));
 	return ret;

