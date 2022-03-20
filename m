Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05A64E19A4
	for <lists+linux-usb@lfdr.de>; Sun, 20 Mar 2022 05:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244699AbiCTEgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Mar 2022 00:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235846AbiCTEgi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Mar 2022 00:36:38 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D7AE0A3
        for <linux-usb@vger.kernel.org>; Sat, 19 Mar 2022 21:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647750914; x=1679286914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlJGwixuBamASEt+ES5RBWBibSXNH3GVmGQuEGVYlr4=;
  b=jVEXA8zayupfwzED6R4RQA/wDDnZQBm18m44eJ/B8p+s9H5ax8Pogn5G
   KcSklaJCHfatIPak6toqG3burTvqESuVdTGwgTA0dV1+ajkroLraDRG9N
   6YdC0A/iCEwvdWcKci0+Dcs7G3JgHml3kHFYqxg0Hh/y7OYFJ+Fv0/p9s
   w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 19 Mar 2022 21:35:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 21:35:13 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 19 Mar 2022 21:35:13 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 19 Mar 2022 21:35:11 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 1/4] usb: gadget: add trace event of configfs operation
Date:   Sun, 20 Mar 2022 12:35:01 +0800
Message-ID: <1647750904-6524-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647750904-6524-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1647750904-6524-1-git-send-email-quic_linyyuan@quicinc.com>
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

Add a common trace event entry which have only one __string field,
the following patch will add global function base on it to allow
usb gadget and function layer use them, it will cover all user input like
make configfs group/item, drop item, write attribute, allow/drop link.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/Makefile   |  1 +
 drivers/usb/gadget/configfs.c |  3 +++
 drivers/usb/gadget/trace.h    | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 drivers/usb/gadget/trace.h

diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 33f1ef9..e072a11 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -5,6 +5,7 @@
 subdir-ccflags-$(CONFIG_USB_GADGET_DEBUG)	:= -DDEBUG
 subdir-ccflags-$(CONFIG_USB_GADGET_VERBOSE)	+= -DVERBOSE_DEBUG
 
+CFLAGS_configfs.o		:= -I$(src)
 obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
 libcomposite-y			:= usbstring.o config.o epautoconf.o
 libcomposite-y			+= composite.o functions.o configfs.o u_f.o
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 1fb837d..f35a226 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -123,6 +123,9 @@ static int usb_string_copy(const char *s, char **s_copy)
 	return 0;
 }
 
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
 #define GI_DEVICE_DESC_SIMPLE_R_u8(__name)	\
 static ssize_t gadget_dev_desc_##__name##_show(struct config_item *item, \
 			char *page)	\
diff --git a/drivers/usb/gadget/trace.h b/drivers/usb/gadget/trace.h
new file mode 100644
index 0000000..d556580
--- /dev/null
+++ b/drivers/usb/gadget/trace.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM gadget_configfs
+
+
+#if !defined(_GADGET_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _GADGET_TRACE_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(gadget_configfs,
+	TP_PROTO(char *info),
+	TP_ARGS(info),
+	TP_STRUCT__entry(
+		__string(info, info)
+	),
+
+	TP_fast_assign(
+		__assign_str(info, info);
+	),
+
+	TP_printk("%s", __get_str(info))
+);
+
+#endif /* _GADGET_TRACE_H */
+
+/* this part has to be here */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
-- 
2.7.4

