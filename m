Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8192740E14
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jun 2023 12:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjF1KGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jun 2023 06:06:11 -0400
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245]:35097 "EHLO
        out203-205-221-245.mail.qq.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231719AbjF1KBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Jun 2023 06:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1687946479;
        bh=3TUQlf//byhuDFGUIL1tvKMwl85gZnZllPo6X6NSy6o=;
        h=From:To:Cc:Subject:Date;
        b=A+E/AYbvjyAEgjBF1lTWjIwrF9uvlybuBP2oUyfSzCjNuP4Ym/X7NllnTVYo+s0yc
         6vogpBzNy45FOUrjcg5SOb693DsXMwwaAvd6CNrZZReVBhF7gk8ApSaarJs2oVWwcS
         M1QvppYdNCJs5ouBsCyAHolv9uU8tT2hphSvFU7A=
Received: from quectel.localdomain ([112.31.208.23])
        by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
        id DC6116FD; Wed, 28 Jun 2023 17:55:06 +0800
X-QQ-mid: xmsmtpt1687946106tsp4zqd7n
Message-ID: <tencent_05185A450C60A1EE8A651E34CC0F60304506@qq.com>
X-QQ-XMAILINFO: Mm/8i8/T4yneh2BB2QpODM0td5pPCxIWbrMUjgZMcNMnf/Mztm55ZzCckecayR
         B8eUsWFkS+oi4vL5e97yF5g5HX4Vq5adBiitPHvp3qiqEPtV010hCTPY+A9X4rGCjBXK6dc7Lgea
         vjjnq2jJ3r1eVS9CueRB/o3ps09P/DLmRmUbu0Gq4iGMeqNuTY9qrSzwUMlzqyOsQC/ijk067Nfo
         EX0B73aOkiQYv9IHM6/dZXZ1WpR18UBDlwScm8ZWP+MH1dXXzwy0AK/Ixeq0/1ciRmd4+lDsLn9J
         C6ucfu3LnTjOkcIvLAiQPPoNqQYoglXASFcl+AxPBwn4aJX0TyD2Ay5q3JqJJDmKhAnBFerlphCB
         Cw6/PNEPtCFGeZQawPtX9guuPzzOUX435c2INUxi+FGpzrvyhyAcPoV4fvty7xmyNLj0OItJT5/G
         xNRCk52HPzVwoIsUtiRbvfMtucxJuCVt2eBjcDUPCBAdOPV67N1SCxBqliJ8XKiQwQu2RrlOtu2G
         Jq3RVqgx2T9ioB5yu+Na+8JM5Gr8So582RafPxG3AJBiF/bDvFpx4PnsFC0lrka74QyV9wgRxwAl
         j/CzF+rEaKi+dvG52lrTk0A5NrJ9l6QpLXZm+ZNs5TI/OCH1DdX0mtGqCWR4waWxkQFtmBF//1PL
         TAabY8CwNCDX9kY++2iilqXq4tKYl7+LJ78heM/Nia883rDtGkWuPFvU01mpFR2yZi5HXacY6DSF
         DC2O7JxO6kTXJwDLRKqa8ihASAEEHeyR1C7Per70XwXNJ/A+3XGBrfBlKRggMmr8HW9Pjldw+hbf
         KiSIazRCCivIkn8718SMZZ+Gge/Xkx3lJQoPy6UCooUPNR9dVzSdy5Kl94pk3xGeGNY0Hc7DRJMD
         sQl7qs4mxC+z2vWBO7Dw2jMmRD57M4+P4DpJOs/CMGdcSEXdRPHsyfjCBJyLkfmctSeWWntXZcyi
         a2lA4XC3dTcqbTm2DHKXyf1AhvriUq
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From:   Jerry Meng <jerry-meng@foxmail.com>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org, Jerry Meng <jerry-meng@foxmail.com>
Subject: [PATCH]     USB: serial: option: support Quectel EM060K_128
Date:   Wed, 28 Jun 2023 17:55:02 +0800
X-OQ-MSGID: <20230628095502.23886-1-jerry-meng@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

    EM060K_128 is EM060K's sub-model, having the same nmae "EM060K-GL"

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

