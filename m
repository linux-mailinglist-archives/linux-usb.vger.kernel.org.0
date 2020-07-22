Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104F622922A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 09:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgGVHhC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 03:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgGVHhC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 03:37:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF375C0619DC
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=58q5sNsknyB+c82dm74VDbMVC80lbW9qfRph2IYqF90=; b=Ce4rRSFLEkWE/qH9wZpQ7n/TwW
        zH6LXHvahnSArg10KssSc74tzCbXPp4Exz80rds38NqYTymjp8+h3Aq680oYlFWPT2WyX6kbVuq3G
        lU3pxNen/5KiFtju0Orn4m8RwQfLnVJCPwSXqTYrHiSEIy6iTPOEImO+yzmfIKE41yLCnxhJV5Bwq
        XRc+oc2hdm9o54l4JoHkUR6MKb+R4Ny/M1v/cuwoQi8pmQAWUef/EaRtozIqDtLNc2q6UYGn2DdDj
        TvbFJY+pXoIGokOxsTqrKCnPISZOoU/0MzK434SijVCqdmAUyMbV0f6wTxGy7iyq6e7ZRpGwQ7dLU
        sUQz2Vgw==;
Received: from [2001:4bb8:18c:2acc:e75:d48f:65ef:e944] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jy9JB-00005I-RL; Wed, 22 Jul 2020 07:36:59 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: usbfs: stop using compat_alloc_user_space
Date:   Wed, 22 Jul 2020 09:36:55 +0200
Message-Id: <20200722073655.220011-1-hch@lst.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just switch the low-level routines to take kernel structures, and do the
conversion from the compat to the native structure on that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/core/devio.c | 126 +++++++++++++++++++++------------------
 1 file changed, 69 insertions(+), 57 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 96d4507d988ac0..e96a858a12185b 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1102,22 +1102,20 @@ static int usbdev_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static int proc_control(struct usb_dev_state *ps, void __user *arg)
+static int do_proc_control(struct usb_dev_state *ps,
+		struct usbdevfs_ctrltransfer *ctrl)
 {
 	struct usb_device *dev = ps->dev;
-	struct usbdevfs_ctrltransfer ctrl;
 	unsigned int tmo;
 	unsigned char *tbuf;
 	unsigned wLength;
 	int i, pipe, ret;
 
-	if (copy_from_user(&ctrl, arg, sizeof(ctrl)))
-		return -EFAULT;
-	ret = check_ctrlrecip(ps, ctrl.bRequestType, ctrl.bRequest,
-			      ctrl.wIndex);
+	ret = check_ctrlrecip(ps, ctrl->bRequestType, ctrl->bRequest,
+			      ctrl->wIndex);
 	if (ret)
 		return ret;
-	wLength = ctrl.wLength;		/* To suppress 64k PAGE_SIZE warning */
+	wLength = ctrl->wLength;	/* To suppress 64k PAGE_SIZE warning */
 	if (wLength > PAGE_SIZE)
 		return -EINVAL;
 	ret = usbfs_increase_memory_usage(PAGE_SIZE + sizeof(struct urb) +
@@ -1129,52 +1127,52 @@ static int proc_control(struct usb_dev_state *ps, void __user *arg)
 		ret = -ENOMEM;
 		goto done;
 	}
-	tmo = ctrl.timeout;
+	tmo = ctrl->timeout;
 	snoop(&dev->dev, "control urb: bRequestType=%02x "
 		"bRequest=%02x wValue=%04x "
 		"wIndex=%04x wLength=%04x\n",
-		ctrl.bRequestType, ctrl.bRequest, ctrl.wValue,
-		ctrl.wIndex, ctrl.wLength);
-	if (ctrl.bRequestType & 0x80) {
+		ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
+		ctrl->wIndex, ctrl->wLength);
+	if (ctrl->bRequestType & 0x80) {
 		pipe = usb_rcvctrlpipe(dev, 0);
-		snoop_urb(dev, NULL, pipe, ctrl.wLength, tmo, SUBMIT, NULL, 0);
+		snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT, NULL, 0);
 
 		usb_unlock_device(dev);
-		i = usb_control_msg(dev, pipe, ctrl.bRequest,
-				    ctrl.bRequestType, ctrl.wValue, ctrl.wIndex,
-				    tbuf, ctrl.wLength, tmo);
+		i = usb_control_msg(dev, pipe, ctrl->bRequest,
+				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
+				    tbuf, ctrl->wLength, tmo);
 		usb_lock_device(dev);
 		snoop_urb(dev, NULL, pipe, max(i, 0), min(i, 0), COMPLETE,
 			  tbuf, max(i, 0));
-		if ((i > 0) && ctrl.wLength) {
-			if (copy_to_user(ctrl.data, tbuf, i)) {
+		if ((i > 0) && ctrl->wLength) {
+			if (copy_to_user(ctrl->data, tbuf, i)) {
 				ret = -EFAULT;
 				goto done;
 			}
 		}
 	} else {
-		if (ctrl.wLength) {
-			if (copy_from_user(tbuf, ctrl.data, ctrl.wLength)) {
+		if (ctrl->wLength) {
+			if (copy_from_user(tbuf, ctrl->data, ctrl->wLength)) {
 				ret = -EFAULT;
 				goto done;
 			}
 		}
 		pipe = usb_sndctrlpipe(dev, 0);
-		snoop_urb(dev, NULL, pipe, ctrl.wLength, tmo, SUBMIT,
-			tbuf, ctrl.wLength);
+		snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT,
+			tbuf, ctrl->wLength);
 
 		usb_unlock_device(dev);
-		i = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), ctrl.bRequest,
-				    ctrl.bRequestType, ctrl.wValue, ctrl.wIndex,
-				    tbuf, ctrl.wLength, tmo);
+		i = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), ctrl->bRequest,
+				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
+				    tbuf, ctrl->wLength, tmo);
 		usb_lock_device(dev);
 		snoop_urb(dev, NULL, pipe, max(i, 0), min(i, 0), COMPLETE, NULL, 0);
 	}
 	if (i < 0 && i != -EPIPE) {
 		dev_printk(KERN_DEBUG, &dev->dev, "usbfs: USBDEVFS_CONTROL "
 			   "failed cmd %s rqt %u rq %u len %u ret %d\n",
-			   current->comm, ctrl.bRequestType, ctrl.bRequest,
-			   ctrl.wLength, i);
+			   current->comm, ctrl->bRequestType, ctrl->bRequest,
+			   ctrl->wLength, i);
 	}
 	ret = i;
  done:
