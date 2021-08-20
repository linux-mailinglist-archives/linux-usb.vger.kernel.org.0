Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386AC3F2C1A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 14:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbhHTMdQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 08:33:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:32166 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233303AbhHTMdQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 08:33:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216799511"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="216799511"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 05:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="680077948"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 20 Aug 2021 05:32:36 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/6] xhci: fix unsafe memory usage in xhci tracing
Date:   Fri, 20 Aug 2021 15:34:58 +0300
Message-Id: <20210820123503.2605901-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
References: <20210820123503.2605901-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Removes static char buffer usage in the following decode functions:
	xhci_decode_trb()
	xhci_decode_ptortsc()

Caller must provide a buffer to use.
In tracing use __get_str() as recommended to pass buffer.

Minor chanes are needed in xhci debugfs code as these functions are also
used there. Changes include moving XHCI_MSG_MAX definititon from
xhci-trace.h to xhci.h

Cc: <stable@vger.kernel.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  6 ++--
 drivers/usb/host/xhci-trace.h   |  8 ++---
 drivers/usb/host/xhci.h         | 52 ++++++++++++++++++---------------
 3 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 2c0fda57869e..85c12f56b17c 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -198,12 +198,13 @@ static void xhci_ring_dump_segment(struct seq_file *s,
 	int			i;
 	dma_addr_t		dma;
 	union xhci_trb		*trb;
+	char			str[XHCI_MSG_MAX];
 
 	for (i = 0; i < TRBS_PER_SEGMENT; i++) {
 		trb = &seg->trbs[i];
 		dma = seg->dma + i * sizeof(*trb);
 		seq_printf(s, "%pad: %s\n", &dma,
-			   xhci_decode_trb(le32_to_cpu(trb->generic.field[0]),
+			   xhci_decode_trb(str, XHCI_MSG_MAX, le32_to_cpu(trb->generic.field[0]),
 					   le32_to_cpu(trb->generic.field[1]),
 					   le32_to_cpu(trb->generic.field[2]),
 					   le32_to_cpu(trb->generic.field[3])));
@@ -341,9 +342,10 @@ static int xhci_portsc_show(struct seq_file *s, void *unused)
 {
 	struct xhci_port	*port = s->private;
 	u32			portsc;
+	char			str[XHCI_MSG_MAX];
 
 	portsc = readl(port->addr);
-	seq_printf(s, "%s\n", xhci_decode_portsc(portsc));
+	seq_printf(s, "%s\n", xhci_decode_portsc(str, portsc));
 
 	return 0;
 }
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 627abd236dbe..5e1c50cb7016 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -25,8 +25,6 @@
 #include "xhci.h"
 #include "xhci-dbgcap.h"
 
-#define XHCI_MSG_MAX	500
-
 DECLARE_EVENT_CLASS(xhci_log_msg,
 	TP_PROTO(struct va_format *vaf),
 	TP_ARGS(vaf),
@@ -122,6 +120,7 @@ DECLARE_EVENT_CLASS(xhci_log_trb,
 		__field(u32, field1)
 		__field(u32, field2)
 		__field(u32, field3)
+		__dynamic_array(char, str, XHCI_MSG_MAX)
 	),
 	TP_fast_assign(
 		__entry->type = ring->type;
@@ -131,7 +130,7 @@ DECLARE_EVENT_CLASS(xhci_log_trb,
 		__entry->field3 = le32_to_cpu(trb->field[3]);
 	),
 	TP_printk("%s: %s", xhci_ring_type_string(__entry->type),
-			xhci_decode_trb(__entry->field0, __entry->field1,
+		  xhci_decode_trb(__get_str(str), XHCI_MSG_MAX, __entry->field0, __entry->field1,
 					__entry->field2, __entry->field3)
 	)
 );
@@ -523,6 +522,7 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 		    TP_STRUCT__entry(
 				     __field(u32, portnum)
 				     __field(u32, portsc)
+				     __dynamic_array(char, str, XHCI_MSG_MAX)
 				     ),
 		    TP_fast_assign(
 				   __entry->portnum = portnum;
@@ -530,7 +530,7 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 				   ),
 		    TP_printk("port-%d: %s",
 			      __entry->portnum,
-			      xhci_decode_portsc(__entry->portsc)
+			      xhci_decode_portsc(__get_str(str), __entry->portsc)
 			      )
 );
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3c7d281672ae..99ae9994f5eb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -22,6 +22,9 @@
 #include	"xhci-ext-caps.h"
 #include "pci-quirks.h"
 
+/* max buffer size for trace and debug messages */
+#define XHCI_MSG_MAX		500
+
 /* xHCI PCI Configuration Registers */
 #define XHCI_SBRN_OFFSET	(0x60)
 
@@ -2235,15 +2238,14 @@ static inline char *xhci_slot_state_string(u32 state)
 	}
 }
 
-static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
-		u32 field3)
+static inline const char *xhci_decode_trb(char *str, size_t size,
+					  u32 field0, u32 field1, u32 field2, u32 field3)
 {
-	static char str[256];
 	int type = TRB_FIELD_TO_TYPE(field3);
 
 	switch (type) {
 	case TRB_LINK:
-		sprintf(str,
+		snprintf(str, size,
 			"LINK %08x%08x intr %d type '%s' flags %c:%c:%c:%c",
 			field1, field0, GET_INTR_TARGET(field2),
 			xhci_trb_type_string(type),
@@ -2260,7 +2262,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 	case TRB_HC_EVENT:
 	case TRB_DEV_NOTE:
 	case TRB_MFINDEX_WRAP:
-		sprintf(str,
+		snprintf(str, size,
 			"TRB %08x%08x status '%s' len %d slot %d ep %d type '%s' flags %c:%c",
 			field1, field0,
 			xhci_trb_comp_code_string(GET_COMP_CODE(field2)),
@@ -2273,7 +2275,8 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 
 		break;
 	case TRB_SETUP:
-		sprintf(str, "bRequestType %02x bRequest %02x wValue %02x%02x wIndex %02x%02x wLength %d length %d TD size %d intr %d type '%s' flags %c:%c:%c",
+		snprintf(str, size,
+			"bRequestType %02x bRequest %02x wValue %02x%02x wIndex %02x%02x wLength %d length %d TD size %d intr %d type '%s' flags %c:%c:%c",
 				field0 & 0xff,
 				(field0 & 0xff00) >> 8,
 				(field0 & 0xff000000) >> 24,
@@ -2290,7 +2293,8 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 				field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_DATA:
-		sprintf(str, "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c",
+		snprintf(str, size,
+			 "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c",
 				field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
 				GET_INTR_TARGET(field2),
 				xhci_trb_type_string(type),
@@ -2303,7 +2307,8 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 				field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_STATUS:
-		sprintf(str, "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c",
+		snprintf(str, size,
+			 "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c",
 				field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
 				GET_INTR_TARGET(field2),
 				xhci_trb_type_string(type),
@@ -2316,7 +2321,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 	case TRB_ISOC:
 	case TRB_EVENT_DATA:
 	case TRB_TR_NOOP:
-		sprintf(str,
+		snprintf(str, size,
 			"Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c:%c",
 			field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
 			GET_INTR_TARGET(field2),
@@ -2333,21 +2338,21 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 
 	case TRB_CMD_NOOP:
 	case TRB_ENABLE_SLOT:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: flags %c",
 			xhci_trb_type_string(type),
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_DISABLE_SLOT:
 	case TRB_NEG_BANDWIDTH:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: slot %d flags %c",
 			xhci_trb_type_string(type),
 			TRB_TO_SLOT_ID(field3),
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_ADDR_DEV:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: ctx %08x%08x slot %d flags %c:%c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2356,7 +2361,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_CONFIG_EP:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: ctx %08x%08x slot %d flags %c:%c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2365,7 +2370,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_EVAL_CONTEXT:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: ctx %08x%08x slot %d flags %c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2373,7 +2378,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_RESET_EP:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: ctx %08x%08x slot %d ep %d flags %c:%c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2394,7 +2399,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_SET_DEQ:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: deq %08x%08x stream %d slot %d ep %d flags %c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2405,14 +2410,14 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_RESET_DEV:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: slot %d flags %c",
 			xhci_trb_type_string(type),
 			TRB_TO_SLOT_ID(field3),
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_FORCE_EVENT:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: event %08x%08x vf intr %d vf id %d flags %c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2421,14 +2426,14 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_SET_LT:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: belt %d flags %c",
 			xhci_trb_type_string(type),
 			TRB_TO_BELT(field3),
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_GET_BW:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: ctx %08x%08x slot %d speed %d flags %c",
 			xhci_trb_type_string(type),
 			field1, field0,
@@ -2437,7 +2442,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_FORCE_HEADER:
-		sprintf(str,
+		snprintf(str, size,
 			"%s: info %08x%08x%08x pkt type %d roothub port %d flags %c",
 			xhci_trb_type_string(type),
 			field2, field1, field0 & 0xffffffe0,
@@ -2446,7 +2451,7 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	default:
-		sprintf(str,
+		snprintf(str, size,
 			"type '%s' -> raw %08x %08x %08x %08x",
 			xhci_trb_type_string(type),
 			field0, field1, field2, field3);
@@ -2571,9 +2576,8 @@ static inline const char *xhci_portsc_link_state_string(u32 portsc)
 	return "Unknown";
 }
 
-static inline const char *xhci_decode_portsc(u32 portsc)
+static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 {
-	static char str[256];
 	int ret;
 
 	ret = sprintf(str, "%s %s %s Link:%s PortSpeed:%d ",
-- 
2.25.1

