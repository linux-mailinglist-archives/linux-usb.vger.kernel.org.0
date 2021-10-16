Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D70430341
	for <lists+linux-usb@lfdr.de>; Sat, 16 Oct 2021 17:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237389AbhJPPXp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Oct 2021 11:23:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47876 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237075AbhJPPXo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Oct 2021 11:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634397697; x=1665933697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W0A8biCH0qhZomNB4P07ihKR5dM4hw5rTLWfXwGA0Jg=;
  b=MMHDkGEdhGTnq539jeNzr+3H4Nh7/Tr2TMJYJIBDdNN+Q2+QHgQSK6Y0
   X0kc8cw/iWL6SYqXZ332KqRwV1XIwgx+AvBZY5YApD5HAejoSmRqunK6J
   qmo17btBRwBubWad4X869jphJ1BZKWNhYuty1W5AZvY/VTTIg29XYj1mC
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Oct 2021 08:21:36 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2021 08:21:36 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Sat, 16 Oct 2021 08:21:34 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v6] usb: gadget: add configfs trace events
Date:   Sat, 16 Oct 2021 23:21:29 +0800
Message-ID: <1634397689-2015-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

in case of USB Gadget functions configure through configfs from
a complicated user space program, when switch function from one to another,
if it failed, it is better to find out what action was done to configfs
from user space program.

this change add most trace events which enable/disable a function,
it including add/remove configuration, bind/unbind UDC,
and write/read some attributes.

Suggested-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix two issue Reported-by: kernel test robot <lkp@intel.com>
v3: do not move private structure to configfs.h
v4: add missing new file configfs_trace.h
v5: lost some change of v2, add it again
v6: fix comments from Greg Kroah-Hartman

 drivers/usb/gadget/configfs.c       |  45 +++++++--
 drivers/usb/gadget/configfs_trace.h | 191 ++++++++++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+), 9 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 477e72a..f30f98f 100644
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
@@ -97,6 +102,10 @@ struct gadget_config_name {
 	struct list_head list;
 };
 
+#define CONFIGFS_TRACE_STRING
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
+
 #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
 
 static int usb_string_copy(const char *s, char **s_copy)
@@ -204,6 +213,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 	if (ret)
 		return ret;
 
+	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
 	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
 	return len;
 }
@@ -222,6 +232,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		return ret;
 
 	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
 	return len;
 }
 
@@ -234,6 +245,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
 	mutex_lock(&gi->lock);
 	udc_name = gi->composite.gadget_driver.udc_name;
 	ret = sprintf(page, "%s\n", udc_name ?: "");
+	trace_gadget_dev_desc_UDC_show(gi);
 	mutex_unlock(&gi->lock);
 
 	return ret;
@@ -243,6 +255,7 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
+	trace_unregister_gadget(gi);
 	if (!gi->composite.gadget_driver.udc_name)
 		return -ENODEV;
 
@@ -270,6 +283,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	if (name[len - 1] == '\n')
 		name[len - 1] = '\0';
 
