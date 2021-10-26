Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E03343AC3C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 08:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhJZGY1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 02:24:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:50034 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbhJZGY1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 02:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635229324; x=1666765324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/F9aPIpBEXezzvPVxVGWnfttvuljZt2pScmZqMfWVV4=;
  b=GkMZfhR0yDU9hYIWlo2l1uX0blQS8VQLiolNke31USWmTKyasT1S26gD
   YDTZpQ8/fHT6NFD5s2IE18ECp46Mq1Oypk4OPWbXBAvByrHQusR3Kclou
   Fm2DNefvsSp0eKenkL7BFOTdPP/l2NqgABTXOYqIR2YuM8K4uW+s0gJmD
   o=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 23:22:04 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2021 23:22:04 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 25 Oct 2021 23:22:01 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <jackp@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v13 2/2] usb: gadget: configfs: add trace events
Date:   Tue, 26 Oct 2021 14:21:49 +0800
Message-ID: <1635229309-2821-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1635229309-2821-1-git-send-email-quic_linyyuan@quicinc.com>
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
it including add/remove configuration function, bind/unbind UDC,
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
v11: split to three changes, minor change to trace event print format
v12: use mutex lock gi->lock to make sure data safe for trace
v13: rebase; add more trace entries; define three event class to remove lock concern

 drivers/usb/gadget/configfs.c       |  23 +++
 drivers/usb/gadget/configfs_trace.h | 273 ++++++++++++++++++++++++++++++++++++
 2 files changed, 296 insertions(+)
 create mode 100644 drivers/usb/gadget/configfs_trace.h

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 97ed9d3..a755fc4 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -102,6 +102,9 @@ struct gadget_config_name {
 	struct list_head list;
 };
 
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
+
 #define USB_MAX_STRING_WITH_NULL_LEN	(USB_MAX_STRING_LEN+1)
 
 static int usb_string_copy(const char *s, char **s_copy)
@@ -157,6 +160,7 @@ static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
 	if (ret)					\
 		return ret;				\
 	gi->cdev.desc._name = val;			\
+	trace_gadget_dev_desc_##_name##_store(gi);	\
 	return len;					\
 }
 
@@ -171,6 +175,7 @@ static ssize_t gadget_dev_desc_##_name##_store(struct config_item *item, \
 	if (ret)					\
 		return ret;				\
 	gi->cdev.desc._name = cpu_to_le16p(&val);	\
+	trace_gadget_dev_desc_##_name##_store(gi);	\
 	return len;					\
 }
 
@@ -215,6 +220,7 @@ static ssize_t gadget_dev_desc_bcdDevice_store(struct config_item *item,
 		return ret;
 
 	gi->cdev.desc.bcdDevice = cpu_to_le16(bcdDevice);
+	trace_gadget_dev_desc_bcdDevice_store(gi);
 	return len;
 }
 
@@ -233,6 +239,7 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct config_item *item,
 		return ret;
 
 	gi->cdev.desc.bcdUSB = cpu_to_le16(bcdUSB);
+	trace_gadget_dev_desc_bcdUSB_store(gi);
 	return len;
 }
 
@@ -254,6 +261,7 @@ static int unregister_gadget(struct gadget_info *gi)
 {
 	int ret;
 
+	trace_unregister_gadget(gi);
 	if (!gi->composite.gadget_driver.udc_name)
 		return -ENODEV;
 
@@ -300,6 +308,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 			goto err;
 		}
 	}
+	trace_gadget_dev_desc_UDC_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -343,6 +352,7 @@ static ssize_t gadget_dev_desc_max_speed_store(struct config_item *item,
 
 	gi->composite.gadget_driver.max_speed = gi->composite.max_speed;
 
+	trace_gadget_dev_desc_max_speed_store(gi);
 	mutex_unlock(&gi->lock);
 	return len;
 err:
@@ -462,6 +472,7 @@ static int config_usb_cfg_link(
 		goto out;
 	}
 
+	trace_config_usb_cfg_link(cfg, f);
 	/* stash the function until we bind it to the gadget */
 	list_add_tail(&f->list, &cfg->func_list);
 	ret = 0;
@@ -495,6 +506,7 @@ static void config_usb_cfg_unlink(
 
 	list_for_each_entry(f, &cfg->func_list, list) {
 		if (f->fi == fi) {
+			trace_config_usb_cfg_unlink(cfg, f);
 			list_del(&f->list);
 			usb_put_function(f);
 			mutex_unlock(&gi->lock);
@@ -532,6 +544,7 @@ static ssize_t gadget_config_desc_MaxPower_store(struct config_item *item,
 	if (DIV_ROUND_UP(val, 8) > 0xff)
 		return -ERANGE;
 	cfg->c.MaxPower = val;
+	trace_gadget_config_desc_MaxPower_store(cfg);
 	return len;
 }
 
@@ -558,6 +571,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 				USB_CONFIG_ATT_WAKEUP))
 		return -EINVAL;
 	cfg->c.bmAttributes = val;
+	trace_gadget_config_desc_bmAttributes_store(cfg);
 	return len;
 }
 
@@ -818,6 +832,7 @@ static ssize_t os_desc_use_store(struct config_item *item, const char *page,
 	ret = strtobool(page, &use);
 	if (!ret) {
 		gi->use_os_desc = use;
+		trace_os_desc_use_store(gi);
 		ret = len;
 	}
 	mutex_unlock(&gi->lock);
@@ -842,6 +857,7 @@ static ssize_t os_desc_b_vendor_code_store(struct config_item *item,
 	ret = kstrtou8(page, 0, &b_vendor_code);
 	if (!ret) {
 		gi->b_vendor_code = b_vendor_code;
+		trace_os_desc_b_vendor_code_store(gi);
 		ret = len;
 	}
 	mutex_unlock(&gi->lock);
@@ -1432,6 +1448,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 	}
 
 	usb_ep_autoconfig_reset(cdev->gadget);
+	trace_configfs_composite_bind(gi);
 	return 0;
 
 err_purge_funcs:
@@ -1464,6 +1481,7 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
 	cdev->gadget = NULL;
 	set_gadget_data(gadget, NULL);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
+	trace_configfs_composite_unbind(gi);
 }
 
 static int configfs_composite_setup(struct usb_gadget *gadget,
@@ -1487,6 +1505,7 @@ static int configfs_composite_setup(struct usb_gadget *gadget,
 	}
 
 	ret = composite_setup(gadget, ctrl);
+	trace_configfs_composite_setup(gi);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 	return ret;
 }
@@ -1510,6 +1529,7 @@ static void configfs_composite_disconnect(struct usb_gadget *gadget)
 	}
 
 	composite_disconnect(gadget);
+	trace_configfs_composite_disconnect(gi);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
 
@@ -1532,6 +1552,7 @@ static void configfs_composite_reset(struct usb_gadget *gadget)
 	}
 
 	composite_reset(gadget);
+	trace_configfs_composite_reset(gi);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
 
@@ -1554,6 +1575,7 @@ static void configfs_composite_suspend(struct usb_gadget *gadget)
 	}
 
 	composite_suspend(gadget);
+	trace_configfs_composite_suspend(gi);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
 
@@ -1576,6 +1598,7 @@ static void configfs_composite_resume(struct usb_gadget *gadget)
 	}
 
 	composite_resume(gadget);
