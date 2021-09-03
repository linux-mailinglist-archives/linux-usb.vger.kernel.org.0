Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623EA3FF8EE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 04:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346327AbhICCqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 22:46:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25022 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346212AbhICCqO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 22:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630637115; x=1662173115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HVsVTjtbiWX652vUzjMmB2o4owiDwzcQ8o8hK0H1Xps=;
  b=Js2mH0dY27eFdStqM4nAj20GuZz37Zy+XLcj32s3NQ1+r6sWueOcJV9v
   H9Srwl6lb0Ytb5O35Qp/Ab7Rwd/KvLYVlR0Rv3IL5+lISrdTEYBJEhmU3
   hvbO4AOUfCWaTQM/cz9REBJSH3bwpnH1vXUg/CifxmK3cvuOPtBDZQD5s
   Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 19:45:15 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 19:45:15 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 19:45:13 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 3/5] usb: gadget: configfs: avoid list move operation of usb_function
Date:   Fri, 3 Sep 2021 10:44:50 +0800
Message-ID: <1630637092-30230-4-git-send-email-quic_linyyuan@quicinc.com>
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

add a new list which link all usb_function at configfs layers,
it means that after link a function a configuration,
from configfs layer, we can still found all functions,
it will allow trace all functions from configfs.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix unused cfg variable warning
 
 drivers/usb/gadget/configfs.c | 50 ++++++++++++++++++++++---------------------
 drivers/usb/gadget/configfs.h |  5 +++++
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 39b916a..7d151ce 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -354,7 +354,7 @@ static int config_usb_cfg_link(
 	struct usb_function_instance *fi = container_of(group,
 			struct usb_function_instance, group);
 	struct usb_function_instance *a_fi;
-	struct usb_function *f;
+	struct config_usb_function *cf;
 	int ret;
 
 	mutex_lock(&gi->lock);
@@ -372,21 +372,29 @@ static int config_usb_cfg_link(
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
@@ -404,7 +412,7 @@ static void config_usb_cfg_unlink(
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
 			struct usb_function_instance, group);
-	struct usb_function *f;
+	struct config_usb_function *cf;
 
 	/*
 	 * ideally I would like to forbid to unlink functions while a gadget is
@@ -417,10 +425,11 @@ static void config_usb_cfg_unlink(
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
@@ -1191,13 +1200,10 @@ static void purge_configs_funcs(struct gadget_info *gi)
 
 	list_for_each_entry(c, &gi->cdev.configs, list) {
 		struct usb_function *f, *tmp;
-		struct config_usb_cfg *cfg;
-
-		cfg = container_of(c, struct config_usb_cfg, c);
 
 		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
 
-			list_move(&f->list, &cfg->func_list);
+			list_del(&f->list);
 			if (f->unbind) {
 				dev_dbg(&gi->cdev.gadget->dev,
 					"unbind function '%s'/%p\n",
@@ -1299,8 +1305,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 	/* Go through all configs, attach all functions */
 	list_for_each_entry(c, &gi->cdev.configs, list) {
 		struct config_usb_cfg *cfg;
-		struct usb_function *f;
-		struct usb_function *tmp;
+		struct config_usb_function *cf, *tmp;
 		struct gadget_config_name *cn;
 
 		if (gadget_is_otg(gadget))
@@ -1324,13 +1329,10 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
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
diff --git a/drivers/usb/gadget/configfs.h b/drivers/usb/gadget/configfs.h
index a1dc513..103df1b 100644
--- a/drivers/usb/gadget/configfs.h
+++ b/drivers/usb/gadget/configfs.h
@@ -44,6 +44,11 @@ static inline struct config_usb_cfg *to_config_usb_cfg(struct config_item *item)
 			group);
 }
 
+struct config_usb_function {
+	struct list_head list;
+	struct usb_function *f;
+};
+
 struct gadget_strings {
 	struct usb_gadget_strings stringtab_dev;
 	struct usb_string strings[USB_GADGET_FIRST_AVAIL_IDX];
-- 
2.7.4

