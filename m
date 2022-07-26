Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9EA15808E8
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 03:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbiGZBI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 21:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiGZBI1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 21:08:27 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EAE27FE9
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 18:08:25 -0700 (PDT)
Received: from localhost.localdomain (c-73-100-220-23.hsd1.ma.comcast.net [73.100.220.23])
        by endrift.com (Postfix) with ESMTPSA id A131DA271;
        Mon, 25 Jul 2022 17:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1658797186; bh=gakgo5hXTsTowEg0KqZq0sl9heuXZCdmFs2JJpNjcsc=;
        h=From:To:Cc:Subject:Date:From;
        b=vjULK8sXVpc6A7P+iIz2YTABJqW60HlDkCayT0QdSFiXHjt0l/stfkpAQL950HDcZ
         C99urxu+NFp/H8luAZfCQRpPQTYihhg6KyXyPDuQiOPv2bt+1V7MZbJM3IGkcUEym+
         RwB6/DvB1QfQwYHVqbaqFP8mYj9qoXvm3rEgTOa2c3D45LE2gcmoeJii74CxyYdrvd
         0camU0sx5ptvdtb7dBqX+M0Y4WrMzxh9PWtufdda2LuIR6U/T41+b8j159dbhikzZi
         q5nmK0Z28EI6Hpb4dyfepufUJCfvrWN04b7AllZOzNKuKspLyqFFRYGe+7bZLOrDca
         mJQDY6nw/p0Ag==
From:   Vicki Pfau <vi@endrift.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxim Devaev <mdevaev@gmail.com>, linux-usb@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/2] USB: gadget: f_hid: Add Get-Feature report
Date:   Mon, 25 Jul 2022 17:58:25 -0700
Message-Id: <20220726005824.2817646-1-vi@endrift.com>
X-Mailer: git-send-email 2.37.1
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
support for (polled) device-to-host Get-Feature reports through a new ioctl
interface to the hidg class dev nodes.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/usb/gadget/function/f_hid.c | 121 ++++++++++++++++++++++++++--
 include/uapi/linux/usb/g_hid.h      |  38 +++++++++
 include/uapi/linux/usb/gadgetfs.h   |   2 +-
 3 files changed, 154 insertions(+), 7 deletions(-)
 create mode 100644 include/uapi/linux/usb/g_hid.h

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index ca0a7d9eaa34..7e70e4a168e6 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -16,6 +16,7 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/usb/g_hid.h>
+#include <uapi/linux/usb/g_hid.h>
 
 #include "u_f.h"
 #include "u_hid.h"
@@ -71,6 +72,13 @@ struct f_hidg {
 	wait_queue_head_t		write_queue;
 	struct usb_request		*req;
 
+	/* get report */
+	struct usb_request		*get_req;
+	struct usb_hidg_report		get_report;
+	spinlock_t			get_spinlock;
+	bool				get_pending;
+	wait_queue_head_t		get_queue;
+
 	int				minor;
 	struct cdev			cdev;
 	struct usb_function		func;
@@ -511,6 +519,64 @@ static ssize_t f_hidg_write(struct file *file, const char __user *buffer,
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
@@ -536,6 +602,7 @@ static __poll_t f_hidg_poll(struct file *file, poll_table *wait)
 #undef WRITE_COND
 #undef READ_COND_SSREPORT
 #undef READ_COND_INTOUT
+#undef GET_REPORT_COND
 
 static int f_hidg_release(struct inode *inode, struct file *fd)
 {
@@ -628,6 +695,10 @@ static void hidg_ssreport_complete(struct usb_ep *ep, struct usb_request *req)
 	wake_up(&hidg->read_queue);
 }
 
+static void hidg_get_report_complete(struct usb_ep *ep, struct usb_request *req)
+{
+}
+
 static int hidg_setup(struct usb_function *f,
 		const struct usb_ctrlrequest *ctrl)
 {
@@ -635,6 +706,8 @@ static int hidg_setup(struct usb_function *f,
 	struct usb_composite_dev	*cdev = f->config->cdev;
 	struct usb_request		*req  = cdev->req;
 	int status = 0;
+	unsigned long flags;
+	bool do_wake = false;
 	__u16 value, length;
 
 	value	= __le16_to_cpu(ctrl->wValue);
@@ -647,14 +720,29 @@ static int hidg_setup(struct usb_function *f,
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
@@ -788,6 +876,14 @@ static void hidg_disable(struct usb_function *f)
 
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
@@ -896,6 +992,7 @@ static const struct file_operations f_hidg_fops = {
 	.write		= f_hidg_write,
 	.read		= f_hidg_read,
 	.poll		= f_hidg_poll,
+	.unlocked_ioctl	= f_hidg_ioctl,
 	.llseek		= noop_llseek,
 };
 
@@ -908,6 +1005,14 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	int			status;
 	dev_t			dev;
 
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
@@ -993,8 +1098,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg->write_pending = 1;
 	hidg->req = NULL;
 	spin_lock_init(&hidg->read_spinlock);
+	spin_lock_init(&hidg->get_spinlock);
 	init_waitqueue_head(&hidg->write_queue);
 	init_waitqueue_head(&hidg->read_queue);
+	init_waitqueue_head(&hidg->get_queue);
 	INIT_LIST_HEAD(&hidg->completed_out_req);
 
 	/* create char device */
@@ -1021,6 +1128,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (hidg->req != NULL)
 		free_ep_req(hidg->in_ep, hidg->req);
 
+	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
+
 	return status;
 }
 
diff --git a/include/uapi/linux/usb/g_hid.h b/include/uapi/linux/usb/g_hid.h
new file mode 100644
index 000000000000..c6068b486354
--- /dev/null
+++ b/include/uapi/linux/usb/g_hid.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * g_hid.h -- Header file for USB HID gadget driver
+ *
+ * Copyright (C) 2022 Valve Software
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#ifndef __UAPI_LINUX_USB_G_HID_H
+#define __UAPI_LINUX_USB_G_HID_H
+
+#include <linux/types.h>
+
+struct usb_hidg_report {
+	__u16 length;
+	__u8 data[512];
+};
+
+/* The 'g' code is also used by gadgetfs and hid gadget ioctl requests.
+ * Don't add any colliding codes to either driver, and keep
+ * them in unique ranges (size 0x20 for now).
+ */
+#define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)
+
+#endif /* __UAPI_LINUX_USB_G_HID_H */
diff --git a/include/uapi/linux/usb/gadgetfs.h b/include/uapi/linux/usb/gadgetfs.h
index 835473910a49..9754822b2a40 100644
--- a/include/uapi/linux/usb/gadgetfs.h
+++ b/include/uapi/linux/usb/gadgetfs.h
@@ -62,7 +62,7 @@ struct usb_gadgetfs_event {
 };
 
 
-/* The 'g' code is also used by printer gadget ioctl requests.
+/* The 'g' code is also used by printer and hid gadget ioctl requests.
  * Don't add any colliding codes to either driver, and keep
  * them in unique ranges (size 0x20 for now).
  */
-- 
2.37.1

