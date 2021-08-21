Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50ACE3F3ACB
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 15:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhHUNlO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Aug 2021 09:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhHUNlN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Aug 2021 09:41:13 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF58CC061575;
        Sat, 21 Aug 2021 06:40:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v19so1583173lfo.7;
        Sat, 21 Aug 2021 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LtO2pVMK1pREamlebnUwNnFA9SnFh9/PwDg5YcEIi4w=;
        b=muPKZQ4yOpx815+iis51N+bXYMT29XS6MadnDqVLxJSlL440eUtF8jk0FLCWfRtSFo
         mif7kg3nnX5hCI9UTALPlwXLltSs3Xohif9qiBI+Ec1eKOVRf2JMR+KQ3LmiRuAL8jX3
         OGadNYQ+e5HZPspCaWOqrYZvGGnIQVje0CejFEACRhG10cm0E1Utx+f/smQ4jjJIfRtQ
         zw3TxBo/sQYvFCf0fUUCZhOv9TOu5JzdX5bz6HuvwS++fYy0ENiO6i85RY9iSPn/WDxv
         OPe9jdYjnVFS+XI+AYcPxFwKPFdSt8zpeYc+WQXqDI5OjJlnYO4bRhDwLFqcaDFPkh4J
         ssRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LtO2pVMK1pREamlebnUwNnFA9SnFh9/PwDg5YcEIi4w=;
        b=ADPUEhQG0Faq6vApveCWrnS+fil/+ukyA5PmQam/thSE8bnlhF4aTxYFrNJeiA32M4
         9KOOXCzuL5VZOR0mw19bmLVyUgJba5tibHRmmo6MCKkA/mwSa8s2YQVaYdCgBb+dyDlD
         NeB1S7kacDoGJ5qPtjwJ+qwIpOsS9ZjRY1uXC3Emj2XN3Fb5DH73lO4S+WJABpbO97A+
         hfUdTIrWMc/+vcIqp4oYGzr+9sBIOUz39bGXbYLN7IbKYi4kMmAKxRb5mnlwx1QMlyLV
         PURQkCo9asQa1nbAEaTYjjmbGSgjMHVrHHsfSaaZeBnKXxOSR5JeKmTdfpuOt4cXjuK4
         UfOA==
X-Gm-Message-State: AOAM5313OkW/NlT8uBFdNGhzSBhuhky61yf+WHzaOzIWfWLfBJp4ffAs
        E+ucfw4T2xYR9tdw0OrZ5YYRdPcEiACMFg==
X-Google-Smtp-Source: ABdhPJyISHR7nKbQ8qg+53jGkZcyqX3r3hdApK204s3/aYMKXINAz8hEvm3KBrX5BGGCdibXul3b+Q==
X-Received: by 2002:a05:6512:312b:: with SMTP id p11mr18177199lfd.11.1629553232013;
        Sat, 21 Aug 2021 06:40:32 -0700 (PDT)
