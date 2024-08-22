Return-Path: <linux-usb+bounces-13870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253395B5D2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 15:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 533D11C2351E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FB11C9DDD;
	Thu, 22 Aug 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9Q5csLT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AD81C9422
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331627; cv=none; b=FENaorxPblkOM06Z6pR8FI8qbWy4rGDRVdWrF/6dH1OS6Nte/CRKZBwCZVPvH/rOyA0zYCaZ7UUibIx4sWq9/2bXo2uqZ6kNfZhNQoNktHaS9rEhUBkfqRKHx0lpxuOX2D0LFu7VOsI0ga5ObPFtI2+SFzM3t5YTo6vLFcUbjXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331627; c=relaxed/simple;
	bh=x6tpBjT3zuBO4IZBygMb/B37cYCC9l/O4Mhp7Y53qGE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qyuTV7pAGY3iLto3IfJcnbScXDOGYptiC6P8xFTngLnPYg4b/9zQ9hanDm25xewSK6C7fqRU1wiEL/XSpCHQQHdvMljcs/BPSWkUXGvFzIl5lWndnqAQIXX0fZMujbA5MrGkjvx2zQSdBD12mDhFdJ5RRWJ5y4j1qCgFy5Sy3V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9Q5csLT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724331625; x=1755867625;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6tpBjT3zuBO4IZBygMb/B37cYCC9l/O4Mhp7Y53qGE=;
  b=V9Q5csLTf5anYZKD+7KSuy5CoBkuN4gj9gtjlARjA/yNFRgvmWib9thS
   QTeUq40my4f7DvMmL8LnJe0QH/K7om/sxlyeJc+bDSxxwm6Vq6zItPX//
   btsxgsGBMn21QIFp94MfvpuiavrP+1dSg/+n2VwIw0jvsEVG+XiviI/uP
   F6hJfTG7tHDcVcd7y40sHwb+GvRTEjuZRlnKglJ4pTAVYykvoaGovtikJ
   JxfsiYEbe0UOK6KMa9cOKgElLYGHklLmLGt3/dSr1PB0u4+NpZnEEt5S5
   YZ0QTbfhd/2DCsu0Jc59aKKCGpUDRgyeukoKRj0ENdhJnGrzYyFdJ7BmU
   Q==;
X-CSE-ConnectionGUID: KLLgHXa/RraspsKOU532Kw==
X-CSE-MsgGUID: XeTRtivYRwaidGGxhx4gow==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33894890"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33894890"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:00:24 -0700
X-CSE-ConnectionGUID: 6U2q7iQKQJiRJa6MSVIQig==
X-CSE-MsgGUID: JIo+o0/USn6l0jwdNBFqfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="92178914"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2024 06:00:24 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	ukaszb@chromium.org
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] xhci: dbc: Fix STALL transfer event handling
Date: Thu, 22 Aug 2024 16:02:24 +0300
Message-Id: <20240822130224.962015-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't flush all pending DbC data requests when an endpoint halts.

An endpoint may halt and xHC DbC trigger a STALL error event if there's an
issue with a bulk data transfer. The transfer should restart once xHC DbC
receives a ClearFeature(ENDPOINT_HALT) request from the host.

Once xHC DbC restarts it will start from the TRB pointed to by dequeue
field in the endpoint context, which might be the same TRB we got the
STALL event for. Turn the TRB to a no-op in this case to make sure xHC
DbC doesn't reuse and tries to retransmit this same TRB after we already
handled it, and gave its corresponding data request back.

Other STALL events might be completely bogus.
Lukasz Bartosik discovered that xHC DbC might issue spurious STALL events
if hosts sends a ClearFeature(ENDPOINT_HALT) request to non-halted
endpoints even without any active bulk tranfers.

Assume STALL event is spurious if it reports 0 bytes tranferred, and
the endpoint stopped on the STALLED TRB.
Don't give back the data request corresponding to the TRB in this case.

The halted status is per endpoint. Track it with a per endpoint flag
instead of the driver invented DbC wide DS_STALLED state.
DbC remains in DbC-Configured state even if endpoints halt. There is no
Stalled state in the DbC Port state Machine (xhci section 7.6.6)

Reported-by: Łukasz Bartosik <ukaszb@chromium.org>
Closes: https://lore.kernel.org/linux-usb/20240725074857.623299-1-ukaszb@chromium.org/
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 133 ++++++++++++++++++++-------------
 drivers/usb/host/xhci-dbgcap.h |   2 +-
 2 files changed, 83 insertions(+), 52 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 161c09953c4e..241d7aa1fbc2 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -173,16 +173,18 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
 	spin_lock(&dbc->lock);
 }
 
