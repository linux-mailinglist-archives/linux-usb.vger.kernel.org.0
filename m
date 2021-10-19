Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE98433707
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 15:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbhJSN3M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 09:29:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8771 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbhJSN3L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 09:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634650018; x=1666186018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBSqkX6++Tvdq+/9FdCWcfu1KmSCZ6q7ym6gCoox0s4=;
  b=a40ATfIWdY5waVtY4x7GuS69XdwGzeAN0xOS3VEenX5rL7Vv4zk9jC8D
   /nAf5wL8wVwwEYMiAPFZ9wf/PI0YTsmjyj2FIs02yrgJbCvP7LN2C0mgr
   z2GBeXV5zOzmDVil8ETktAp2r4f1pJ7K9awECyiXZsKYZ1ofbKeNIi6l6
   Y=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 06:26:58 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 06:26:58 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 06:26:57 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v12 4/4] usb: gadget: add configfs trace events
Date:   Tue, 19 Oct 2021 21:26:37 +0800
Message-ID: <1634649997-28745-5-git-send-email-quic_linyyuan@quicinc.com>
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

in case of USB Gadget functions configure through configfs from
a complicated user space program, when switch function from one to another,
if it failed, it is better to find out what action was done to configfs
from user space program.

this change add some trace events which enable/disable a function,
it including add/remove configuration, bind/unbind UDC,
and some attribute files write operation.

Suggested-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: fix two issue Reported-by: kernel test robot <lkp@intel.com>
v3: do not move private structure to configfs.h
v4: add missing new file configfs_trace.h
v5: lost some change of v2, add it again
v6: fix comments from Greg Kroah-Hartman
v7: three minor changes according to coding rules
v8: change two trace location
v9: fix when config is empty
v10: fix wrong api in v9
v11: split to 3 changes, remove read trace, change trace event print format
v12: allocate trace string array per gadget driver

 drivers/usb/gadget/configfs.c       |  17 ++++
 drivers/usb/gadget/configfs_trace.h | 168 ++++++++++++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 27aa569..6e7d1b1 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -29,6 +29,7 @@ int check_user_usb_string(const char *name,
 
 #define MAX_NAME_LEN	40
 #define MAX_USB_STRING_LANGS 2
+#define MAX_TRACE_STR_LEN	512
 
 static const struct usb_descriptor_header *otg_desc[2];
 
@@ -51,6 +52,9 @@ struct gadget_info {
 	char qw_sign[OS_STRING_QW_SIGN_LEN];
 	spinlock_t spinlock;
 	bool unbind;
+#ifdef CONFIG_TRACING
+	char trace_string[MAX_TRACE_STR_LEN];
+#endif
 };
 
 static inline struct gadget_info *to_gadget_info(struct config_item *item)
@@ -102,6 +106,10 @@ struct gadget_config_name {
 	struct list_head list;
 };
 
+#define CONFIGFS_TRACE_STRING
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
+
 #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
 
 static int usb_string_copy(const char *s, char **s_copy)
@@ -212,6 +220,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 
 	mutex_lock(&gi->lock);
 	gi->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
+	trace_gadget_dev_desc_bcdDevice_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 }
@@ -232,6 +241,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 
 	mutex_lock(&gi->lock);
 	gi->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	trace_gadget_dev_desc_bcdUSB_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 }
@@ -254,6 +264,7 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
+	trace_unregister_gadget(gi);
 	if (!gi->composite.gadget_driver.udc_name)
 		return -ENODEV;
 
@@ -300,6 +311,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 			goto err;
 		}
 	}
+	trace_gadget_dev_desc_UDC_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -342,6 +354,7 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 
 	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -465,6 +478,7 @@ static int config_usb_cfg_link(
 	list_add_tail(&f->list, &cfg->func_list);
 	ret = 0;
 out:
+	trace_config_usb_cfg_link(gi);
 	mutex_unlock(&gi->lock);
 	return ret;
 }
