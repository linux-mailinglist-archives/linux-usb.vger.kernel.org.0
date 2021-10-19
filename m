Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A321A432FFE
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 09:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhJSHrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 03:47:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:21279 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbhJSHq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 03:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634629487; x=1666165487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aBpWricXtZMWBp4tFnV5VIPSNdy5rTQpwSyPYop4t8A=;
  b=PKyHMvGHzEnmq7HQWt5qmOa+jBp9ppRjhqkx2WID/jERIjaSlECYeoq+
   r6TbXbmgs/KZ6kE2wJ2WsNuT8yrp4lmiAhtk+shU1YQ7l4mConCJM2Xoz
   /2+g9VW3mMBgZmdcENKni8Jq73/lqAejAlzXC0TGGQKAmxZZHp5AhuzWr
   g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 00:44:47 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 00:44:47 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 00:44:45 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v11 2/3] usb: gadget: configfs: change config attributes file operation
Date:   Tue, 19 Oct 2021 15:44:31 +0800
Message-ID: <1634629473-15411-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634629473-15411-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1634629473-15411-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

in order to add trace event in configfs function with same
struct gadget_info *gi parameter,
add struct config_usb_cfg *cfg variable in below functions,
gadget_config_desc_MaxPower_show(),
gadget_config_desc_MaxPower_store(),
gadget_config_desc_bmAttributes_show(),
gadget_config_desc_bmAttributes_store(),
this allow following patch easy change cfg to gi with helper function
cfg_to_gadget_info().

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 58615dc..36c611d 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -508,12 +508,15 @@ static struct configfs_item_operations gadget_config_item_ops = {
 static ssize_t gadget_config_desc_MaxPower_show(struct config_item *item,
 		char *page)
 {
-	return sprintf(page, "%u\n", to_config_usb_cfg(item)->c.MaxPower);
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
+
+	return sprintf(page, "%u\n", cfg->c.MaxPower);
 }
 
 static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
 	u16 val;
 	int ret;
 	ret = kstrtou16(page, 0, &val);
@@ -521,20 +524,22 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		return ret;
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
-	to_config_usb_cfg(item)->c.MaxPower = val;
+	cfg->c.MaxPower = val;
 	return len;
 }
 
 static ssize_t gadget_config_desc_bmAttributes_show(struct config_item *item,
 		char *page)
 {
-	return sprintf(page, "0x%02x\n",
-		to_config_usb_cfg(item)->c.bmAttributes);
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
+
+	return sprintf(page, "0x%02x\n", cfg->c.bmAttributes);
 }
 
 static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
 	u8 val;
 	int ret;
 	ret = kstrtou8(page, 0, &val);
@@ -545,7 +550,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 	if (val & ~(USB_CONFIG_ATT_ONE | USB_CONFIG_ATT_SELFPOWER |
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
-	to_config_usb_cfg(item)->c.bmAttributes = val;
+	cfg->c.bmAttributes = val;
 	return len;
 }
 
-- 
2.7.4