+	trace_configfs_composite_resume(gi);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }
 
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
new file mode 100644
index 0000000..5022a57
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,273 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
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
+		__array(char, qw_sign, OS_STRING_QW_SIGN_LEN)
+		__field(bool, suspended)
+		__field(bool, setup_pending)
+		__field(bool, os_desc_pending)
+		__field(unsigned int, deactivations)
+		__field(int, delayed_status)
+		__field(u16, bcdUSB)
+		__field(u8, bDeviceClass)
+		__field(u8, bDeviceSubClass)
+		__field(u8, bDeviceProtocol)
+		__field(u8, bMaxPacketSize0)
+		__field(u16, idVendor)
+		__field(u16, idProduct)
+		__field(u16, bcdDevice)
+		__field(unsigned int, max_speed)
+		__field(bool, needs_serial)
+		__string(udc_name, gi->composite.gadget_driver.udc_name)
+	),
+	TP_fast_assign(
+		__assign_str(gi_group, config_item_name(&gi->group.cg_item));
+		__entry->unbind = gi->unbind;
+		__entry->use_os_desc = gi->use_os_desc;
+		__entry->b_vendor_code = gi->b_vendor_code;
+		memcpy(__entry->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
+		__entry->suspended = gi->cdev.suspended;
+		__entry->setup_pending = gi->cdev.setup_pending;
+		__entry->os_desc_pending = gi->cdev.os_desc_pending;
+		__entry->deactivations = gi->cdev.deactivations;
+		__entry->delayed_status = gi->cdev.delayed_status;
+		__entry->bcdUSB = le16_to_cpu(gi->cdev.desc.bcdUSB);
+		__entry->bDeviceClass = gi->cdev.desc.bDeviceClass;
+		__entry->bDeviceSubClass = gi->cdev.desc.bDeviceSubClass;
+		__entry->bDeviceProtocol = gi->cdev.desc.bDeviceProtocol;
+		__entry->bMaxPacketSize0 = gi->cdev.desc.bMaxPacketSize0;
+		__entry->idVendor = le16_to_cpu(gi->cdev.desc.idVendor);
+		__entry->idProduct = le16_to_cpu(gi->cdev.desc.idProduct);
+		__entry->bcdDevice = le16_to_cpu(gi->cdev.desc.bcdDevice);
+		__entry->max_speed = gi->composite.max_speed;
+		__entry->needs_serial = gi->composite.needs_serial;
+		__assign_str(udc_name, gi->composite.gadget_driver.udc_name);
+	),
+	TP_printk("%s: %s: %d %d %d %d %d %d %u %d %04x %02x %02x %02x %02x %04x %04x %04x %d %d %s",
+		__get_str(gi_group),
+		__get_str(udc_name),
+		__entry->unbind,
+		__entry->use_os_desc,
+		__entry->b_vendor_code,
+		__entry->suspended,
+		__entry->setup_pending,
+		__entry->os_desc_pending,
+		__entry->deactivations,
+		__entry->delayed_status,
+		__entry->bcdUSB,
+		__entry->bDeviceClass,
+		__entry->bDeviceSubClass,
+		__entry->bDeviceProtocol,
+		__entry->bMaxPacketSize0,
+		__entry->idVendor,
+		__entry->idProduct,
+		__entry->bcdDevice,
+		__entry->max_speed,
+		__entry->needs_serial,
+		__print_hex_str(__entry->qw_sign, OS_STRING_QW_SIGN_LEN)
+	)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bDeviceClass_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bDeviceSubClass_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bDeviceProtocol_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_bMaxPacketSize0_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_idVendor_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, gadget_dev_desc_idProduct_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
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
+DEFINE_EVENT(log_gadget_info, os_desc_use_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, os_desc_b_vendor_code_store,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_bind,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_unbind,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_setup,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_disconnect,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_reset,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_suspend,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DEFINE_EVENT(log_gadget_info, configfs_composite_resume,
+	TP_PROTO(struct gadget_info *gi),
+	TP_ARGS(gi)
+);
+
+DECLARE_EVENT_CLASS(log_config,
+	TP_PROTO(struct config_usb_cfg *cfg),
+	TP_ARGS(cfg),
+	TP_STRUCT__entry(
+		__string(gi_group, config_item_name(&cfg_to_gadget_info(cfg)->group.cg_item))
+		__string(label, cfg->c.label)
+		__field(u8, bConfigurationValue)
+		__field(u8, bmAttributes)
+		__field(u16, MaxPower)
+	),
+	TP_fast_assign(
+		__assign_str(gi_group, config_item_name(&cfg_to_gadget_info(cfg)->group.cg_item));
+		__assign_str(label, cfg->c.label);
+		__entry->bConfigurationValue = cfg->c.bConfigurationValue;
+		__entry->bmAttributes = cfg->c.bmAttributes;
+		__entry->MaxPower = cfg->c.MaxPower;
+	),
+	TP_printk("%s: %s: %u %u %u",
+		__get_str(gi_group),
+		__get_str(label),
+		__entry->bConfigurationValue,
+		__entry->bmAttributes,
+		__entry->MaxPower
+	)
+);
+
+DEFINE_EVENT(log_config, gadget_config_desc_MaxPower_store,
+	TP_PROTO(struct config_usb_cfg *cfg),
+	TP_ARGS(cfg)
+);
+
+DEFINE_EVENT(log_config, gadget_config_desc_bmAttributes_store,
+	TP_PROTO(struct config_usb_cfg *cfg),
+	TP_ARGS(cfg)
+);
+
+DECLARE_EVENT_CLASS(log_config_function,
+	TP_PROTO(struct config_usb_cfg *cfg, struct usb_function *f),
+	TP_ARGS(cfg, f),
+	TP_STRUCT__entry(
+		__string(gi_group, config_item_name(&cfg_to_gadget_info(cfg)->group.cg_item))
+		__string(label, cfg->c.label)
+		__string(name, f->name)
+		__field(u8, bConfigurationValue)
+		__field(u8, bmAttributes)
+		__field(u16, MaxPower)
+	),
+	TP_fast_assign(
+		__assign_str(gi_group, config_item_name(&cfg_to_gadget_info(cfg)->group.cg_item));
+		__assign_str(label, cfg->c.label);
+		__assign_str(name, f->name);
+		__entry->bConfigurationValue = cfg->c.bConfigurationValue;
+		__entry->bmAttributes = cfg->c.bmAttributes;
+		__entry->MaxPower = cfg->c.MaxPower;
+	),
+	TP_printk("%s: %s: %u %u %u %s",
+		__get_str(gi_group),
+		__get_str(label),
+		__entry->bConfigurationValue,
+		__entry->bmAttributes,
+		__entry->MaxPower,
+		__get_str(name)
+	)
+);
+
+DEFINE_EVENT(log_config_function, config_usb_cfg_link,
+	TP_PROTO(struct config_usb_cfg *cfg, struct usb_function *f),
+	TP_ARGS(cfg, f)
+);
+
+DEFINE_EVENT(log_config_function, config_usb_cfg_unlink,
+	TP_PROTO(struct config_usb_cfg *cfg, struct usb_function *f),
+	TP_ARGS(cfg, f)
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

