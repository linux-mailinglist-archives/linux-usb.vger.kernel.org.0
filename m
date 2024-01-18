Return-Path: <linux-usb+bounces-5197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65883108E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 01:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EADE283B9C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 00:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEF91371;
	Thu, 18 Jan 2024 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="KhoCenoo"
X-Original-To: linux-usb@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D902185D
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 00:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538292; cv=none; b=d7FIwS7kZTOglAKPvHT/z29xJQUykcl6OD5TBZwG4w+t4jbwGqXiaSabloVoHs7EWyfxy5+a4jotBz/bdJVhI9iXTloPDBYHA/rcopTkFoHJbmqatASafM0QENQ6FatbY37ry7elo87PYrQwHJWRiXh0b7dEGjOQHqmcJ+FuGvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538292; c=relaxed/simple;
	bh=g0szu+eYeAwCsXmDTdcLr/zvzFKoWcNDtkZgem4Usvw=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=haEEUylKN/iBRlMrs66FeezQoaHm7gW2EiWaAm9NMeZJ/tB29m6XAN5PbkHgcYs5kjzmvJdlojVcJD6G8CgJqHfvYeUFVf307MMzUduaNPt+OkW4vJ63IatiKLwch3sYw58whQxaL1q7o/zM+OaXgE/6C8LtXkGxMxlJNPlNmvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=KhoCenoo; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from microtis.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id C5801A1E6;
	Wed, 17 Jan 2024 16:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1705538284; bh=g0szu+eYeAwCsXmDTdcLr/zvzFKoWcNDtkZgem4Usvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KhoCenooxnsJU522MTo+7eoWZSHzDtdl1uiaOlkmZYvdy/IExm9YpczKfA4ARwV4D
	 TWGGiAEU3TeCJ8XuPFUhcdXBS6J4f+qFbPEGVK7qP/KJYjDVZFMfggN813Gp1ZHPDH
	 /hIg7c17NU1Vok+QB5lhJsO7jlrgwLQ/TXZ14MD08ALTn7XxJPYq/ak3t882h3mypz
	 rWx0Tn15osvJc1ODfSavMQxjxNnaFODnyoJw25uHnF6W+e34DQb9rt3HzBBsLRqXR3
	 7yj7dtdnhigR9v8kbYShnTRsDlAU24PKZLqonpZe2K+EM5oeyXrjCBDnEx1Hhbm9Zs
	 gqjlYxeFIcwwg==
From: Vicki Pfau <vi@endrift.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Maxim Devaev <mdevaev@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>,
	David Sands <david.sands@biamp.com>
Subject: [PATCH v2 1/3] USB: gadget: Move gadget-related ioctl codes to gadget-ioctl.h
Date: Wed, 17 Jan 2024 16:37:55 -0800
Message-ID: <20240118003758.1870691-2-vi@endrift.com>
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

Since multiple different gadget types use similar ranges of ioctl IDs,
put all of them in the same file to avoid accidentally creating
overlaps.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 include/uapi/linux/usb/g_printer.h    | 23 ++----------------
 include/uapi/linux/usb/g_uvc.h        |  4 +--
 include/uapi/linux/usb/gadget-ioctl.h | 35 +++++++++++++++++++++++++++
 include/uapi/linux/usb/gadgetfs.h     | 27 +--------------------
 4 files changed, 39 insertions(+), 50 deletions(-)
 create mode 100644 include/uapi/linux/usb/gadget-ioctl.h

diff --git a/include/uapi/linux/usb/g_printer.h b/include/uapi/linux/usb/g_printer.h
index 7fc20e4b82f5..fc411ee3f5cc 100644
--- a/include/uapi/linux/usb/g_printer.h
+++ b/include/uapi/linux/usb/g_printer.h
@@ -3,34 +3,15 @@
  * g_printer.h -- Header file for USB Printer gadget driver
  *
  * Copyright (C) 2007 Craig W. Nadler
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
 #ifndef __LINUX_USB_G_PRINTER_H
 #define __LINUX_USB_G_PRINTER_H
 
+#include <linux/usb/gadget-ioctl.h>
+
 #define PRINTER_NOT_ERROR	0x08
 #define PRINTER_SELECTED	0x10
 #define PRINTER_PAPER_EMPTY	0x20
 
-/* The 'g' code is also used by gadgetfs ioctl requests.
- * Don't add any colliding codes to either driver, and keep
- * them in unique ranges (size 0x20 for now).
- */
-#define GADGET_GET_PRINTER_STATUS	_IOR('g', 0x21, unsigned char)
-#define GADGET_SET_PRINTER_STATUS	_IOWR('g', 0x22, unsigned char)
-
 #endif /* __LINUX_USB_G_PRINTER_H */
