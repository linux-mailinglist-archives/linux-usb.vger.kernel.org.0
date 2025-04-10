Return-Path: <linux-usb+bounces-22917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0FA8479E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 17:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA1F8A4573
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1411E8847;
	Thu, 10 Apr 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g79Yx1Sm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE83757F3
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298260; cv=none; b=b/YQrNEFknSXA9OdxbeMbxQdEyHBmG9bxHZvjuk6qcrxhFEgpRzZtNMKyswSL9bWLXlehQO72jsRJlX9Vc6WZZmi2soZBC+yxDNKGeOopgnoEU6rUbl58pVFVRXgVmYBFAaKBR2Xawk2OSatDDBWtpuox+7l69gamVbcasqz+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298260; c=relaxed/simple;
	bh=5Yc21wueEndWZDDnB2dz3Zbd+I7CcrfZC6vxrfYhCsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa6EDkPucL8990loXPya7odOM71wagj/SX8KMjedEXDpJAB7mx1Tt5vOkG4yX2rJNrGnnJoYhWNJrzQ8kY/kQV9g/3hXhHYpLcxW7Dy42idxYXV8CQzWC/Poj6N5qQ2Y+368Z5bNwfIkLnoKqcGj6sJ6KCujS5JkOLNkEruSEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g79Yx1Sm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298258; x=1775834258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Yc21wueEndWZDDnB2dz3Zbd+I7CcrfZC6vxrfYhCsA=;
  b=g79Yx1SmjCppcCb1745DWT7BOzDg9AWs3A/00ARAKbUsMm/IQkv7eq3r
   Lz3NqHxbylpYALLdIwl9iV2hYJo/JBlKMm/KKru74my23+cwlgfSc3zmK
   +Un3MjHBPtk/YZcDl7/JMfrbYyamXDPdThlp/5duoDGdYjk4uiH0pS88m
   y2s1RSyAGIkfZFplFFR3ttjgD5LOFaQvFVsBdh74QqRQsmiqD2ywUZDWh
   7w060UKUS6xfD1XDQ7BuBXCAHUlbE6YdhmjbwOxYdVmjmx0nLxxAzphhM
   Z0ZITU+NriML7K5iJKFOJpa/SOi5KXuX3ywkCX6+yhibiKsRdKuy2L4jq
   A==;
X-CSE-ConnectionGUID: 60bMseohTq2vJCWkwtPsIA==
X-CSE-MsgGUID: PfT1ps4aRv6uUzgXVIs9wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48534970"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48534970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:17:37 -0700
X-CSE-ConnectionGUID: MGc4wgZvQaSCqXiuDCB4Ew==
X-CSE-MsgGUID: FyNEH+QMRVSqfzXxSmhgYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128913190"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2025 08:17:35 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH 2/5] Revert "xhci: Prevent early endpoint restart when handling STALL errors."
Date: Thu, 10 Apr 2025 18:18:24 +0300
Message-ID: <20250410151828.2868740-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410151828.2868740-1-mathias.nyman@linux.intel.com>
References: <20250410151828.2868740-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 860f5d0d3594005d4588240028f42e8d2bfc725b.

Paul Menzel reported that the two EP_STALLED patches in 6.15-rc1 cause
regression. Turns out that the new flag may never get cleared after
reset-resume, preventing xhci from restarting the endpoint.

Revert this to take a proper look at it.

Link: https://lore.kernel.org/linux-usb/84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de
cc: Paul Menzel <pmenzel@molgen.mpg.de>
cc: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 7 ++-----
 drivers/usb/host/xhci.c      | 6 ------
 drivers/usb/host/xhci.h      | 3 +--
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5d64c297721c..94a2ae2c52e2 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -561,8 +561,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 	 * pointer command pending because the device can choose to start any
 	 * stream once the endpoint is on the HW schedule.
 	 */
-	if (ep_state & (EP_STOP_CMD_PENDING | SET_DEQ_PENDING | EP_HALTED |
-			EP_CLEARING_TT | EP_STALLED))
+	if ((ep_state & EP_STOP_CMD_PENDING) || (ep_state & SET_DEQ_PENDING) ||
+	    (ep_state & EP_HALTED) || (ep_state & EP_CLEARING_TT))
 		return;
 
 	trace_xhci_ring_ep_doorbell(slot_id, DB_VALUE(ep_index, stream_id));
@@ -2573,9 +2573,6 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
 		return;
-	case COMP_STALL_ERROR:
-		ep->ep_state |= EP_STALLED;
-		break;
 	default:
 		/* do nothing */
 		break;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6370874bf265..ca390beda85b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1605,11 +1605,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
-	/* Class driver might not be aware ep halted due to async URB giveback */
-	if (*ep_state & EP_STALLED)
-		dev_dbg(&urb->dev->dev, "URB %p queued before clearing halt\n",
-			urb);
-
 	switch (usb_endpoint_type(&urb->ep->desc)) {
 
 	case USB_ENDPOINT_XFER_CONTROL:
@@ -3208,7 +3203,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		return;
 
 	ep = &vdev->eps[ep_index];
-	ep->ep_state &= ~EP_STALLED;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
 	spin_lock_irqsave(&xhci->lock, flags);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 37860f1e3aba..28b6264f8b87 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -664,7 +664,7 @@ struct xhci_virt_ep {
 	unsigned int			err_count;
 	unsigned int			ep_state;
 #define SET_DEQ_PENDING		(1 << 0)
-#define EP_HALTED		(1 << 1)	/* Halted host ep handling */
+#define EP_HALTED		(1 << 1)	/* For stall handling */
 #define EP_STOP_CMD_PENDING	(1 << 2)	/* For URB cancellation */
 /* Transitioning the endpoint to using streams, don't enqueue URBs */
 #define EP_GETTING_STREAMS	(1 << 3)
@@ -675,7 +675,6 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		(1 << 8)
-#define EP_STALLED		(1 << 9)	/* For stall handling */
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
-- 
2.43.0


