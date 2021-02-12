Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754D9319DDD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 13:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhBLMFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 07:05:41 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:47060 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230518AbhBLMF3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Feb 2021 07:05:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 7B803FB02;
        Fri, 12 Feb 2021 13:04:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kYd1gTX18jJn; Fri, 12 Feb 2021 13:04:37 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id AD7DC4188D; Fri, 12 Feb 2021 13:04:33 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/4] usb: typec: tps6598x: Add trace event for IRQ events
Date:   Fri, 12 Feb 2021 13:04:30 +0100
Message-Id: <11444ae487d69da98ec20a18f2e49259e68319e3.1613131413.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1613131413.git.agx@sigxcpu.org>
References: <cover.1613131413.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow to get irq event information via the tracing framework.  This
allows to inspect USB-C negotiation at runtime.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/usb/typec/Makefile         |  3 +
 drivers/usb/typec/tps6598x.c       |  9 ++-
 drivers/usb/typec/tps6598x.h       | 64 ++++++++++++++++++++
 drivers/usb/typec/tps6598x_trace.h | 97 ++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 drivers/usb/typec/tps6598x.h
 create mode 100644 drivers/usb/typec/tps6598x_trace.h

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index d03b48c4b864..27aa12129190 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+# define_trace.h needs to know how to find our header
+CFLAGS_tps6598x.o		:= -I$(src)
+
 obj-$(CONFIG_TYPEC)		+= typec.o
 typec-y				:= class.o mux.o bus.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 6e6ef6317523..bc34b35e909f 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -6,6 +6,8 @@
  * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
  */
 
+#include "tps6598x.h"
+
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/module.h>
@@ -15,6 +17,9 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/role.h>
 
+#define CREATE_TRACE_POINTS
+#include "tps6598x_trace.h"
+
 /* Register offsets */
 #define TPS_REG_VID			0x00
 #define TPS_REG_MODE			0x03
@@ -32,9 +37,6 @@
 #define TPS_REG_POWER_STATUS		0x3f
 #define TPS_REG_RX_IDENTITY_SOP		0x48
 
-/* TPS_REG_INT_* bits */
-#define TPS_REG_INT_PLUG_EVENT		BIT(3)
-
 /* TPS_REG_STATUS bits */
 #define TPS_STATUS_PLUG_PRESENT		BIT(0)
 #define TPS_STATUS_ORIENTATION		BIT(4)
@@ -428,6 +430,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 		dev_err(tps->dev, "%s: failed to read events\n", __func__);
 		goto err_unlock;
 	}
