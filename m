Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15094E19AD
	for <lists+linux-usb@lfdr.de>; Sun, 20 Mar 2022 05:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244716AbiCTEpi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Mar 2022 00:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244713AbiCTEpe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Mar 2022 00:45:34 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822043152F
        for <linux-usb@vger.kernel.org>; Sat, 19 Mar 2022 21:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647751451; x=1679287451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDOY22hKH8xHx4e6PbNvOR2LcgO4dCQJgjTWzseu688=;
  b=zgwPE6bepGqEHHcpFKnfdxFHcl0crv31X2TyIDDOeCXr7ZCPnPuEqLE5
   28RSHkO3+5l1pdlleOREWytso6BdRkxC9FdxBf4kEMFHr9uNDNNAG2E9G
   n+KJS9mL0lUSxl6rnMYOdoVgmQou8sdGxDDxZXA1cTUp7iDG8fUtpLZ97
   g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Mar 2022 21:44:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 21:44:08 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 19 Mar 2022 21:43:35 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 19 Mar 2022 21:43:33 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 3/4] usb: gadget: add trace event of configfs link/unlink operation
Date:   Sun, 20 Mar 2022 12:43:23 +0800
Message-ID: <1647751404-6841-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647751404-6841-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1647751404-6841-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add API trace_usb_configfs_link_group() and trace_usb_configfs_unlink_group()
to trace user link/unlink a function to gadget configuration,
if a specific function need link/unlink, it also can be used.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/gadget/configfs.c              | 50 ++++++++++++++++++++++++++++++
 drivers/usb/gadget/function/uvc_configfs.c | 12 +++++++
 include/linux/usb/composite.h              |  6 ++++
 3 files changed, 68 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index be9e70a..0f85290 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -425,6 +425,8 @@ static int config_usb_cfg_link(
 	struct usb_function *f;
 	int ret;
 
+	trace_usb_configfs_link_group(usb_cfg_ci, usb_func_ci);
+
 	mutex_lock(&gi->lock);
 	/*
 	 * Make sure this function is from within our _this_ gadget and not
@@ -474,6 +476,8 @@ static void config_usb_cfg_unlink(
 			to_usb_function_instance(usb_func_ci);
 	struct usb_function *f;
 
+	trace_usb_configfs_unlink_group(usb_cfg_ci, usb_func_ci);
+
 	/*
 	 * ideally I would like to forbid to unlink functions while a gadget is
 	 * bound to an UDC. Since this isn't possible at the moment, we simply
@@ -896,6 +900,8 @@ static int os_desc_link(struct config_item *os_desc_ci,
 	struct usb_configuration *c = NULL, *iter;
 	int ret;
 
+	trace_usb_configfs_link_group(os_desc_ci, usb_cfg_ci);
+
 	mutex_lock(&gi->lock);
 	list_for_each_entry(iter, &cdev->configs, list) {
 		if (iter != &c_target->c)
@@ -927,6 +933,8 @@ static void os_desc_unlink(struct config_item *os_desc_ci,
 	struct gadget_info *gi = os_desc_item_to_gadget_info(os_desc_ci);
 	struct usb_composite_dev *cdev = &gi->cdev;
 
+	trace_usb_configfs_unlink_group(os_desc_ci, usb_cfg_ci);
+
 	mutex_lock(&gi->lock);
 	if (gi->composite.gadget_driver.udc_name)
 		unregister_gadget(gi);
@@ -1756,6 +1764,48 @@ void trace_usb_configfs_drop_group(struct config_item *pitem,
 	trace_usb_configfs_make_drop_group(pitem, item, "rmdir");
 }
 EXPORT_SYMBOL(trace_usb_configfs_drop_group);
+
+static void trace_usb_configfs_link_unlink_group(struct config_item *dest,
+		struct config_item *src, char *link_unlink)
+{
+	char *group = kzalloc(4 * GROUP_LEN, GFP_KERNEL);
+	char *group1, *group2;
+	int ret;
+
+	if (!group)
+		goto out;
+
+	group1 = group + 2 * GROUP_LEN;
+	ret = gadget_configfs_group(group1, dest);
+	if (ret)
+		goto out;
+
+	group2 = group + 3 * GROUP_LEN;
+	ret = gadget_configfs_group(group2, src);
+	if (ret)
+		goto out;
+
+	snprintf(group, 2 * GROUP_LEN, "%s %s %s", link_unlink, group1, group2);
+
+	trace_gadget_configfs(group);
+
+out:
+	kfree(group);
+}
+
+void trace_usb_configfs_link_group(struct config_item *dest,
+		struct config_item *src)
+{
+	trace_usb_configfs_link_unlink_group(dest, src, "link");
+}
+EXPORT_SYMBOL(trace_usb_configfs_link_group);
+
+void trace_usb_configfs_unlink_group(struct config_item *dest,
+		struct config_item *src)
+{
+	trace_usb_configfs_link_unlink_group(dest, src, "unlink");
+}
+EXPORT_SYMBOL(trace_usb_configfs_unlink_group);
 #endif
 
 static int __init gadget_cfs_init(void)
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index cc0f2eb..fc139f3 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -598,6 +598,8 @@ static int uvcg_control_class_allow_link(struct config_item *src,
 	struct uvcg_control_header *target_hdr;
 	int ret = -EINVAL;
 
+	trace_usb_configfs_link_group(src, target);
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	control = src->ci_parent->ci_parent;
@@ -639,6 +641,8 @@ static void uvcg_control_class_drop_link(struct config_item *src,
 	struct uvc_descriptor_header **class_array;
 	struct uvcg_control_header *target_hdr;
 
+	trace_usb_configfs_unlink_group(src, target);
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	control = src->ci_parent->ci_parent;
@@ -883,6 +887,8 @@ static int uvcg_streaming_header_allow_link(struct config_item *src,
 	struct uvcg_format_ptr *format_ptr;
 	int i, ret = -EINVAL;
 
+	trace_usb_configfs_link_group(src, target);
+
 	src_hdr = to_uvcg_streaming_header(src);
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
@@ -946,6 +952,8 @@ static void uvcg_streaming_header_drop_link(struct config_item *src,
 	struct uvcg_format *target_fmt = NULL;
 	struct uvcg_format_ptr *format_ptr, *tmp;
 
+	trace_usb_configfs_unlink_group(src, target);
+
 	src_hdr = to_uvcg_streaming_header(src);
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
@@ -2171,6 +2179,8 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
 	size_t size = 0, count = 0;
 	int ret = -EINVAL;
 
+	trace_usb_configfs_link_group(src, target);
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	streaming = src->ci_parent->ci_parent;
@@ -2242,6 +2252,8 @@ static void uvcg_streaming_class_drop_link(struct config_item *src,
 	struct uvc_descriptor_header ***class_array;
 	struct uvcg_streaming_header *target_hdr;
 
+	trace_usb_configfs_unlink_group(src, target);
+
 	mutex_lock(su_mutex); /* for navigating configfs hierarchy */
 
 	streaming = src->ci_parent->ci_parent;
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 611029d..a90e626 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -608,9 +608,15 @@ void trace_usb_configfs_make_group(struct config_item *pitem,
 		struct config_item *item);
 void trace_usb_configfs_drop_group(struct config_item *pitem,
 		struct config_item *item);
+void trace_usb_configfs_link_group(struct config_item *pitem,
+		struct config_item *item);
+void trace_usb_configfs_unlink_group(struct config_item *pitem,
+		struct config_item *item);
 #else
 #define trace_usb_configfs_make_group(pitem, item) do {} while(0)
 #define trace_usb_configfs_drop_group(pitem, item) do {} while(0)
+#define trace_usb_configfs_link_group(pitem, item) do {} while(0)
+#define trace_usb_configfs_unlink_group(pitem, item) do {} while(0)
 #endif
 
 struct usb_configuration *usb_get_config(struct usb_composite_dev *cdev,
-- 
2.7.4

