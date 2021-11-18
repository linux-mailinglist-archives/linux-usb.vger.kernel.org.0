Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD614553FC
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 05:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243074AbhKRE4w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 23:56:52 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:52314 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243066AbhKRE4v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 23:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637211232; x=1668747232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U7ISu5ZQkjWnxyd6dGHRf46aIdHsQa1dZWGR/bxxe4A=;
  b=SflP4KYAw1gr7FnEnMAMQNzZ6UNU6YO/Lh3XswQrKz3/oiopU2yTjMcE
   /uq98sKoMvPfhJq00zj2sVRKvDJo5CMAtNw6obkJUgx2dDRYv1mbgbarL
   F62ILBMDXHvFiI2OjSILYFNsbi4ayobYGllc/e8pOiUUKj9To8gOprGwG
   U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Nov 2021 20:53:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 20:53:51 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:50 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:48 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 4/4] usb: gadget: configfs: use to_usb_function_instance() in cfg (un)link func
Date:   Thu, 18 Nov 2021 12:53:33 +0800
Message-ID: <1637211213-16400-5-git-send-email-quic_linyyuan@quicinc.com>
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

replace open-coded container_of() with to_usb_function_instance() helper.

Reviewed-by: Jack Pham <quic_jackp@quicinc.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ff0fb33..d4a678c 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -416,9 +416,8 @@ static int config_usb_cfg_link(
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
 	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 
-	struct config_group *group = to_config_group(usb_func_ci);
-	struct usb_function_instance *fi = container_of(group,
-			struct usb_function_instance, group);
+	struct usb_function_instance *fi =
+			to_usb_function_instance(usb_func_ci);
 	struct usb_function_instance *a_fi;
 	struct usb_function *f;
 	int ret;
@@ -466,9 +465,8 @@ static void config_usb_cfg_unlink(
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
 	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 
-	struct config_group *group = to_config_group(usb_func_ci);
-	struct usb_function_instance *fi = container_of(group,
-			struct usb_function_instance, group);
+	struct usb_function_instance *fi =
+			to_usb_function_instance(usb_func_ci);
 	struct usb_function *f;
 
 	/*
-- 
2.7.4

