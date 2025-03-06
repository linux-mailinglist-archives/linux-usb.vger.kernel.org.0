Return-Path: <linux-usb+bounces-21445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09BA54E35
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 550673A883F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8527318DB21;
	Thu,  6 Mar 2025 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N73VWpHx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828218DF81
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272587; cv=none; b=WwFUkKMnWbMb5nWL+IJLJTrxymZ/HyxQ5ZXeBG7bJ8vD3l0gKLpbHn9hU6+dI3XIOD76n2JFemiKVZ8LPNSSRaLXSQUr5fMbQFtwR0E9rY0nvUPL3VlNuyNAOSd80BU9gz4AzDSyWpIjkMLmgeOBDqiNVUEZ2UBlH+8ElRDQ+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272587; c=relaxed/simple;
	bh=v+Mk99ZnZEQmPQ5kDPchn9OHkgy2n4/m7U5IopKQ5rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mElxSG42TWfVtJ2XVaUWDkE616VOz4PlWJcuhCadLwZ0/e+h0rG9GyX0e1FL8ePaAeQw6CT7/22FC4o+iU9QXGPvbWmPwzadsY4oeRg5dwEj/29ueuFjHk9VxJy7dxZnCAddj7xR61+LVRjNGq2b9P2u7uxcTQQl94HndVVYRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N73VWpHx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272585; x=1772808585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v+Mk99ZnZEQmPQ5kDPchn9OHkgy2n4/m7U5IopKQ5rY=;
  b=N73VWpHxyJhWaZcEkiTUiboMy1yUIKd3Q5h5YVdCUKpV/j2RJd3E3mMZ
   WX7xkon4zq1CAzJD+K6nzgWki1SnQRlmF6tLLCfFxy77PqdE3Z4y0L+uG
   9y8bqUkFs62ap7XTyhCaaTC88KWji1FoMDrEdrKXS1gzFLD3heMQgcz/h
   oSeWZM8VXi6e+1V+siyU3M7hC0miTxAMdVL/hQUD58Wozj7UpyW89nzE1
   ID1QKpo3Xv8V/mVrdndPBCRhxDQ/CI95KMCyZ4UPfUSsin8/32O6C/8Z6
   oi6CygxVrspJtWwfwa21NSAfosThIYdD4xUrsymJxtQk5guGGGcp9mG6S
   Q==;
X-CSE-ConnectionGUID: VHaSpRpVTo+RjDHmBs6oWw==
X-CSE-MsgGUID: Hd2H0mq+Qy2YhMFVrPChHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657127"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657127"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:45 -0800
X-CSE-ConnectionGUID: Uq2vwelKQ2ui/AA60bK5uw==
X-CSE-MsgGUID: F49EXsQpQmOr/pPeai8NKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954861"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:44 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/15] xhci: Prevent early endpoint restart when handling STALL errors.
Date: Thu,  6 Mar 2025 16:49:51 +0200
Message-ID: <20250306144954.3507700-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that an endpoint halted due to device STALL is not
restarted before a Clear_Feature(ENDPOINT_HALT) request is sent to
the device.

The host side of the endpoint may otherwise be started early by the
'Set TR Deq' command completion handler which is called if dequeue
is moved past a cancelled or halted TD.

Prevent this with a new flag set for bulk and interrupt endpoints
when a Stall Error is received. Clear it in hcd->endpoint_reset()
which is called after Clear_Feature(ENDPOINT_HALT) is sent.

Also add a debug message if a class driver queues a new URB after the
STALL. Note that class driver might not be aware of the STALL
yet when it submits the URB as URBs are given back in BH.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 7 +++++--
 drivers/usb/host/xhci.c      | 6 ++++++
 drivers/usb/host/xhci.h      | 3 ++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c2e15a27338b..7643ab9ec3b4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -556,8 +556,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 	 * pointer command pending because the device can choose to start any
 	 * stream once the endpoint is on the HW schedule.
 	 */
-	if ((ep_state & EP_STOP_CMD_PENDING) || (ep_state & SET_DEQ_PENDING) ||
-	    (ep_state & EP_HALTED) || (ep_state & EP_CLEARING_TT))
+	if (ep_state & (EP_STOP_CMD_PENDING | SET_DEQ_PENDING | EP_HALTED |
+			EP_CLEARING_TT | EP_STALLED))
 		return;
 
 	trace_xhci_ring_ep_doorbell(slot_id, DB_VALUE(ep_index, stream_id));
@@ -2555,6 +2555,9 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
 		return;
+	case COMP_STALL_ERROR:
+		ep->ep_state |= EP_STALLED;
+		break;
 	default:
 		/* do nothing */
 		break;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3f2cd546a7a2..0c22b78358b9 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1604,6 +1604,11 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
+	/* Class driver might not be aware ep halted due to async URB giveback */
+	if (*ep_state & EP_STALLED)
+		dev_dbg(&urb->dev->dev, "URB %p queued before clearing halt\n",
+			urb);
+
 	switch (usb_endpoint_type(&urb->ep->desc)) {
 
 	case USB_ENDPOINT_XFER_CONTROL:
@@ -3202,6 +3207,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		return;
 
 	ep = &vdev->eps[ep_index];
+	ep->ep_state &= ~EP_STALLED;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	spin_lock_irqsave(&xhci->lock, flags);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index cd96e0a8c593..4ee14f651d36 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -664,7 +664,7 @@ struct xhci_virt_ep {
 	unsigned int			err_count;
 	unsigned int			ep_state;
 #define SET_DEQ_PENDING		(1 << 0)
-#define EP_HALTED		(1 << 1)	/* For stall handling */
+#define EP_HALTED		(1 << 1)	/* Halted host ep handling */
 #define EP_STOP_CMD_PENDING	(1 << 2)	/* For URB cancellation */
 /* Transitioning the endpoint to using streams, don't enqueue URBs */
 #define EP_GETTING_STREAMS	(1 << 3)
@@ -675,6 +675,7 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		(1 << 8)
+#define EP_STALLED		(1 << 9)	/* For stall handling */
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
-- 
2.43.0


