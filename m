Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D36B58366E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 03:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbiG1BiO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 21:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiG1BiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 21:38:13 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4E14D175
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 18:38:12 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RJBqHk007287;
        Wed, 27 Jul 2022 18:38:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=date : message-id :
 from : subject : to; s=pfptdkimsnps;
 bh=AITmAF2r7AE+o5w6lgweIIl6CBS+TczKsniNQAl2Do4=;
 b=U7JGtGDL1llqSH/lKkJiHiE0pK3iiCqDOKKL+x+UrIpcnqsTb75GCycuvlquKn+9eoQS
 v31+Y60rXAbfVUb/fEj2dl61z6gFAskyGZOxfO5mtBI/UXiMEKlytfPoZCkUZ4GqnLoZ
 BJuNj2KEg1QCdCKiVZ4IShfk/Wpj4JePvBCa/vZCNSGQBbWV3SanRSWMeztIR6Ca+j3d
 5i0dvFPG1ri5gac8HosL1AUfh8CAgK6I0VfWzPMqy+q30YlnojWxLW6hXWfdr59FuLM5
 Xc/7zWgGtQy2We0FJbDaXiKI9slFnFpMQdKUnHqrHviBr391H/WmuQK/0bLHG0sy9LKh Pg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3hgfmfx67u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jul 2022 18:38:04 -0700
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF91E40052;
        Thu, 28 Jul 2022 01:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1658972284; bh=F96/Vg0QdHfhpYT6vwo1WbFbOs+6ACuSU1PTzA4jct4=;
        h=Date:From:Subject:To:From;
        b=SSQgoBrHkVX4w+uKJGh1RDu309zQpJhWplCNq5Q0LAUAeYAX+F0/l7Q1gnd6UxHY3
         p32WzKke7hz38ObUjC7J2CLdePj4gq733uUhCZf3080z+MlpXppEY8eoPoVx4OTT1V
         b6dIgkPHl0i4QxpSoQ8Xaesc8nPM46EetfivvtObrmbXUJjPtjGwhjtvwXQC65ugwC
         1tmDK2nW5YAFdCipW/w/eIvg7onLW3PRaXFcg5dQHN2MrkE2Q/Ox4+KxM8hLhS41p2
         ZHnXevJpvtvTaLoW0V3AZbMyJJ4Kx+XEOAt0pcZtyTreWgpJhl81hHiLJhBTOPBlfA
         XUiWAGmMnslYg==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id ED15BA0099;
        Thu, 28 Jul 2022 01:38:01 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Wed, 27 Jul 2022 18:38:01 -0700
Date:   Wed, 27 Jul 2022 18:38:01 -0700
Message-Id: <8d6a30f2f2f953eff833a5bc5aac640a4cc2fc9f.1658971571.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: common: debug: Check non-standard control requests
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
X-Proofpoint-GUID: Dfo_AtjipbR7BDSAOUKzEumREtsZK5HK
X-Proofpoint-ORIG-GUID: Dfo_AtjipbR7BDSAOUKzEumREtsZK5HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_08,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207280004
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously usb_decode_ctrl() only decodes standard control requests, but
it was used for non-standard requests also. If it's non-standard or
unknown standard bRequest, print the Setup data values.

Fixes: af32423a2d86 ("usb: dwc3: trace: decode ctrl request")
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
New patch from previous feedback:
https://lore.kernel.org/linux-usb/bf1e225b660d0bb68ccdb3ce1bd7bd2d33edb817.1648253632.git.Thinh.Nguyen@synopsys.com/


 drivers/usb/common/debug.c | 96 +++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index 075f6b1b2a1a..f204cec8d380 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -208,30 +208,28 @@ static void usb_decode_set_isoch_delay(__u8 wValue, char *str, size_t size)
 	snprintf(str, size, "Set Isochronous Delay(Delay = %d ns)", wValue);
 }
 
