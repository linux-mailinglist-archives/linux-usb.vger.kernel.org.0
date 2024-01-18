Return-Path: <linux-usb+bounces-5198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634583108F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 01:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1E21C21A88
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 00:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3E32115;
	Thu, 18 Jan 2024 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="UfeVu/VA"
X-Original-To: linux-usb@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78B186E
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 00:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538293; cv=none; b=OwsLWz5RC7DysrhoHNxbgoKA9yqxt/9L8543XVJfrwJpFt/qXFzboCFOVw79Cr74gcc+XCTleOYqGSbyd01Hk7pP0KGLeDfxENHFIzqtgfJknWolXd/kjyYKU6xanCRgVZsCp70CZx0m0c1Ncv9J5yrRVkoAoR2GvEScMdOpBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538293; c=relaxed/simple;
	bh=ZTMn8Kd1wry6pZc9CBL4lRv6jXJ/1ry8JyU4D6TSWP8=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=RXCnBKWe+Srby+mqttCm6rvYUGr5EdKV6h51JvwI/gm6xhLLFBqA+z6Pl/HTzqTD5pFbC3Ruo8bnzMuT5HGNR4+w+l8Bn5HLBMFjh02idy6auhOehPheRtjpYjtK8lMA49zlZlrfxK99NCpMu09A198uclt32bE/sR6alOGTBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=UfeVu/VA; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from microtis.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id C0BE2A2E9;
	Wed, 17 Jan 2024 16:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1705538285; bh=ZTMn8Kd1wry6pZc9CBL4lRv6jXJ/1ry8JyU4D6TSWP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UfeVu/VA1iHaZSOuLH9EiBaocOAZYxkAGAYbCZ0E57Z37fB0q1jur+y5POee0Eknc
	 RrBafEnMhvrouAT3mliFaVu713CHR6ioGI3Pb2Re8ys01m1bgagnwBybPxFI5FIihf
	 8j6QMr4NpSE90a2qTn/dn/QyV+8oad6Ut9ZswUc8oFyfyDxDNZuVsNnHPxXKxt60WZ
	 McjW8FflL68/Ab99I7PVMDzMcGF8RkcHLKAPjv/0F3rYiIsSfyxHN1hhNCvXLQOjUs
	 sK5cRSqvchk1sEuIfS+hgACg1C8+P56KppWK/38FGCXEW++cDkT9fVhSCnta2feYFa
	 Nkz1CnitgWLGA==
From: Vicki Pfau <vi@endrift.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Maxim Devaev <mdevaev@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>,
	David Sands <david.sands@biamp.com>
Subject: [PATCH v2 3/3] USB: gadget: f_hid: Add Set-Feature report
Date: Wed, 17 Jan 2024 16:37:57 -0800
Message-ID: <20240118003758.1870691-4-vi@endrift.com>
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
support for host-to-device Set-Feature reports through a new ioctl
interface to the hidg class dev nodes.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/usb/gadget/function/f_hid.c   | 110 ++++++++++++++++++++++++--
 include/uapi/linux/usb/gadget-ioctl.h |   1 +
 2 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 5a097ea718e8..18e679dc52e3 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -76,6 +76,11 @@ struct f_hidg {
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
@@ -532,6 +537,54 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
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
@@ -583,6 +636,8 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 static long f_hidg_ioctl(struct file *file, unsigned int code, unsigned long arg)
 {
 	switch (code) {
+	case GADGET_HID_READ_SET_REPORT:
+		return f_hidg_set_report(file, (struct usb_hidg_report __user *)arg);
 	case GADGET_HID_WRITE_GET_REPORT:
 		return f_hidg_get_report(file, (struct usb_hidg_report __user *)arg);
 	default:
@@ -597,6 +652,7 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &hidg->read_queue, wait);
 	poll_wait(file, &hidg->write_queue, wait);
+	poll_wait(file, &hidg->set_queue, wait);
 
 	if (WRITE_COND)
 		ret |= EPOLLOUT | EPOLLWRNORM;
@@ -609,12 +665,16 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
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
@@ -659,11 +719,19 @@ static void hidg_intout_complete(struct usb_ep *ep, struct usb_request *req)
 
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
@@ -776,12 +844,27 @@ static int hidg_setup(struct usb_function *f,
 	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
 		  | HID_REQ_SET_REPORT):
 		VDBG(cdev, "set_report | wLength=%d\n", ctrl->wLength);
-		if (hidg->use_out_ep)
+		if (!hidg->use_out_ep) {
+			req->complete = hidg_ssreport_complete;
+			req->context  = hidg;
+			goto respond;
+		}
+		if (!length)
 			goto stall;
-		req->complete = hidg_ssreport_complete;
+		req = alloc_ep_req(cdev->gadget->ep0, GFP_ATOMIC);
+		if (!req)
+			return -ENOMEM;
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
@@ -881,6 +964,14 @@ static void hidg_disable(struct usb_function *f)
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
@@ -1109,11 +1200,14 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
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
diff --git a/include/uapi/linux/usb/gadget-ioctl.h b/include/uapi/linux/usb/gadget-ioctl.h
index 81f488643b53..f447699148e4 100644
--- a/include/uapi/linux/usb/gadget-ioctl.h
+++ b/include/uapi/linux/usb/gadget-ioctl.h
@@ -26,6 +26,7 @@
 #define	GADGETFS_CLEAR_HALT	_IO('g', 3)
 
 /* g_hid ioctls */
+#define GADGET_HID_READ_SET_REPORT	_IOR('g', 0x41, struct usb_hidg_report)
 #define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)
 
 /* g_printer ioctls */
-- 
2.43.0


