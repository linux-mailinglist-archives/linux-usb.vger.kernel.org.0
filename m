Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F1C3FF8ED
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 04:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346199AbhICCqL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 22:46:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:2629 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346092AbhICCqK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 22:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630637111; x=1662173111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+qQGcjNUPYnkY+4ebPv3uq2zO6wnTwSbiD/xGwfSiU=;
  b=it3iO6yhZEpPwNvfmOoMpCkYyEmd1kjQvsh5gJl9iOgqPVEvUdI2Ga37
   NVthKS386/Jk5VzMvBaTMPKfh9AE3ZCRgPuP5MAODssj7pebRboT0K2Q7
   uNg3/8Fqlc882sBUZoPEH6eBSqybArBnRLmRDkogTLSMPFm9We9SUFP5I
   U=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 19:45:11 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 19:45:11 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 19:45:09 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 2/5] usb: gadget: configfs: change OS attributes operation
Date:   Fri, 3 Sep 2021 10:44:49 +0800
Message-ID: <1630637092-30230-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630637092-30230-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630637092-30230-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

OS decsriptor related attributes use,b_vendor_code,qw_sign
can removed from struct gadget_info, there are sames member in
struct usb_composite_dev.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/gadget/configfs.c | 18 ++++++------------
 drivers/usb/gadget/configfs.h |  3 ---
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 0f3a01f..39b916a 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -723,7 +723,7 @@ static inline struct gadget_info *os_desc_item_to_gadget_info(
 static ssize_t os_desc_use_show(struct config_item *item, char *page)
 {
 	return sprintf(page, "%d\n",
-			os_desc_item_to_gadget_info(item)->use_os_desc);
+			os_desc_item_to_gadget_info(item)->cdev.use_os_string);
 }
 
 static ssize_t os_desc_use_store(struct config_item *item, const char *page,
@@ -736,7 +736,7 @@ static ssize_t os_desc_use_store(struct config_item *item, const char *page,
 	mutex_lock(&gi->lock);
 	ret = strtobool(page, &use);
 	if (!ret) {
-		gi->use_os_desc = use;
+		gi->cdev.use_os_string = use;
 		ret = len;
 	}
 	mutex_unlock(&gi->lock);
@@ -747,7 +747,7 @@ static ssize_t os_desc_use_store(struct config_item *item, const char *page,
 static ssize_t os_desc_b_vendor_code_show(struct config_item *item, char *page)
 {
 	return sprintf(page, "0x%02x\n",
-			os_desc_item_to_gadget_info(item)->b_vendor_code);
+			os_desc_item_to_gadget_info(item)->cdev.b_vendor_code);
 }
 
 static ssize_t os_desc_b_vendor_code_store(struct config_item *item,
@@ -760,7 +760,7 @@ static ssize_t os_desc_b_vendor_code_store(struct config_item *item,
 	mutex_lock(&gi->lock);
 	ret = kstrtou8(page, 0, &b_vendor_code);
 	if (!ret) {
-		gi->b_vendor_code = b_vendor_code;
+		gi->cdev.b_vendor_code = b_vendor_code;
 		ret = len;
 	}
 	mutex_unlock(&gi->lock);
@@ -773,7 +773,7 @@ static ssize_t os_desc_qw_sign_show(struct config_item *item, char *page)
 	struct gadget_info *gi = os_desc_item_to_gadget_info(item);
 	int res;
 
-	res = utf16s_to_utf8s((wchar_t *) gi->qw_sign, OS_STRING_QW_SIGN_LEN,
+	res = utf16s_to_utf8s((wchar_t *) gi->cdev.qw_sign, OS_STRING_QW_SIGN_LEN,
 			      UTF16_LITTLE_ENDIAN, page, PAGE_SIZE - 1);
 	page[res++] = '\n';
 
@@ -792,7 +792,7 @@ static ssize_t os_desc_qw_sign_store(struct config_item *item, const char *page,
 
 	mutex_lock(&gi->lock);
 	res = utf8s_to_utf16s(page, l,
-			      UTF16_LITTLE_ENDIAN, (wchar_t *) gi->qw_sign,
+			      UTF16_LITTLE_ENDIAN, (wchar_t *) gi->cdev.qw_sign,
 			      OS_STRING_QW_SIGN_LEN);
 	if (res > 0)
 		res = len;
@@ -1283,12 +1283,6 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		gi->cdev.desc.iSerialNumber = s[USB_GADGET_SERIAL_IDX].id;
 	}
 
-	if (gi->use_os_desc) {
-		cdev->use_os_string = true;
-		cdev->b_vendor_code = gi->b_vendor_code;
-		memcpy(cdev->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
-	}
-
 	if (gadget_is_otg(gadget) && !otg_desc[0]) {
 		struct usb_descriptor_header *usb_desc;
 
diff --git a/drivers/usb/gadget/configfs.h b/drivers/usb/gadget/configfs.h
index bae403f..a1dc513 100644
--- a/drivers/usb/gadget/configfs.h
+++ b/drivers/usb/gadget/configfs.h
@@ -20,9 +20,6 @@ struct gadget_info {
 
 	struct usb_composite_driver composite;
 	struct usb_composite_dev cdev;
-	bool use_os_desc;
-	char b_vendor_code;
-	char qw_sign[OS_STRING_QW_SIGN_LEN];
 	spinlock_t spinlock;
 	bool unbind;
 };
-- 
2.7.4

