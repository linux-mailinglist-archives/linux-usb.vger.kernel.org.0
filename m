Return-Path: <linux-usb+bounces-5199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA2831090
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 01:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1A51F22CC7
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 00:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCA8211C;
	Thu, 18 Jan 2024 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="GG0ievhB"
X-Original-To: linux-usb@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E01844
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 00:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538293; cv=none; b=huMpVX8uT2e7vHZYd9yo2Bk/XRhKHmFtwFQEfqVfKc+hmiw9w/OhAErHXOPQiB4xJufgknHzTHMTLIeB5rzyDMQc8rsjaBl+eYWxiMOYInmR9loLs1N0S1TRx41XoMb9qDsEFSM6FSbG20TFNuftOUdO1q/y1vxLmVC/R35j2mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538293; c=relaxed/simple;
	bh=1GQgppB3FHDZRwWy7GMQzWHMwOUq3BrwY669+lhCsL0=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=A/eMJ1Lb24LZCPZ5VlujZXqTIkjGNAVZqvVXX1q/IyXHNrJXM8Zv00cpUDumccK7wx6tGl2XF8i3adhem/Ynv12PhHQHa12TLJGjF2dDhPbkvir148IQopyqmOnu51y9rNwhvwquZNVZLW9ZLT+TiEJElQ7JyCInCMLPqpaKv0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=GG0ievhB; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from microtis.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 4CAB8A250;
	Wed, 17 Jan 2024 16:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1705538284; bh=1GQgppB3FHDZRwWy7GMQzWHMwOUq3BrwY669+lhCsL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GG0ievhBsJN/KjkNGC4QMjRPF3bQBybRauVu8Brye5+VSr76bGmnILklEDuBOOgB7
	 QF0GJ2dhrojVgSCNxrBD2zGPauXAcAHN8f5GgXWngsU/jtWLwPSeWtbXqyZXtqVmM4
	 kdX7bnuLxzScYoCjxcYuxQ43Nk2y6ER8YnwdmCknllgZZifxrJKxWP6K3uECBATqFk
	 5tpI3sbxv+gtHotLtQbtU/2ipybvA/rJkrPYfSMxEWVKnCBOmIlPHglTJHXFoNrdd7
	 boc6AVjka7fMIN7lGZs5tzJMfB68vGT1ZyJUYyCRMmnTpPHxPGzeAFAjU5ARNsTMEq
	 1vIzGyhtU0/tQ==
From: Vicki Pfau <vi@endrift.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Maxim Devaev <mdevaev@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>,
	David Sands <david.sands@biamp.com>
Subject: [PATCH v2 2/3] USB: gadget: f_hid: Add Get-Feature report
Date: Wed, 17 Jan 2024 16:37:56 -0800
Message-ID: <20240118003758.1870691-3-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118003758.1870691-1-vi@endrift.com>
References: <20240118003758.1870691-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the HID gadget implementation has been sufficient for devices that only
use INTERRUPT transfers, the USB HID standard includes provisions for Set- and
Get-Feature report CONTROL transfers that go over endpoint 0. These were
previously impossible with the existing implementation, and would either send
an empty reply, or stall out.

As the feature is a standard part of USB HID, it stands to reason that devices
would use it, and that the HID gadget should support it. This patch adds
support for (polled) device-to-host Get-Feature reports through a new ioctl
interface to the hidg class dev nodes.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/usb/gadget/function/f_hid.c   | 121 ++++++++++++++++++++++++--
 include/uapi/linux/usb/g_hid.h        |  19 ++++
 include/uapi/linux/usb/gadget-ioctl.h |   3 +
 3 files changed, 137 insertions(+), 6 deletions(-)
 create mode 100644 include/uapi/linux/usb/g_hid.h

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c8a9dd585c0..5a097ea718e8 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -16,6 +16,7 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/usb/g_hid.h>
+#include <uapi/linux/usb/g_hid.h>
 
 #include "u_f.h"
 #include "u_hid.h"
@@ -75,6 +76,13 @@ struct f_hidg {
 	wait_queue_head_t		write_queue;
 	struct usb_request		*req;
 
+	/* get report */
+	struct usb_request		*get_req;
+	struct usb_hidg_report		get_report;
+	spinlock_t			get_spinlock;
+	bool				get_pending;
+	wait_queue_head_t		get_queue;
+
 	struct device			dev;
 	struct cdev			cdev;
 	struct usb_function		func;
@@ -524,6 +532,64 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
 	return status;
 }
 
