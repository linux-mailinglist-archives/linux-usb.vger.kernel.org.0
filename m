Return-Path: <linux-usb+bounces-6455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293785634A
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 13:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7EB1C220DB
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 12:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B2712CD88;
	Thu, 15 Feb 2024 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3np+r2W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16637869B
	for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000541; cv=none; b=umbRVq39beRr4PUER5+pZ7bg57KRJp7YzUus8+S73WfZuZ1YMtbf/XxncrSZRjBdIB5pD6cNag7TrZRx7iFZAP/z1rrs8y8sepy4NSItapK1hL58PGmuCNA/nzO65E5nrlpyina8SiUu++15AAl1kidgb4HtVnqgYw/adLusigY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000541; c=relaxed/simple;
	bh=juLX0SLKcx9RAX5iROGyrX0/TEQd7b17cFCcSOtgUG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OE/rWt/xLF0ee/fDbhM6sNwQ2AtVmdONxkrpvUGdsAL+qZoMzYB+FZOuaJbZhVb20C08kpdqEvbpNi4wMtzUwH4jqnVat7kS9Qd1pRD87pIp3HDmBgaDkti8DZN/26aEvQ1Tn09tNqDRtyM/j1IJHCF1TPouFcKlb6h/m38Ag4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3np+r2W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708000540; x=1739536540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=juLX0SLKcx9RAX5iROGyrX0/TEQd7b17cFCcSOtgUG8=;
  b=U3np+r2WkpVS2tUIDHMcD+TgbM5fFm1xP5KuQXOPPGsJPaHuOBO+GeqI
   qXyyGV0sE9jNlcxmhfpB2o5lZCtw7BWpGky9DvdnctqH3g6Arghdip2B8
   90CJ3+cnaQkbvxmWq/w8sjbaMt8d+JvgN4KI/AhcTt0d8qsb3dR2tkh8E
   7bBnoOPoaGTnUX4dDfsnI6G+5hfVLKS1O3Z4K9Midr13PEyKsvAhpjFRO
   K9Op8d/2OdrVIR3V12Cksna31TrprQwYuicsjhRD/D5wCrETP0maq4Df4
   fCtuGWOXN+ewhhfU1tLwRPriMW9wL5qq6X6zyo1GYfSh/rnN3DsB+c+fy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5051747"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5051747"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 04:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912159267"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="912159267"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2024 04:35:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9129D204; Thu, 15 Feb 2024 14:35:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3] thunderbolt: Add trace events support for the control channel
Date: Thu, 15 Feb 2024 14:35:35 +0200
Message-ID: <20240215123535.137840-1-mika.westerberg@linux.intel.com>
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
Changes from v2:

 - Move "index" at the end of the structure to avoid creating a hole.

Changes from v1:

 - Add domain number to the trace so we can distinquish from which
   host controller the record is coming in case there are more than one.
 - Correct the year in copyright

v2: https://lore.kernel.org/linux-usb/20240212090604.2551237-1-mika.westerberg@linux.intel.com/
v1: https://lore.kernel.org/linux-usb/20240209142609.2288471-1-mika.westerberg@linux.intel.com/

 drivers/thunderbolt/Makefile |   1 +
 drivers/thunderbolt/ctl.c    |  19 +++-
 drivers/thunderbolt/ctl.h    |   4 +-
 drivers/thunderbolt/domain.c |   2 +-
 drivers/thunderbolt/trace.h  | 188 +++++++++++++++++++++++++++++++++++
 5 files changed, 209 insertions(+), 5 deletions(-)
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
index d997a4c545f7..4bdb2d45e0bf 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -15,6 +15,8 @@
 
 #include "ctl.h"
 
+#define CREATE_TRACE_POINTS
+#include "trace.h"
 
 #define TB_CTL_RX_PKG_COUNT	10
 #define TB_CTL_RETRIES		4
@@ -32,6 +34,7 @@
  * @timeout_msec: Default timeout for non-raw control messages
  * @callback: Callback called when hotplug message is received
  * @callback_data: Data passed to @callback
