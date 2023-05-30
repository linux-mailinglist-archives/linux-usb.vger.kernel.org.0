Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6849B71543C
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 05:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjE3Dow (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 23:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjE3Dot (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 23:44:49 -0400
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E968EB7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1685418282;
        bh=JRfSS4FhdJtX97qS2BwwMPYQqE2a2nvFA+6dCz1xBGE=;
        h=From:To:Cc:Subject:Date;
        b=VUj7NqIQ9NMukmotMn5BsGnGLZ/FsUSrkCsn0TGUBVsAEP5DbNY3GHVm+zJTYZ/Pd
         UGptVXrr14Y76hDdOKDqcj07VwB6B8ZUvNlZ0cxe8EDEJ1RszZ4lXc0YX2i3wj1xYZ
         lZHigLqQlTgiJAZyBVO4DKpdgDvfmslqAv8NsdT8=
Received: from quectel.localdomain ([220.180.239.55])
        by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
        id AD0804FB; Tue, 30 May 2023 11:43:16 +0800
X-QQ-mid: xmsmtpt1685418196ticqnque9
Message-ID: <tencent_9E34E48F5FB07FD875452120856EAE650906@qq.com>
X-QQ-XMAILINFO: OLsBWtCIHsg66//btZZ3wXg/HxtvBEWPBjQMhngsASdX7w1cSYkBXSZxXkxyVm
         cCwwsu7UIHj+RUox0FnO4T4GoYxmq7QPmkM9pximBaTN2ENq+lR/W21mQwc+MFjUKB+1etGAomEF
         VNcXcokzXbF7PiJF3ociKoAw/IcGl3GowfVm8SO3QLyeYn7Xq093YPc2CUAKE2ARAS+va3CffX0F
         Hv7YewPW9JYazOojU9+X3njJ2/zFqUENIPk5b0SDVeNySHENbEXdlInSbL5ElRiDxlj4I1P5jGI7
         eS12asnhnpCwzbNo5UGVbsjHBWBRFZAlyz/oHVtytYyfPG07CKnSAjhtrUYWFgCzSKjsrpynJCm3
         ORDusOyvNBFnnVfvRtd7HRlmNyvR8Ae5v8KhQgtmtbLTCBkhuF3uNia6+Mv8oNDkqX8uszn/MOUS
         bGyRZf4OA7welo+VlGQS9/+HLT7jw2Iu/506x8oFqH/ATw7r9UHkvvf74tqvGOCwlRSCj5OWRkIk
         XQ9iSjIx/Iu5ey3wB5VpilkZL/LIFWkjZl2cgV9r8nz6HM46exQvGs3q49urz2LfWt5Tc9/W3elx
         eNc7ZybcvCSr7ewA5heZzYn0CLtz8/mLgdzDMoZ5GO1OyMFfgidzf1mn3sXlFLsww9iaF6XWkRc9
         3+o2kqyVSskORyqIZNMfoqHUsDbHrE+3R4HNmBrbwxR/1Vl8AsgAblgK/bTtzb64WZJWaUIkCDX8
         Wd/7SM5edFKeVuNc8UMuje6JcAlJQokZZ6XnTjP2HV4hImqe4u/mCVaZ7X6PKWihMRWOWQimVj/2
         aLExx9Mzw8bh3wh2JqTHHZOEPYZhoKE8DXP7bArzMh7UPj4oUYc3JKGC4iBA+k7rKjnEhAevEhP+
         +qOlITK5QjlwYT9/J2Ib0OUd3hO6AbtOI8eQ8T1NNRfJ54rS9I6C9orIV0KJZeUV1o6t/OVIbJ6m
         YtLECp2/75bI8vGS8/fB2GCPo+FhQBKrsGH9STaFi+cTNzsFpWqv+pX1jFe68PuMsMG0IQQHQW8A
         jd1DHA+9K9WyL2+1R6cCmo6pRriSLMJ3j/djcD1A==
From:   Jerry Meng <jerry-meng@foxmail.com>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org, Jerry Meng <jerry-meng@foxmail.com>
Subject: [PATCH] USB: serial: option: add Quectel EM061KGL series
Date:   Tue, 30 May 2023 11:42:00 +0800
X-OQ-MSGID: <20230530034200.1937107-1-jerry-meng@foxmail.com>
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

EM061KGL_LWW(0x2c7c / 0x6008): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
EM061KGL_LCN(0x2c7c / 0x6009): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
EM061KGL_LTA(0x2c7c / 0x0123): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
EM061KGL_LMS(0x2c7c / 0x0124): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

Option driver just for interfaces DIAG, NMEA and AT

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
index 644a55447fd7..e9275fd9640e 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -255,6 +255,10 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EP06			0x0306
 #define QUECTEL_PRODUCT_EM05G			0x030a
 #define QUECTEL_PRODUCT_EM060K			0x030b
+#define QUECTEL_PRODUCT_EM061K_LWW		0x6008
+#define QUECTEL_PRODUCT_EM061K_LCN		0x6009
+#define QUECTEL_PRODUCT_EM061K_LTA		0x0123
+#define QUECTEL_PRODUCT_EM061K_LMS		0x0124
 #define QUECTEL_PRODUCT_EM05G_CS		0x030c
 #define QUECTEL_PRODUCT_EM05CN_SG		0x0310
 #define QUECTEL_PRODUCT_EM05G_SG		0x0311
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

