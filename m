Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D857FE32C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 17:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfKOQrx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 11:47:53 -0500
Received: from mga09.intel.com ([134.134.136.24]:15381 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727644AbfKOQrx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Nov 2019 11:47:53 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 08:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; 
   d="scan'208";a="208179181"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2019 08:47:51 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/4] xhci: Add tracing for xhci doorbell register writes
Date:   Fri, 15 Nov 2019 18:50:01 +0200
Message-Id: <1573836603-10871-3-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Trace when a register in the doorbell array is written,
both for host controller command doorbell and device doorbells,
including for which endpoint and stream

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c  |  6 ++++++
 drivers/usb/host/xhci-trace.h | 26 ++++++++++++++++++++++++++
 drivers/usb/host/xhci.h       | 29 +++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 55084adf1faf..bfd4d34c2535 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -280,6 +280,9 @@ void xhci_ring_cmd_db(struct xhci_hcd *xhci)
 		return;
 
 	xhci_dbg(xhci, "// Ding dong!\n");
+
+	trace_xhci_ring_host_doorbell(0, DB_VALUE_HOST);
+
 	writel(DB_VALUE_HOST, &xhci->dba->doorbell[0]);
 	/* Flush PCI posted writes */
 	readl(&xhci->dba->doorbell[0]);
@@ -401,6 +404,9 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 	if ((ep_state & EP_STOP_CMD_PENDING) || (ep_state & SET_DEQ_PENDING) ||
 	    (ep_state & EP_HALTED) || (ep_state & EP_CLEARING_TT))
 		return;
+
+	trace_xhci_ring_ep_doorbell(slot_id, DB_VALUE(ep_index, stream_id));
+
 	writel(DB_VALUE(ep_index, stream_id), db_addr);
 	/* The CPU has better things to do at this point than wait for a
 	 * write-posting flush.  It'll get there soon enough.
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 052a269d86f2..56eb867803a6 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -560,6 +560,32 @@ DEFINE_EVENT(xhci_log_portsc, xhci_hub_status_data,
 	     TP_ARGS(portnum, portsc)
 );
 
+DECLARE_EVENT_CLASS(xhci_log_doorbell,
+	TP_PROTO(u32 slot, u32 doorbell),
+	TP_ARGS(slot, doorbell),
+	TP_STRUCT__entry(
+		__field(u32, slot)
+		__field(u32, doorbell)
+	),
+	TP_fast_assign(
+		__entry->slot = slot;
+		__entry->doorbell = doorbell;
+	),
+	TP_printk("Ring doorbell for %s",
+		xhci_decode_doorbell(__entry->slot, __entry->doorbell)
+	)
+);
+
+DEFINE_EVENT(xhci_log_doorbell, xhci_ring_ep_doorbell,
+	     TP_PROTO(u32 slot, u32 doorbell),
+	     TP_ARGS(slot, doorbell)
+);
+
+DEFINE_EVENT(xhci_log_doorbell, xhci_ring_host_doorbell,
+	     TP_PROTO(u32 slot, u32 doorbell),
+	     TP_ARGS(slot, doorbell)
+);
+
 DECLARE_EVENT_CLASS(xhci_dbc_log_request,
 	TP_PROTO(struct dbc_request *req),
 	TP_ARGS(req),
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f9f88626a57a..dc6f62a4b197 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2580,6 +2580,35 @@ static inline const char *xhci_decode_portsc(u32 portsc)
 	return str;
 }
 
+static inline const char *xhci_decode_doorbell(u32 slot, u32 doorbell)
+{
+	static char str[256];
+	u8 ep;
+	u16 stream;
+	int ret;
+
+	ep = (doorbell & 0xff);
+	stream = doorbell >> 16;
+
+	if (slot == 0) {
+		sprintf(str, "Command Ring %d", doorbell);
+		return str;
+	}
+	ret = sprintf(str, "Slot %d ", slot);
+	if (ep > 0 && ep < 32)
+		ret = sprintf(str + ret, "ep%d%s",
+			      ep / 2,
+			      ep % 2 ? "in" : "out");
+	else if (ep == 0 || ep < 248)
+		ret = sprintf(str + ret, "Reserved %d", ep);
+	else
+		ret = sprintf(str + ret, "Vendor Defined %d", ep);
+	if (stream)
+		ret = sprintf(str + ret, " Stream %d", stream);
+
+	return str;
+}
+
 static inline const char *xhci_ep_state_string(u8 state)
 {
 	switch (state) {
-- 
2.7.4