@@ -1184,30 +1182,37 @@ static int proc_control(struct usb_dev_state *ps, void __user *arg)
 	return ret;
 }
 
-static int proc_bulk(struct usb_dev_state *ps, void __user *arg)
+static int proc_control(struct usb_dev_state *ps, void __user *arg)
+{
+	struct usbdevfs_ctrltransfer ctrl;
+
+	if (copy_from_user(&ctrl, arg, sizeof(ctrl)))
+		return -EFAULT;
+	return do_proc_control(ps, &ctrl);
+}
+
+static int do_proc_bulk(struct usb_dev_state *ps,
+		struct usbdevfs_bulktransfer *bulk)
 {
 	struct usb_device *dev = ps->dev;
-	struct usbdevfs_bulktransfer bulk;
 	unsigned int tmo, len1, pipe;
 	int len2;
 	unsigned char *tbuf;
 	int i, ret;
 
-	if (copy_from_user(&bulk, arg, sizeof(bulk)))
-		return -EFAULT;
-	ret = findintfep(ps->dev, bulk.ep);
+	ret = findintfep(ps->dev, bulk->ep);
 	if (ret < 0)
 		return ret;
 	ret = checkintf(ps, ret);
 	if (ret)
 		return ret;
-	if (bulk.ep & USB_DIR_IN)
-		pipe = usb_rcvbulkpipe(dev, bulk.ep & 0x7f);
+	if (bulk->ep & USB_DIR_IN)
+		pipe = usb_rcvbulkpipe(dev, bulk->ep & 0x7f);
 	else
-		pipe = usb_sndbulkpipe(dev, bulk.ep & 0x7f);
-	if (!usb_maxpacket(dev, pipe, !(bulk.ep & USB_DIR_IN)))
+		pipe = usb_sndbulkpipe(dev, bulk->ep & 0x7f);
+	if (!usb_maxpacket(dev, pipe, !(bulk->ep & USB_DIR_IN)))
 		return -EINVAL;
-	len1 = bulk.len;
+	len1 = bulk->len;
 	if (len1 >= (INT_MAX - sizeof(struct urb)))
 		return -EINVAL;
 	ret = usbfs_increase_memory_usage(len1 + sizeof(struct urb));
@@ -1218,8 +1223,8 @@ static int proc_bulk(struct usb_dev_state *ps, void __user *arg)
 		ret = -ENOMEM;
 		goto done;
 	}