diff --git a/include/uapi/linux/usb/g_uvc.h b/include/uapi/linux/usb/g_uvc.h
index 8d7824dde1b2..7142e05abab1 100644
--- a/include/uapi/linux/usb/g_uvc.h
+++ b/include/uapi/linux/usb/g_uvc.h
@@ -8,9 +8,9 @@
 #ifndef __LINUX_USB_G_UVC_H
 #define __LINUX_USB_G_UVC_H
 
-#include <linux/ioctl.h>
 #include <linux/types.h>
 #include <linux/usb/ch9.h>
+#include <linux/usb/gadget-ioctl.h>
 
 #define UVC_EVENT_FIRST			(V4L2_EVENT_PRIVATE_START + 0)
 #define UVC_EVENT_CONNECT		(V4L2_EVENT_PRIVATE_START + 0)
@@ -37,6 +37,4 @@ struct uvc_event {
 	};
 };
 
-#define UVCIOC_SEND_RESPONSE		_IOW('U', 1, struct uvc_request_data)
-
 #endif /* __LINUX_USB_G_UVC_H */
diff --git a/include/uapi/linux/usb/gadget-ioctl.h b/include/uapi/linux/usb/gadget-ioctl.h
new file mode 100644
index 000000000000..b5f8f7894db7
--- /dev/null
+++ b/include/uapi/linux/usb/gadget-ioctl.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef __LINUX_USB_GADGET_IOCTL_H
+#define __LINUX_USB_GADGET_IOCTL_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* gadgetfs endpoint ioctls */
+
+/* IN transfers may be reported to the gadget driver as complete
+ *	when the fifo is loaded, before the host reads the data;
+ * OUT transfers may be reported to the host's "client" driver as
+ *	complete when they're sitting in the FIFO unread.
+ * THIS returns how many bytes are "unclaimed" in the endpoint fifo
+ * (needed for precise fault handling, when the hardware allows it)
+ */
+#define	GADGETFS_FIFO_STATUS	_IO('g', 1)
+
+/* discards any unclaimed data in the fifo. */
+#define	GADGETFS_FIFO_FLUSH	_IO('g', 2)
+
+/* resets endpoint halt+toggle; used to implement set_interface.
+ * some hardware (like pxa2xx) can't support this.
+ */
+#define	GADGETFS_CLEAR_HALT	_IO('g', 3)
+
+/* g_printer ioctls */
+#define GADGET_GET_PRINTER_STATUS	_IOR('g', 0x21, unsigned char)
+#define GADGET_SET_PRINTER_STATUS	_IOWR('g', 0x22, unsigned char)
+
+/* g_uvc ioctls */
+#define UVCIOC_SEND_RESPONSE		_IOW('U', 1, struct uvc_request_data)
+
+#endif /* __LINUX_USB_GADGET_IOCTL_H */
diff --git a/include/uapi/linux/usb/gadgetfs.h b/include/uapi/linux/usb/gadgetfs.h
index 835473910a49..e8629943d249 100644
--- a/include/uapi/linux/usb/gadgetfs.h
+++ b/include/uapi/linux/usb/gadgetfs.h
@@ -20,9 +20,9 @@
 #define __LINUX_USB_GADGETFS_H
 
 #include <linux/types.h>
-#include <linux/ioctl.h>
 
 #include <linux/usb/ch9.h>
+#include <linux/usb/gadget-ioctl.h>
 
 /*
  * Events are delivered on the ep0 file descriptor, when the user mode driver
@@ -61,29 +61,4 @@ struct usb_gadgetfs_event {
 	enum usb_gadgetfs_event_type	type;
 };
 
-
-/* The 'g' code is also used by printer gadget ioctl requests.
- * Don't add any colliding codes to either driver, and keep
- * them in unique ranges (size 0x20 for now).
- */
-
-/* endpoint ioctls */
-
-/* IN transfers may be reported to the gadget driver as complete
- *	when the fifo is loaded, before the host reads the data;
- * OUT transfers may be reported to the host's "client" driver as
- *	complete when they're sitting in the FIFO unread.
- * THIS returns how many bytes are "unclaimed" in the endpoint fifo
- * (needed for precise fault handling, when the hardware allows it)
- */
-#define	GADGETFS_FIFO_STATUS	_IO('g', 1)
-
-/* discards any unclaimed data in the fifo. */
-#define	GADGETFS_FIFO_FLUSH	_IO('g', 2)
-
-/* resets endpoint halt+toggle; used to implement set_interface.
- * some hardware (like pxa2xx) can't support this.
- */
-#define	GADGETFS_CLEAR_HALT	_IO('g', 3)
-
 #endif /* __LINUX_USB_GADGETFS_H */
-- 
2.43.0


