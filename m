Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC2A2955EE
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894574AbgJVBHX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:07:23 -0400
Received: from mail-eopbgr70041.outbound.protection.outlook.com ([40.107.7.41]:40165
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894545AbgJVBHX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:07:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEHvj2+PcraHaXjWcoXgOHoCKH6FyTC4S4PrsqQeNMwEHACrE9qwEz/vQAx0LIUUvjqqDGgO/8dNC8fgqA3o1NO75H9mqvNLRAcV7aYKTUPNizskrenFHmykXdZ2j3kpvE8jrU1Y2F38SApwofG9Sjop3W2zL05jBoJNpEC+oHjkocxhDxCRftKJ3k/7VgXCYlIF8FwnvMIWu3xrakraVf1YeLkV3iLejU1w/3OF4kNJajAYTmrRGsuD6jif7KIzbtZXIUE2N+twj1B7w6qoptBr52sRg3+0PCvmJdCUucPpmN9qF51g4HhUthn1lq9MfeZkjvCj3DYxX7BFnyrnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oPoXfcjT+XmY3QRm4QH6v/Tp5XDsq/bkpEJoruv1y0=;
 b=YJfaooiX3RaqF/1DfpGMY+pYm4jHC9I24UouOwhBNdD0Rh+2dXIDltTdF6h6+2U/FCYzu0Hc+jb0AYPk0UkiecwidHgmdVEp8J2zb9PEiC6NJf0cwUItFDch5sPmIcbKBphX+GubhOTsVCsYdYviLIbX9tZWUFZnZXkKJ6KJ4U0QDJOWLS+yDoTuA47lG6G0RruhMwir0MB4fbGXx3MIG3a4Kbx/MhXKKOlgeWwZc6mEQNBAl4rMwPADg/u0+MBTgOw3IWPnzzKzeKIktznp34cU/KSMr9ELB8PXmF125oegK+N7T0IWZ6KxjpJ8/7PJQPuOfyDZCLL7RdZwrORXTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oPoXfcjT+XmY3QRm4QH6v/Tp5XDsq/bkpEJoruv1y0=;
 b=q7ld+BBEKR5ZsDU5GZ3FrliWMC3e+XL5RxYL4Z3bcPMJ8bKv6PofjQV0nsZkaI+mPxEO76t46fEf8Hyd9QY4B3Vwy5K0tBOng68KRErIz7sE9M3udd803LkdrnAfz2V8MdlS/aY4Z+HdLCATRQPsW1QRLdc79fstW+UDVVr5FxQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB6371.eurprd04.prod.outlook.com (2603:10a6:208:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 22 Oct
 2020 01:07:17 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:07:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: add tracepoint support for udc
Date:   Thu, 22 Oct 2020 09:06:40 +0800
Message-Id: <20201022010640.24831-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0094.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::20) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0094.apcprd01.prod.exchangelabs.com (2603:1096:3:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27 via Frontend Transport; Thu, 22 Oct 2020 01:07:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8db101f5-639b-489c-b106-08d87626d1b8
X-MS-TrafficTypeDiagnostic: AM0PR04MB6371:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB63715264BD487C6ECC3B6BD98B1D0@AM0PR04MB6371.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HIuc11uxg3QWjOYhKXTd84QN9RnqzSjZB23RM1iTamLff1DXwkdXdrQq8i4YLN4SA3JbmuqOaq8GuNkr3Fi7IEwpWI/OJz0zovfLuTixUc3OAvbJm2dXWZGlENObw5J2pCMT11K6CiVeg1y6vTdlhC78diRKQgQkn1On+1ruQb82BenZ4QghA4vrpvdaMp+mpodceqSg6NkP8UHK4zaZIl6oMURjKUgDlDWOXQhk8WnJMi9KtJ3wvUAYWouOpC1xn6m4nbXjfGVrQIwlD0U4kATExcs+glU/cf1UhuaHKkaRbzW3ARoAzYH9AO420+jl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(44832011)(6666004)(6506007)(66476007)(5660300002)(6486002)(86362001)(316002)(2906002)(6512007)(478600001)(36756003)(66946007)(16526019)(66556008)(8676002)(4326008)(52116002)(6916009)(186003)(8936002)(956004)(2616005)(83380400001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ftnQPVBWCdoVNhPl1qC9uJtJuYVM/iFBaKvbYVxU7COk9+Upy/Glpj5JPn4yvIqfrRjYd4/4p3H8+gmZAVQVFrQLtNhMVPijxyahkLM+QsxaSVEaQ+UcBofSoOfb5VlWjvatZm5UAMmzvWmF/O7t37SC5qAQmPzSZKD17l84bP8cX92hdgJR3SmzgCfO0BbjdUYf6P3BpUxsoOXTroifnNKcGMGyZrUIq8kjZth5iWU6fUsqoBpkEd8z5MrwDnREuYMlQPsuje7N7lyYcSN35pLF8cva7fmpLAeZVRQFF88desXefS1jfd1ORTRL42XbsrEitL0YvI+5AMTbX5YObc7cq9xEaOlZmAvLsVsVWZ7RV51KAnMnuRsk3po7aQOdZ/rlFZV7S7g/JO8UKpHnMV3k2aqS5FNF+54cPme/fQ3oR8C+TY+TineciVb8Mtd2RhL9C/v4hN64RfQJ4vtt9m89jLReIKNW+uEoG4A2q6uM6vjvllNooQBy1dIq5SllEX836khEAgkNH73C40UsFxR5o6S8aZCaDjqYFSPiNv9WV2J540/tSB+P4BXk9YPpBs1hTrymqXsk30izNuqGMj7K7gWaNtcGc1HE7x98pzKNzFl4muZF0/qj87rT2drkRpgUMKrBVmusSMc7faliFg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db101f5-639b-489c-b106-08d87626d1b8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:07:17.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUcYNRjDYUZAQfdnH472IiiYeL7wCQn4ZcKqd4usRavOf4f+dfdfxFLKU0iNNJH9iB5Fmb4eDfR22FepsN68BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6371
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add basic tracepoint support for udc driver.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/Makefile |  5 +-
 drivers/usb/chipidea/trace.c  | 23 +++++++++
 drivers/usb/chipidea/trace.h  | 91 +++++++++++++++++++++++++++++++++++
 drivers/usb/chipidea/udc.c    | 10 +++-
 4 files changed, 126 insertions(+), 3 deletions(-)
 create mode 100644 drivers/usb/chipidea/trace.c
 create mode 100644 drivers/usb/chipidea/trace.h

diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index fae779a23866..6f4a3deced35 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -1,8 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# define_trace.h needs to know how to find our header
+CFLAGS_trace.o			:= -I$(src)
 obj-$(CONFIG_USB_CHIPIDEA)		+= ci_hdrc.o
 
 ci_hdrc-y				:= core.o otg.o debug.o ulpi.o
-ci_hdrc-$(CONFIG_USB_CHIPIDEA_UDC)	+= udc.o
+ci_hdrc-$(CONFIG_USB_CHIPIDEA_UDC)	+= udc.o trace.o
 ci_hdrc-$(CONFIG_USB_CHIPIDEA_HOST)	+= host.o
 ci_hdrc-$(CONFIG_USB_OTG_FSM)		+= otg_fsm.o
 
diff --git a/drivers/usb/chipidea/trace.c b/drivers/usb/chipidea/trace.c
new file mode 100644
index 000000000000..f6402630a58e
--- /dev/null
+++ b/drivers/usb/chipidea/trace.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Chipidea Device Mode Trace Support
+ *
+ * Copyright (C) 2020 NXP
+ *
+ * Author: Peter Chen <peter.chen@nxp.com>
+ */
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
+void ci_log(struct ci_hdrc *ci, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+	trace_ci_log(ci, &vaf);
+	va_end(args);
+}
diff --git a/drivers/usb/chipidea/trace.h b/drivers/usb/chipidea/trace.h
new file mode 100644
index 000000000000..a5c483a078d2
--- /dev/null
+++ b/drivers/usb/chipidea/trace.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Trace support header file for device mode
+ *
+ * Copyright (C) 2020 NXP
+ *
+ * Author: Peter Chen <peter.chen@nxp.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM chipidea
+
+#if !defined(__LINUX_CHIPIDEA_TRACE) || defined(TRACE_HEADER_MULTI_READ)
+#define __LINUX_CHIPIDEA_TRACE
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+#include "ci.h"
+#include "udc.h"
+
+#define CHIPIDEA_MSG_MAX	500
+
+void ci_log(struct ci_hdrc *ci, const char *fmt, ...);
+
+TRACE_EVENT(ci_log,
+	TP_PROTO(struct ci_hdrc *ci, struct va_format *vaf),
+	TP_ARGS(ci, vaf),
+	TP_STRUCT__entry(
+		__string(name, dev_name(ci->dev))
+		__dynamic_array(char, msg, CHIPIDEA_MSG_MAX)
+	),
+	TP_fast_assign(
+		__assign_str(name, dev_name(ci->dev));
+		vsnprintf(__get_str(msg), CHIPIDEA_MSG_MAX, vaf->fmt, *vaf->va);
+	),
+	TP_printk("%s: %s", __get_str(name), __get_str(msg))
+);
+
+DECLARE_EVENT_CLASS(ci_log_trb,
+	TP_PROTO(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq, struct td_node *td),
+	TP_ARGS(hwep, hwreq, td),
+	TP_STRUCT__entry(
+		__string(name, hwep->name)
+		__field(struct td_node *, td)
+		__field(struct usb_request *, req)
+		__field(dma_addr_t, dma)
+		__field(s32, td_remaining_size)
+		__field(u32, next)
+		__field(u32, token)
+		__field(u32, type)
+	),
+	TP_fast_assign(
+		__assign_str(name, hwep->name);
+		__entry->req = &hwreq->req;
+		__entry->td = td;
+		__entry->dma = td->dma;
+		__entry->td_remaining_size = td->td_remaining_size;
+		__entry->next = td->ptr->next;
+		__entry->token = td->ptr->token;
+		__entry->type = usb_endpoint_type(hwep->ep.desc);
+	),
+	TP_printk("%s: req: %p, td: %p, td_dma_address: %pad, remaining_size: %d, "
+	       "next: %x, total bytes: %d, status: %lx",
+		__get_str(name), __entry->req, __entry->td, &__entry->dma,
+		__entry->td_remaining_size, __entry->next,
+		(int)((__entry->token & TD_TOTAL_BYTES) >> __ffs(TD_TOTAL_BYTES)),
+		__entry->token & TD_STATUS
+	)
+);
+
+DEFINE_EVENT(ci_log_trb, ci_prepare_td,
+	TP_PROTO(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq, struct td_node *td),
+	TP_ARGS(hwep, hwreq, td)
+);
+
+DEFINE_EVENT(ci_log_trb, ci_complete_td,
+	TP_PROTO(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq, struct td_node *td),
+	TP_ARGS(hwep, hwreq, td)
+);
+
+#endif /* __LINUX_CHIPIDEA_TRACE */
+
+/* this part must be outside header guard */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 60ea932afe2b..c16d900cdaee 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -26,6 +26,7 @@
 #include "bits.h"
 #include "otg.h"
 #include "otg_fsm.h"
+#include "trace.h"
 
 /* control endpoint description */
 static const struct usb_endpoint_descriptor
@@ -569,14 +570,18 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	if (ret)
 		return ret;
 
-	firstnode = list_first_entry(&hwreq->tds, struct td_node, td);
-
 	lastnode = list_entry(hwreq->tds.prev,
 		struct td_node, td);
 
 	lastnode->ptr->next = cpu_to_le32(TD_TERMINATE);
 	if (!hwreq->req.no_interrupt)
 		lastnode->ptr->token |= cpu_to_le32(TD_IOC);
+
+	list_for_each_entry_safe(firstnode, lastnode, &hwreq->tds, td)
+		trace_ci_prepare_td(hwep, hwreq, firstnode);
+
+	firstnode = list_first_entry(&hwreq->tds, struct td_node, td);
+
 	wmb();
 
 	hwreq->req.actual = 0;
@@ -671,6 +676,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 	list_for_each_entry_safe(node, tmpnode, &hwreq->tds, td) {
 		tmptoken = le32_to_cpu(node->ptr->token);
+		trace_ci_complete_td(hwep, hwreq, node);
 		if ((TD_STATUS_ACTIVE & tmptoken) != 0) {
 			int n = hw_ep_bit(hwep->num, hwep->dir);
 
-- 
2.17.1