@@ -496,6 +510,7 @@ static void config_usb_cfg_unlink(
 		if (f->fi == fi) {
 			list_del(&f->list);
 			usb_put_function(f);
+			trace_config_usb_cfg_unlink(gi);
 			mutex_unlock(&gi->lock);
 			return;
 		}
@@ -533,6 +548,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 		return -ERANGE;
 	mutex_lock(&gi->lock);
 	cfg->c.MaxPower = val;
+	trace_gadget_config_desc_MaxPower_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 }
@@ -562,6 +578,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 		return -EINVAL;
 	mutex_lock(&gi->lock);
 	cfg->c.bmAttributes = val;
+	trace_gadget_config_desc_bmAttributes_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 }
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
new file mode 100644
index 0000000..d36c61f
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifdef CONFIGFS_TRACE_STRING
+#undef CONFIGFS_TRACE_STRING
+
+#ifdef CONFIG_TRACING
+static __maybe_unused char *configfs_trace_string(struct gadget_info *gi)
+{
+	struct usb_configuration *uc;
+	struct config_usb_cfg *cfg;
+	struct usb_function *f;
+	size_t len = sizeof(gi->trace_string) - 1;
+	int n = 0;
+
+	if (list_empty(&gi->cdev.configs)) {
+		strcat(gi->trace_string, "empty");
+		return gi->trace_string;
+	}
+
+	list_for_each_entry(uc, &gi->cdev.configs, list) {
+		cfg = container_of(uc, struct config_usb_cfg, c);
+
+		n += scnprintf(gi->trace_string + n, len - n,
+			"{%d %02x %d ",
+			uc->bConfigurationValue,
+			uc->bmAttributes,
+			uc->MaxPower);
+
+		list_for_each_entry(f, &cfg->func_list, list)
+			n += scnprintf(gi->trace_string + n,
+				len - n, "%s,", f->name);
+
+		list_for_each_entry(f, &cfg->c.functions, list)
+			n += scnprintf(gi->trace_string + n,
+				len - n, "%s,", f->name);
+
+		n += scnprintf(gi->trace_string + n, len - n, "};");
+	}
+
+	return gi->trace_string;
+}
+#endif /* CONFIG_TRACING */
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
+		__field(bool, suspended)
+		__field(bool, setup_pending)
+		__field(bool, os_desc_pending)
+		__field(unsigned int, deactivations)
+		__field(int, delayed_status)
+		__field(u16, bcdUSB)
+		__field(u16, bcdDevice)
+		__string(config, configfs_trace_string(gi))
+		__field(unsigned int, max_speed)
+		__field(bool, needs_serial)
+		__string(udc_name, gi->composite.gadget_driver.udc_name)
+	),
+	TP_fast_assign(
+		__assign_str(gi_group, config_item_name(&gi->group.cg_item));
+		__entry->unbind = gi->unbind;
+		__entry->use_os_desc = gi->use_os_desc;
+		__entry->b_vendor_code = gi->b_vendor_code;
+		__entry->suspended = gi->cdev.suspended;
+		__entry->setup_pending = gi->cdev.setup_pending;
+		__entry->os_desc_pending = gi->cdev.os_desc_pending;
+		__entry->deactivations = gi->cdev.deactivations;
+		__entry->delayed_status = gi->cdev.delayed_status;
+		__entry->bcdUSB = le16_to_cpu(gi->cdev.desc.bcdUSB);
+		__entry->bcdDevice = le16_to_cpu(gi->cdev.desc.bcdDevice);
+		__assign_str(config, configfs_trace_string(gi));
+		__entry->max_speed = gi->composite.max_speed;
+		__entry->needs_serial = gi->composite.needs_serial;
+		__assign_str(udc_name, gi->composite.gadget_driver.udc_name);
+	),
+	TP_printk("%s: %d %d %d %d %d %d %d %d %04x %04x %d %d %s - %s",
+		__get_str(gi_group),
+		__entry->unbind,
+		__entry->use_os_desc,
+		__entry->b_vendor_code,
+		__entry->suspended,
+		__entry->setup_pending,
+		__entry->os_desc_pending,
+		__entry->deactivations,
+		__entry->delayed_status,
+		__entry->bcdUSB,
+		__entry->bcdDevice,
+		__entry->max_speed,
+		__entry->needs_serial,
+		__get_str(config),
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
+DEFINE_EVENT(log_gadget_info, gadget_config_desc_MaxPower_store,
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

