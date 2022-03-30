Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3173C4EB9B5
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 06:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242615AbiC3EiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 00:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242660AbiC3EiQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 00:38:16 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA0C22B18
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 21:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648614992; x=1680150992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNyAYn2iRB9DghlnpbxutG5HqEHxLidQEAxBj35aa9A=;
  b=hBSQyf2nn+NBRdpmaaveugVL5dyrHZlY4TreZUvWTamtAjD9XGy29gk3
   XIP5wETCfuC8wZvI/+DZ2xTD2+bpuBZHYz+Y+MDF+Qat9vxzn6Nm+BIe5
   rC59/bN6MWCMq48Wn5kSx+mOaCfpORXGNQL0/1c70tydvl8TLrT2KBU0X
   E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 21:36:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 21:36:31 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 21:36:31 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 21:36:29 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 2/5] usb: gadget: add trace event of configfs operation
Date:   Wed, 30 Mar 2022 12:36:17 +0800
Message-ID: <1648614980-25024-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648614980-25024-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1648614980-25024-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
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

 drivers/usb/gadget/Makefile |  2 ++
 drivers/usb/gadget/trace.c  |  8 ++++++++
 drivers/usb/gadget/trace.h  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
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

