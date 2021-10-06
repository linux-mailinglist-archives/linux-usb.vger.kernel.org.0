Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD2F423EEB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 15:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbhJFN1y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 09:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238111AbhJFN1r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Oct 2021 09:27:47 -0400
X-Greylist: delayed 1542 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Oct 2021 06:25:37 PDT
Received: from chandra.tablix.org (chandra.tablix.org [IPv6:2a00:ee2:100:3a01::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605F6C061768
        for <linux-usb@vger.kernel.org>; Wed,  6 Oct 2021 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tablix.org;
         s=alpha; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc
        :To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=vmUDZt4N9AsgqijLndpTMEj2xSGE119w8ekjdw8D3nQ=; b=coCLNJEaf9mE8wLLI64Iydw+5B
        OUn/pPuCVUFrt8kKVb6h1gH5TEjWXKES/TpMuxhDsQwxbAReW75teYwQWJSOOTbIZvyvXmfFPCNfs
        XRWUazp5PpN5gKU22imYwuYnladszbgTNK6gsTbJcg/Jlv1d5kX/j6tBiijjM637yPaY3CSPt6qXi
        oSLN/yUgDm1GppLIn0Z/06WPasdB/Dh1okbtbWCfcXX5jZjECv81rffimVIvIPVRCWW/gRhrPywt6
        voGmQlmL5TDuC7fYjA+qhgL9BjeMkNMfmJTsxeKrmw4Pznvo/aJM7QLrUT3gxMQ3rEsPIyaQ35haq
        KaFE9iNA==;
Received: from [2a01:261:355:1d00:4d4c:70c:e514:4e27] (helo=muffin.lan)
        by chandra.tablix.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tomaz.solc@tablix.org>)
        id 1mY6WX-0001PB-HI; Wed, 06 Oct 2021 14:59:53 +0200
From:   Tomaz Solc <tomaz.solc@tablix.org>
To:     linux-usb@vger.kernel.org
Cc:     Tomaz Solc <tomaz.solc@tablix.org>
Subject: [PATCH] usb: serial: option: add prod. id for Quectel EG91
Date:   Wed,  6 Oct 2021 14:57:50 +0200
Message-Id: <20211006125749.4075-1-tomaz.solc@tablix.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding support for Quectel EG91 LTE module.

The interface layout is same as for EG95.

usb-devices output:
T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  3 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=0191 Rev=03.18
S:  Manufacturer=Android
S:  Product=Android
C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan

Interfaces:

0: Diag
1: GNSS
2: AT-command interface/modem
3: Modem
4: QMI

Signed-off-by: Tomaz Solc <tomaz.solc@tablix.org>
---
 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 6cfb5d33609f..f54abcb408b6 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -246,6 +246,7 @@ static void option_instat_callback(struct urb *urb);
 /* These Quectel products use Quectel's vendor ID */
 #define QUECTEL_PRODUCT_EC21			0x0121
 #define QUECTEL_PRODUCT_EC25			0x0125
+#define QUECTEL_PRODUCT_EG91			0x0191
 #define QUECTEL_PRODUCT_EG95			0x0195
 #define QUECTEL_PRODUCT_BG96			0x0296
 #define QUECTEL_PRODUCT_EP06			0x0306
@@ -1111,6 +1112,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC25, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC25, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG91, 0xff, 0xff, 0xff),
+	  .driver_info = NUMEP2 },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG91, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG95, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG95, 0xff, 0, 0) },
-- 
2.20.1

