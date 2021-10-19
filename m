Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62087433702
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 15:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbhJSN27 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 09:28:59 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8771 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbhJSN27 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 09:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634650007; x=1666186007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9cSDkh0L775oJcnjYQ1zCD2n1VGoUH9afSAy2K1tR9s=;
  b=owyRdcy8RLyA4k9bV9JYRxjpgg7Rl4p+oj9vldzmgpLGqEnJ900M7MYJ
   FgIUneog/OQ21ShyfMF5KJ5IMuNojFYZkrZ/y3Ry4Rl8IYj80gUS9roJE
   JgFfuZGZqpUC6rCkp1kl/50myKzP0pbgZzSC/ykaD4hg2tjY9SQESoIob
   g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 06:26:47 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 06:26:46 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 06:26:45 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v12 1/4] usb: gadget: configfs: add cfg_to_gadget_info() helper
Date:   Tue, 19 Oct 2021 21:26:34 +0800
Message-ID: <1634649997-28745-2-git-send-email-quic_linyyuan@quicinc.com>
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

add this helper function can simplify code of
config_usb_cfg_link() and config_usb_cfg_unlink().

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 477e72a..58615dc 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -73,6 +73,11 @@ static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
 			group);
 }
 
+static inline struct gadget_info *cfg_to_gadget_info(struct config_usb_cfg *cfg)
+{
+	return container_of(cfg->c.cdev, struct gadget_info, cdev);
+}
+
 struct gadget_strings {
 	struct usb_gadget_strings stringtab_dev;
 	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
@@ -413,8 +418,7 @@ static int config_usb_cfg_link(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -464,8 +468,7 @@ static void config_usb_cfg_unlink(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
-- 
2.7.4

