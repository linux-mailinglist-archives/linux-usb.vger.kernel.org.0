Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7071E3BC33B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jul 2021 21:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhGETrB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jul 2021 15:47:01 -0400
Received: from mout01.posteo.de ([185.67.36.65]:48843 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhGETrB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Jul 2021 15:47:01 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id ACD99240027
        for <linux-usb@vger.kernel.org>; Mon,  5 Jul 2021 21:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1625514262; bh=PrFQktCUXyaw1aHedAagAWgszonzj20/xEy+H9qFiuY=;
        h=From:To:Subject:Date:From;
        b=Jmp1Nc8g3dEtolvUYDg88nSIVzSQ1mROOH67rpZObceHbyC2yV7imYSnYhNPVjG9N
         QgMZHPgFLTS5NnmrKbLR/el3eRuF8qbKy+5Kwo58JA2K2ry3s53ym51kHAZSduBE5u
         dDegXmOFagAyD+6KmdtZZxWmPumJEtSWp+ge4aOUHpvlpYciEqH8IogtUUGdPVh0RT
         xbBzzPSJMTJbleDjv1Y0JAZJ0GJhBEpvwM4x52ZSeRCAHpJ9czIRHKGJmw/swxJSTY
         4hsqodYdLikIWm8/jG0g/j/khVJpdTOU5+qv7VraO/Jx3fP5kxpxI0S02mAaQY7i7A
         ErBSvgJQC5GOg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GJbjf1BbCz9rxH;
        Mon,  5 Jul 2021 21:44:22 +0200 (CEST)
From:   Marco De Marco <marco.demarco@posteo.net>
To:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: serial: option: Add support for u-blox LARA-R6 family
Date:   Mon, 05 Jul 2021 19:44:21 +0000
Message-ID: <49260184.kfMIbaSn9k@mars>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patch is meant to support LARA-R6 Cat 1 module family.

Module USB ID:
Vendor  ID: 0x05c6
Product ID: 0x90fA

Interface layout:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: QMI wwan (not available in all versions)

Signed-off-by: Marco De Marco <marco.demarco@posteo.net>

---

ADB interface is not available. 
Diagnostic interface (If 0) can be used with option driver.

Output of usb-devices command (this version does not have QMI WWAN):
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=05c6 ProdID=90fa Rev=00.00
S:  Manufacturer=Qualcomm, Incorporated
S:  Product=Qualcomm CDMA Technologies MSM
S:  SerialNumber=7da8aacd
C:  #Ifs= 3 Cfg#= 1 Atr=c0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fe Prot=ff Driver=(none)

Thanks for your patience and the tireless endeavour.


diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index aeaa3756f..32d1eac8c 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
+#define UBLOX_PRODUCT_R6XX			0x90fa
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
 
@@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] = {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info = RSVD(1) | RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
+	  .driver_info = RSVD(3) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },



