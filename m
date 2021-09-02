Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4183FEE81
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 15:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345248AbhIBNPb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 09:15:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46422 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345291AbhIBNPK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 09:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630588452; x=1662124452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J/U58zH4MFmVMWyCIPfQK8YfvB+molJsctEj3iXccC0=;
  b=azK08tvYZepItcRRCnU7x8UfgD8mJil7mDW1lG3Hx5lk9uvqdYkghPCl
   4NVB52Y4xU2Fgtd4S/TqwrtpXynvRADcZs6bUxLcTInX+V3KMYiS39krs
   RZJOn2ADIdBPhuIk5Fslnefa2gr0AXy21FNohqWUM4bLADtghtDVSid6C
   I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 06:13:13 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 06:13:13 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 06:13:12 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 5/5] usb: gadget: configfs: add some trace event
Date:   Thu, 2 Sep 2021 21:12:54 +0800
Message-ID: <1630588374-5169-6-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add UDC, cfg link/unlink and some attributes trace
to better trace gadget issues.

Suggested-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/Makefile         |   1 +
 drivers/usb/gadget/configfs.c       |  19 +++++
 drivers/usb/gadget/configfs_trace.c |  43 ++++++++++
 drivers/usb/gadget/configfs_trace.h | 164 ++++++++++++++++++++++++++++++++++++
 4 files changed, 227 insertions(+)
 create mode 100644 drivers/usb/gadget/configfs_trace.c
 create mode 100644 drivers/usb/gadget/configfs_trace.h

diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 130dad7..8e9c2b8 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -9,5 +9,6 @@ ccflags-y				+= -I$(srctree)/drivers/usb/gadget/udc
 obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
 libcomposite-y			:= usbstring.o config.o epautoconf.o
 libcomposite-y			+= composite.o functions.o configfs.o u_f.o
+libcomposite-y			+= configfs_trace.o
 
 obj-$(CONFIG_USB_GADGET)	+= udc/ function/ legacy/
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 6b02e74..d63fed2 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -9,6 +9,7 @@
 #include "configfs.h"
 #include "u_f.h"
 #include "u_os_desc.h"
+#include "configfs_trace.h"
 
 int check_user_usb_string(const char *name,
 		struct usb_gadget_strings *stringtab_dev)
@@ -138,6 +139,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 	if (ret)
 		return ret;
 
+	trace_gadget_dev_desc_bcdDevice_store(to_gadget_info(item));
 	to_gadget_info(item)->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
 	return len;
 }
@@ -156,6 +158,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		return ret;
 
 	to_gadget_info(item)->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	trace_gadget_dev_desc_bcdUSB_store(to_gadget_info(item));
 	return len;
 }
 
@@ -168,6 +171,7 @@ static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char *page)
 	mutex_lock(&gi->lock);
 	udc_name = gi->composite.gadget_driver.udc_name;
 	ret = sprintf(page, "%s\n", udc_name ?: "");
+	trace_gadget_dev_desc_UDC_show(gi);
 	mutex_unlock(&gi->lock);
 
 	return ret;
@@ -177,6 +181,7 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
+	trace_unregister_gadget(gi);
 	if (!gi->composite.gadget_driver.udc_name)
 		return -ENODEV;
 
@@ -204,6 +209,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	if (name[len - 1] == '\n')
 		name[len - 1] = '\0';
 
+	trace_gadget_dev_desc_UDC_store(gi);
+
 	mutex_lock(&gi->lock);
 
 	if (!strlen(name)) {
@@ -224,6 +231,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 		}
 	}
 	mutex_unlock(&gi->lock);
+
+	trace_gadget_dev_desc_UDC_store(gi);
 	return len;
 err:
 	kfree(name);
@@ -236,6 +245,7 @@ static ssize_t gadget_dev_desc_max_speed_show(struct config_item *item,
 {
 	enum usb_device_speed speed = to_gadget_info(item)->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_show(to_gadget_info(item));
 	return sprintf(page, "%s\n", usb_speed_string(speed));
 }
 
@@ -265,6 +275,8 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 
 	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_store(gi);
+
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -396,6 +408,7 @@ static int config_usb_cfg_link(
 	list_add_tail(&cf->list, &cfg->func_list);
 	ret = 0;
 out:
+	trace_config_usb_cfg_link(gi);
 	mutex_unlock(&gi->lock);
 	return ret;
 }
@@ -428,10 +441,12 @@ static void config_usb_cfg_unlink(
 			list_del(&cf->list);
 			usb_put_function(cf->f);
 			kfree(cf);
+			trace_config_usb_cfg_unlink(gi);
 			mutex_unlock(&gi->lock);
 			return;
 		}
 	}
+	trace_config_usb_cfg_unlink(gi);
 	mutex_unlock(&gi->lock);
 	WARN(1, "Unable to locate function to unbind\n");
 }
@@ -446,6 +461,7 @@ static struct configfs_item_operations gadget_config_item_ops = {
 static ssize_t gadget_config_desc_MaxPower_show(struct config_item *item,
 		char *page)
 {
+	trace_gadget_config_desc_MaxPower_show(to_config_usb_cfg(item)->gi);
 	return sprintf(page, "%u\n", to_config_usb_cfg(item)->c.MaxPower);
 }
 
@@ -460,12 +476,14 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
 	to_config_usb_cfg(item)->c.MaxPower = val;
+	trace_gadget_config_desc_MaxPower_store(to_config_usb_cfg(item)->gi);
 	return len;
 }
 
 static ssize_t gadget_config_desc_bmAttributes_show(struct config_item *item,
 		char *page)
 {
+	trace_gadget_config_desc_bmAttributes_show(to_config_usb_cfg(item)->gi);
 	return sprintf(page, "0x%02x\n",
 		to_config_usb_cfg(item)->c.bmAttributes);
 }
@@ -484,6 +502,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
 	to_config_usb_cfg(item)->c.bmAttributes = val;
+	trace_gadget_config_desc_bmAttributes_store(to_config_usb_cfg(item)->gi);
 	return len;
 }
 
diff --git a/drivers/usb/gadget/configfs_trace.c b/drivers/usb/gadget/configfs_trace.c
new file mode 100644
index 0000000..a39454f
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/usb/composite.h>
+#include "configfs.h"
+
+#define MAX_CONFIGURAITON_STR_LEN	512
+
+static char *config_to_string(struct gadget_info *gi)
+{
+	struct usb_configuration *uc;
+	struct config_usb_cfg *cfg;
+	struct config_usb_function *cf;
+	static char cfg_str[MAX_CONFIGURAITON_STR_LEN];
+	size_t len = MAX_CONFIGURAITON_STR_LEN;
+	int n = 0;
+
+	cfg_str[0] = '\0';
+
+	list_for_each_entry(uc, &gi->cdev.configs, list) {
+		cfg = container_of(uc, struct config_usb_cfg, c);
+
+		n += scnprintf(cfg_str + n, len - n,
+			"group:%s,bConfigurationValue:%d,bmAttributes:%d,"
+			"MaxPower:%d,",
+			config_item_name(&cfg->group.cg_item),
+			uc->bConfigurationValue,
+			uc->bmAttributes,
+			uc->MaxPower);
+
+		n += scnprintf(cfg_str + n, len - n, "function:[");
+		list_for_each_entry(cf, &cfg->func_list, list)
+			n += scnprintf(cfg_str + n, len - n, "%s", cf->f->name);
+		n += scnprintf(cfg_str + n, len - n, "},");
+	}
+
+	return cfg_str;
+}
+
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
new file mode 100644
index 0000000..c7d4856
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM configfs_gadget
+
+#if !defined(__GADGET_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __GADGET_TRACE_H
+
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(log_gadget_info,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi),
+	TP_STRUCT__entry(
+		/* gadget_info */
+		__string(gi_group, config_item_name(&gi->group.cg_item))
+		__field(bool, unbind)
+
+		/* usb_composite_dev */
+		__field(u8, b_vendor_code)
+		__field(bool, suspended)
+		__field(bool, setup_pending)
+		__field(bool, os_desc_pending)
+		__field(unsigned, deactivations)
+		__field(int, delayed_status)
+		__field(__le16, bcdUSB)
+		__field(__le16, bcdDevice)
+		__string(config, gi->cdev.config)
+
+		/* usb_composite_driver */
+		__field(unsigned, max_speed)
+		__field(bool, needs_serial)
+
+		/* usb_gadget_driver */
+		__string(udc_name, gi->composite.gadget_driver.udc_name)
+	),
+	TP_fast_assign(
+		__assign_str(gi_group, config_item_name(&gi->group.cg_item));
+		__entry->unbind = gi->unbind;
+
+		__entry->b_vendor_code = gi->cdev.b_vendor_code;
+		__entry->suspended = gi->cdev.suspended;
+		__entry->setup_pending = gi->cdev.setup_pending;
+		__entry->os_desc_pending = gi->cdev.os_desc_pending;
+		__entry->deactivations = gi->cdev.deactivations;
+		__entry->delayed_status = gi->cdev.delayed_status;
+		__entry->bcdUSB = gi->cdev.desc.bcdUSB;
+		__entry->bcdDevice = gi->cdev.desc.bcdDevice;
+		__assign_str(config, config_to_string(gi));
+
+		__entry->max_speed = gi->composite.max_speed;
+		__entry->needs_serial = gi->composite.needs_serial;
+
+		__assign_str(udc_name, gi->composite.gadget_driver.udc_name);
+	),
+	TP_printk("gi_group:%s,unbind:%d,"
+		" - "
+		"b_vendor_code:%d,suspended:%d,setup_pending:%d,"
+		"os_desc_pending:%d,deactivations:%d,delayed_status:%d,"
+		"bcdUSB:%04x,bcdDevice:%04x,config:%s,"
+		" - "
+		"max_speed:%d,needs_serial:%d,"
+		" - "
+		"udc_name:%s",
+
+		__get_str(gi_group),
+		__entry->unbind,
+
+		__entry->b_vendor_code,
+		__entry->suspended,
+		__entry->setup_pending,
+		__entry->os_desc_pending,
+		__entry->deactivations,
+		__entry->delayed_status,
+		le16_to_cpu(__entry->bcdUSB),
+		le16_to_cpu(__entry->bcdDevice),
+		__get_str(config),
+
+		__entry->max_speed,
+		__entry->needs_serial,
+
+		__get_str(udc_name)
+		)
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
+#endif /* __GADGET_TRACE_H */
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

