Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722EF433705
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 15:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235857AbhJSN3I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 09:29:08 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8771 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235870AbhJSN3H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 09:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634650014; x=1666186014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q7sMiibwXrM5wEpxYTwtA+jYAxSFvIpa74p3kVBhBiY=;
  b=MYH1ysBUOpwKFZVelYe2WUz+d4K0Rxyesvn1JDUw4C6FMrjxktHeuPt9
   RoZbLrkNPBOh+DmMpK4+Gj7vIUw5cfsft5rEiOw45KkaGkjefByqYHAv5
   kk9jNyRStaekG9U1BEPxvMiqWOKNztVclIgY2hjncbwSK7BOEVtcV+xyS
   Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 06:26:54 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 06:26:54 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 06:26:52 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v12 3/4] usb: gadget: configfs: use gi->lock to protect write operation
Date:   Tue, 19 Oct 2021 21:26:36 +0800
Message-ID: <1634649997-28745-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1634649997-28745-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

write operation from user space should be protected by
one mutex lock gi->lock.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 36c611d..27aa569 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -199,6 +199,7 @@ static ssize_t is_valid_bcd(u16 bcd_val)
 static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct gadget_info *gi = to_gadget_info(item);
 	u16 bcdDevice;
 	int ret;
 
@@ -209,13 +210,16 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
+	mutex_lock(&gi->lock);
+	gi->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
+	mutex_unlock(&gi->lock);
 	return len;
 }
 
 static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct gadget_info *gi = to_gadget_info(item);
 	u16 bcdUSB;
 	int ret;
 
@@ -226,7 +230,9 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	mutex_lock(&gi->lock);
+	gi->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	mutex_unlock(&gi->lock);
 	return len;
 }
 
@@ -517,6 +523,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		const char *page, size_t len)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
+	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 	u16 val;
 	int ret;
 	ret = kstrtou16(page, 0, &val);
@@ -524,7 +531,9 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		return ret;
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
+	mutex_lock(&gi->lock);
 	cfg->c.MaxPower = val;
+	mutex_unlock(&gi->lock);
 	return len;
 }
 
@@ -540,6 +549,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 		const char *page, size_t len)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
+	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 	u8 val;
 	int ret;
 	ret = kstrtou8(page, 0, &val);
@@ -550,7 +560,9 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 	if (val & ~(USB_CONFIG_ATT_ONE | USB_CONFIG_ATT_SELFPOWER |
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
+	mutex_lock(&gi->lock);
 	cfg->c.bmAttributes = val;
+	mutex_unlock(&gi->lock);
 	return len;
 }
 
@@ -729,7 +741,9 @@ static struct config_group *config_desc_make(
 			&gadget_config_name_strings_type);
 	configfs_add_default_group(&cfg->strings_group, &cfg->group);
 
+	mutex_lock(&gi->lock);
 	ret = usb_add_config_only(&gi->cdev, &cfg->c);
+	mutex_unlock(&gi->lock);
 	if (ret)
 		goto err;
 
-- 
2.7.4