Received: from localhost.localdomain (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id o20sm913259lfu.148.2021.08.21.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 06:40:31 -0700 (PDT)
From:   Maxim Devaev <mdevaev@gmail.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, mdevaev@gmail.com,
        ruslan.bilovol@gmail.com, mika.westerberg@linux.intel.com,
        jj251510319013@gmail.com, maze@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_hid: optional SETUP/SET_REPORT mode
Date:   Sat, 21 Aug 2021 16:40:04 +0300
Message-Id: <20210821134004.363217-1-mdevaev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

f_hid provides the OUT Endpoint as only way for receiving reports
from the host. SETUP/SET_REPORT method is not supported, and this causes
a number of compatibility problems with various host drivers, especially
in the case of keyboard emulation using f_hid.

  - Some hosts do not support the OUT Endpoint and ignore it,
    so it becomes impossible for the gadget to receive a report
    from the host. In the case of a keyboard, the gadget loses
    the ability to receive the status of the LEDs.

  - Some BIOSes/UEFIs can't work with HID devices with the OUT Endpoint
    at all. This may be due to their bugs or incomplete implementation
    of the HID standard.
    For example, absolutely all Apple UEFIs can't handle the OUT Endpoint
    if it goes after IN Endpoint in the descriptor and require the reverse
    order (OUT, IN) which is a violation of the standard.
    Other hosts either do not initialize gadgets with a descriptor
    containing the OUT Endpoint completely (like some HP and DELL BIOSes
    and embedded firmwares like on KVM switches), or initialize them,
    but will not poll the IN Endpoint.

This patch adds configfs option no_out_endpoint=1 to disable
the OUT Endpoint and allows f_hid to receive reports from the host
via SETUP/SET_REPORT.

Previously, there was such a feature in f_hid, but it was replaced
by the OUT Endpoint [1] in the commit 99c515005857 ("usb: gadget: hidg:
register OUT INT endpoint for SET_REPORT"). So this patch actually
returns the removed functionality while making it optional.
For backward compatibility reasons, the OUT Endpoint mode remains
the default behaviour.

  - The OUT Endpoint mode provides the report queue and reduces
    USB overhead (eliminating SETUP routine) on transmitting a report
    from the host.

  - If the SETUP/SET_REPORT mode is used, there is no report queue,
    so the userspace will only read last report. For classic HID devices
    like keyboards this is not a problem, since it's intended to transmit
    the status of the LEDs and only the last report is important.
    This mode provides better compatibility with strange and buggy
    host drivers.

Both modes passed USBCV tests. Checking with the USB protocol analyzer
also confirmed that everything is working as it should and the new mode
ensures operability in all of the described cases.

Signed-off-by: Maxim Devaev <mdevaev@gmail.com>
Link: https://www.spinics.net/lists/linux-usb/msg65494.html [1]
---
 drivers/usb/gadget/function/f_hid.c | 220 +++++++++++++++++++++++-----
 drivers/usb/gadget/function/u_hid.h |   1 +
 2 files changed, 188 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index bb476e121eae..ca0a7d9eaa34 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -45,12 +45,25 @@ struct f_hidg {
 	unsigned short			report_desc_length;
 	char				*report_desc;
 	unsigned short			report_length;
+	/*
+	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
+	 *              will be used to receive reports from the host
+	 *              using functions with the "intout" suffix.
+	 *              Otherwise, the OUT Endpoint will not be configured
+	 *              and the SETUP/SET_REPORT method ("ssreport" suffix)
+	 *              will be used to receive reports.
+	 */
+	bool				use_out_ep;
 
 	/* recv report */
-	struct list_head		completed_out_req;
 	spinlock_t			read_spinlock;
 	wait_queue_head_t		read_queue;
+	/* recv report - interrupt out only (use_out_ep == 1) */
+	struct list_head		completed_out_req;
 	unsigned int			qlen;
+	/* recv report - setup set_report only (use_out_ep == 0) */
+	char				*set_report_buf;
+	unsigned int			set_report_length;
 
 	/* send report */
 	spinlock_t			write_spinlock;
@@ -79,7 +92,7 @@ static struct usb_interface_descriptor hidg_interface_desc = {
 	.bDescriptorType	= USB_DT_INTERFACE,
 	/* .bInterfaceNumber	= DYNAMIC */
 	.bAlternateSetting	= 0,
-	.bNumEndpoints		= 2,
+	/* .bNumEndpoints	= DYNAMIC (depends on use_out_ep) */
 	.bInterfaceClass	= USB_CLASS_HID,
 	/* .bInterfaceSubClass	= DYNAMIC */
 	/* .bInterfaceProtocol	= DYNAMIC */
@@ -140,7 +153,7 @@ static struct usb_ss_ep_comp_descriptor hidg_ss_out_comp_desc = {
 	/* .wBytesPerInterval   = DYNAMIC */
 };
 
-static struct usb_descriptor_header *hidg_ss_descriptors[] = {
+static struct usb_descriptor_header *hidg_ss_descriptors_intout[] = {
 	(struct usb_descriptor_header *)&hidg_interface_desc,
 	(struct usb_descriptor_header *)&hidg_desc,
 	(struct usb_descriptor_header *)&hidg_ss_in_ep_desc,
@@ -150,6 +163,14 @@ static struct usb_descriptor_header *hidg_ss_descriptors[] = {
 	NULL,
 };
 
+static struct usb_descriptor_header *hidg_ss_descriptors_ssreport[] = {
+	(struct usb_descriptor_header *)&hidg_interface_desc,
+	(struct usb_descriptor_header *)&hidg_desc,
+	(struct usb_descriptor_header *)&hidg_ss_in_ep_desc,
+	(struct usb_descriptor_header *)&hidg_ss_in_comp_desc,
+	NULL,
+};
+
 /* High-Speed Support */
 
 static struct usb_endpoint_descriptor hidg_hs_in_ep_desc = {
@@ -176,7 +197,7 @@ static struct usb_endpoint_descriptor hidg_hs_out_ep_desc = {
 				      */
 };
 
-static struct usb_descriptor_header *hidg_hs_descriptors[] = {
+static struct usb_descriptor_header *hidg_hs_descriptors_intout[] = {
 	(struct usb_descriptor_header *)&hidg_interface_desc,
 	(struct usb_descriptor_header *)&hidg_desc,
 	(struct usb_descriptor_header *)&hidg_hs_in_ep_desc,
@@ -184,6 +205,13 @@ static struct usb_descriptor_header *hidg_hs_descriptors[] = {
 	NULL,
 };
 
+static struct usb_descriptor_header *hidg_hs_descriptors_ssreport[] = {
+	(struct usb_descriptor_header *)&hidg_interface_desc,
+	(struct usb_descriptor_header *)&hidg_desc,
+	(struct usb_descriptor_header *)&hidg_hs_in_ep_desc,
+	NULL,
+};
+
 /* Full-Speed Support */
 
 static struct usb_endpoint_descriptor hidg_fs_in_ep_desc = {
@@ -210,7 +238,7 @@ static struct usb_endpoint_descriptor hidg_fs_out_ep_desc = {
 				       */
 };
 
-static struct usb_descriptor_header *hidg_fs_descriptors[] = {
+static struct usb_descriptor_header *hidg_fs_descriptors_intout[] = {
 	(struct usb_descriptor_header *)&hidg_interface_desc,
 	(struct usb_descriptor_header *)&hidg_desc,
 	(struct usb_descriptor_header *)&hidg_fs_in_ep_desc,
@@ -218,6 +246,13 @@ static struct usb_descriptor_header *hidg_fs_descriptors[] = {
 	NULL,
 };
 
+static struct usb_descriptor_header *hidg_fs_descriptors_ssreport[] = {
+	(struct usb_descriptor_header *)&hidg_interface_desc,
+	(struct usb_descriptor_header *)&hidg_desc,
+	(struct usb_descriptor_header *)&hidg_fs_in_ep_desc,
+	NULL,
+};
+
 /*-------------------------------------------------------------------------*/
 /*                                 Strings                                 */
 
@@ -241,8 +276,8 @@ static struct usb_gadget_strings *ct_func_strings[] = {
 /*-------------------------------------------------------------------------*/
 /*                              Char Device                                */
 
-static ssize_t f_hidg_read(struct file *file, char __user *buffer,
-			size_t count, loff_t *ptr)
+static ssize_t f_hidg_intout_read(struct file *file, char __user *buffer,
+				  size_t count, loff_t *ptr)
 {
 	struct f_hidg *hidg = file->private_data;
 	struct f_hidg_req_list *list;
@@ -255,15 +290,15 @@ static ssize_t f_hidg_read(struct file *file, char __user *buffer,
 
 	spin_lock_irqsave(&hidg->read_spinlock, flags);
 
-#define READ_COND (!list_empty(&hidg->completed_out_req))
+#define READ_COND_INTOUT (!list_empty(&hidg->completed_out_req))
 
 	/* wait for at least one buffer to complete */
-	while (!READ_COND) {
+	while (!READ_COND_INTOUT) {
 		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
 		if (file->f_flags & O_NONBLOCK)
 			return -EAGAIN;
 
-		if (wait_event_interruptible(hidg->read_queue, READ_COND))
+		if (wait_event_interruptible(hidg->read_queue, READ_COND_INTOUT))
 			return -ERESTARTSYS;
 
 		spin_lock_irqsave(&hidg->read_spinlock, flags);
@@ -313,6 +348,60 @@ static ssize_t f_hidg_read(struct file *file, char __user *buffer,
 	return count;
 }
 
+#define READ_COND_SSREPORT (hidg->set_report_buf != NULL)
+
+static ssize_t f_hidg_ssreport_read(struct file *file, char __user *buffer,
+				    size_t count, loff_t *ptr)
+{
+	struct f_hidg *hidg = file->private_data;
+	char *tmp_buf = NULL;
+	unsigned long flags;
+
+	if (!count)
+		return 0;
+
+	spin_lock_irqsave(&hidg->read_spinlock, flags);
+
+	while (!READ_COND_SSREPORT) {
+		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+
+		if (wait_event_interruptible(hidg->read_queue, READ_COND_SSREPORT))
+			return -ERESTARTSYS;
+
+		spin_lock_irqsave(&hidg->read_spinlock, flags);
+	}
+
+	count = min_t(unsigned int, count, hidg->set_report_length);
+	tmp_buf = hidg->set_report_buf;
+	hidg->set_report_buf = NULL;
+
+	spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+
+	if (tmp_buf != NULL) {
+		count -= copy_to_user(buffer, tmp_buf, count);
+		kfree(tmp_buf);
+	} else {
+		count = -ENOMEM;
+	}
+
+	wake_up(&hidg->read_queue);
+
+	return count;
+}
+
+static ssize_t f_hidg_read(struct file *file, char __user *buffer,
+			   size_t count, loff_t *ptr)
+{
+	struct f_hidg *hidg = file->private_data;
+
+	if (hidg->use_out_ep)
+		return f_hidg_intout_read(file, buffer, count, ptr);
+	else
+		return f_hidg_ssreport_read(file, buffer, count, ptr);
+}
+
 static void f_hidg_req_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct f_hidg *hidg = (struct f_hidg *)ep->driver_data;
@@ -433,14 +522,20 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 	if (WRITE_COND)
 		ret |= EPOLLOUT | EPOLLWRNORM;
 
-	if (READ_COND)
-		ret |= EPOLLIN | EPOLLRDNORM;
+	if (hidg->use_out_ep) {
+		if (READ_COND_INTOUT)
+			ret |= EPOLLIN | EPOLLRDNORM;
+	} else {
+		if (READ_COND_SSREPORT)
+			ret |= EPOLLIN | EPOLLRDNORM;
+	}
 
 	return ret;
 }
 
 #undef WRITE_COND
-#undef READ_COND
+#undef READ_COND_SSREPORT
+#undef READ_COND_INTOUT
 
 static int f_hidg_release(struct inode *inode, struct file *fd)
 {
@@ -467,7 +562,7 @@ static inline struct usb_request *hidg_alloc_ep_req(struct usb_ep *ep,
 	return alloc_ep_req(ep, length);
 }
 
-static void hidg_set_report_complete(struct usb_ep *ep, struct usb_request *req)
+static void hidg_intout_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct f_hidg *hidg = (struct f_hidg *) req->context;
 	struct usb_composite_dev *cdev = hidg->func.config->cdev;
@@ -502,6 +597,37 @@ static void hidg_set_report_complete(struct usb_ep *ep, struct usb_request *req)
 	}
 }
 
+static void hidg_ssreport_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct f_hidg *hidg = (struct f_hidg *)req->context;
+	struct usb_composite_dev *cdev = hidg->func.config->cdev;
+	char *new_buf = NULL;
+	unsigned long flags;
+
+	if (req->status != 0 || req->buf == NULL || req->actual == 0) {
+		ERROR(cdev,
+		      "%s FAILED: status=%d, buf=%p, actual=%d\n",
+		      __func__, req->status, req->buf, req->actual);
+		return;
+	}
+
+	spin_lock_irqsave(&hidg->read_spinlock, flags);
+
+	new_buf = krealloc(hidg->set_report_buf, req->actual, GFP_ATOMIC);
+	if (new_buf == NULL) {
+		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+		return;
+	}
+	hidg->set_report_buf = new_buf;
+
+	hidg->set_report_length = req->actual;
+	memcpy(hidg->set_report_buf, req->buf, req->actual);
+
+	spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+
+	wake_up(&hidg->read_queue);
+}
+
 static int hidg_setup(struct usb_function *f,
 		const struct usb_ctrlrequest *ctrl)
 {
@@ -549,7 +675,11 @@ static int hidg_setup(struct usb_function *f,
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_REPORT):
 		VDBG(cdev, "set_report | wLength=%d\n", ctrl->wLength);
-		goto stall;
+		if (hidg->use_out_ep)
+			goto stall;
+		req->complete = hidg_ssreport_complete;
+		req->context  = hidg;
+		goto respond;
 		break;
 
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
@@ -637,15 +767,18 @@ static void hidg_disable(struct usb_function *f)
 	unsigned long flags;
 
 	usb_ep_disable(hidg->in_ep);
-	usb_ep_disable(hidg->out_ep);
 
-	spin_lock_irqsave(&hidg->read_spinlock, flags);
-	list_for_each_entry_safe(list, next, &hidg->completed_out_req, list) {
-		free_ep_req(hidg->out_ep, list->req);
-		list_del(&list->list);
-		kfree(list);
+	if (hidg->out_ep) {
+		usb_ep_disable(hidg->out_ep);
+
+		spin_lock_irqsave(&hidg->read_spinlock, flags);
+		list_for_each_entry_safe(list, next, &hidg->completed_out_req, list) {
+			free_ep_req(hidg->out_ep, list->req);
+			list_del(&list->list);
+			kfree(list);
+		}
+		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
 	}
-	spin_unlock_irqrestore(&hidg->read_spinlock, flags);
 
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 	if (!hidg->write_pending) {
@@ -691,8 +824,7 @@ static int hidg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		}
 	}
 
-
-	if (hidg->out_ep != NULL) {
+	if (hidg->use_out_ep && hidg->out_ep != NULL) {
 		/* restart endpoint */
 		usb_ep_disable(hidg->out_ep);
 
@@ -717,7 +849,7 @@ static int hidg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 					hidg_alloc_ep_req(hidg->out_ep,
 							  hidg->report_length);
 			if (req) {
-				req->complete = hidg_set_report_complete;
+				req->complete = hidg_intout_complete;
 				req->context  = hidg;
 				status = usb_ep_queue(hidg->out_ep, req,
 						      GFP_ATOMIC);
@@ -743,7 +875,8 @@ static int hidg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 	}
 	return 0;
 disable_out_ep:
-	usb_ep_disable(hidg->out_ep);
+	if (hidg->out_ep)
+		usb_ep_disable(hidg->out_ep);
 free_req_in:
 	if (req_in)
 		free_ep_req(hidg->in_ep, req_in);
@@ -795,14 +928,21 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		goto fail;
 	hidg->in_ep = ep;
 
-	ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
-	if (!ep)
-		goto fail;
-	hidg->out_ep = ep;
+	hidg->out_ep = NULL;
+	if (hidg->use_out_ep) {
+		ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
+		if (!ep)
+			goto fail;
+		hidg->out_ep = ep;
+	}
+
+	/* used only if use_out_ep == 1 */
+	hidg->set_report_buf = NULL;
 
 	/* set descriptor dynamic values */
 	hidg_interface_desc.bInterfaceSubClass = hidg->bInterfaceSubClass;
 	hidg_interface_desc.bInterfaceProtocol = hidg->bInterfaceProtocol;
+	hidg_interface_desc.bNumEndpoints = hidg->use_out_ep ? 2 : 1;
 	hidg->protocol = HID_REPORT_PROTOCOL;
 	hidg->idle = 1;
 	hidg_ss_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
@@ -833,9 +973,19 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_ss_out_ep_desc.bEndpointAddress =
 		hidg_fs_out_ep_desc.bEndpointAddress;
 
-	status = usb_assign_descriptors(f, hidg_fs_descriptors,
-			hidg_hs_descriptors, hidg_ss_descriptors,
-			hidg_ss_descriptors);
+	if (hidg->use_out_ep)
+		status = usb_assign_descriptors(f,
+			hidg_fs_descriptors_intout,
+			hidg_hs_descriptors_intout,
+			hidg_ss_descriptors_intout,
+			hidg_ss_descriptors_intout);
+	else
+		status = usb_assign_descriptors(f,
+			hidg_fs_descriptors_ssreport,
+			hidg_hs_descriptors_ssreport,
+			hidg_ss_descriptors_ssreport,
+			hidg_ss_descriptors_ssreport);
+
 	if (status)
 		goto fail;
 
@@ -950,6 +1100,7 @@ CONFIGFS_ATTR(f_hid_opts_, name)
 
 F_HID_OPT(subclass, 8, 255);
 F_HID_OPT(protocol, 8, 255);
+F_HID_OPT(no_out_endpoint, 8, 1);
 F_HID_OPT(report_length, 16, 65535);
 
 static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
@@ -1009,6 +1160,7 @@ CONFIGFS_ATTR_RO(f_hid_opts_, dev);
 static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_subclass,
 	&f_hid_opts_attr_protocol,
+	&f_hid_opts_attr_no_out_endpoint,
 	&f_hid_opts_attr_report_length,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
@@ -1093,6 +1245,7 @@ static void hidg_free(struct usb_function *f)
 	hidg = func_to_hidg(f);
 	opts = container_of(f->fi, struct f_hid_opts, func_inst);
 	kfree(hidg->report_desc);
+	kfree(hidg->set_report_buf);
 	kfree(hidg);
 	mutex_lock(&opts->lock);
 	--opts->refcnt;
@@ -1139,6 +1292,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 			return ERR_PTR(-ENOMEM);
 		}
 	}
+	hidg->use_out_ep = !opts->no_out_endpoint;
 
 	mutex_unlock(&opts->lock);
 
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index 98d6af558c03..84bb70292855 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -20,6 +20,7 @@ struct f_hid_opts {
 	int				minor;
 	unsigned char			subclass;
 	unsigned char			protocol;
+	unsigned char			no_out_endpoint;
 	unsigned short			report_length;
 	unsigned short			report_desc_length;
 	unsigned char			*report_desc;
-- 
2.32.0

