Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 188C04F216D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 06:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiDECuf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 22:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiDECuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 22:50:25 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E87E0AD8
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1649125635; x=1680661635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fD1gGEWM45xv7kUIrWyPSZHM1juOQASdSZQoLYzUCIA=;
  b=QllrUsFslZvMrVYLSi2uN5WWS/gNyC0IsnyZpMdFepPb8klKyRiIQ817
   ur2BCZWsSpJkracexvPaMjDejf+QUWGtH+g7avf3b/FCISK/4UsZJ3gqa
   wDJOSwWJ6EoCtfRYxFMJ5jDlPKDQBWH4Nbz8h4OKSs+4KlXHoyOyxlk4v
   s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Apr 2022 19:27:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 19:27:15 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 19:27:15 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 19:27:13 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v5 2/5] usb: gadget: add trace event of configfs operation
Date:   Tue, 5 Apr 2022 10:27:02 +0800
Message-ID: <1649125625-7003-3-git-send-email-quic_linyyuan@quicinc.com>
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

 drivers/usb/gadget/Makefile |  2 ++
 drivers/usb/gadget/trace.c  |  8 ++++++++
 drivers/usb/gadget/trace.h  | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
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
index 0000000..8b4b1db
--- /dev/null
+++ b/drivers/usb/gadget/trace.c
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
diff --git a/drivers/usb/gadget/trace.h b/drivers/usb/gadget/trace.h
new file mode 100644
index 0000000..20d190d
--- /dev/null
+++ b/drivers/usb/gadget/trace.h
@@ -0,0 +1,40 @@
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
+
-- 
2.7.4

