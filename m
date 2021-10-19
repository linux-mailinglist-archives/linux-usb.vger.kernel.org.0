Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D1D432FFF
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 09:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbhJSHrE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 03:47:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:21279 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhJSHrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 03:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634629490; x=1666165490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GcNygGN0y09sTshFjGVnKyxrX8DoGcs1HSwO0DdjX08=;
  b=gZBmVdp1B3ZTSFKqxnbrvMQe5Fyn+tKrQt9TZgq9VAB0l8zfKOI0f5/z
   v8hjZYqAs4ij3UrFN6f33KuVOdjzmO+Xr34hZPBFZ0GM938oFIwdQH499
   22TFyKgtWPoYv06SWPiTTIrju0lF8Td94k6/tZsUBdJMafdAB3Yd7j5hR
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2021 00:44:50 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 00:44:50 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 19 Oct 2021 00:44:48 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v11 3/3] usb: gadget: add configfs trace events
Date:   Tue, 19 Oct 2021 15:44:32 +0800
Message-ID: <1634629473-15411-4-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634629473-15411-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1634629473-15411-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

 drivers/usb/gadget/configfs.c       |  13 +++
 drivers/usb/gadget/configfs_trace.h | 166 ++++++++++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 36c611d..9b063bb 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -102,6 +102,10 @@ struct gadget_config_name {
 	struct list_head list;
 };
 
+#define CONFIGFS_TRACE_STRING
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
+
 #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
 
 static int usb_string_copy(const char *s, char **s_copy)
@@ -210,6 +214,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 		return ret;
 
 	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
+	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
 	return len;
 }
 
@@ -227,6 +232,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		return ret;
 
 	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
 	return len;
 }
 
@@ -248,6 +254,7 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
+	trace_unregister_gadget(gi);
 	if (!gi->composite.gadget_driver.udc_name)
 		return -ENODEV;
 
@@ -294,6 +301,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 			goto err;
 		}
 	}
+	trace_gadget_dev_desc_UDC_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -336,6 +344,7 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 
 	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -459,6 +468,7 @@ static int config_usb_cfg_link(
 	list_add_tail(&f->list, &cfg->func_list);
 	ret = 0;
 out:
+	trace_config_usb_cfg_link(gi);
 	mutex_unlock(&gi->lock);
 	return ret;
 }
@@ -490,6 +500,7 @@ static void config_usb_cfg_unlink(
 		if (f->fi == fi) {
 			list_del(&f->list);
 			usb_put_function(f);
+			trace_config_usb_cfg_unlink(gi);
 			mutex_unlock(&gi->lock);
 			return;
 		}
@@ -525,6 +536,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
 	cfg->c.MaxPower = val;
+	trace_gadget_config_desc_MaxPower_store(cfg_to_gadget_info(cfg));
 	return len;
 }
 
@@ -551,6 +563,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
 	cfg->c.bmAttributes = val;
+	trace_gadget_config_desc_bmAttributes_store(cfg_to_gadget_info(cfg));
 	return len;
 }
 
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
new file mode 100644
index 0000000..74283f0
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+	if (list_empty(&gi->cdev.configs)) {
+		strcat(trs, "empty");
+		return trs;
+	}
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
+			n += scnprintf(trs + n, len - n, "%s,", f->name);
+
+		list_for_each_entry(f, &cfg->c.functions, list)
+			n += scnprintf(trs + n, len - n, "%s,", f->name);
+
+		n += scnprintf(trs + n, len - n, "};");
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