-	tmo = bulk.timeout;
-	if (bulk.ep & 0x80) {
+	tmo = bulk->timeout;
+	if (bulk->ep & 0x80) {
 		snoop_urb(dev, NULL, pipe, len1, tmo, SUBMIT, NULL, 0);
 
 		usb_unlock_device(dev);
@@ -1228,14 +1233,14 @@ static int proc_bulk(struct usb_dev_state *ps, void __user *arg)
 		snoop_urb(dev, NULL, pipe, len2, i, COMPLETE, tbuf, len2);
 
 		if (!i && len2) {
-			if (copy_to_user(bulk.data, tbuf, len2)) {
+			if (copy_to_user(bulk->data, tbuf, len2)) {
 				ret = -EFAULT;
 				goto done;
 			}
 		}
 	} else {
 		if (len1) {
-			if (copy_from_user(tbuf, bulk.data, len1)) {
+			if (copy_from_user(tbuf, bulk->data, len1)) {
 				ret = -EFAULT;
 				goto done;
 			}
@@ -1254,6 +1259,15 @@ static int proc_bulk(struct usb_dev_state *ps, void __user *arg)
 	return ret;
 }
 
+static int proc_bulk(struct usb_dev_state *ps, void __user *arg)
+{
+	struct usbdevfs_bulktransfer bulk;
+
+	if (copy_from_user(&bulk, arg, sizeof(bulk)))
+		return -EFAULT;
+	return do_proc_bulk(ps, &bulk);
+}
+
 static void check_reset_of_active_ep(struct usb_device *udev,
 		unsigned int epnum, char *ioctl_name)
 {
@@ -2013,33 +2027,31 @@ static int proc_reapurbnonblock(struct usb_dev_state *ps, void __user *arg)
 static int proc_control_compat(struct usb_dev_state *ps,
 				struct usbdevfs_ctrltransfer32 __user *p32)
 {
-	struct usbdevfs_ctrltransfer __user *p;
-	__u32 udata;
-	p = compat_alloc_user_space(sizeof(*p));
-	if (copy_in_user(p, p32, (sizeof(*p32) - sizeof(compat_caddr_t))) ||
-	    get_user(udata, &p32->data) ||
-	    put_user(compat_ptr(udata), &p->data))
+	struct usbdevfs_ctrltransfer ctrl;
+	u32 udata;
+
+	if (copy_from_user(&ctrl, p32, sizeof(*p32) - sizeof(compat_caddr_t)) ||
+	    get_user(udata, &p32->data))
 		return -EFAULT;
-	return proc_control(ps, p);
+	ctrl.data = compat_ptr(udata);
+	return do_proc_control(ps, &ctrl);
 }
 
 static int proc_bulk_compat(struct usb_dev_state *ps,
 			struct usbdevfs_bulktransfer32 __user *p32)
 {
-	struct usbdevfs_bulktransfer __user *p;
-	compat_uint_t n;
+	struct usbdevfs_bulktransfer bulk;
 	compat_caddr_t addr;
 
-	p = compat_alloc_user_space(sizeof(*p));
-
-	if (get_user(n, &p32->ep) || put_user(n, &p->ep) ||
-	    get_user(n, &p32->len) || put_user(n, &p->len) ||
-	    get_user(n, &p32->timeout) || put_user(n, &p->timeout) ||
-	    get_user(addr, &p32->data) || put_user(compat_ptr(addr), &p->data))
+	if (get_user(bulk.ep, &p32->ep) ||
+	    get_user(bulk.len, &p32->len) ||
+	    get_user(bulk.timeout, &p32->timeout) ||
+	    get_user(addr, &p32->data))
 		return -EFAULT;
-
-	return proc_bulk(ps, p);
+	bulk.data = compat_ptr(addr);
+	return do_proc_bulk(ps, &bulk);
 }
+
 static int proc_disconnectsignal_compat(struct usb_dev_state *ps, void __user *arg)
 {
 	struct usbdevfs_disconnectsignal32 ds;
-- 
2.27.0

