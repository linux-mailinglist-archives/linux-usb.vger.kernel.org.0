Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6466922DDCF
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 11:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgGZJtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 05:49:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgGZJtt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Jul 2020 05:49:49 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8BCB20715;
        Sun, 26 Jul 2020 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595756989;
        bh=Bjo9JaRmqjj+103uHiWaTaso7PWFKeW6swWEVX5TRZM=;
        h=From:To:Cc:Subject:Date:From;
        b=jviM0SmlAo4xVqWYlNZJmXn/BTtHdcgFyPOyJ7ghx+X1bhX8hjA/KF04+h+Ggnz0T
         pG8oG6xMSTTC23BsWmoH03wm39DZf915RsBZaqJLSi8JnRhiNAUmVjTl6gDTHKj7Wd
         Qxw8HjtlYeEkGrDRFInamVMi1TDFHdNl/1AoBnik=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@kernel.org>, Christoph Jung <jung@codemercs.com>
Subject: [PATCH] USB: iowarrior: fix up report size handling for some devices
Date:   Sun, 26 Jul 2020 11:49:39 +0200
Message-Id: <20200726094939.1268978-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In previous patches that added support for new iowarrior devices, the
handling of the report size was not done correct.

Fix that up and update the copyright date for the driver

Reworked from an original patch written by Christoph Jung.

Fixes: bab5417f5f01 ("USB: misc: iowarrior: add support for the 100 device")
Fixes: 5f6f8da2d7b5 ("USB: misc: iowarrior: add support for the 28 and 28L devices")
Fixes: 461d8deb26a7 ("USB: misc: iowarrior: add support for 2 OEMed devices")
Cc: stable <stable@kernel.org>
Reported-by: Christoph Jung <jung@codemercs.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/iowarrior.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index dce20301e367..103c69c692ba 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -2,8 +2,9 @@
 /*
  *  Native support for the I/O-Warrior USB devices
  *
- *  Copyright (c) 2003-2005  Code Mercenaries GmbH
- *  written by Christian Lucht <lucht@codemercs.com>
+ *  Copyright (c) 2003-2005, 2020  Code Mercenaries GmbH
+ *  written by Christian Lucht <lucht@codemercs.com> and
+ *  Christoph Jung <jung@codemercs.com>
  *
  *  based on
 
@@ -802,14 +803,28 @@ static int iowarrior_probe(struct usb_interface *interface,
 
 	/* we have to check the report_size often, so remember it in the endianness suitable for our machine */
 	dev->report_size = usb_endpoint_maxp(dev->int_in_endpoint);
-	if ((dev->interface->cur_altsetting->desc.bInterfaceNumber == 0) &&
-	    ((dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56) ||
-	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW56AM) ||
-	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW28) ||
-	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW28L) ||
-	     (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW100)))
-		/* IOWarrior56 has wMaxPacketSize different from report size */
-		dev->report_size = 7;
+
+	/*
+	 * Some devices need the report size to be different than the
+	 * endpoint size.
+	 */
+	if (dev->interface->cur_altsetting->desc.bInterfaceNumber == 0) {
+		switch (dev->product_id) {
+		case USB_DEVICE_ID_CODEMERCS_IOW56:
+		case USB_DEVICE_ID_CODEMERCS_IOW56AM:
+			dev->report_size = 7;
+			break;
+
+		case USB_DEVICE_ID_CODEMERCS_IOW28:
+		case USB_DEVICE_ID_CODEMERCS_IOW28L:
+			dev->report_size = 4;
+			break;
+
+		case USB_DEVICE_ID_CODEMERCS_IOW100:
+			dev->report_size = 13;
+			break;
+		}
+	}
 
 	/* create the urb and buffer for reading */
 	dev->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
-- 
2.27.0