+	trace_tps6598x_irq(event1, event2);
 
 	ret = tps6598x_read32(tps, TPS_REG_STATUS, &status);
 	if (ret) {
diff --git a/drivers/usb/typec/tps6598x.h b/drivers/usb/typec/tps6598x.h
new file mode 100644
index 000000000000..b83b8a6a1504
--- /dev/null
+++ b/drivers/usb/typec/tps6598x.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Driver for TI TPS6598x USB Power Delivery controller family
+ *
+ * Copyright (C) 2017, Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+
+#ifndef __TPS6598X_H__
+#define __TPS6598X_H__
+
+
+/* TPS_REG_INT_* bits */
+#define TPS_REG_INT_USER_VID_ALT_MODE_OTHER_VDM		BIT_ULL(27+32)
+#define TPS_REG_INT_USER_VID_ALT_MODE_ATTN_VDM		BIT_ULL(26+32)
+#define TPS_REG_INT_USER_VID_ALT_MODE_EXIT		BIT_ULL(25+32)
+#define TPS_REG_INT_USER_VID_ALT_MODE_ENTERED		BIT_ULL(24+32)
+#define TPS_REG_INT_EXIT_MODES_COMPLETE			BIT_ULL(20+32)
+#define TPS_REG_INT_DISCOVER_MODES_COMPLETE		BIT_ULL(19+32)
+#define TPS_REG_INT_VDM_MSG_SENT			BIT_ULL(18+32)
+#define TPS_REG_INT_VDM_ENTERED_MODE			BIT_ULL(17+32)
+#define TPS_REG_INT_ERROR_UNABLE_TO_SOURCE		BIT_ULL(14+32)
+#define TPS_REG_INT_SRC_TRANSITION			BIT_ULL(10+32)
+#define TPS_REG_INT_ERROR_DISCHARGE_FAILED		BIT_ULL(9+32)
+#define TPS_REG_INT_ERROR_MESSAGE_DATA			BIT_ULL(7+32)
+#define TPS_REG_INT_ERROR_PROTOCOL_ERROR		BIT_ULL(6+32)
+#define TPS_REG_INT_ERROR_MISSING_GET_CAP_MESSAGE	BIT_ULL(4+32)
+#define TPS_REG_INT_ERROR_POWER_EVENT_OCCURRED		BIT_ULL(3+32)
+#define TPS_REG_INT_ERROR_CAN_PROVIDE_PWR_LATER		BIT_ULL(2+32)
+#define TPS_REG_INT_ERROR_CANNOT_PROVIDE_PWR		BIT_ULL(1+32)
+#define TPS_REG_INT_ERROR_DEVICE_INCOMPATIBLE		BIT_ULL(0+32)
+#define TPS_REG_INT_CMD2_COMPLETE			BIT(31)
+#define TPS_REG_INT_CMD1_COMPLETE			BIT(30)
+#define TPS_REG_INT_ADC_HIGH_THRESHOLD			BIT(29)
+#define TPS_REG_INT_ADC_LOW_THRESHOLD			BIT(28)
+#define TPS_REG_INT_PD_STATUS_UPDATE			BIT(27)
+#define TPS_REG_INT_STATUS_UPDATE			BIT(26)
+#define TPS_REG_INT_DATA_STATUS_UPDATE			BIT(25)
+#define TPS_REG_INT_POWER_STATUS_UPDATE			BIT(24)
+#define TPS_REG_INT_PP_SWITCH_CHANGED			BIT(23)
+#define TPS_REG_INT_HIGH_VOLTAGE_WARNING		BIT(22)
+#define TPS_REG_INT_USB_HOST_PRESENT_NO_LONGER		BIT(21)
+#define TPS_REG_INT_USB_HOST_PRESENT			BIT(20)
+#define TPS_REG_INT_GOTO_MIN_RECEIVED			BIT(19)
+#define TPS_REG_INT_PR_SWAP_REQUESTED			BIT(17)
+#define TPS_REG_INT_SINK_CAP_MESSAGE_READY		BIT(15)
+#define TPS_REG_INT_SOURCE_CAP_MESSAGE_READY		BIT(14)
+#define TPS_REG_INT_NEW_CONTRACT_AS_PROVIDER		BIT(13)
+#define TPS_REG_INT_NEW_CONTRACT_AS_CONSUMER		BIT(12)
+#define TPS_REG_INT_VDM_RECEIVED			BIT(11)
+#define TPS_REG_INT_ATTENTION_RECEIVED			BIT(10)
+#define TPS_REG_INT_OVERCURRENT				BIT(9)
+#define TPS_REG_INT_BIST				BIT(8)
+#define TPS_REG_INT_RDO_RECEIVED_FROM_SINK		BIT(7)
+#define TPS_REG_INT_DR_SWAP_COMPLETE			BIT(5)
+#define TPS_REG_INT_PR_SWAP_COMPLETE			BIT(4)
+#define TPS_REG_INT_PLUG_EVENT				BIT(3)
+#define TPS_REG_INT_HARD_RESET				BIT(1)
+#define TPS_REG_INT_PD_SOFT_RESET			BIT(0)
+
+#endif /* __TPS6598X_H__ */
diff --git a/drivers/usb/typec/tps6598x_trace.h b/drivers/usb/typec/tps6598x_trace.h
new file mode 100644
index 000000000000..4ec96e3b2c3e
--- /dev/null
+++ b/drivers/usb/typec/tps6598x_trace.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Driver for TI TPS6598x USB Power Delivery controller family
+ *
+ * Copyright (C) 2020 Purism SPC
+ * Author: Guido Günther <agx@sigxcpu.org>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM tps6598x
+
+#if !defined(_TPS6598x_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _TPS6598X_TRACE_H_
+
+#include "tps6598x.h"
+
+#include <linux/stringify.h>
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+#define show_irq_flags(flags) \
+	__print_flags_u64(flags, "|", \
+		{ TPS_REG_INT_PD_SOFT_RESET,			"PD_SOFT_RESET" }, \
+		{ TPS_REG_INT_HARD_RESET,			"HARD_RESET" }, \
+		{ TPS_REG_INT_PLUG_EVENT,			"PLUG_EVENT" }, \
+		{ TPS_REG_INT_PR_SWAP_COMPLETE,			"PR_SWAP_COMPLETE" }, \
+		{ TPS_REG_INT_DR_SWAP_COMPLETE,			"DR_SWAP_COMPLETE" }, \
+		{ TPS_REG_INT_RDO_RECEIVED_FROM_SINK,		"RDO_RECEIVED_FROM_SINK" }, \
+		{ TPS_REG_INT_BIST,				"BIST" }, \
+		{ TPS_REG_INT_OVERCURRENT,			"OVERCURRENT" }, \
+		{ TPS_REG_INT_ATTENTION_RECEIVED,		"ATTENTION_RECEIVED" }, \
+		{ TPS_REG_INT_VDM_RECEIVED,			"VDM_RECEIVED" }, \
+		{ TPS_REG_INT_NEW_CONTRACT_AS_CONSUMER,		"NEW_CONTRACT_AS_CONSUMER" }, \
+		{ TPS_REG_INT_NEW_CONTRACT_AS_PROVIDER,		"NEW_CONTRACT_AS_PROVIDER" }, \
+		{ TPS_REG_INT_SOURCE_CAP_MESSAGE_READY,		"SOURCE_CAP_MESSAGE_READY" }, \
+		{ TPS_REG_INT_SINK_CAP_MESSAGE_READY,		"SINK_CAP_MESSAGE_READY" }, \
+		{ TPS_REG_INT_PR_SWAP_REQUESTED,		"PR_SWAP_REQUESTED" }, \
+		{ TPS_REG_INT_GOTO_MIN_RECEIVED,		"GOTO_MIN_RECEIVED" }, \
+		{ TPS_REG_INT_USB_HOST_PRESENT,			"USB_HOST_PRESENT" }, \
+		{ TPS_REG_INT_USB_HOST_PRESENT_NO_LONGER,	"USB_HOST_PRESENT_NO_LONGER" }, \
+		{ TPS_REG_INT_HIGH_VOLTAGE_WARNING,		"HIGH_VOLTAGE_WARNING" }, \
+		{ TPS_REG_INT_PP_SWITCH_CHANGED,		"PP_SWITCH_CHANGED" }, \
+		{ TPS_REG_INT_POWER_STATUS_UPDATE,		"POWER_STATUS_UPDATE" }, \
+		{ TPS_REG_INT_DATA_STATUS_UPDATE,		"DATA_STATUS_UPDATE" }, \
+		{ TPS_REG_INT_STATUS_UPDATE,			"STATUS_UPDATE" }, \
+		{ TPS_REG_INT_PD_STATUS_UPDATE,			"PD_STATUS_UPDATE" }, \
+		{ TPS_REG_INT_ADC_LOW_THRESHOLD,		"ADC_LOW_THRESHOLD" }, \
+		{ TPS_REG_INT_ADC_HIGH_THRESHOLD,		"ADC_HIGH_THRESHOLD" }, \
+		{ TPS_REG_INT_CMD1_COMPLETE,			"CMD1_COMPLETE" }, \
+		{ TPS_REG_INT_CMD2_COMPLETE,			"CMD2_COMPLETE" }, \
+		{ TPS_REG_INT_ERROR_DEVICE_INCOMPATIBLE,	"ERROR_DEVICE_INCOMPATIBLE" }, \
+		{ TPS_REG_INT_ERROR_CANNOT_PROVIDE_PWR,		"ERROR_CANNOT_PROVIDE_PWR" }, \
+		{ TPS_REG_INT_ERROR_CAN_PROVIDE_PWR_LATER,	"ERROR_CAN_PROVIDE_PWR_LATER" }, \
+		{ TPS_REG_INT_ERROR_POWER_EVENT_OCCURRED,	"ERROR_POWER_EVENT_OCCURRED" }, \
+		{ TPS_REG_INT_ERROR_MISSING_GET_CAP_MESSAGE,	"ERROR_MISSING_GET_CAP_MESSAGE" }, \
+		{ TPS_REG_INT_ERROR_PROTOCOL_ERROR,		"ERROR_PROTOCOL_ERROR" }, \
+		{ TPS_REG_INT_ERROR_MESSAGE_DATA,		"ERROR_MESSAGE_DATA" }, \
+		{ TPS_REG_INT_ERROR_DISCHARGE_FAILED,		"ERROR_DISCHARGE_FAILED" }, \
+		{ TPS_REG_INT_SRC_TRANSITION,			"SRC_TRANSITION" }, \
+		{ TPS_REG_INT_ERROR_UNABLE_TO_SOURCE,		"ERROR_UNABLE_TO_SOURCE" }, \
+		{ TPS_REG_INT_VDM_ENTERED_MODE,			"VDM_ENTERED_MODE" }, \
+		{ TPS_REG_INT_VDM_MSG_SENT,			"VDM_MSG_SENT" }, \
+		{ TPS_REG_INT_DISCOVER_MODES_COMPLETE,		"DISCOVER_MODES_COMPLETE" }, \
+		{ TPS_REG_INT_EXIT_MODES_COMPLETE,		"EXIT_MODES_COMPLETE" }, \
+		{ TPS_REG_INT_USER_VID_ALT_MODE_ENTERED,	"USER_VID_ALT_MODE_ENTERED" }, \
+		{ TPS_REG_INT_USER_VID_ALT_MODE_EXIT,		"USER_VID_ALT_MODE_EXIT" }, \
+		{ TPS_REG_INT_USER_VID_ALT_MODE_ATTN_VDM,	"USER_VID_ALT_MODE_ATTN_VDM" }, \
+		{ TPS_REG_INT_USER_VID_ALT_MODE_OTHER_VDM,	"USER_VID_ALT_MODE_OTHER_VDM" })
+
+TRACE_EVENT(tps6598x_irq,
+	    TP_PROTO(u64 event1,
+		     u64 event2),
+	    TP_ARGS(event1, event2),
+
+	    TP_STRUCT__entry(
+			     __field(u64, event1)
+			     __field(u64, event2)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->event1 = event1;
+			   __entry->event2 = event2;
+			   ),
+
+	    TP_printk("event1=%s, event2=%s",
+		      show_irq_flags(__entry->event1),
+		      show_irq_flags(__entry->event2))
+);
+
+#endif /* _TPS6598X_TRACE_H_ */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_FILE tps6598x_trace
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#include <trace/define_trace.h>
-- 
2.30.0

