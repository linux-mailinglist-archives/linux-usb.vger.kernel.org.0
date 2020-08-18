Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F824837F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 13:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHRLEv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 07:04:51 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44785 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgHRLEu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 07:04:50 -0400
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B1BAF200004;
        Tue, 18 Aug 2020 11:04:47 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v8 2/3] USB: Better name for __check_usb_generic()
Date:   Tue, 18 Aug 2020 13:04:44 +0200
Message-Id: <20200818110445.509668-2-hadess@hadess.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818110445.509668-1-hadess@hadess.net>
References: <20200818110445.509668-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

__check_usb_generic() doesn't explain very well what the
function actually does: It checks to see whether the driver is
non-generic and matches the device.

Change it to check_for_non_generic_match()

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
No changes since v7 which was the first version based on
Alan's comment:
https://marc.info/?l=linux-usb&m=159568870400795&w=2

 drivers/usb/core/generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 2b2f1ab6e36a..22c887f5c497 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -195,7 +195,7 @@ int usb_choose_configuration(struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(usb_choose_configuration);
 
-static int __check_usb_generic(struct device_driver *drv, void *data)
+static int __check_for_non_generic_match(struct device_driver *drv, void *data)
 {
 	struct usb_device *udev = data;
 	struct usb_device_driver *udrv;
@@ -219,7 +219,7 @@ static bool usb_generic_driver_match(struct usb_device *udev)
 	 * If any other driver wants the device, leave the device to this other
 	 * driver.
 	 */
-	if (bus_for_each_drv(&usb_bus_type, NULL, udev, __check_usb_generic))
+	if (bus_for_each_drv(&usb_bus_type, NULL, udev, __check_for_non_generic_match))
 		return false;
 
 	return true;
-- 
2.26.2