-/**
- * usb_decode_ctrl - Returns human readable representation of control request.
- * @str: buffer to return a human-readable representation of control request.
- *       This buffer should have about 200 bytes.
- * @size: size of str buffer.
- * @bRequestType: matches the USB bmRequestType field
- * @bRequest: matches the USB bRequest field
- * @wValue: matches the USB wValue field (CPU byte order)
- * @wIndex: matches the USB wIndex field (CPU byte order)
- * @wLength: matches the USB wLength field (CPU byte order)
- *
- * Function returns decoded, formatted and human-readable description of
- * control request packet.
- *
- * The usage scenario for this is for tracepoints, so function as a return
- * use the same value as in parameters. This approach allows to use this
- * function in TP_printk
- *
- * Important: wValue, wIndex, wLength parameters before invoking this function
- * should be processed by le16_to_cpu macro.
- */
-const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
-			    __u8 bRequest, __u16 wValue, __u16 wIndex,
-			    __u16 wLength)
+static void usb_decode_ctrl_generic(char *str, size_t size, __u8 bRequestType,
+				    __u8 bRequest, __u16 wValue, __u16 wIndex,
+				    __u16 wLength)
+{
+	u8 recip = bRequestType & USB_RECIP_MASK;
+	u8 type = bRequestType & USB_TYPE_MASK;
+
+	snprintf(str, size,
+		 "Type=%s Recipient=%s Dir=%s bRequest=%u wValue=%u wIndex=%u wLength=%u",
+		 (type == USB_TYPE_STANDARD)    ? "Standard" :
+		 (type == USB_TYPE_VENDOR)      ? "Vendor" :
+		 (type == USB_TYPE_CLASS)       ? "Class" : "Unknown",
+		 (recip == USB_RECIP_DEVICE)    ? "Device" :
+		 (recip == USB_RECIP_INTERFACE) ? "Interface" :
+		 (recip == USB_RECIP_ENDPOINT)  ? "Endpoint" : "Unknown",
+		 (bRequestType & USB_DIR_IN)    ? "IN" : "OUT",
+		 bRequest, wValue, wIndex, wLength);
+}
+
+static void usb_decode_ctrl_standard(char *str, size_t size, __u8 bRequestType,
+				     __u8 bRequest, __u16 wValue, __u16 wIndex,
+				     __u16 wLength)
 {
 	switch (bRequest) {
 	case USB_REQ_GET_STATUS:
@@ -272,14 +270,48 @@ const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
 		usb_decode_set_isoch_delay(wValue, str, size);
 		break;
 	default:
-		snprintf(str, size, "%02x %02x %02x %02x %02x %02x %02x %02x",
-			 bRequestType, bRequest,
-			 (u8)(cpu_to_le16(wValue) & 0xff),
-			 (u8)(cpu_to_le16(wValue) >> 8),
-			 (u8)(cpu_to_le16(wIndex) & 0xff),
-			 (u8)(cpu_to_le16(wIndex) >> 8),
-			 (u8)(cpu_to_le16(wLength) & 0xff),
-			 (u8)(cpu_to_le16(wLength) >> 8));
+		usb_decode_ctrl_generic(str, size, bRequestType, bRequest,
+					wValue, wIndex, wLength);
+		break;
+	}
+}
+
+/**
+ * usb_decode_ctrl - Returns human readable representation of control request.
+ * @str: buffer to return a human-readable representation of control request.
+ *       This buffer should have about 200 bytes.
+ * @size: size of str buffer.
+ * @bRequestType: matches the USB bmRequestType field
+ * @bRequest: matches the USB bRequest field
+ * @wValue: matches the USB wValue field (CPU byte order)
+ * @wIndex: matches the USB wIndex field (CPU byte order)
+ * @wLength: matches the USB wLength field (CPU byte order)
+ *
+ * Function returns decoded, formatted and human-readable description of
+ * control request packet.
+ *
+ * The usage scenario for this is for tracepoints, so function as a return
+ * use the same value as in parameters. This approach allows to use this
+ * function in TP_printk
+ *
+ * Important: wValue, wIndex, wLength parameters before invoking this function
+ * should be processed by le16_to_cpu macro.
+ */
+const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
+			    __u8 bRequest, __u16 wValue, __u16 wIndex,
+			    __u16 wLength)
+{
+	switch (bRequestType & USB_TYPE_MASK) {
+	case USB_TYPE_STANDARD:
+		usb_decode_ctrl_standard(str, size, bRequestType, bRequest,
+					 wValue, wIndex, wLength);
+		break;
+	case USB_TYPE_VENDOR:
+	case USB_TYPE_CLASS:
+	default:
+		usb_decode_ctrl_generic(str, size, bRequestType, bRequest,
+					wValue, wIndex, wLength);
+		break;
 	}
 
 	return str;

base-commit: ed92f4353ef53e544db5311fd8efa0cd7fdc4e08
-- 
2.28.0

