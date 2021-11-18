Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359424553F9
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 05:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243057AbhKRE4r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 23:56:47 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:25996 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243061AbhKRE4p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 23:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637211226; x=1668747226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u/f8pUXy9itls9k3grtaYW6p2+4CXjPTwmvirnTmops=;
  b=P1TBEEf943J2stvqnuBa0Dalhm+PU1o0I9NcPZ6aEVIjfAZt2qDMpq4G
   4BqEGXjnBitSVwVbQF0BX8q4AXA0idVcMrfZdRO1NqEMz5ZewPxmBU1Sb
   SETS0q1kxrWPtZ1mh+jDiNI8+3R5D0N83RiQg8sRLrE6T8XmonuyViUat
   I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Nov 2021 20:53:45 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 20:53:45 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:45 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:43 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 1/4] usb: gadget: configfs: simplify os_desc_item_to_gadget_info() helper
Date:   Thu, 18 Nov 2021 12:53:30 +0800
Message-ID: <1637211213-16400-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

since os_desc_group is already a member of struct gadget_info,
we can simply just use container_of() to retrieve the latter,
without needing to dereference the cg_item's parent pointer.

use os_desc_item_to_gadget_info() helper in os_desc (un)link function.

Reviewed-by: Jack Pham <quic_jackp@quicinc.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 36c611d..ac35fea 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -791,7 +791,8 @@ static inline struct os_desc *to_os_desc(struct config_item *item)
 static inline struct gadget_info *os_desc_item_to_gadget_info(
 		struct config_item *item)
 {
-	return to_gadget_info(to_os_desc(item)->group.cg_item.ci_parent);
+	return container_of(to_config_group(item),
+			struct gadget_info, os_desc_group);
 }
 
 static ssize_t os_desc_use_show(struct config_item *item, char *page)
@@ -895,8 +896,7 @@ static void os_desc_attr_release(struct config_item *item)
 static int os_desc_link(struct config_item *os_desc_ci,
 			struct config_item *usb_cfg_ci)
 {
-	struct gadget_info *gi = container_of(to_config_group(os_desc_ci),
-					struct gadget_info, os_desc_group);
+	struct gadget_info *gi = os_desc_item_to_gadget_info(os_desc_ci);
 	struct usb_composite_dev *cdev = &gi->cdev;
 	struct config_usb_cfg *c_target =
 		container_of(to_config_group(usb_cfg_ci),
@@ -930,8 +930,7 @@ static int os_desc_link(struct config_item *os_desc_ci,
 static void os_desc_unlink(struct config_item *os_desc_ci,
 			  struct config_item *usb_cfg_ci)
 {
-	struct gadget_info *gi = container_of(to_config_group(os_desc_ci),
-					struct gadget_info, os_desc_group);
+	struct gadget_info *gi = os_desc_item_to_gadget_info(os_desc_ci);
 	struct usb_composite_dev *cdev = &gi->cdev;
 
 	mutex_lock(&gi->lock);
-- 
2.7.4

