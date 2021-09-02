Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7399C3FEE7F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 15:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345237AbhIBNPW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 09:15:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:39192 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345248AbhIBNOZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 09:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630588407; x=1662124407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eIe9jadkwp4PkpgpQ0cxNwDPBIxI77oA/u1kzzEciWg=;
  b=U3umHrl33hvV/V35Tsx0BdlepD7IyaQW9JvPt5Wvw1NusMjpWJ4S748m
   3/5lgIRs8qc5AboJ1GO8OIwqVvOgy80fdvC0f9QP3wJ8opnE5PBOqnfaF
   vpSW2vdhsoCDRY33ik0YMCI62Oll7vRfVttIKy0Lwv1mtidlbUKJ92YT2
   4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 06:13:11 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 06:13:11 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 06:13:09 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 4/5] usb: gadget: configfs: add gadget_info for config group
Date:   Thu, 2 Sep 2021 21:12:53 +0800
Message-ID: <1630588374-5169-5-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
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
 drivers/usb/gadget/configfs.c | 7 +++----
 drivers/usb/gadget/configfs.h | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index c5b5c2f..6b02e74 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -347,8 +347,7 @@ static int config_usb_cfg_link(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg->gi;
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -406,8 +405,7 @@ static void config_usb_cfg_unlink(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg->gi;
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -646,6 +644,7 @@ static struct config_group *config_desc_make(
 	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
 	if (!cfg)
 		return ERR_PTR(-ENOMEM);
+	cfg->gi = gi;
 	cfg->c.label = kstrdup(buf, GFP_KERNEL);
 	if (!cfg->c.label) {
 		ret = -ENOMEM;
diff --git a/drivers/usb/gadget/configfs.h b/drivers/usb/gadget/configfs.h
index 103df1b..2fa2c3b 100644
--- a/drivers/usb/gadget/configfs.h
+++ b/drivers/usb/gadget/configfs.h
@@ -36,6 +36,7 @@ struct config_usb_cfg {
 	struct usb_configuration c;
 	struct list_head func_list;
 	struct usb_gadget_strings *gstrings[MAX_USB_STRING_LANGS + 1];
+	struct gadget_info *gi;
 };
 
 static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
-- 
2.7.4

