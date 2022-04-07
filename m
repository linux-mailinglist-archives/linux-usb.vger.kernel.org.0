Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E3E4F7195
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 03:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238799AbiDGBd7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 21:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242161AbiDGBcI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 21:32:08 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D0F1DE58C
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 18:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649294878; x=1680830878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X85VkfqOunQhO8LhzBWM+2IsbTCfkssku+XaX5vK7L8=;
  b=dShVXlgmJNsZ2FVyIBSQJIYQsXlHV7Q7mkuevM7u4Ee9nkh6QKN5vKJL
   6Rp/DWXY39Y/aqKkez55iW/g0NPAzu8XQbtFy2pg2gCGLb2YZs0jfThnv
   uReo6NPpc2j3aj53S3NlVH3XjUiPDhdfuWDjg1s/7siM64mNlIGoF4kC2
   Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2022 18:27:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 18:27:57 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 18:27:57 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 18:27:55 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v6 2/5] usb: gadget: add trace event of configfs operation
Date:   Thu, 7 Apr 2022 09:27:42 +0800
Message-ID: <1649294865-4388-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a common trace event entry which have only one __string field,
it allow create APIs base on it to add trace events for
usb gadget and function layer, then it will cover all user input
like make configfs group/item, drop item, write attribute, allow/drop link.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change
v3: add trace.c and configfs.c will not include trace.h
v4: no change
v5: no change
v6: change license start with // in trace.c

 drivers/usb/gadget/Makefile |  2 ++
 drivers/usb/gadget/trace.c  |  7 +++++++
 drivers/usb/gadget/trace.h  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 drivers/usb/gadget/trace.c
 create mode 100644 drivers/usb/gadget/trace.h

diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 33f1ef9..b426f5c 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -8,5 +8,7 @@ subdir-ccflags-$(CONFIG_USB_GADGET_VERBOSE)	+= -DVERBOSE_DEBUG
 obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
 libcomposite-y			:= usbstring.o config.o epautoconf.o
 libcomposite-y			+= composite.o functions.o configfs.o u_f.o
+CFLAGS_trace.o			:= -I$(src)
+libcomposite-y			+= trace.o
 
 obj-$(CONFIG_USB_GADGET)	+= udc/ function/ legacy/
diff --git a/drivers/usb/gadget/trace.c b/drivers/usb/gadget/trace.c
new file mode 100644
index 0000000..108c1c8
--- /dev/null
+++ b/drivers/usb/gadget/trace.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
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

