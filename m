Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2CF55E36B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236149AbiF0N4d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 09:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbiF0N42 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 09:56:28 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0903B1E7;
        Mon, 27 Jun 2022 06:56:27 -0700 (PDT)
X-Virus-Scanned: Yes
From:   Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1656337002;
        bh=Lz3w10Y7011ZXvFZ6IwPtBUZtQwQ3TQPVmm3cRsOZwM=;
        h=From:To:Cc:Subject;
        b=dZfHBJWtYz+yJK1WPPY2gVT4OmQc/GcGO+uPgdMMHXzqKmEgJ+OWBbhJ7LB87o3+5
         Wqgm1Sc9kVO3m05XiTrOagc1m6Xql9RTcfZh38f19fFd31hYLC13rbEe+KKbX91y5u
         YcSGN8FUWtSg/P44HI+LoNqBQLWB1RzR4VsgpeEXlJ4yjoARgNrVI1b5/Dm6Fhpmnp
         7IcCKv4J6Yi1mhegOXEz9euVwYccVBRN+Dq738MOoeRmrhoQQ130c9nhQXG5srdPh2
         b6MJeBL+dusb9mw1t3SHdjlu+v5jq2p1o6Qd9lMZxFnAFR7z8cADtSuIyXtYetcIDV
         jXTgu6CmUcXSw==
To:     linux-usb@vger.kernel.org, oliver@neukum.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 1/2] net: usb: cdc_ether: Add Fibocom L610 modem
Date:   Mon, 27 Jun 2022 15:36:19 +0200
Message-Id: <20220627133620.272716-1-sven@svenschwermer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

Since this is a modem device enumerating as an Ethernet adapter, we need
to whitelist it as a WWAN device which tells userspace that this device
requires setup (via AT commands) before it can be used.

The L610 modem has 3 USB configurations that are configurable via the AT
command AT+GTUSBMODE={31,32,33} which make the modem enumerate with the
following interfaces, respectively:

31: Modem + NV + MOS + Diag + LOG + AT + AT
32: ECM + Modem + NV + MOS + Diag + LOG + AT + AT
33: RNDIS + Modem + NV + MOS + Diag + LOG + AT + AT

A detailed description of the USB configuration for the ECM mode
(+GTUSBMODE=32) follows:

T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=04 Dev#=122 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1782 ProdID=4d11 Rev= 0.00
S:  Manufacturer=FIBOCOM
S:  Product=L610
C:* #Ifs= 9 Cfg#= 1 Atr=e0 MxPwr=400mA
A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=06 Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 7 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 8 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=08(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
---
 drivers/net/usb/cdc_ether.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index 2de09ad5bac0..d165df1ad6d6 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -1000,6 +1000,12 @@ static const struct usb_device_id	products[] = {
 				      USB_CDC_SUBCLASS_ETHERNET,
 				      USB_CDC_PROTO_NONE),
 	.driver_info = (unsigned long)&wwan_info,
+}, {
+	/* Fibocom L610 (ECM mode) */
+	USB_DEVICE_AND_INTERFACE_INFO(0x1782, 0x4d11, USB_CLASS_COMM,
+				      USB_CDC_SUBCLASS_ETHERNET,
+				      USB_CDC_PROTO_NONE),
+	.driver_info = (unsigned long)&wwan_info,
 }, {
 	USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ETHERNET,
 			USB_CDC_PROTO_NONE),

base-commit: 03c765b0e3b4cb5063276b086c76f7a612856a9a
-- 
2.36.1