+	trace_gadget_dev_desc_UDC_store(gi);
+
 	mutex_lock(&gi->lock);
 
 	if (!strlen(name)) {
@@ -302,6 +317,7 @@ static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
 {
 	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
 	return sprintf(page, "%s\n", usb_speed_string(speed));
 }
 
@@ -331,6 +347,8 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 
 	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_store(gi);
+
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -413,8 +431,7 @@ static int config_usb_cfg_link(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -455,6 +472,7 @@ static int config_usb_cfg_link(
 	list_add_tail(&f->list, &cfg->func_list);
 	ret = 0;
 out:
+	trace_config_usb_cfg_link(gi);
 	mutex_unlock(&gi->lock);
 	return ret;
 }
@@ -464,8 +482,7 @@ static void config_usb_cfg_unlink(
 	struct config_item *usb_func_ci)
 {
 	struct config_usb_cfg *cfg = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_composite_dev *cdev = cfg->c.cdev;
-	struct gadget_info *gi = container_of(cdev, struct gadget_info, cdev);
+	struct gadget_info *gi = cfg_to_gadget_info(cfg);
 
 	struct config_group *group = to_config_group(usb_func_ci);
 	struct usb_function_instance *fi = container_of(group,
@@ -487,6 +504,7 @@ static void config_usb_cfg_unlink(
 		if (f->fi == fi) {
 			list_del(&f->list);
 			usb_put_function(f);
+			trace_config_usb_cfg_unlink(gi);
 			mutex_unlock(&gi->lock);
 			return;
 		}
@@ -505,12 +523,16 @@ static struct configfs_item_operations gadget_config_item_ops = {
 static ssize_t gadget_config_desc_MaxPower_show(struct config_item *item,
 		char *page)
 {
-	return sprintf(page, "%u\n", to_config_usb_cfg(item)->c.MaxPower);
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
+
+	trace_gadget_config_desc_MaxPower_show(cfg_to_gadget_info(cfg));
+	return sprintf(page, "%u\n", cfg->c.MaxPower);
 }
 
 static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
 	u16 val;
 	int ret;
 	ret = kstrtou16(page, 0, &val);
@@ -518,20 +540,24 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		return ret;
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
-	to_config_usb_cfg(item)->c.MaxPower = val;
+	cfg->c.MaxPower = val;
+	trace_gadget_config_desc_MaxPower_store(cfg_to_gadget_info(cfg));
 	return len;
 }
 
 static ssize_t gadget_config_desc_bmAttributes_show(struct config_item *item,
 		char *page)
 {
-	return sprintf(page, "0x%02x\n",
-		to_config_usb_cfg(item)->c.bmAttributes);
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
+
+	trace_gadget_config_desc_bmAttributes_show(cfg_to_gadget_info(cfg));
+	return sprintf(page, "0x%02x\n", cfg->c.bmAttributes);
 }
 
 static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 		const char *page, size_t len)
 {
+	struct config_usb_cfg *cfg = to_config_usb_cfg(item);
 	u8 val;
 	int ret;
 	ret = kstrtou8(page, 0, &val);
@@ -542,7 +568,8 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 	if (val & ~(USB_CONFIG_ATT_ONE | USB_CONFIG_ATT_SELFPOWER |
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
-	to_config_usb_cfg(item)->c.bmAttributes = val;
+	cfg->c.bmAttributes = val;
+	trace_gadget_config_desc_bmAttributes_store(cfg_to_gadget_info(cfg));
 	return len;
 }
 
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
new file mode 100644
index 0000000..890122e
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifdef CONFIGFS_TRACE_STRING
+#undef CONFIGFS_TRACE_STRING
+
+#define MAX_CONFIGURAITON_STR_LEN	512
+static __maybe_unused char *configfs_trace_string(struct gadget_info *gi)
+{
+	struct usb_configuration *uc;
+	struct config_usb_cfg *cfg;
+	struct usb_function *f;
+	static char trs[MAX_CONFIGURAITON_STR_LEN];
+	size_t len = MAX_CONFIGURAITON_STR_LEN - 1;
+	int n = 0;
+
+	list_for_each_entry(uc, &gi->cdev.configs, list) {
+		cfg = container_of(uc, struct config_usb_cfg, c);
+
+		n += scnprintf(trs + n, len - n,
+			"{%d %02x %d ",
+			uc->bConfigurationValue,
+			uc->bmAttributes,
+			uc->MaxPower);
+
+		list_for_each_entry(f, &cfg->func_list, list)
+			n += scnprintf(trs + n, len - n, "%s;", f->name);
+
+		list_for_each_entry(f, &cfg->c.functions, list)
+			n += scnprintf(trs + n, len - n, "%s;", f->name);
+
+		n += scnprintf(trs + n, len - n, "},");
+	}
+
+	return trs;
+}
+
+#endif /* CONFIGFS_TRACE_STRING */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM configfs_gadget
+
+#if !defined(__CONFIGFS_GADGET_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __CONFIGFS_GADGET_TRACE_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(log_gadget_info,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi),
+	TP_STRUCT__entry(
+		__string(gi_group, config_item_name(&gi->group.cg_item))
+		__field(bool, unbind)
+		__field(bool, use_os_desc)
+		__field(char, b_vendor_code)
+
+		__field(bool, suspended)
+		__field(bool, setup_pending)
+		__field(bool, os_desc_pending)
+		__field(unsigned, deactivations)
+		__field(int, delayed_status)
+		__field(u16, bcdUSB)
+		__field(u16, bcdDevice)
+		__string(config, configfs_trace_string(gi))
+
+		__field(unsigned, max_speed)
+		__field(bool, needs_serial)
+
+		__string(udc_name, gi->composite.gadget_driver.udc_name)
+	),
+	TP_fast_assign(
+		__assign_str(gi_group, config_item_name(&gi->group.cg_item));
+		__entry->unbind = gi->unbind;
+		__entry->use_os_desc = gi->use_os_desc;
+		__entry->b_vendor_code = gi->b_vendor_code;
+
+		__entry->suspended = gi->cdev.suspended;
+		__entry->setup_pending = gi->cdev.setup_pending;
+		__entry->os_desc_pending = gi->cdev.os_desc_pending;
+		__entry->deactivations = gi->cdev.deactivations;
+		__entry->delayed_status = gi->cdev.delayed_status;
+		__entry->bcdUSB = le16_to_cpu(gi->cdev.desc.bcdUSB);
+		__entry->bcdDevice = le16_to_cpu(gi->cdev.desc.bcdDevice);
+		__assign_str(config, configfs_trace_string(gi));
+
+		__entry->max_speed = gi->composite.max_speed;
+		__entry->needs_serial = gi->composite.needs_serial;
+
+		__assign_str(udc_name, gi->composite.gadget_driver.udc_name);
+	),
+	TP_printk("%s %d %d %d - %d %d %d %d %d %04x %04x %s - %d %d - %s",
+
+		__get_str(gi_group),
+		__entry->unbind,
+		__entry->use_os_desc,
+		__entry->b_vendor_code,
+
+		__entry->suspended,
+		__entry->setup_pending,
+		__entry->os_desc_pending,
+		__entry->deactivations,
+		__entry->delayed_status,
+		__entry->bcdUSB,
+		__entry->bcdDevice,
+		__get_str(config),
+
+		__entry->max_speed,
+		__entry->needs_serial,
+
+		__get_str(udc_name)
+	)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bcdDevice_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bcdUSB_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_show,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, unregister_gadget,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_UDC_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_show,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_max_speed_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, config_usb_cfg_link,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, config_usb_cfg_unlink,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_config_desc_MaxPower_show,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_config_desc_MaxPower_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_config_desc_bmAttributes_show,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_config_desc_bmAttributes_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+#endif /* __CONFIGFS_GADGET_TRACE_H */
+
+/* this part has to be here */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/usb/gadget
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE configfs_trace
+
+#include <trace/define_trace.h>
-- 
2.7.4