+
+static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *buffer)
+{
+	struct f_hidg			*hidg = file->private_data;
+	struct usb_composite_dev	*cdev = hidg->func.config->cdev;
+
+	int		status = 0;
+	unsigned long	flags;
+
+	spin_lock_irqsave(&hidg->get_spinlock, flags);
+
+#define GET_REPORT_COND (!hidg->get_pending)
+
+	while (!GET_REPORT_COND) {
+		spin_unlock_irqrestore(&hidg->get_spinlock, flags);
+
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+
+		if (wait_event_interruptible_exclusive(hidg->get_queue,
+						       GET_REPORT_COND))
+			return -ERESTARTSYS;
+
+		spin_lock_irqsave(&hidg->get_spinlock, flags);
+		if (!hidg->get_pending) {
+			spin_unlock_irqrestore(&hidg->get_spinlock, flags);
+			return -EINVAL;
+		}
+	}
+
+	hidg->get_pending = true;
+	spin_unlock_irqrestore(&hidg->get_spinlock, flags);
+
+	status = copy_from_user(&hidg->get_report, buffer,
+				sizeof(struct usb_hidg_report));
+	if (status != 0) {
+		ERROR(cdev, "copy_from_user error\n");
+		status = -EINVAL;
+	}
+
+	spin_lock_irqsave(&hidg->get_spinlock, flags);
+	hidg->get_pending = false;
+	spin_unlock_irqrestore(&hidg->get_spinlock, flags);
+
+	wake_up(&hidg->get_queue);
+	return status;
+}
+
+static long f_hidg_ioctl(struct file *file, unsigned int code, unsigned long arg)
+{
+	switch (code) {
+	case GADGET_HID_WRITE_GET_REPORT:
+		return f_hidg_get_report(file, (struct usb_hidg_report __user *)arg);
+	default:
+		return -ENOTTY;
+	}
+}
+
 static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 {
 	struct f_hidg	*hidg  = file->private_data;
@@ -549,6 +615,7 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 #undef WRITE_COND
 #undef READ_COND_SSREPORT
 #undef READ_COND_INTOUT
+#undef GET_REPORT_COND
 
 static int f_hidg_release(struct inode *inode, struct file *fd)
 {
@@ -641,6 +708,10 @@ static void hidg_ssreport_complete(struct usb_ep *ep, struct usb_request *req)
 	wake_up(&hidg->read_queue);
 }
 
+static void hidg_get_report_complete(struct usb_ep *ep, struct usb_request *req)
+{
+}
+
 static int hidg_setup(struct usb_function *f,
 		const struct usb_ctrlrequest *ctrl)
 {
@@ -648,6 +719,8 @@ static int hidg_setup(struct usb_function *f,
 	struct usb_composite_dev	*cdev = f->config->cdev;
 	struct usb_request		*req  = cdev->req;
 	int status = 0;
+	unsigned long flags;
+	bool do_wake = false;
 	__u16 value, length;
 
 	value	= __le16_to_cpu(ctrl->wValue);
@@ -660,14 +733,29 @@ static int hidg_setup(struct usb_function *f,
 	switch ((ctrl->bRequestType << 8) | ctrl->bRequest) {
 	case ((USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_GET_REPORT):
-		VDBG(cdev, "get_report\n");
+		VDBG(cdev, "get_report | wLength=%d\n", ctrl->wLength);
 
-		/* send an empty report */
-		length = min_t(unsigned, length, hidg->report_length);
-		memset(req->buf, 0x0, length);
+		req = hidg->get_req;
+		req->zero = 0;
+		req->length = min_t(unsigned, length, hidg->report_length);
+		status = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
+		if (status < 0) {
+			ERROR(cdev, "usb_ep_queue error on get_report %d\n",
+			      status);
 
-		goto respond;
-		break;
+			spin_lock_irqsave(&hidg->get_spinlock, flags);
+			if (hidg->get_pending) {
+				hidg->get_pending = false;
+				do_wake = true;
+			}
+			spin_unlock_irqrestore(&hidg->get_spinlock, flags);
+
+			if (do_wake) {
+				wake_up(&hidg->get_queue);
+			}
+		}
+
+		return status;
 
 	case ((USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_GET_PROTOCOL):
@@ -801,6 +889,14 @@ static void hidg_disable(struct usb_function *f)
 
 	hidg->req = NULL;
 	spin_unlock_irqrestore(&hidg->write_spinlock, flags);
+
+	spin_lock_irqsave(&hidg->get_spinlock, flags);
+	if (!hidg->get_pending) {
+		usb_ep_free_request(f->config->cdev->gadget->ep0, hidg->get_req);
+		hidg->get_pending = true;
+	}
+	hidg->get_req = NULL;
+	spin_unlock_irqrestore(&hidg->get_spinlock, flags);
 }
 
 static int hidg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
@@ -909,6 +1005,7 @@ static const struct file_operations f_hidg_fops = {
 	.write		= f_hidg_write,
 	.read		= f_hidg_read,
 	.poll		= f_hidg_poll,
+	.unlocked_ioctl	= f_hidg_ioctl,
 	.llseek		= noop_llseek,
 };
 
@@ -919,6 +1016,14 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	struct usb_string	*us;
 	int			status;
 
+	hidg->get_req = usb_ep_alloc_request(c->cdev->gadget->ep0, GFP_ATOMIC);
+	if (!hidg->get_req)
+		return -ENOMEM;
+	hidg->get_req->buf = hidg->get_report.data;
+	hidg->get_req->zero = 0;
+	hidg->get_req->complete = hidg_get_report_complete;
+	hidg->get_req->context = hidg;
+
 	/* maybe allocate device-global string IDs, and patch descriptors */
 	us = usb_gstrings_attach(c->cdev, ct_func_strings,
 				 ARRAY_SIZE(ct_func_string_defs));
@@ -1004,8 +1109,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg->write_pending = 1;
 	hidg->req = NULL;
 	spin_lock_init(&hidg->read_spinlock);
+	spin_lock_init(&hidg->get_spinlock);
 	init_waitqueue_head(&hidg->write_queue);
 	init_waitqueue_head(&hidg->read_queue);
+	init_waitqueue_head(&hidg->get_queue);
 	INIT_LIST_HEAD(&hidg->completed_out_req);
 
 	/* create char device */
@@ -1022,6 +1129,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (hidg->req != NULL)
 		free_ep_req(hidg->in_ep, hidg->req);
 
+	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
+
 	return status;
 }
 
diff --git a/include/uapi/linux/usb/g_hid.h b/include/uapi/linux/usb/g_hid.h
new file mode 100644
index 000000000000..187224dcc0a1
--- /dev/null
+++ b/include/uapi/linux/usb/g_hid.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+
+#ifndef __UAPI_LINUX_USB_G_HID_H
+#define __UAPI_LINUX_USB_G_HID_H
+
+#include <linux/types.h>
+
+#include <linux/usb/gadget-ioctl.h>
+
+/* This value is based on the maximum value of wMaxPacketSize for an endpoint,
+ * which in USB 3.2 is defined as 512 for control packets in section 9.6.6 */
+#define HIDG_REPORT_SIZE_MAX 512
+
+struct usb_hidg_report {
+	__u16 length;
+	__u8 data[HIDG_REPORT_SIZE_MAX];
+};
+
+#endif /* __UAPI_LINUX_USB_G_HID_H */
diff --git a/include/uapi/linux/usb/gadget-ioctl.h b/include/uapi/linux/usb/gadget-ioctl.h
index b5f8f7894db7..81f488643b53 100644
--- a/include/uapi/linux/usb/gadget-ioctl.h
+++ b/include/uapi/linux/usb/gadget-ioctl.h
@@ -25,6 +25,9 @@
  */
 #define	GADGETFS_CLEAR_HALT	_IO('g', 3)
 
+/* g_hid ioctls */
+#define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)
+
 /* g_printer ioctls */
 #define GADGET_GET_PRINTER_STATUS	_IOR('g', 0x21, unsigned char)
 #define GADGET_SET_PRINTER_STATUS	_IOWR('g', 0x22, unsigned char)
-- 
2.43.0


