Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2162813AB31
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 14:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgANNfd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 08:35:33 -0500
Received: from vsmx011.vodafonemail.xion.oxcs.net ([153.92.174.89]:52739 "EHLO
        vsmx011.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726038AbgANNfd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 08:35:33 -0500
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jan 2020 08:35:32 EST
Received: from vsmx003.vodafonemail.xion.oxcs.net (unknown [192.168.75.197])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id 754BA59D0C8;
        Tue, 14 Jan 2020 13:29:52 +0000 (UTC)
Received: from arcor.de (unknown [2.247.252.118])
        by mta-7-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 157BB5399F2;
        Tue, 14 Jan 2020 13:29:41 +0000 (UTC)
Date:   Tue, 14 Jan 2020 14:29:23 +0100
From:   Reinhard Speyerer <rspmn@arcor.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     Kristian Evensen <kristian.evensen@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: option: add support for Quectel RM500Q in QDL
 mode
Message-ID: <20200114132923.GA18330@arcor.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-VADE-STATUS: LEGIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Quectel RM500Q in QDL mode.

T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 24 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=0800 Rev= 0.00
S:  Manufacturer=Qualcomm CDMA Technologies MSM
S:  Product=QUSB_BULK_SN:xxxxxxxx
S:  SerialNumber=xxxxxxxx
C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

It is assumed that the ZLP flag required for other Qualcomm-based
5G devices also applies to Quectel RM500Q.

Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
---
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 62bad1b2c18e..084cc2fff3ae 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1107,6 +1107,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500Q, 0xff, 0xff, 0x10),
+	  .driver_info = ZLP },
 
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },
