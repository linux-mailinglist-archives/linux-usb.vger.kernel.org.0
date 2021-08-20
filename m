Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466293F25A0
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 06:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhHTEQ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 00:16:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48492 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhHTEQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Aug 2021 00:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629432948; x=1660968948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FNH7AK4EGYWfnuJ4BDn4ARCJxqO5ow6yPVyw0BJzilw=;
  b=HgDERKrIZg7aDoRiYyRpoWCKKpVZZ0x0mHRLT3xD8tMLTllECtZd6wK1
   LmwGEJGBaCMdXUu/VgxONKw8GW8qRsi4kykhQP6WrbfxSjfO1Y7YIPe3d
   prHKZyvoWNQcHb2cSW01v0KN8PD/edJnOVA7mZymO0LfjQwe4vNDI4MBS
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 19 Aug 2021 21:15:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 21:15:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 21:15:47 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7;
 Thu, 19 Aug 2021 21:15:45 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH V2] usb: gadget: configfs: add three trace entries
Date:   Fri, 20 Aug 2021 12:15:41 +0800
Message-ID: <1629432941-23737-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03e.na.qualcomm.com (10.85.0.48) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add UDC/link/unlink trace entry to track important event.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/Makefile         |  1 +
 drivers/usb/gadget/configfs.c       | 11 ++++++
 drivers/usb/gadget/configfs_trace.c |  7 ++++
 drivers/usb/gadget/configfs_trace.h | 73 +++++++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)
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
index 477e72a..4024f9b 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -9,6 +9,7 @@
 #include "configfs.h"
 #include "u_f.h"
 #include "u_os_desc.h"
+#include "configfs_trace.h"
 
 int check_user_usb_string(const char *name,
 		struct usb_gadget_strings *stringtab_dev)
@@ -270,6 +271,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
 	if (name[len - 1] == '\n')
 		name[len - 1] = '\0';
 
+	trace_gadget_dev_desc_UDC_store(config_item_name(item), name);
+
 	mutex_lock(&gi->lock);
 
 	if (!strlen(name)) {
@@ -423,6 +426,10 @@ static int config_usb_cfg_link(
 	struct usb_function *f;
 	int ret;
 
+	trace_config_usb_cfg_link(config_item_name(&gi->group.cg_item),
+				config_item_name(usb_cfg_ci),
+				config_item_name(usb_func_ci));
+
 	mutex_lock(&gi->lock);
 	/*
 	 * Make sure this function is from within our _this_ gadget and not
@@ -472,6 +479,10 @@ static void config_usb_cfg_unlink(
 			struct usb_function_instance, group);
 	struct usb_function *f;
 
+	trace_config_usb_cfg_unlink(config_item_name(&gi->group.cg_item),
+				config_item_name(usb_cfg_ci),
+				config_item_name(usb_func_ci));
+
 	/*
 	 * ideally I would like to forbid to unlink functions while a gadget is
 	 * bound to an UDC. Since this isn't possible at the moment, we simply
diff --git a/drivers/usb/gadget/configfs_trace.c b/drivers/usb/gadget/configfs_trace.c
new file mode 100644
index 0000000..b74ff21
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define CREATE_TRACE_POINTS
+#include "configfs_trace.h"
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
new file mode 100644
index 0000000..82e0121
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,73 @@
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
+TRACE_EVENT(gadget_dev_desc_UDC_store,
+	TP_PROTO(char *name, char *udc),
+	TP_ARGS(name, udc),
+	TP_STRUCT__entry(
+		__string(group_name, name)
+		__string(udc_name, udc)
+	),
+	TP_fast_assign(
+		__assign_str(group_name, name);
+		__assign_str(udc_name, udc);
+	),
+	TP_printk("gadget:%s UDC:%s", __get_str(group_name),
+		__get_str(udc_name))
+);
+
+TRACE_EVENT(config_usb_cfg_link,
+	TP_PROTO(char *name, char *cfg, char *func),
+	TP_ARGS(name, cfg, func),
+	TP_STRUCT__entry(
+		__string(group_name, name)
+		__string(cfg_name, cfg)
+		__string(func_name, func)
+	),
+	TP_fast_assign(
+		__assign_str(group_name, name);
+		__assign_str(cfg_name, cfg);
+		__assign_str(func_name, func)
+	),
+	TP_printk("gadget:%s cfg:%s link func:%s", __get_str(group_name),
+		__get_str(cfg_name), __get_str(func_name))
+);
+
+TRACE_EVENT(config_usb_cfg_unlink,
+	TP_PROTO(char *name, char *cfg, char *func),
+	TP_ARGS(name, cfg, func),
+	TP_STRUCT__entry(
+		__string(group_name, name)
+		__string(cfg_name, cfg)
+		__string(func_name, func)
+	),
+	TP_fast_assign(
+		__assign_str(group_name, name);
+		__assign_str(cfg_name, cfg);
+		__assign_str(func_name, func)
+	),
+	TP_printk("gadget:%s cfg:%s unlink func:%s", __get_str(group_name),
+		__get_str(cfg_name), __get_str(func_name))
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

