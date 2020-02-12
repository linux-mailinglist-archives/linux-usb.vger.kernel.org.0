Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD22159FB9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 05:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgBLEEa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 23:04:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:41718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbgBLEEa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 23:04:30 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C94320842;
        Wed, 12 Feb 2020 04:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581480269;
        bh=xjiXrOCf+f0NHFOe/pIvdoOKkTHyI/yytY6Dq4HKKxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bvXfXxgVZ+87tCvIxJn1hdxKxW52wMH4KnpGcWL3qiOsAs6x/YngP0Cc5kJFhU+la
         a9VnCma63n6/K7oiEt2JJc82hyiFZ5W6t+AHG2fKX2qOaIHwc/rMNQg62VVhhE4UBD
         60uHCjcvpv2hvCaxAu7HECy9fTJw2jbaiL5n1W/s=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Jung <jung@codemercs.com>
Subject: [PATCH 2/2] USB: misc: iowarrior: add support for the 28 and 28L devices
Date:   Tue, 11 Feb 2020 20:04:22 -0800
Message-Id: <20200212040422.2991-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200212040422.2991-1-gregkh@linuxfoundation.org>
References: <20200212040422.2991-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add new device ids for the 28 and 28L devices.  These have 4 interfaces
instead of 2, but the driver binds the same, so the driver changes are
minimal.

Cc: Christoph Jung <jung@codemercs.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/iowarrior.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 990acbe14852..d20b60acfe8a 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -33,6 +33,9 @@
 #define USB_DEVICE_ID_CODEMERCS_IOWPV2	0x1512
 /* full speed iowarrior */
 #define USB_DEVICE_ID_CODEMERCS_IOW56	0x1503
+/* fuller speed iowarrior */
+#define USB_DEVICE_ID_CODEMERCS_IOW28	0x1504
+#define USB_DEVICE_ID_CODEMERCS_IOW28L	0x1505
 
 /* OEMed devices */
 #define USB_DEVICE_ID_CODEMERCS_IOW24SAG	0x158a
@@ -139,6 +142,8 @@ static const struct usb_device_id iowarrior_ids[] = {
 	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW56)},
 	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW24SAG)},
 	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW56AM)},
+	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW28)},
+	{USB_DEVICE(USB_VENDOR_ID_CODEMERCS, USB_DEVICE_ID_CODEMERCS_IOW28L)},
 	{}			/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, iowarrior_ids);
@@ -379,6 +384,8 @@ static ssize_t iowarrior_write(struct file *file,
 		break;
 	case USB_DEVICE_ID_CODEMERCS_IOW56:
 	case USB_DEVICE_ID_CODEMERCS_IOW56AM:
+	case USB_DEVICE_ID_CODEMERCS_IOW28:
+	case USB_DEVICE_ID_CODEMERCS_IOW28L:
 		/* The IOW56 uses asynchronous IO and more urbs */
 		if (atomic_read(&dev->write_busy) == MAX_WRITES_IN_FLIGHT) {
 			/* Wait until we are below the limit for submitted urbs */
@@ -777,7 +784,9 @@ static int iowarrior_probe(struct usb_interface *interface,
 	}
 
 	if ((dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56) ||
-	    (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM)) {
+	    (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM) ||
+	    (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW28) ||
+	    (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW28L)) {
 		res = usb_find_last_int_out_endpoint(iface_desc,
 				&dev->int_out_endpoint);
 		if (res) {
@@ -791,7 +800,9 @@ static int iowarrior_probe(struct usb_interface *interface,
 	dev->report_size = usb_endpoint_maxp(dev->int_in_endpoint);
 	if ((dev->interface->cur_altsetting->desc.bInterfaceNumber == 0) &&
 	    ((dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56) ||
-	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM)))
+	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM) ||
+	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW28) ||
+	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW28L)))
 		/* IOWarrior56 has wMaxPacketSize different from report size */
 		dev->report_size = 7;
 
-- 
2.25.0

