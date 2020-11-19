Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952F72B98D0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 18:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgKSRAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 12:00:41 -0500
Received: from netrider.rowland.org ([192.131.102.5]:53041 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728327AbgKSRAl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 12:00:41 -0500
Received: (qmail 577008 invoked by uid 1000); 19 Nov 2020 12:00:40 -0500
Date:   Thu, 19 Nov 2020 12:00:40 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Alexander Chalikiopoulos <bugzilla.kernel.org@mrtoasted.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix regression in Hercules audio card
Message-ID: <20201119170040.GA576844@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit ecaaef6b50a7 ("USB: core: fix check for duplicate endpoints")
aimed to make the USB stack more reliable by detecting and skipping
over endpoints that are duplicated between interfaces.  This caused a
regression for a Hercules audio card (reported as Bugzilla #208357),
which contains such non-compliant duplications.  Although the
duplications are harmless, skipping the valid endpoints prevented the
device from working.

This patch fixes the regression by adding ENDPOINT_IGNORE quirks for
the Hercules card, telling the kernel to ignore the invalid duplicate
endpoints and thereby allowing the valid endpoints to be used as
intended.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Alexander Chalikiopoulos <bugzilla.kernel.org@mrtoasted.com>
Fixes: ecaaef6b50a7 ("USB: core: fix check for duplicate endpoints")
CC: <stable@vger.kernel.org>

---

Note: Back-porting this patch to kernels before 91c7eaa686c3 ("USB:
rename USB quirk to USB_QUIRK_ENDPOINT_IGNORE") will require changing
a few occurrences of "ignore" or "IGNORE" to "blacklist" or
"BLACKLIST".


[as1947]


 drivers/usb/core/quirks.c |    6 ++++++
 1 file changed, 6 insertions(+)

Index: usb-devel/drivers/usb/core/quirks.c
===================================================================
--- usb-devel.orig/drivers/usb/core/quirks.c
+++ usb-devel/drivers/usb/core/quirks.c
@@ -348,6 +348,10 @@ static const struct usb_device_id usb_qu
 	/* Guillemot Webcam Hercules Dualpix Exchange*/
 	{ USB_DEVICE(0x06f8, 0x3005), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* Guillemot Hercules DJ Console audio card (BZ 208357) */
+	{ USB_DEVICE(0x06f8, 0xb000), .driver_info =
+			USB_QUIRK_ENDPOINT_IGNORE },
+
 	/* Midiman M-Audio Keystation 88es */
 	{ USB_DEVICE(0x0763, 0x0192), .driver_info = USB_QUIRK_RESET_RESUME },
 
@@ -521,6 +525,8 @@ static const struct usb_device_id usb_am
  * Matched for devices with USB_QUIRK_ENDPOINT_IGNORE.
  */
 static const struct usb_device_id usb_endpoint_ignore[] = {
+	{ USB_DEVICE_INTERFACE_NUMBER(0x06f8, 0xb000, 5), .driver_info = 0x01 },
+	{ USB_DEVICE_INTERFACE_NUMBER(0x06f8, 0xb000, 5), .driver_info = 0x81 },
 	{ USB_DEVICE_INTERFACE_NUMBER(0x0926, 0x0202, 1), .driver_info = 0x85 },
 	{ USB_DEVICE_INTERFACE_NUMBER(0x0926, 0x0208, 1), .driver_info = 0x85 },
 	{ }
