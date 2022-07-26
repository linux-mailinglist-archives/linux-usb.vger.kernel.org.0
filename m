Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C995808E7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 03:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbiGZBI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 21:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbiGZBI1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 21:08:27 -0400
X-Greylist: delayed 519 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Jul 2022 18:08:25 PDT
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C5B27FE7
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 18:08:25 -0700 (PDT)
Received: from localhost.localdomain (c-73-100-220-23.hsd1.ma.comcast.net [73.100.220.23])
        by endrift.com (Postfix) with ESMTPSA id 37588A2A0;
        Mon, 25 Jul 2022 17:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1658797186; bh=4k4dBaKSGveA16isbS3KL3AqRhTfNDtH6wpw0BZSGys=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sPUrWtCN6WzqP2Y4WlgzGsrFuqvenA+FVGgZzxlSbQzvcUOfn9A9udNFdxfHAT3F9
         3BcqmVVFRNVShG6BDc0CGhQgATWZVJ0O3CY4prvBA07inGeNf0EgGQMBcZzCrUJAo2
         IjnjeJja01ul5EtDvNM78ZvgZyJNfqU8yA1kdkTdh1gDl/gcvn0vV94uS9FaoDWtHW
         TSn8NuFGpoYWOtOa+HYpsekg319Kgfjufe3GjWO/bpQIhY2/1477b64UCh1gzCJcaL
         49Qq8AUUSk7ZFjZ8jSRuuIGZfajrlZmrWNMW+26Nnn4JDfIaANPO0HCtpZ/WgunZux
         C63e/U1GJ5BNA==
From:   Vicki Pfau <vi@endrift.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxim Devaev <mdevaev@gmail.com>, linux-usb@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Date:   Mon, 25 Jul 2022 17:58:26 -0700
Message-Id: <20220726005824.2817646-2-vi@endrift.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726005824.2817646-1-vi@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While the HID gadget implementation has been sufficient for devices that only
use INTERRUPT transfers, the USB HID standard includes provisions for Set- and
Get-Feature report CONTROL transfers that go over endpoint 0. These were
previously impossible with the existing implementation, and would either send
an empty reply, or stall out.

As the feature is a standard part of USB HID, it stands to reason that devices
would use it, and that the HID gadget should support it. This patch adds
support for host-to-device Set-Feature reports through a new ioctl
interface to the hidg class dev nodes.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/usb/gadget/function/f_hid.c | 112 ++++++++++++++++++++++++++--
 include/uapi/linux/usb/g_hid.h      |   1 +
 2 files changed, 105 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 7e70e4a168e6..97aa56206020 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -72,6 +72,11 @@ struct f_hidg {
 	wait_queue_head_t		write_queue;
 	struct usb_request		*req;
 
+	/* set report */
+	struct list_head		completed_set_req;
+	spinlock_t			set_spinlock;
+	wait_queue_head_t		set_queue;
+
 	/* get report */
 	struct usb_request		*get_req;
 	struct usb_hidg_report		get_report;
@@ -519,6 +524,54 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 	return status;
 }
 
+static int f_hidg_set_report(struct file *file, struct usb_hidg_report __user *buffer)
+{
+	struct f_hidg		*hidg = file->private_data;
+	struct f_hidg_req_list	*list;
+	struct usb_request	*req;
+	unsigned long		flags;
+	unsigned short		length;
+	int			status;
+
+	spin_lock_irqsave(&hidg->set_spinlock, flags);
+
+#define SET_REPORT_COND (!list_empty(&hidg->completed_set_req))
+
+	/* wait for at least one buffer to complete */
+	while (!SET_REPORT_COND) {
+		spin_unlock_irqrestore(&hidg->set_spinlock, flags);
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+
+		if (wait_event_interruptible(hidg->set_queue, SET_REPORT_COND))
+			return -ERESTARTSYS;
+
+		spin_lock_irqsave(&hidg->set_spinlock, flags);
+	}
+
+	/* pick the first one */
+	list = list_first_entry(&hidg->completed_set_req,
+				struct f_hidg_req_list, list);
+
+	/*
+	 * Remove this from list to protect it from being free()
+	 * while host disables our function
+	 */
+	list_del(&list->list);
+
+	req = list->req;
+	spin_unlock_irqrestore(&hidg->set_spinlock, flags);
+
+	/* copy to user outside spinlock */
+	length = min_t(unsigned short, sizeof(buffer->data), req->actual);
+	status = copy_to_user(&buffer->length, &length, sizeof(buffer->length));
+	if (!status) {
+	    status = copy_to_user(&buffer->data, req->buf, length);
+	}
+	kfree(list);
+	free_ep_req(hidg->func.config->cdev->gadget->ep0, req);
+	return status;
+}
 
 static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *buffer)
 {
@@ -570,6 +623,8 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 static long f_hidg_ioctl(struct file *file, unsigned int code, unsigned long arg)
 {
 	switch (code) {
+	case GADGET_HID_READ_SET_REPORT:
+		return f_hidg_set_report(file, (struct usb_hidg_report __user *)arg);
 	case GADGET_HID_WRITE_GET_REPORT:
 		return f_hidg_get_report(file, (struct usb_hidg_report __user *)arg);
 	default:
@@ -584,6 +639,7 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &hidg->read_queue, wait);
 	poll_wait(file, &hidg->write_queue, wait);
+	poll_wait(file, &hidg->set_queue, wait);
 
 	if (WRITE_COND)
 		ret |= EPOLLOUT | EPOLLWRNORM;
@@ -596,12 +652,16 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 			ret |= EPOLLIN | EPOLLRDNORM;
 	}
 
+	if (SET_REPORT_COND)
+		ret |= EPOLLPRI;
+
 	return ret;
 }
 
 #undef WRITE_COND
 #undef READ_COND_SSREPORT
 #undef READ_COND_INTOUT
