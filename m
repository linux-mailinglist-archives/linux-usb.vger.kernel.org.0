Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8433F43AC3B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 08:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhJZGYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 02:24:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26447 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhJZGYY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 02:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635229321; x=1666765321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wh7yzPGNx2t9ZAISAfeMf+8t8c4Z+4HdkHBlkmM63kE=;
  b=oNgvnk7mv3Yx78VyS0l8IZVa5N0717Up0yeSUEHpZ06ptmxbGoVRFs4U
   fekRZ8aME+nFqkRDLqf/+Ij3LOpj1sj1HI614BS7TR47Scs09uv0KKlto
   E2Zdy7/GKZEX1+563/4qkhW9iy71srpsXfjo5d/Wg8g1TgnW5WcnQITFJ
   0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 23:22:01 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 23:22:00 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 23:21:59 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v13 1/2] usb: gadget: configfs: add explicit gi variable
Date:   Tue, 26 Oct 2021 14:21:48 +0800
Message-ID: <1635229309-2821-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

first it will make ussage of to_gadget_info()  consistent,
and gi will be used in following patch as trace event
call argument.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 36c611d..97ed9d3 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -127,20 +127,22 @@ static int usb_string_copy(const char *s, char **s_copy)
 	return 0;
 }
 
-#define GI_DEVICE_DESC_SIMPLE_R_u8(__name)	\
+#define GI_DEVICE_DESC_SIMPLE_R_u8(__name)		\
 static ssize_t gadget_dev_desc_##__name##_show(struct config_item *item, \
-			char *page)	\
-{	\
-	return sprintf(page, "0x%02x\n", \
-		to_gadget_info(item)->cdev.desc.__name); \
+			char *page)			\
+{							\
+	struct gadget_info *gi = to_gadget_info(item);	\
+	return sprintf(page, "0x%02x\n",		\
+			gi->cdev.desc.__name); 		\
 }
 
-#define GI_DEVICE_DESC_SIMPLE_R_u16(__name)	\
+#define GI_DEVICE_DESC_SIMPLE_R_u16(__name)		\
 static ssize_t gadget_dev_desc_##__name##_show(struct config_item *item, \
-			char *page)	\
-{	\
-	return sprintf(page, "0x%04x\n", \
-		le16_to_cpup(&to_gadget_info(item)->cdev.desc.__name)); \
+			char *page)			\
+{							\
+	struct gadget_info *gi = to_gadget_info(item);	\
+	return sprintf(page, "0x%04x\n",		\
+		le16_to_cpup(&gi->cdev.desc.__name));	\
 }
 
 
@@ -148,25 +150,27 @@ static ssize_t gadget_dev_desc_##__name##_show(struct config_item *item, \
 static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
 		const char *page, size_t len)		\
 {							\
+	struct gadget_info *gi = to_gadget_info(item);	\
 	u8 val;						\
 	int ret;					\
 	ret = kstrtou8(page, 0, &val);			\
 	if (ret)					\
 		return ret;				\
-	to_gadget_info(item)->cdev.desc._name = val;	\
+	gi->cdev.desc._name = val;			\
 	return len;					\
 }
 
-#define GI_DEVICE_DESC_SIMPLE_W_u16(_name)	\
+#define GI_DEVICE_DESC_SIMPLE_W_u16(_name)		\
 static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
 		const char *page, size_t len)		\
 {							\
+	struct gadget_info *gi = to_gadget_info(item);	\
 	u16 val;					\
 	int ret;					\
 	ret = kstrtou16(page, 0, &val);			\
 	if (ret)					\
 		return ret;				\
-	to_gadget_info(item)->cdev.desc._name = cpu_to_le16p(&val);	\
+	gi->cdev.desc._name = cpu_to_le16p(&val);	\
 	return len;					\
 }
 
@@ -199,6 +203,7 @@ static ssize_t is_valid_bcd(u16 bcd_val)
 static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct gadget_info *gi = to_gadget_info(item);
 	u16 bcdDevice;
 	int ret;
 
@@ -209,13 +214,14 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
+	gi->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
 	return len;
 }
 
 static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct gadget_info *gi = to_gadget_info(item);
 	u16 bcdUSB;
 	int ret;
 
@@ -226,7 +232,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	gi->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
 	return len;
 }
 
@@ -305,7 +311,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
 					      char *page)
 {
-	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
+	struct gadget_info *gi = to_gadget_info(item);
+	enum usb_device_speed speed = gi->composite.max_speed;
 
 	return sprintf(page, "%s\n", usb_speed_string(speed));
 }
-- 
2.7.4

