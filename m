Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C553574235D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jun 2023 11:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjF2JkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 05:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbjF2Jjr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 05:39:47 -0400
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6E81727
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1688031583;
        bh=wVTuCIxyvLDD/DcoCaqbJS7OLbR76cNPm8LoFO2zaRc=;
        h=From:To:Cc:Subject:Date;
        b=mCi4uDi5CeNwncfK/myJlGB0M+C/CObV4kB/5MHYYMEXMZLFxGY5CJ1XM5ViOzU83
         kRfwq5okDTos1sap2OhQKMxjHzBw6wsbxdf+TVG70BZyeQzh1JRq4lLMJJjIlv8EJX
         zlyisxleToVAVgFAnx0L9ozc4BmL4pk4XMBzYD4E=
Received: from quectel.localdomain ([112.31.70.25])
        by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
        id 8D922ACB; Thu, 29 Jun 2023 17:35:25 +0800
X-QQ-mid: xmsmtpt1688031325tdhngfwbn
Message-ID: <tencent_4C0C961CD0213FB3C100615415168012BA08@qq.com>
X-QQ-XMAILINFO: M1JY6XCfJolWCHd7atIypsTs8oTDXb0ee9tfkck23EPVG5bJ+rRZKjwzpEIbY5
         iGNvQeqztiElv+j2HbmRRWdJ5LunaXN+fmbOdjj75WqIyr131uPRrPkwuT71zDrfSMKml2zxwvgk
         i3nqHXjnSeRrB13XNKPMQ7PzvWolrtuUPp34nEIlox/ogMGh7V07S5wlkW9FoXJPJ/wUoXW2SDOz
         8e8CaTECBKd1TwrViGcvrrc6TF/IBTwt2n09+C+nWVKvkWjLQ5trih6ezaQMYDe8GfrhIhsJ9RFT
         N4019dECkEeb3SQi8Ai1Zz+sg6nHPT87vNwfWBP9J9rQ8tYyoBpXXcjQWPAfjAkAOc9JvtXEoN2H
         1XWV1Ps1YiMc+492h/b6MBpgguBm7rZdqwAdU1P975N4+BT2Jyo++q7s38jFnvw4MktDvsIlZlxv
         gvllp73JAHheEk06a+DYHlPMKHP/TQWKwMNWUXCUoX//v4qkWkwOd9DDrEVrhar2lpGyksPXbL0e
         7cxSdG3Z4vSUcWaeB+pcnripp5MBOVrp7EfuunVbv7VKyiBobWyBS0g25f7R6XNEgqh4u3zV3AlC
         DJgY2J+esugKz7qFeaIjKwVsdGq4dephMCqbxpHPyxfxf9nASrusJOse3grt7HHEoE9DFuudiGmD
         kjpstK4dxzHzyu4rAsfxA5l+QzhdhUFTjSOZvUzX6wASzXHeKOy2WpPWqXJcwkQT4yStIT1ONVdv
         O/YsmgP/OzFvP0ctR4oLze+vzAXMOCI1Wjjk3lg5YgmPDHSZOsx1hyZOWztgsn264FkYJ+rwLbSQ
         b0iIh1DGxxyJHKvtfTNdaI5cw1ftV76M3Mwts1rkTNHwtwZTKWFdcWMrXK7Q+V87hF1KoqDriG+j
         cFvkId3lw/8pd2VDARZxRST39l2PYJEjyGUDRqPu1pctX6GfYkl4VfTEEfRksuJYp3rnUyWB5764
         phK0qee5EO1Q9nA3R/DvIU0MPl6g2jutlZbVvTOZfvieSffPWXZtPZuBCmkuv1
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From:   Jerry Meng <jerry-meng@foxmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-usb@vger.kernel.org, Jerry Meng <jerry-meng@foxmail.com>
Subject: [PATCH V2] USB: serial: option: support Quectel EM060K_128
Date:   Thu, 29 Jun 2023 17:35:22 +0800
X-OQ-MSGID: <20230629093522.57014-1-jerry-meng@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

EM060K_128 is EM060K's sub-model, having the same name "Quectel EM060K-GL"

MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  8 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=0128 Rev= 5.04
S:  Manufacturer=Quectel
S:  Product=Quectel EM060K-GL
S:  SerialNumber=f6fa08b6
C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Jerry Meng <jerry-meng@foxmail.com>
---
V1 -> V2: Remove indentaions and correct spelling for commit message

 drivers/usb/serial/option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 288a96a74266..a1600ec82f56 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -251,6 +251,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EM061K_LTA		0x0123
 #define QUECTEL_PRODUCT_EM061K_LMS		0x0124
 #define QUECTEL_PRODUCT_EC25			0x0125
+#define QUECTEL_PRODUCT_EM060K_128		0x0128
 #define QUECTEL_PRODUCT_EG91			0x0191
 #define QUECTEL_PRODUCT_EG95			0x0195
 #define QUECTEL_PRODUCT_BG96			0x0296
@@ -1197,6 +1198,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K_128, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x40) },
-- 
2.25.1