+#undef SET_REPORT_COND
 #undef GET_REPORT_COND
 
 static int f_hidg_release(struct inode *inode, struct file *fd)
@@ -646,11 +706,19 @@ static void hidg_intout_complete(struct usb_ep *ep, struct usb_request *req)
 
 		req_list->req = req;
 
-		spin_lock_irqsave(&hidg->read_spinlock, flags);
-		list_add_tail(&req_list->list, &hidg->completed_out_req);
-		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+		if (ep == cdev->gadget->ep0) {
+			spin_lock_irqsave(&hidg->set_spinlock, flags);
+			list_add_tail(&req_list->list, &hidg->completed_set_req);
+			spin_unlock_irqrestore(&hidg->set_spinlock, flags);
 
-		wake_up(&hidg->read_queue);
+			wake_up(&hidg->set_queue);
+		} else {
+			spin_lock_irqsave(&hidg->read_spinlock, flags);
+			list_add_tail(&req_list->list, &hidg->completed_out_req);
+			spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+
+			wake_up(&hidg->read_queue);
+		}
 		break;
 	default:
 		ERROR(cdev, "Set report failed %d\n", req->status);
@@ -763,12 +831,29 @@ static int hidg_setup(struct usb_function *f,
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_REPORT):
 		VDBG(cdev, "set_report | wLength=%d\n", ctrl->wLength);
-		if (hidg->use_out_ep)
+		if (!hidg->use_out_ep) {
+			req->complete = hidg_ssreport_complete;
+			req->context  = hidg;
+			goto respond;
+		}
+		if (!length) {
 			goto stall;
-		req->complete = hidg_ssreport_complete;
+		}
+		req = alloc_ep_req(cdev->gadget->ep0, GFP_ATOMIC);
+		if (!req) {
+			return -ENOMEM;
+		}
+		req->complete = hidg_intout_complete;
 		req->context  = hidg;
-		goto respond;
-		break;
+		req->zero = 0;
+		req->length = length;
+		status = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
+		if (status < 0) {
+			ERROR(cdev, "usb_ep_queue error on set_report %d\n", status);
+			free_ep_req(cdev->gadget->ep0, req);
+		}
+
+		return status;
 
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_PROTOCOL):
@@ -868,6 +953,14 @@ static void hidg_disable(struct usb_function *f)
 		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
 	}
 
+	spin_lock_irqsave(&hidg->set_spinlock, flags);
+	list_for_each_entry_safe(list, next, &hidg->completed_set_req, list) {
+		free_ep_req(f->config->cdev->gadget->ep0, list->req);
+		list_del(&list->list);
+		kfree(list);
+	}
+	spin_unlock_irqrestore(&hidg->set_spinlock, flags);
+
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 	if (!hidg->write_pending) {
 		free_ep_req(hidg->in_ep, hidg->req);
@@ -1098,11 +1191,14 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg->write_pending = 1;
 	hidg->req = NULL;
 	spin_lock_init(&hidg->read_spinlock);
+	spin_lock_init(&hidg->set_spinlock);
 	spin_lock_init(&hidg->get_spinlock);
 	init_waitqueue_head(&hidg->write_queue);
 	init_waitqueue_head(&hidg->read_queue);
+	init_waitqueue_head(&hidg->set_queue);
 	init_waitqueue_head(&hidg->get_queue);
 	INIT_LIST_HEAD(&hidg->completed_out_req);
+	INIT_LIST_HEAD(&hidg->completed_set_req);
 
 	/* create char device */
 	cdev_init(&hidg->cdev, &f_hidg_fops);
diff --git a/include/uapi/linux/usb/g_hid.h b/include/uapi/linux/usb/g_hid.h
index c6068b486354..81416698e145 100644
--- a/include/uapi/linux/usb/g_hid.h
+++ b/include/uapi/linux/usb/g_hid.h
@@ -33,6 +33,7 @@ struct usb_hidg_report {
  * Don't add any colliding codes to either driver, and keep
  * them in unique ranges (size 0x20 for now).
  */
+#define GADGET_HID_READ_SET_REPORT	_IOR('g', 0x41, struct usb_hidg_report)
 #define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)
 
 #endif /* __UAPI_LINUX_USB_G_HID_H */
-- 
2.37.1

