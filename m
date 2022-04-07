Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E357B4F7191
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 03:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239543AbiDGBeA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 21:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242160AbiDGBcI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 21:32:08 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC6F1A395C
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649294881; x=1680830881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QrDxIhNSSVjW8QCgMoW1d0vCX0ZPa/+ICVFo0h8IqZM=;
  b=efmITa9Ll0NtFw1yqdFaVOEXrlqqAXvoIdMw5hQoGULOZtxSRyuSRNVD
   XCqeFiygYNiVNCFlvFcOPBTmWBjvKbr9NZpYAV/51BEuOate+rQr1T3X2
   B8QIVFJ3157SjNn7atlQduCiec8MNwa7Kipj+uoN98llV0UINKXqkdzDf
   Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 06 Apr 2022 18:28:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 18:28:01 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 18:28:00 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 18:27:58 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v6 4/5] usb: gadget: add trace event of configfs link/unlink operation
Date:   Thu, 7 Apr 2022 09:27:44 +0800
Message-ID: <1649294865-4388-5-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add API trace_usb_configfs_link/unlink_group() to trace user space
link/unlink a group like add function to configuration or
remove function from configuration.
If a specific function need link/unlink, it also can be used.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: add API in trace.c
v4: fix memory leak
v5: no change
v6: fix checkpatch warning

 drivers/usb/gadget/configfs.c              |  8 ++++++
 drivers/usb/gadget/function/uvc_configfs.c | 12 ++++++++
 drivers/usb/gadget/trace.c                 | 46 ++++++++++++++++++++++++++++++
 include/linux/usb/composite.h              |  6 ++++
 4 files changed, 72 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index a0599fb..a304d29 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -422,6 +422,8 @@ static int config_usb_cfg_link(
 	struct usb_function *f;
 	int ret;
 
+	trace_usb_configfs_link_group(usb_cfg_ci, usb_func_ci);
+
 	mutex_lock(&gi->lock);
 	/*
 	 * Make sure this function is from within our _this_ gadget and not
@@ -471,6 +473,8 @@ static void config_usb_cfg_unlink(
 			to_usb_function_instance(usb_func_ci);
 	struct usb_function *f;
 
+	trace_usb_configfs_unlink_group(usb_cfg_ci, usb_func_ci);
+
 	/*
 	 * ideally I would like to forbid to unlink functions while a gadget is
 	 * bound to an UDC. Since this isn't possible at the moment, we simply
@@ -893,6 +897,8 @@ static int os_desc_link(struct config_item *os_desc_ci,
 	struct usb_configuration *c = NULL, *iter;
 	int ret;
 
+	trace_usb_configfs_link_group(os_desc_ci, usb_cfg_ci);
+
 	mutex_lock(&gi->lock);
 	list_for_each_entry(iter, &cdev->configs, list) {
 		if (iter != &c_target->c)
@@ -924,6 +930,8 @@ static void os_desc_unlink(struct config_item *os_desc_ci,
 	struct gadget_info *gi = os_desc_item_to_gadget_info(os_desc_ci);
 	struct usb_composite_dev *cdev = &gi->cdev;
 
+	trace_usb_configfs_unlink_group(os_desc_ci, usb_cfg_ci);
+
 	mutex_lock(&gi->lock);
 	if (gi->composite.gadget_driver.udc_name)
 		unregister_gadget(gi);
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
diff --git a/drivers/usb/gadget/trace.c b/drivers/usb/gadget/trace.c
index 65b328f..9b33b30 100644
--- a/drivers/usb/gadget/trace.c
+++ b/drivers/usb/gadget/trace.c
@@ -88,4 +88,50 @@ void trace_usb_configfs_drop_group(struct config_item *parent,
 	trace_usb_configfs_make_drop_group(parent, item, "rmdir");
 }
 EXPORT_SYMBOL(trace_usb_configfs_drop_group);
+
+static void trace_usb_configfs_link_unlink_group(struct config_item *dest,
+		struct config_item *src, char *link_unlink)
+{
+	char *group, *dest_group, *src_group;
+	int ret;
+
+	group = kzalloc(4 * GROUP_LEN, GFP_KERNEL);
+	if (!group)
+		return;
+
+	dest_group = group + 2 * GROUP_LEN;
+	ret = gadget_configfs_group(dest_group, dest);
+	if (ret) {
+		kfree(group);
+		return;
+	}
+
+	src_group = group + 3 * GROUP_LEN;
+	ret = gadget_configfs_group(src_group, src);
+	if (ret) {
+		kfree(group);
+		return;
+	}
+
+	snprintf(group, 2 * GROUP_LEN, "%s %s %s",
+			link_unlink, dest_group, src_group);
+
+	trace_gadget_configfs(group);
+
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
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 7bf6574..65dc26e 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -608,9 +608,15 @@ void trace_usb_configfs_make_group(struct config_item *parent,
 		struct config_item *item);
 void trace_usb_configfs_drop_group(struct config_item *parent,
 		struct config_item *item);
+void trace_usb_configfs_link_group(struct config_item *dest,
+		struct config_item *src);
+void trace_usb_configfs_unlink_group(struct config_item *dest,
+		struct config_item *src);
 #else
 #define trace_usb_configfs_make_group(parent, item) do {} while (0)
 #define trace_usb_configfs_drop_group(parent, item) do {} while (0)
+#define trace_usb_configfs_link_group(dest, src) do {} while (0)
+#define trace_usb_configfs_unlink_group(dest, src) do {} while (0)
 #endif
 
 struct usb_configuration *usb_get_config(struct usb_composite_dev *cdev,
-- 
2.7.4