-static void xhci_dbc_flush_single_request(struct dbc_request *req)
+static void trb_to_noop(union xhci_trb *trb)
 {
-	union xhci_trb	*trb = req->trb;
-
 	trb->generic.field[0]	= 0;
 	trb->generic.field[1]	= 0;
 	trb->generic.field[2]	= 0;
 	trb->generic.field[3]	&= cpu_to_le32(TRB_CYCLE);
 	trb->generic.field[3]	|= cpu_to_le32(TRB_TYPE(TRB_TR_NOOP));
+}
 
+static void xhci_dbc_flush_single_request(struct dbc_request *req)
+{
+	trb_to_noop(req->trb);
 	xhci_dbc_giveback(req, -ESHUTDOWN);
 }
 
@@ -649,7 +651,6 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 	case DS_DISABLED:
 		return;
 	case DS_CONFIGURED:
-	case DS_STALLED:
 		if (dbc->driver->disconnect)
 			dbc->driver->disconnect(dbc);
 		break;
@@ -669,6 +670,23 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 	pm_runtime_put_sync(dbc->dev); /* note, was self.controller */
 }
 
+static void
+handle_ep_halt_changes(struct xhci_dbc *dbc, struct dbc_ep *dep, bool halted)
+{
+	if (halted) {
+		dev_info(dbc->dev, "DbC Endpoint halted\n");
+		dep->halted = 1;
+
+	} else if (dep->halted) {
+		dev_info(dbc->dev, "DbC Endpoint halt cleared\n");
+		dep->halted = 0;
+
+		if (!list_empty(&dep->list_pending))
+			writel(DBC_DOOR_BELL_TARGET(dep->direction),
+			       &dbc->regs->doorbell);
+	}
+}
+
 static void
 dbc_handle_port_status(struct xhci_dbc *dbc, union xhci_trb *event)
 {
@@ -697,6 +715,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	struct xhci_ring	*ring;
 	int			ep_id;
 	int			status;
+	struct xhci_ep_ctx	*ep_ctx;
 	u32			comp_code;
 	size_t			remain_length;
 	struct dbc_request	*req = NULL, *r;
@@ -706,8 +725,30 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	ep_id		= TRB_TO_EP_ID(le32_to_cpu(event->generic.field[3]));
 	dep		= (ep_id == EPID_OUT) ?
 				get_out_ep(dbc) : get_in_ep(dbc);
+	ep_ctx		= (ep_id == EPID_OUT) ?
+				dbc_bulkout_ctx(dbc) : dbc_bulkin_ctx(dbc);
 	ring		= dep->ring;
 
+	/* Match the pending request: */
+	list_for_each_entry(r, &dep->list_pending, list_pending) {
+		if (r->trb_dma == event->trans_event.buffer) {
+			req = r;
+			break;
+		}
+		if (r->status == -COMP_STALL_ERROR) {
+			dev_warn(dbc->dev, "Give back stale stalled req\n");
+			ring->num_trbs_free++;
+			xhci_dbc_giveback(r, 0);
+		}
+	}
+
+	if (!req) {
+		dev_warn(dbc->dev, "no matched request\n");
+		return;
+	}
+
+	trace_xhci_dbc_handle_transfer(ring, &req->trb->generic);
+
 	switch (comp_code) {
 	case COMP_SUCCESS:
 		remain_length = 0;
@@ -718,31 +759,49 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	case COMP_TRB_ERROR:
 	case COMP_BABBLE_DETECTED_ERROR:
 	case COMP_USB_TRANSACTION_ERROR:
-	case COMP_STALL_ERROR:
 		dev_warn(dbc->dev, "tx error %d detected\n", comp_code);
 		status = -comp_code;
 		break;
+	case COMP_STALL_ERROR:
+		dev_warn(dbc->dev, "Stall error at bulk TRB %llx, remaining %zu, ep deq %llx\n",
+			 event->trans_event.buffer, remain_length, ep_ctx->deq);
+		status = 0;
+		dep->halted = 1;
+
+		/*
+		 * xHC DbC may trigger a STALL bulk xfer event when host sends a
+		 * ClearFeature(ENDPOINT_HALT) request even if there wasn't an
+		 * active bulk transfer.
+		 *
+		 * Don't give back this transfer request as hardware will later
+		 * start processing TRBs starting from this 'STALLED' TRB,
+		 * causing TRBs and requests to be out of sync.
+		 *
+		 * If STALL event shows some bytes were transferred then assume
+		 * it's an actual transfer issue and give back the request.
+		 * In this case mark the TRB as No-Op to avoid hw from using the
+		 * TRB again.
+		 */
+
+		if ((ep_ctx->deq & ~TRB_CYCLE) == event->trans_event.buffer) {
+			dev_dbg(dbc->dev, "Ep stopped on Stalled TRB\n");
+			if (remain_length == req->length) {
+				dev_dbg(dbc->dev, "Spurious stall event, keep req\n");
+				req->status = -COMP_STALL_ERROR;
+				req->actual = 0;
+				return;
+			}
+			dev_dbg(dbc->dev, "Give back stalled req, but turn TRB to No-op\n");
+			trb_to_noop(req->trb);
+		}
+		break;
+
 	default:
 		dev_err(dbc->dev, "unknown tx error %d\n", comp_code);
 		status = -comp_code;
 		break;
 	}
 
-	/* Match the pending request: */
-	list_for_each_entry(r, &dep->list_pending, list_pending) {
-		if (r->trb_dma == event->trans_event.buffer) {
-			req = r;
-			break;
-		}
-	}
-
-	if (!req) {
-		dev_warn(dbc->dev, "no matched request\n");
-		return;
-	}
-
-	trace_xhci_dbc_handle_transfer(ring, &req->trb->generic);
-
 	ring->num_trbs_free++;
 	req->actual = req->length - remain_length;
 	xhci_dbc_giveback(req, status);
@@ -762,7 +821,6 @@ static void inc_evt_deq(struct xhci_ring *ring)
 static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 {
 	dma_addr_t		deq;
-	struct dbc_ep		*dep;
 	union xhci_trb		*evt;
 	u32			ctrl, portsc;
 	bool			update_erdp = false;
@@ -814,43 +872,17 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 			return EVT_DISC;
 		}
 
-		/* Handle endpoint stall event: */
+		/* Check and handle changes in endpoint halt status */
 		ctrl = readl(&dbc->regs->control);
-		if ((ctrl & DBC_CTRL_HALT_IN_TR) ||
-		    (ctrl & DBC_CTRL_HALT_OUT_TR)) {
-			dev_info(dbc->dev, "DbC Endpoint stall\n");
-			dbc->state = DS_STALLED;
-
-			if (ctrl & DBC_CTRL_HALT_IN_TR) {
-				dep = get_in_ep(dbc);
-				xhci_dbc_flush_endpoint_requests(dep);
-			}
-
-			if (ctrl & DBC_CTRL_HALT_OUT_TR) {
-				dep = get_out_ep(dbc);
-				xhci_dbc_flush_endpoint_requests(dep);
-			}
-
-			return EVT_DONE;
-		}
+		handle_ep_halt_changes(dbc, get_in_ep(dbc), ctrl & DBC_CTRL_HALT_IN_TR);
+		handle_ep_halt_changes(dbc, get_out_ep(dbc), ctrl & DBC_CTRL_HALT_OUT_TR);
 
 		/* Clear DbC run change bit: */
 		if (ctrl & DBC_CTRL_DBC_RUN_CHANGE) {
 			writel(ctrl, &dbc->regs->control);
 			ctrl = readl(&dbc->regs->control);
 		}
-
 		break;
-	case DS_STALLED:
-		ctrl = readl(&dbc->regs->control);
-		if (!(ctrl & DBC_CTRL_HALT_IN_TR) &&
-		    !(ctrl & DBC_CTRL_HALT_OUT_TR) &&
-		    (ctrl & DBC_CTRL_DBC_RUN)) {
-			dbc->state = DS_CONFIGURED;
-			break;
-		}
-
-		return EVT_DONE;
 	default:
 		dev_err(dbc->dev, "Unknown DbC state %d\n", dbc->state);
 		break;
@@ -939,7 +971,6 @@ static const char * const dbc_state_strings[DS_MAX] = {
 	[DS_ENABLED] = "enabled",
 	[DS_CONNECTED] = "connected",
 	[DS_CONFIGURED] = "configured",
-	[DS_STALLED] = "stalled",
 };
 
 static ssize_t dbc_show(struct device *dev,
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 0118c6288a3c..97c5dc290138 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -81,7 +81,6 @@ enum dbc_state {
 	DS_ENABLED,
 	DS_CONNECTED,
 	DS_CONFIGURED,
-	DS_STALLED,
 	DS_MAX
 };
 
@@ -90,6 +89,7 @@ struct dbc_ep {
 	struct list_head		list_pending;
 	struct xhci_ring		*ring;
 	unsigned int			direction:1;
+	unsigned int			halted:1;
 };
 
 #define DBC_QUEUE_SIZE			16
-- 
2.25.1