+ * @index: Domain number. This will be output with the trace record.
  */
 struct tb_ctl {
 	struct tb_nhi *nhi;
@@ -47,6 +50,8 @@ struct tb_ctl {
 	int timeout_msec;
 	event_cb callback;
 	void *callback_data;
+
+	int index;
 };
 
 
@@ -369,6 +374,9 @@ static int tb_ctl_tx(struct tb_ctl *ctl, const void *data, size_t len,
 	pkg->frame.size = len + 4;
 	pkg->frame.sof = type;
 	pkg->frame.eof = type;
+
+	trace_tb_tx(ctl->index, type, data, len);
+
 	cpu_to_be32_array(pkg->buffer, data, len / 4);
 	*(__be32 *) (pkg->buffer + len) = tb_crc(pkg->buffer, len);
 
@@ -384,6 +392,7 @@ static int tb_ctl_tx(struct tb_ctl *ctl, const void *data, size_t len,
 static bool tb_ctl_handle_event(struct tb_ctl *ctl, enum tb_cfg_pkg_type type,
 				struct ctl_pkg *pkg, size_t size)
 {
+	trace_tb_event(ctl->index, type, pkg->buffer, size);
 	return ctl->callback(ctl->callback_data, type, pkg->buffer, size);
 }
 
@@ -489,6 +498,9 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 	 * triggered from messing with the active requests.
 	 */
 	req = tb_cfg_request_find(pkg->ctl, pkg);
+
+	trace_tb_rx(pkg->ctl->index, frame->eof, pkg->buffer, frame->size, !req);
+
 	if (req) {
 		if (req->copy(req, pkg))
 			schedule_work(&req->work);
@@ -614,6 +626,7 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 /**
  * tb_ctl_alloc() - allocate a control channel
  * @nhi: Pointer to NHI
+ * @index: Domain number
  * @timeout_msec: Default timeout used with non-raw control messages
  * @cb: Callback called for plug events
  * @cb_data: Data passed to @cb
@@ -622,14 +635,16 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
  *
  * Return: Returns a pointer on success or NULL on failure.
  */
-struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int timeout_msec, event_cb cb,
-			    void *cb_data)
+struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
+			    event_cb cb, void *cb_data)
 {
 	int i;
 	struct tb_ctl *ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
 	if (!ctl)
 		return NULL;
+
 	ctl->nhi = nhi;
+	ctl->index = index;
 	ctl->timeout_msec = timeout_msec;
 	ctl->callback = cb;
 	ctl->callback_data = cb_data;
diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index eec5c953c743..bf930a191472 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -21,8 +21,8 @@ struct tb_ctl;
 typedef bool (*event_cb)(void *data, enum tb_cfg_pkg_type type,
 			 const void *buf, size_t size);
 
-struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int timeout_msec, event_cb cb,
-			    void *cb_data);
+struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
+			    event_cb cb, void *cb_data);
 void tb_ctl_start(struct tb_ctl *ctl);
 void tb_ctl_stop(struct tb_ctl *ctl);
 void tb_ctl_free(struct tb_ctl *ctl);
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index d7abb8c445aa..1d915a6c61a4 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -397,7 +397,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
 	if (!tb->wq)
 		goto err_remove_ida;
 
-	tb->ctl = tb_ctl_alloc(nhi, timeout_msec, tb_domain_event_cb, tb);
+	tb->ctl = tb_ctl_alloc(nhi, tb->index, timeout_msec, tb_domain_event_cb, tb);
 	if (!tb->ctl)
 		goto err_destroy_wq;
 
diff --git a/drivers/thunderbolt/trace.h b/drivers/thunderbolt/trace.h
new file mode 100644
index 000000000000..4dccfcf7af6a
--- /dev/null
+++ b/drivers/thunderbolt/trace.h
@@ -0,0 +1,188 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Thunderbolt tracing support
+ *
+ * Copyright (C) 2024, Intel Corporation
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
+	TP_PROTO(int index, u8 type, const void *data, size_t size),
+	TP_ARGS(index, type, data, size),
+	TP_STRUCT__entry(
+		__field(int, index)
+		__field(u8, type)
+		__field(size_t, size)
+		__dynamic_array(u32, data, size / 4)
+	),
+	TP_fast_assign(
+		__entry->index = index;
+		__entry->type = type;
+		__entry->size = size / 4;
+		memcpy(__get_dynamic_array(data), data, size);
+	),
+	TP_printk("type=%s, size=%zd, domain=%d, %s",
+		  show_type_name(__entry->type), __entry->size, __entry->index,
+		  show_data(p, __entry->type, __get_dynamic_array(data),
+			    __entry->size)
+	)
+);
+
+DEFINE_EVENT(tb_raw, tb_tx,
+	TP_PROTO(int index, u8 type, const void *data, size_t size),
+	TP_ARGS(index, type, data, size)
+);
+
+DEFINE_EVENT(tb_raw, tb_event,
+	TP_PROTO(int index, u8 type, const void *data, size_t size),
+	TP_ARGS(index, type, data, size)
+);
+
+TRACE_EVENT(tb_rx,
+	TP_PROTO(int index, u8 type, const void *data, size_t size, bool dropped),
+	TP_ARGS(index, type, data, size, dropped),
+	TP_STRUCT__entry(
+		__field(int, index)
+		__field(u8, type)
+		__field(size_t, size)
+		__dynamic_array(u32, data, size / 4)
+		__field(bool, dropped)
+	),
+	TP_fast_assign(
+		__entry->index = index;
+		__entry->type = type;
+		__entry->size = size / 4;
+		memcpy(__get_dynamic_array(data), data, size);
+		__entry->dropped = dropped;
+	),
+	TP_printk("type=%s, dropped=%u, size=%zd, domain=%d, %s",
+		  show_type_name(__entry->type), __entry->dropped,
+		  __entry->size, __entry->index,
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


