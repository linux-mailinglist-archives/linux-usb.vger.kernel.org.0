Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F331468B3C4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 02:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjBFBYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Feb 2023 20:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBFBYJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Feb 2023 20:24:09 -0500
X-Greylist: delayed 1165 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Feb 2023 17:23:59 PST
Received: from rain.florz.de (rain.florz.de [IPv6:2a07:12c0:1c00:40::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334A61A97A
        for <linux-usb@vger.kernel.org>; Sun,  5 Feb 2023 17:23:58 -0800 (PST)
Received: from [2a07:12c0:1c00:43::121] (port=42166 helo=florz.florz.de)
        by rain.florz.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-SHA256:256)
        (Exim 4.92)
        (envelope-from <florz@florz.de>)
        id 1pOpvp-0005d5-1v; Mon, 06 Feb 2023 02:04:29 +0100
Received: from florz by florz.florz.de with local (Exim 4.92)
        (envelope-from <florz@florz.de>)
        id 1pOpvo-0007Iy-KM; Mon, 06 Feb 2023 02:04:28 +0100
Date:   Mon, 6 Feb 2023 02:04:28 +0100
From:   Florian Zumbiehl <florz@florz.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usbserial: Add support for VW/Skoda "Carstick LTE"
Message-ID: <20230206010428.GF23822@florz.florz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for VW/Skoda "Carstick LTE"

D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1c9e ProdID=7605 Rev=02.00
S:  Manufacturer=USB Modem
S:  Product=USB Modem
C:  #Ifs= 4 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)

The stick has AT command interfaces on interfaces 1, 2, and 3, and does PPP
on interface 3.

Signed-off-by: Florian Zumbiehl <florz@florz.de>
---
Note that the patch is untested, I hope that it's trivial enough. I have
the device running on a Debian kernel 4.19 by dynamically binding the USB
device ID to the option driver.

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index ee5ac4e..61b4a46 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -406,6 +406,8 @@ static void option_instat_callback(struct urb *urb);
  * It seems to contain a Qualcomm QSC6240/6290 chipset            */
 #define FOUR_G_SYSTEMS_PRODUCT_W14		0x9603
 #define FOUR_G_SYSTEMS_PRODUCT_W100		0x9b01
+/* This one was sold as the VW and Skoda "Carstick LTE" */
+#define FOUR_G_SYSTEMS_PRODUCT_CARSTICK_LTE	0x7605
 
 /* Fujisoft products */
 #define FUJISOFT_PRODUCT_FS040U			0x9b02
@@ -1980,6 +1982,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | NCTRL(1) },
 	{ USB_DEVICE(LONGCHEER_VENDOR_ID, FOUR_G_SYSTEMS_PRODUCT_W100),
 	  .driver_info = NCTRL(1) | NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE(LONGCHEER_VENDOR_ID, FOUR_G_SYSTEMS_PRODUCT_CARSTICK_LTE),
+	  .driver_info = RSVD(0) },
 	{USB_DEVICE(LONGCHEER_VENDOR_ID, FUJISOFT_PRODUCT_FS040U),
 	 .driver_info = RSVD(3)},
 	{ USB_DEVICE_INTERFACE_CLASS(LONGCHEER_VENDOR_ID, SPEEDUP_PRODUCT_SU9800, 0xff) },
