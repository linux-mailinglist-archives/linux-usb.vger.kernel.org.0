Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 386E34F2167
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 06:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbiDECuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 22:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiDECuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 22:50:12 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFFBE0AE3
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 19:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649125637; x=1680661637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=psfu01lJ1JBERxTudeyZgjoY+ClMj3B8i5GvLU7ahC0=;
  b=VLjHeDz/w/FtBwBEM3kVPa68bCvxeKk2THfSv/mvF6nq9tqpAgwUbb1K
   fg2K4YjuwlHAa/VQRqJOSnxjWjV7m4sm3JnRvXK0LVEjQYyVybjK46K08
   XZgUyDTabiuOr24rPYEFb/lj+tHH6OCQKNntQINlviyVZLKbFtxGkp/Zy
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Apr 2022 19:27:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 19:27:17 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 19:27:17 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 19:27:15 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 3/5] usb: gadget: add trace event of configfs group operation
Date:   Tue, 5 Apr 2022 10:27:03 +0800
Message-ID: <1649125625-7003-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649125625-7003-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649125625-7003-1-git-send-email-quic_linyyuan@quicinc.com>
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

Add API trace_usb_configfs_make_group() and trace_usb_configfs_drop_group()
to trace user create groups like gadget/function/configuration,
it also trace group create in a specific function.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: add API in trace.c
v4: fix memory leak
v5: change return value which report by kernel test robot <lkp@intel.com> and
    Dan Carpenter <dan.carpenter@oracle.com>

 drivers/usb/gadget/configfs.c                | 11 ++++
 drivers/usb/gadget/function/f_mass_storage.c |  4 ++
 drivers/usb/gadget/function/uvc_configfs.c   | 12 ++++
 drivers/usb/gadget/trace.c                   | 83 ++++++++++++++++++++++++++++
 include/linux/usb/composite.h                |  9 +++
 include/linux/usb/gadget_configfs.h          |  2 +
 6 files changed, 121 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index b2beeda..a0599fb 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -621,6 +621,8 @@ static struct config_group *function_make(
 
 	gi = container_of(group, struct gadget_info, functions_group);
 
+	trace_usb_configfs_make_group(&group->cg_item, &fi->group.cg_item);
+
 	mutex_lock(&gi->lock);
 	list_add_tail(&fi->cfs_list, &gi->available_func);
 	mutex_unlock(&gi->lock);
@@ -634,6 +636,8 @@ static void function_drop(
 	struct usb_function_instance *fi = to_usb_function_instance(item);
 	struct gadget_info *gi;
 
+	trace_usb_configfs_drop_group(&group->cg_item, item);
+
 	gi = container_of(group, struct gadget_info, functions_group);
 
 	mutex_lock(&gi->lock);
@@ -729,6 +733,7 @@ static struct config_group *config_desc_make(
 	if (ret)
 		goto err;
 
+	trace_usb_configfs_make_group(&group->cg_item, &cfg->group.cg_item);
 	return &cfg->group;
 err:
 	kfree(cfg->c.label);
@@ -740,6 +745,7 @@ static void config_desc_drop(
 		struct config_group *group,
 		struct config_item *item)
 {
+	trace_usb_configfs_drop_group(&group->cg_item, item);
 	config_item_put(item);
 }
 
@@ -1083,6 +1089,7 @@ static struct config_item *ext_prop_make(
 	ext_prop_type->ct_owner = desc->owner;
 
 	config_item_init_type_name(&ext_prop->item, name, ext_prop_type);
+	trace_usb_configfs_make_group(&group->cg_item, &ext_prop->item);
 
 	ext_prop->name = kstrdup(name, GFP_KERNEL);
 	if (!ext_prop->name) {
@@ -1107,6 +1114,8 @@ static void ext_prop_drop(struct config_group *group, struct config_item *item)
 	struct usb_os_desc_ext_prop *ext_prop = to_usb_os_desc_ext_prop(item);
 	struct usb_os_desc *desc = to_usb_os_desc(&group->cg_item);
 
+	trace_usb_configfs_drop_group(&group->cg_item, item);
+
 	if (desc->opts_mutex)
 		mutex_lock(desc->opts_mutex);
 	list_del(&ext_prop->entry);
@@ -1626,6 +1635,7 @@ static struct config_group *gadgets_make(
 	if (!gi->composite.gadget_driver.function)
 		goto err;
 
+	trace_usb_configfs_make_group(&group->cg_item, &gi->group.cg_item);
 	return &gi->group;
 err:
 	kfree(gi);
@@ -1634,6 +1644,7 @@ static struct config_group *gadgets_make(
 
 static void gadgets_drop(struct config_group *group, struct config_item *item)
 {
+	trace_usb_configfs_drop_group(&group->cg_item, item);
 	config_item_put(item);
 }
 
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 3a77bca..a96eca9 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -3289,6 +3289,8 @@ static struct config_group *fsg_lun_make(struct config_group *group,
 
 	config_group_init_type_name(&opts->group, name, &fsg_lun_type);
 
+	trace_usb_configfs_make_group(&group->cg_item, &opts->group.cg_item);
+
 	return &opts->group;
 out:
 	mutex_unlock(&fsg_opts->lock);
@@ -3300,6 +3302,8 @@ static void fsg_lun_drop(struct config_group *group, struct config_item *item)
 	struct fsg_lun_opts *lun_opts;
 	struct fsg_opts *fsg_opts;
 
+	trace_usb_configfs_drop_group(&group->cg_item, item);
+
 	lun_opts = to_fsg_lun_opts(item);
 	fsg_opts = to_fsg_opts(&group->cg_item);
 
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 77d6403..cc0f2eb 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -236,6 +236,8 @@ static struct config_item *uvcg_control_header_make(struct config_group *group,
 
 	config_item_init_type_name(&h->item, name, &uvcg_control_header_type);
 
+	trace_usb_configfs_make_group(&group->cg_item, &h->item);
+
 	return &h->item;
 }
 
@@ -1039,6 +1041,8 @@ static struct config_item
 
 	config_item_init_type_name(&h->item, name, &uvcg_streaming_header_type);
 
+	trace_usb_configfs_make_group(&group->cg_item, &h->item);
+
 	return &h->item;
 }
 
@@ -1380,6 +1384,8 @@ static struct config_item *uvcg_frame_make(struct config_group *group,
 
 	config_item_init_type_name(&h->item, name, &uvcg_frame_type);
 
+	trace_usb_configfs_make_group(&group->cg_item, &h->item);
+
 	return &h->item;
 }
 
@@ -1389,6 +1395,8 @@ static void uvcg_frame_drop(struct config_group *group, struct config_item *item
 	struct f_uvc_opts *opts;
 	struct config_item *opts_item;
 
+	trace_usb_configfs_drop_group(&group->cg_item, item);
+
 	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1649,6 +1657,8 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_uncompressed_type);
 
+	trace_usb_configfs_make_group(&group->cg_item, &h->fmt.group.cg_item);
+
 	return &h->fmt.group;
 }
 
@@ -1835,6 +1845,8 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_mjpeg_type);
 
+	trace_usb_configfs_make_group(&group->cg_item, &h->fmt.group.cg_item);
+
 	return &h->fmt.group;
 }
 
diff --git a/drivers/usb/gadget/trace.c b/drivers/usb/gadget/trace.c
index 8b4b1db..8f8b6b7 100644
--- a/drivers/usb/gadget/trace.c
+++ b/drivers/usb/gadget/trace.c
@@ -6,3 +6,86 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
+#include <linux/configfs.h>
+#include <linux/usb/composite.h>
+
+extern const struct config_item_type gadgets_type;
+
+#ifdef CONFIG_TRACEPOINTS
+#define GROUP_LEN	128
+static int gadget_configfs_group(char *group, struct config_item *item)
+{
+	struct config_item *parent;
+	char *tmpgroup;
+
+	if (!item)
+		return -EINVAL;
+
+	tmpgroup = kzalloc(GROUP_LEN, GFP_KERNEL);
+	if (!tmpgroup)
+		return -ENOMEM;
+
+	for (parent = item->ci_parent; parent;
+			item = parent,parent = item->ci_parent) {
+		if (item->ci_type == &gadgets_type) {
+			kfree(tmpgroup);
+			return 0;
+		}
+
+		if (tmpgroup[0] == '\0')
+			snprintf(group, GROUP_LEN, "%s",
+					config_item_name(item));
+		else
+			snprintf(group, GROUP_LEN, "%s/%s",
+					config_item_name(item), tmpgroup);
+
+		strcpy(tmpgroup, group);
+	}
+
+	kfree(tmpgroup);
+	return -EINVAL;
+}
+
+static void trace_usb_configfs_make_drop_group(struct config_item *parent,
+		struct config_item *item, char *make_drop)
+{
+	char *group, *parent_group;
+	int ret;
+
+	group = kzalloc(2 * GROUP_LEN, GFP_KERNEL);
+	if (!group)
+		return;
+
+	parent_group = group + GROUP_LEN;
+	ret = gadget_configfs_group(parent_group, parent);
+	if (ret) {
+		kfree(group);
+		return;
+	}
+
+	if (parent_group[0] == '\0')
+		snprintf(group, GROUP_LEN, "%s %s", make_drop,
+				config_item_name(item));
+	else
+		snprintf(group, GROUP_LEN, "%s %s/%s", make_drop, parent_group,
+				config_item_name(item));
+
+	trace_gadget_configfs(group);
+
+	kfree(group);
+}
+
+void trace_usb_configfs_make_group(struct config_item *parent,
+		struct config_item *item)
+{
+	trace_usb_configfs_make_drop_group(parent, item, "mkdir");
+}
+EXPORT_SYMBOL(trace_usb_configfs_make_group);
+
+void trace_usb_configfs_drop_group(struct config_item *parent,
+		struct config_item *item)
+{
+	trace_usb_configfs_make_drop_group(parent, item, "rmdir");
+}
+EXPORT_SYMBOL(trace_usb_configfs_drop_group);
+#endif
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 9d27622..e904527 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -603,6 +603,15 @@ void usb_put_function_instance(struct usb_function_instance *fi);
 void usb_put_function(struct usb_function *f);
 struct usb_function_instance *usb_get_function_instance(const char *name);
 struct usb_function *usb_get_function(struct usb_function_instance *fi);
+#ifdef CONFIG_TRACEPOINTS
+void trace_usb_configfs_make_group(struct config_item *parent,
+		struct config_item *item);
+void trace_usb_configfs_drop_group(struct config_item *parent,
+		struct config_item *item);
+#else
+#define trace_usb_configfs_make_group(parent, item) do {} while(0)
+#define trace_usb_configfs_drop_group(parent, item) do {} while(0)
+#endif
 
 struct usb_configuration *usb_get_config(struct usb_composite_dev *cdev,
 		int val);
diff --git a/include/linux/usb/gadget_configfs.h b/include/linux/usb/gadget_configfs.h
index d61aebd..a89f177 100644
--- a/include/linux/usb/gadget_configfs.h
+++ b/include/linux/usb/gadget_configfs.h
@@ -63,6 +63,7 @@ static struct config_item_type struct_in##_langid_type = {		\
 		goto err;						\
 	config_group_init_type_name(&new->group, name,			\
 			&struct_in##_langid_type);			\
+	trace_usb_configfs_make_group(&group->cg_item, &new->group.cg_item); \
 									\
 	gi = container_of(group, struct struct_member, strings_group);	\
 	ret = -EEXIST;							\
@@ -86,6 +87,7 @@ static void struct_in##_strings_drop(					\
 		struct config_group *group,				\
 		struct config_item *item)				\
 {									\
+	trace_usb_configfs_drop_group(&group->cg_item, item);		\
 	config_item_put(item);						\
 }									\
 									\
-- 
2.7.4

