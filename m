Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D78401A93
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 13:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238264AbhIFL24 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 07:28:56 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41197 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbhIFL24 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Sep 2021 07:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630927672; x=1662463672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eIAMMBuDhSWC/qjUh6+8nowHYz3d7LJiEygLtxkKlQU=;
  b=DiiKF/EWK8W+Bfprbl0k1gFo1yKVPwAhhbfnaAfrG13baA/mB6yLOHTY
   PYPPo4U89v0QbHeJuvE5V2sarFR5kfweYOQHbvJA8IDwZvb1MQhCVsECf
   +6BUGafJ6XvfCwvMYrzC4S4+fujR6qKXNHk4EHz5zab2AV2yCB9Hi6aw5
   A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 04:27:52 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 04:27:52 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 6 Sep 2021 04:27:50 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v4 2/3] usb: gadget: configfs: add gadget_info for config group
Date:   Mon, 6 Sep 2021 19:27:40 +0800
Message-ID: <1630927661-11307-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630927661-11307-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630927661-11307-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add gadget_info pointer in struct config_usb_cfg
to allow common gadget info trace from configfs layer.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: change struct inside configfs.c
v4: no change

 drivers/usb/gadget/configfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 88d6bcc..f766756 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -70,6 +70,7 @@ struct config_usb_cfg {
 	struct usb_configuration c;
 	struct list_head func_list;
 	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
+	struct gadget_info *gi;
 };
 
 static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
@@ -418,8 +419,7 @@ static int config_usb_cfg_link(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg->gi;
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -477,8 +477,7 @@ static void config_usb_cfg_unlink(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg->gi;
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -717,6 +716,7 @@ static struct config_group *config_desc_make(
 	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
 	if (!cfg)
 		return ERR_PTR(-ENOMEM);
+	cfg->gi = gi;
 	cfg->c.label = kstrdup(buf, GFP_KERNEL);
 	if (!cfg->c.label) {
 		ret = -ENOMEM;
-- 
2.7.4

