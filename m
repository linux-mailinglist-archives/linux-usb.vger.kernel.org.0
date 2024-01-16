Return-Path: <linux-usb+bounces-5117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354D82F1A4
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 16:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CE23B2259A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEBB1C29E;
	Tue, 16 Jan 2024 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nmsjii5s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6AB1C287
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705419295; x=1736955295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yB6AKpkoscaBLk3tTKBPHDJzsonZ1+kLy2SlGQJ4iqk=;
  b=Nmsjii5sVwy0y13kVMLeKq0iCK/+28rOSWPC374Ktf4IY7pQTUjCco9l
   eCJaaOOYBAw8yOfvj8um1OiLLjSN3PjCGHA9SBJPvQBWhqPIgTaXAv5Uy
   sApB3CsfqAtGJmeHO6gKcuo6q3cwKQ6AXdhbN3aJIdfWDlgapOLw89rA9
   b7Q6TKLuzKvADc0UChRX4E4R6WhmhI4yAzq4MkSLZu1JBlAgU/aNzoHJF
   1MFQk8PtEfdTS01rnff/e8IZcq4xZVMHGfRVr9MG3ojbOylXN491egadz
   SwUP+STpNcaFHKMB5WUL/16FDwFAOKr7YXKPoZ7BHH4Falmf6ajgD51FF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="390345698"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="390345698"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 07:34:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818203171"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="818203171"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Jan 2024 07:34:52 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: michal.pecio@gmail.com
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] xhci: process isoc TD properly when there was an error mid TD.
Date: Tue, 16 Jan 2024 17:36:18 +0200
Message-Id: <20240116153618.2527463-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115172709.0b6f2bba@foxbook>
References: <20240115172709.0b6f2bba@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The last TRB of a isoc TD might not trigger an event if there was
an error event for TRB mid TD. This is seen on a  NEC Corporation
uPD720200 USB 3.0 Host

Driver and xHC host get out of sync as driver is still expecting a
transfer event for that first TD, while xHC host is already sending
events for the next TD in the list. This leads to
"Transfer event TRB DMA ptr not part of current TD" messages.

As a solution we tag the isoc TDs that get error events mid TD.
If an event doesn't match the first TD, then check if the tag is
set, and event points to the next TD.
In that case give back the fist TD and process the next TD normally

Reported-by: Michał Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 55 +++++++++++++++++++++++++++---------
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 33806ae966f9..4869005379f5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2401,8 +2401,11 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
 		frame->status = -EPROTO;
-		if (ep_trb != td->last_trb)
+		if (ep_trb != td->last_trb) {
+			td->error_mid_td = true;
+			/* FIXME update actual_length */
 			return 0;
+		}
 		break;
 	case COMP_STOPPED:
 		sum_trbs_for_length = true;
@@ -2808,17 +2811,44 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		if (!ep_seg) {
-			if (!ep->skip ||
-			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
-				/* Some host controllers give a spurious
-				 * successful event after a short transfer.
-				 * Ignore it.
-				 */
-				if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-						ep_ring->last_td_was_short) {
-					ep_ring->last_td_was_short = false;
-					goto cleanup;
+
+			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+				skip_isoc_td(xhci, td, ep, status);
+				goto cleanup;
+			}
+
+			/*
+			 * Some hosts give a spurious success event after a short
+			 * transfer. Ignore it.
+			 */
+			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
+			    ep_ring->last_td_was_short) {
+				ep_ring->last_td_was_short = false;
+				goto cleanup;
+			}
+
+			/*
+			 * if there was an error event mid TD then host may not
+			 * give an event for the last TRB on an isoc TD.
+			 * This event can be for the next TD, See xHCI 4.9.1.
+			 */
+			if (td->error_mid_td) {
+				struct xhci_td *td_next = list_next_entry(td, td_list);
+
+				ep_seg = trb_in_td(xhci, td_next->start_seg, td_next->first_trb,
+						   td_next->last_trb, ep_trb_dma, false);
+				if (ep_seg) {
+					/* give back previous TD, start handling new */
+					ep_ring->dequeue = td->last_trb;
+					ep_ring->deq_seg = td->last_trb_seg;
+					inc_deq(xhci, ep_ring);
+					xhci_td_cleanup(xhci, td, ep_ring, td->status);
+					td = td_next;
 				}
+
+			}
+
+			if (!ep_seg) {
 				/* HC is busted, give up! */
 				xhci_err(xhci,
 					"ERROR Transfer event TRB DMA ptr not "
@@ -2830,9 +2860,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					  ep_trb_dma, true);
 				return -ESHUTDOWN;
 			}
-
-			skip_isoc_td(xhci, td, ep, status);
-			goto cleanup;
 		}
 		if (trb_comp_code == COMP_SHORT_PACKET)
 			ep_ring->last_td_was_short = true;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a5c72a634e6a..6f82d404883f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1549,6 +1549,7 @@ struct xhci_td {
 	struct xhci_segment	*bounce_seg;
 	/* actual_length of the URB has already been set */
 	bool			urb_length_set;
+	bool			error_mid_td;
 	unsigned int		num_trbs;
 };
 
-- 
2.25.1


