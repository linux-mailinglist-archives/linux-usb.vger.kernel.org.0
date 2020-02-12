Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6F12159FBA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 05:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgBLEEb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 23:04:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:41738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbgBLEEa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 23:04:30 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A92712086A;
        Wed, 12 Feb 2020 04:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581480269;
        bh=iek9nhlFUuEiC+tRjIFUik48VzjYSod6Qp6FxMd8l84=;
        h=From:To:Cc:Subject:Date:From;
        b=zA3b36b0iSVtmNH8JTUuobi/kRah/IsN2OZ2FmpZQA0QcgU0q4iT5KM13OqC6tX+W
         wO7wzAVrDc66KSs8gZsNvs9ja3jYgB6PUMDwwfV8iWX633fbxa5mTYdH9YgkHWIGQB
         C3xH025x7g9XWkbWh0flreN6jzh1kQEP4act7J0k=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Jung <jung@codemercs.com>
Subject: [PATCH 1/2] USB: misc: iowarrior: add support for 2 OEMed devices
Date:   Tue, 11 Feb 2020 20:04:21 -0800
Message-Id: <20200212040422.2991-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for two OEM devices that are identical to existing
IO-Warrior devices, except for the USB device id.

Cc: Christoph Jung <jung@codemercs.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/iowarrior.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index dce44fbf031f..990acbe14852 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -34,6 +34,10 @@
 /* full speed iowarrior */
 #define USB_DEVICE_ID_CODEMERCS_IOW56	0x1503
 
+/* OEMed devices */
+#define USB_DEVICE_ID_CODEMERCS_IOW24SAG	0x158a
+#define USB_DEVICE_ID_CODEMERCS_IOW56AM		0x158b
+
 /* Get a minor range for your devices from the usb maintainer */
 #ifdef CONFIG_USB_DYNAMIC_MINORS
 #define IOWARRIOR_MINOR_BASE	0
@@ -133,6 +137,8 @@ static const struct usb_device_id iowarrior_ids[] = {
 	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOWPV1)},
 	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOWPV2)},
 	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW56)},
+	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW24SAG)},
+	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW56AM)},
 	{}			/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, iowarrior_ids);
@@ -357,6 +363,7 @@ static ssize_t iowarrior_write(struct file *file,
 	}
 	switch (dev->product_id) {
 	case USB_DEVICE_ID_CODEMERCS_IOW24:
+	case USB_DEVICE_ID_CODEMERCS_IOW24SAG:
 	case USB_DEVICE_ID_CODEMERCS_IOWPV1:
 	case USB_DEVICE_ID_CODEMERCS_IOWPV2:
 	case USB_DEVICE_ID_CODEMERCS_IOW40:
@@ -371,6 +378,7 @@ static ssize_t iowarrior_write(struct file *file,
 		goto exit;
 		break;
 	case USB_DEVICE_ID_CODEMERCS_IOW56:
+	case USB_DEVICE_ID_CODEMERCS_IOW56AM:
 		/* The IOW56 uses asynchronous IO and more urbs */
 		if (atomic_read(&dev->write_busy) == MAX_WRITES_IN_FLIGHT) {
 			/* Wait until we are below the limit for submitted urbs */
@@ -493,6 +501,7 @@ static long iowarrior_ioctl(struct file *file, unsigned int cmd,
 	switch (cmd) {
 	case IOW_WRITE:
 		if (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW24 ||
+		    dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW24SAG ||
 		    dev->product_id == USB_DEVICE_ID_CODEMERCS_IOWPV1 ||
 		    dev->product_id == USB_DEVICE_ID_CODEMERCS_IOWPV2 ||
 		    dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW40) {
@@ -767,7 +776,8 @@ static int iowarrior_probe(struct usb_interface *interface,
 		goto error;
 	}
 
-	if (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56) {
+	if ((dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56) ||
+	    (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM)) {
 		res = usb_find_last_int_out_endpoint(iface_desc,
 				&dev->int_out_endpoint);
 		if (res) {
@@ -780,7 +790,8 @@ static int iowarrior_probe(struct usb_interface *interface,
 	/* we have to check the report_size often, so remember it in the endianness suitable for our machine */
 	dev->report_size = usb_endpoint_maxp(dev->int_in_endpoint);
 	if ((dev->interface->cur_altsetting->desc.bInterfaceNumber == 0) &&
-	    (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56))
+	    ((dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56) ||
+	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM)))
 		/* IOWarrior56 has wMaxPacketSize different from report size */
 		dev->report_size = 7;
 

base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
-- 
2.25.0

