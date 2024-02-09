Return-Path: <linux-usb+bounces-6166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F884F73C
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3443E1F21C21
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F1A692E1;
	Fri,  9 Feb 2024 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YS6TepjQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2867E8B
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488775; cv=none; b=KXF8vN55t5Agf8MKTfRZqypaR7lD0jN/GMeYcL3Afeip+KeD/8jGGBNvdOfl1DqFYIydlYxeVvU+tgkRxaqHCK9pfoHHSvBdwvJTa523OKb9Ug7l+LxsvhEhRLLUxMvfNmPDiLVCMj59+HKzcGUW7Kd5c31bGLcxqRqWkt1tIbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488775; c=relaxed/simple;
	bh=iX2VSAbCxXd8Ennkn/Hqpa0qPWfggm/5UU5aTPdt/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQOddFluZhPBtILqA76CsBmgwtHWLrwKJAlyxVITibIrWb40Nyqr65YFdqTCKRWKlCFapXq7VVH6k+eHXn8ahHUcjGFDvfU8ArwYWsK9/fl3MKMzhrbSIE054PWFhotB11N0bmBhhPTMUpM8iKOMe4dTR3unGDNJg3BxwwlLFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YS6TepjQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488774; x=1739024774;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iX2VSAbCxXd8Ennkn/Hqpa0qPWfggm/5UU5aTPdt/bE=;
  b=YS6TepjQVqNbszUQmWnLBVIku40ot8DokpFErKhBLiFewsuqfYvBwPO0
   +691e41JPldzOm6EFXEYWatH2worI3gqgBW5HSIInLP2Vo3HAq6uRZlvi
   4nBelBT833jZAul1rx1vwEs+r+RaSMNL+Z7uPCVBo7rlrVk/IvZvERTRQ
   UqHc3yiVZLClLczFwcS/IDTyLljQk3E8ilsprvmG/FXr/VpkLf/vc08iW
   iEmZx9xHGU7DqUkCkI+xDVOmXzdeXuqfKB63Zca3ktkYHNPVyDmAYBdE7
   5JXALJrThXSYHdKaytAZKfFttzdIQbPyiH+C6DALpAU4ITN/M4cJw7J9w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1295227"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1295227"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="934437210"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934437210"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:26:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A6172159; Fri,  9 Feb 2024 16:26:09 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Add trace events support for the control channel
Date: Fri,  9 Feb 2024 16:26:09 +0200
Message-ID: <20240209142609.2288471-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Sometimes it is useful to see the traffic happening inside the control
channel, especially when debugging a possible problem. This adds
tracepoints close to the hardware which can be enabled dynamically as
needed using the standard Linux trace events facility.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Makefile |   1 +
 drivers/thunderbolt/ctl.c    |   9 ++
 drivers/thunderbolt/trace.h  | 183 +++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/thunderbolt/trace.h

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index c8b3d7b78098..b44b32dcb832 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index d997a4c545f7..95f296ca44cb 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -15,6 +15,8 @@
 
 #include "ctl.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace.h"
 
 #define TB_CTL_RX_PKG_COUNT	10
 #define TB_CTL_RETRIES		4
