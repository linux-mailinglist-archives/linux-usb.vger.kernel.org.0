Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 590ED717486
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 05:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbjEaDwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 23:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjEaDwD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 23:52:03 -0400
X-Greylist: delayed 86910 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 May 2023 20:52:01 PDT
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4F8FC
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 20:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1685505117;
        bh=ZWEw1MiHOAURKgPlB3yhUDSYRNWbzdiMuDxH0bgiCXk=;
        h=From:To:Cc:Subject:Date;
        b=cbFRkRMgSrvw0hpu6/17hXv2kWvBTSWjIXIdkx6fbE/evT0+iejngyryf0FBkW5kt
         cbIOTI0w9t32ouEUarTmQLNpOs7239GrvJmjE2ouOI08YEsIgy2hMvahc86Z9TaB1F
         EvpSBX3IuDh6QzTRdFy8b8LZ1GISUG2/z7LO8KiM=
Received: from quectel.localdomain ([220.180.239.54])
        by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
        id CD39DE0B; Wed, 31 May 2023 11:51:19 +0800
X-QQ-mid: xmsmtpt1685505079tswmba84a
Message-ID: <tencent_935361841584807CBAF9961AD0C83F2AC108@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8C9I54kS8Yt7JWu3I1F8obOfymfwjoTxftBX16ljjLpAfQmPnlP
         QjZCFf7sgG792Hk7NFQaIuFcywaYf2Ewit5d24rF6XC5vXiGCYGWLAY6YBBOFpS0nUeCjJdO/f8R
         AdU+NKDSJMqh3oPFjMVQ7vKZXRpPd+GhulQMyfBLa7K9WxRXIF/laVk7ogz9dyCsPD6DxMU82qm2
         UTiiBbgZkdNfejsijzlo9qVy9VI9wwiX9nNtdCiLgYg1znX2jfUNDAM34Aw8NgaRd28GQxGmsadL
         MrA77KiewrBjEEC5M9oA+Wath007UuuuTec3o60H8E3p/WWgfJUqUV0FFeLUswgn5F0BW6fm2XFC
         F1OsG7kkTYFCkukFpHMZVfai0Q+wNpYJUcVaFycIH7kAV/FLNLhMNmC3pr5K+8W6/MQv7C4AIBkm
         JOTqhGfHjHrVACUgvoQUwpbvIrZ2WBgeb4b0HjHIKRt5b6zijC7C9MFNdQ29E8hggzUyXAH4r3BQ
         BvXMNQxBnuxuVgDYBRuyEdS70cl5QCe92wkVXNST5Yy5ssCEHIT5BucvakRpewCHKC1eLfQAEa32
         5CLUv9/cXAMvaEiyo65c1+70ERikOAbzR1UFzK/12dLkDYJyGa/09ZdnLmOfZ1Olf3ERd8+cY7mj
         9YYyfmAwpWpNKCpAfawl6K7NruqfmYhGBzAx76ycRcTjDDulgy2qSWs25kNzgYd4S6dFAVXK1SHn
         xv1LtBEx6bwHDxfjp14hkPdvTOmAkD7QQMAeKaYjPkJqY6G64ENc0CW2RmNSMEX8zw6ztksb30Pj
         2Qbl3fj+CCk6evN2ad5bOhqe4SJedbyecr+sNAPqwFQv6hfqx4JZXlzfHSCiKC0XlvxbCE8Y7ss3
         ZfykQIebR8iBfCFoyIdut7iKlIv8GGkXcBcCiic9hDJYUJzZzwdW9CrCydJ2rjLCnQKhhihwoBpp
         w//0gYYNoX2+R1cQAKHW6z+Je/EAGfnPhEt4MKP3NbaCkETERtSvTPLFFfY9zFvE5XiHrOcxwIIb
         +S1lHR2A==
From:   Jerry Meng <jerry-meng@foxmail.com>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org, Jerry Meng <jerry-meng@foxmail.com>
Subject: [PATCH v2] USB: serial: option: add Quectel EM061KGL series
Date:   Wed, 31 May 2023 11:51:16 +0800
X-OQ-MSGID: <20230531035116.2237011-1-jerry-meng@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add support for Quectel EM061KGL series which are based on Qualcomm SDX12 chip

EM061KGL_LTA(0x2c7c / 0x0123): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
EM061KGL_LMS(0x2c7c / 0x0124): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
EM061KGL_LWW(0x2c7c / 0x6008): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
EM061KGL_LCN(0x2c7c / 0x6009): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

Above products use the exact same interface layout and
option driver is for interfaces DIAG, NMEA and AT.

T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=6008 Rev= 5.04
S:  Manufacturer=Quectel
S:  Product=Quectel EM061K-GL
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
 drivers/usb/serial/option.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 644a55447fd7..23d7b202590d 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -248,6 +248,8 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_VENDOR_ID			0x2c7c
 /* These Quectel products use Quectel's vendor ID */
 #define QUECTEL_PRODUCT_EC21			0x0121
+#define QUECTEL_PRODUCT_EM061K_LTA		0x0123
+#define QUECTEL_PRODUCT_EM061K_LMS		0x0124
 #define QUECTEL_PRODUCT_EC25			0x0125
 #define QUECTEL_PRODUCT_EG91			0x0191
 #define QUECTEL_PRODUCT_EG95			0x0195
@@ -266,6 +268,8 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_RM520N			0x0801
 #define QUECTEL_PRODUCT_EC200U			0x0901
 #define QUECTEL_PRODUCT_EC200S_CN		0x6002
+#define QUECTEL_PRODUCT_EM061K_LWW		0x6008
+#define QUECTEL_PRODUCT_EM061K_LCN		0x6009
 #define QUECTEL_PRODUCT_EC200T			0x6026
 #define QUECTEL_PRODUCT_RM500K			0x7001
 
@@ -1189,6 +1193,18 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0x00, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x30) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM060K, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LWW, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LCN, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LTA, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0x00, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM061K_LMS, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) | RSVD(4) | NUMEP2 },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM12, 0xff, 0, 0) },
-- 
2.25.1

