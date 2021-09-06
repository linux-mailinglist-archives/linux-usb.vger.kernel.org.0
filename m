Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7ADB401A77
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 13:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241333AbhIFLSk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 07:18:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43174 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241236AbhIFLSg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Sep 2021 07:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630927052; x=1662463052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TpbQ28wOsPzsirvOorr4EuDfjd1Vd6SarKvHxGgPwb8=;
  b=RpgU+3yahRGUzonYV84wjZxNXwVOqc7An9rve9I5g8TsJKZdHmOyCt3R
   xhzN+sKQfOvh08aFG/LwMX6MIlZX7nM2i15roEFYSkYt+oqBY/pjYnDPb
   yiQRof2r8SyRIy5qH3vat5vlmq5VN1jlc96rJPEBCl9hDydVaCKAZexM8
   8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 06 Sep 2021 04:17:30 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2021 04:17:30 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 6 Sep 2021 04:17:28 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 1/3] usb: gadget: configfs: avoid list move operation of usb_function
Date:   Mon, 6 Sep 2021 19:17:19 +0800
Message-ID: <1630927041-10175-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630927041-10175-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630927041-10175-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add a new list which link all usb_function at configfs layers,
it means that after link a function a configuration,
from configfs layer, we can still found all functions,
it will allow trace all functions from configfs.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix unused cfg variable warning
v3: add struct inside configfs.c

 drivers/usb/gadget/configfs.c | 52 ++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 477e72a..88d6bcc 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -58,6 +58,11 @@ static inline struct gadget_info *to_gadget_info(struct config_item *item)
 	return container_of(to_config_group(item), struct gadget_info, group);
 }
 
+struct config_usb_function {
+	struct list_head list;
+	struct usb_function *f;
+};
+
 struct config_usb_cfg {
 	struct config_group group;
 	struct config_group strings_group;
@@ -420,7 +425,7 @@ static int config_usb_cfg_link(
 	struct usb_function_instance *fi = container_of(group,
 			struct usb_function_instance, group);
 	struct usb_function_instance *a_fi;
-	struct usb_function *f;
+	struct config_usb_function *cf;
 	int ret;
 
 	mutex_lock(&gi->lock);
@@ -438,21 +443,29 @@ static int config_usb_cfg_link(
 		goto out;
 	}
 
-	list_for_each_entry(f, &cfg->func_list, list) {
-		if (f->fi == fi) {
+	list_for_each_entry(cf, &cfg->func_list, list) {
+		if (cf->f->fi == fi) {
 			ret = -EEXIST;
 			goto out;
 		}
 	}
 
-	f = usb_get_function(fi);
-	if (IS_ERR(f)) {
-		ret = PTR_ERR(f);
+	cf = kzalloc(sizeof(*cf), GFP_KERNEL);
+	if (!cf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	INIT_LIST_HEAD(&cf->list);
+
+	cf->f = usb_get_function(fi);
+	if (IS_ERR(cf->f)) {
+		ret = PTR_ERR(cf->f);
+		kfree(cf);
 		goto out;
 	}
 
 	/* stash the function until we bind it to the gadget */
-	list_add_tail(&f->list, &cfg->func_list);
+	list_add_tail(&cf->list, &cfg->func_list);
 	ret = 0;
 out:
 	mutex_unlock(&gi->lock);
@@ -470,7 +483,7 @@ static void config_usb_cfg_unlink(
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
 			struct usb_function_instance, group);
-	struct usb_function *f;
+	struct config_usb_function *cf;
 
 	/*
 	 * ideally I would like to forbid to unlink functions while a gadget is
@@ -483,10 +496,11 @@ static void config_usb_cfg_unlink(
 		unregister_gadget(gi);
 	WARN_ON(gi->composite.gadget_driver.udc_name);
 
-	list_for_each_entry(f, &cfg->func_list, list) {
-		if (f->fi == fi) {
-			list_del(&f->list);
-			usb_put_function(f);
+	list_for_each_entry(cf, &cfg->func_list, list) {
+		if (cf->f->fi == fi) {
+			list_del(&cf->list);
+			usb_put_function(cf->f);
+			kfree(cf);
 			mutex_unlock(&gi->lock);
 			return;
 		}
@@ -1263,7 +1277,7 @@ static void purge_configs_funcs(struct gadget_info *gi)
 
 		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
 
-			list_move(&f->list, &cfg->func_list);
+			list_del(&f->list);
 			if (f->unbind) {
 				dev_dbg(&gi->cdev.gadget->dev,
 					"unbind function '%s'/%p\n",
@@ -1371,8 +1385,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 	/* Go through all configs, attach all functions */
 	list_for_each_entry(c, &gi->cdev.configs, list) {
 		struct config_usb_cfg *cfg;
-		struct usb_function *f;
-		struct usb_function *tmp;
+		struct config_usb_function *cf, *tmp;
 		struct gadget_config_name *cn;
 
 		if (gadget_is_otg(gadget))
@@ -1396,13 +1409,10 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 			c->iConfiguration = s[0].id;
 		}
 
-		list_for_each_entry_safe(f, tmp, &cfg->func_list, list) {
-			list_del(&f->list);
-			ret = usb_add_function(c, f);
-			if (ret) {
-				list_add(&f->list, &cfg->func_list);
+		list_for_each_entry_safe(cf, tmp, &cfg->func_list, list) {
+			ret = usb_add_function(c, cf->f);
+			if (ret)
 				goto err_purge_funcs;
-			}
 		}
 		ret = usb_gadget_check_config(cdev->gadget);
 		if (ret)
-- 
2.7.4