@@ -369,6 +371,9 @@ static int tb_ctl_tx(struct tb_ctl *ctl, const void *data, size_t len,
 	pkg->frame.size = len + 4;
 	pkg->frame.sof = type;
 	pkg->frame.eof = type;
+
+	trace_tb_tx(type, data, len);
+
 	cpu_to_be32_array(pkg->buffer, data, len / 4);
 	*(__be32 *) (pkg->buffer + len) = tb_crc(pkg->buffer, len);
 
@@ -384,6 +389,7 @@ static int tb_ctl_tx(struct tb_ctl *ctl, const void *data, size_t len,
 static bool tb_ctl_handle_event(struct tb_ctl *ctl, enum tb_cfg_pkg_type type,
 				struct ctl_pkg *pkg, size_t size)
 {
+	trace_tb_event(type, pkg->buffer, size);
 	return ctl->callback(ctl->callback_data, type, pkg->buffer, size);
 }
 
@@ -489,6 +495,9 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 	 * triggered from messing with the active requests.
 	 */
 	req = tb_cfg_request_find(pkg->ctl, pkg);
+
+	trace_tb_rx(frame->eof, pkg->buffer, frame->size, !req);
+
 	if (req) {
 		if (req->copy(req, pkg))
 			schedule_work(&req->work);
diff --git a/drivers/thunderbolt/trace.h b/drivers/thunderbolt/trace.h
new file mode 100644
index 000000000000..918fab0636be
--- /dev/null
+++ b/drivers/thunderbolt/trace.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Thunderbolt tracing support
+ *
+ * Copyright (C) 2023, Intel Corporation
+ * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
+ *	   Gil Fine <gil.fine@intel.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM thunderbolt
+
+#if !defined(TB_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define TB_TRACE_H_
+
+#include <linux/trace_seq.h>
+#include <linux/tracepoint.h>
+
+#include "tb_msgs.h"
+
+#define tb_cfg_type_name(type)		{ type, #type }
+#define show_type_name(val)					\
+	__print_symbolic(val,					\
+		tb_cfg_type_name(TB_CFG_PKG_READ),		\
+		tb_cfg_type_name(TB_CFG_PKG_WRITE),		\
+		tb_cfg_type_name(TB_CFG_PKG_ERROR),		\
+		tb_cfg_type_name(TB_CFG_PKG_NOTIFY_ACK),	\
+		tb_cfg_type_name(TB_CFG_PKG_EVENT),		\
+		tb_cfg_type_name(TB_CFG_PKG_XDOMAIN_REQ),	\
+		tb_cfg_type_name(TB_CFG_PKG_XDOMAIN_RESP),	\
+		tb_cfg_type_name(TB_CFG_PKG_OVERRIDE),		\
+		tb_cfg_type_name(TB_CFG_PKG_RESET),		\
+		tb_cfg_type_name(TB_CFG_PKG_ICM_EVENT),		\
+		tb_cfg_type_name(TB_CFG_PKG_ICM_CMD),		\
+		tb_cfg_type_name(TB_CFG_PKG_ICM_RESP))
+
+#ifndef TB_TRACE_HELPERS
+#define TB_TRACE_HELPERS
+static inline const char *show_data_read_write(struct trace_seq *p,
+					       const u32 *data)
+{
+	const struct cfg_read_pkg *msg = (const struct cfg_read_pkg *)data;
+	const char *ret = trace_seq_buffer_ptr(p);
+
+	trace_seq_printf(p, "offset=%#x, len=%u, port=%d, config=%#x, seq=%d, ",
+			 msg->addr.offset, msg->addr.length, msg->addr.port,
+			 msg->addr.space, msg->addr.seq);
+
+	return ret;
+}
+
+static inline const char *show_data_error(struct trace_seq *p, const u32 *data)
+{
+	const struct cfg_error_pkg *msg = (const struct cfg_error_pkg *)data;
+	const char *ret = trace_seq_buffer_ptr(p);
+
+	trace_seq_printf(p, "error=%#x, port=%d, plug=%#x, ", msg->error,
+			 msg->port, msg->pg);
+
+	return ret;
+}
+
+static inline const char *show_data_event(struct trace_seq *p, const u32 *data)
+{
+	const struct cfg_event_pkg *msg = (const struct cfg_event_pkg *)data;
+	const char *ret = trace_seq_buffer_ptr(p);
+
+	trace_seq_printf(p, "port=%d, unplug=%#x, ", msg->port, msg->unplug);
+
+	return ret;
+}
+
+static inline const char *show_route(struct trace_seq *p, const u32 *data)
+{
+	const struct tb_cfg_header *header = (const struct tb_cfg_header *)data;
+	const char *ret = trace_seq_buffer_ptr(p);
+
+	trace_seq_printf(p, "route=%llx, ", tb_cfg_get_route(header));
+
+	return ret;
+}
+
+static inline const char *show_data(struct trace_seq *p, u8 type,
+				    const u32 *data, u32 length)
+{
+	const char *ret = trace_seq_buffer_ptr(p);
+	const char *prefix = "";
+	int i;
+
+	show_route(p, data);
+
+	switch (type) {
+	case TB_CFG_PKG_READ:
+	case TB_CFG_PKG_WRITE:
+		show_data_read_write(p, data);
+		break;
+
+	case TB_CFG_PKG_ERROR:
+		show_data_error(p, data);
+		break;
+
+	case TB_CFG_PKG_EVENT:
+		show_data_event(p, data);
+		break;
+
+	default:
+		break;
+	}
+
+	trace_seq_printf(p, "data=[");
+	for (i = 0; i < length; i++) {
+		trace_seq_printf(p, "%s0x%08x", prefix, data[i]);
+		prefix = ", ";
+	}
+	trace_seq_printf(p, "]");
+	trace_seq_putc(p, 0);
+
+	return ret;
+}
+#endif
+
+DECLARE_EVENT_CLASS(tb_raw,
+	TP_PROTO(u8 type, const void *data, size_t size),
+	TP_ARGS(type, data, size),
+	TP_STRUCT__entry(
+		__field(u8, type)
+		__field(size_t, size)
+		__dynamic_array(u32, data, size / 4)
+	),
+	TP_fast_assign(
+		__entry->type = type;
+		__entry->size = size / 4;
+		memcpy(__get_dynamic_array(data), data, size);
+	),
+	TP_printk("type=%s, size=%zd, %s",
+		  show_type_name(__entry->type), __entry->size,
+		  show_data(p, __entry->type, __get_dynamic_array(data),
+			    __entry->size)
+	)
+);
+
+DEFINE_EVENT(tb_raw, tb_tx,
+	TP_PROTO(u8 type, const void *data, size_t size),
+	TP_ARGS(type, data, size)
+);
+
+DEFINE_EVENT(tb_raw, tb_event,
+	TP_PROTO(u8 type, const void *data, size_t size),
+	TP_ARGS(type, data, size)
+);
+
+TRACE_EVENT(tb_rx,
+	TP_PROTO(u8 type, const void *data, size_t size, bool dropped),
+	TP_ARGS(type, data, size, dropped),
+	TP_STRUCT__entry(
+		__field(u8, type)
+		__field(size_t, size)
+		__dynamic_array(u32, data, size / 4)
+		__field(bool, dropped)
+	),
+	TP_fast_assign(
+		__entry->type = type;
+		__entry->size = size / 4;
+		memcpy(__get_dynamic_array(data), data, size);
+		__entry->dropped = dropped;
+	),
+	TP_printk("type=%s, dropped=%u, size=%zd, %s",
+		  show_type_name(__entry->type), __entry->dropped, __entry->size,
+		  show_data(p, __entry->type, __get_dynamic_array(data),
+			    __entry->size)
+	)
+);
+
+#endif /* TB_TRACE_H_ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.43.0


