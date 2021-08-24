Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E2E3F56DC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 05:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhHXD4E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 23:56:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:2083 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234052AbhHXDzw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 23:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629777309; x=1661313309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dwR9OjbcqpBXAJOeXbmWqMiNdG11O0SRU1WSEq1kSMQ=;
  b=feemfcxQds25ZfbY45PSz7MLuaHMqAAyVjioL1n6oQRpI3D8c4BxM5DN
   XFCye4ftzvgWlfNLKaUl/zq6NKNj274xbbbBqf/s04hx0gWkeyIMz+YYf
   +FGU4s8rPqPSUes/6GAiYly+ipS/7SByKUhyxSh3pYhVlHScRb7sC/RDL
   Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Aug 2021 20:55:09 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 20:55:08 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7;
 Mon, 23 Aug 2021 20:55:06 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Date:   Tue, 24 Aug 2021 11:54:39 +0800
Message-ID: <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add trace in function gadget_dev_desc_UDC_store()
will show when user space enable/disable the gadget.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/Makefile         |  1 +
 drivers/usb/gadget/configfs.c       |  3 +++
 drivers/usb/gadget/configfs_trace.c |  7 +++++++
 drivers/usb/gadget/configfs_trace.h | 39 +++++++++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
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
index 477e72a..f7f3af8 100644
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
index 0000000..f2e17e4
--- /dev/null
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -0,0 +1,39 @@
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

