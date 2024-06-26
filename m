Return-Path: <linux-usb+bounces-11679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FE91814F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 847661F246C3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32ABD185E7B;
	Wed, 26 Jun 2024 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXNGiNHN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11037185E5F
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406013; cv=none; b=cYpEAIwNgOwPY48Xdn39B9Ahj0fcLtoZn6x0Ma6rFK1xn+XNQmzztS7b0NKxs3qhGugXw3tlCpMG8TsOAy0ehz3VC8o0402rrCtx2LJVhqpMVz+eSPDwhvYHKGSvpFkq1xH3Kvb/1+u1P5kEZgkOaYIwVw2hV3E9UKXHqu6DRbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406013; c=relaxed/simple;
	bh=1l/6gZ1jpSqxM2iGGc9oFU22Wh9ch4UxBvTA0IouHO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSY8XW2djimS0fukmgDwB+7Qz/0QZR72OTEQ8dZeit7SgPHo2eXj7S/V55WiPm/TS3E775fmToSWJo3ZPqlV27jVdyqxES94J1B9ghHrdHI9KOls2aJypAkxy9aNj36Eg9wlELbe4+g4AoTIuZ1LAQ/zmNMie8SOyftwSauZGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXNGiNHN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406012; x=1750942012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1l/6gZ1jpSqxM2iGGc9oFU22Wh9ch4UxBvTA0IouHO4=;
  b=RXNGiNHNHV6C8L63Xab6Hw1LLAqK3iTD+72dkfD2+93tQOIZZfyx5Gl4
   36O7f5RFU7TfN1k/T6ifBq6z4GXKGF7sSKuImRoIfOydZ4qQ6kdmfURSu
   mI9Y8xlvuGVazKK3W58/2fXKnHl0ryHgfWYZtVog4sCQCCc0OQXIjFF2g
   8dwk8UhgM62OqjkB5Gq4pJlH0JBfk2EQ2TxZX4bVh5gz6e7QTbYo2l7sZ
   2ptDw/HMqz86aKsG3n+3AO3oIMJxpKPjv5vNbZ+OeurZ45HTa9l6OVVI0
   cst+zgSY2oMyL+1XXrh99a/EGZY4xxbcRO/2IHGUty/Fvm59+9QS2H0e0
   A==;
X-CSE-ConnectionGUID: Z7jBWoD8Se6zSwBYnz8t5w==
X-CSE-MsgGUID: OC1GvCD2TBC4doSdk2qk1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353382"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:52 -0700
X-CSE-ConnectionGUID: r5NqoYxuRvm1NL2IO8z6zg==
X-CSE-MsgGUID: 5uWFznpfRrS4PbT15+VRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442615"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:50 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/21] usb: xhci: remove unused 'xhci' argument
Date: Wed, 26 Jun 2024 15:48:20 +0300
Message-Id: <20240626124835.1023046-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Remove argument 'struct xhci_hcd *xhci' from functions which do not
utilize it. This change contributes to a simpler codebase by avoiding
redundant arguments.

Functions which have the argument removed:
  check_interval()
  xhci_num_trbs_free()
  xhci_handle_cmd_enable_slot()
  xhci_clear_interrupt_pending()
  xhci_requires_manual_halt_cleanup()

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index dfde9d3cca02..c528dc97dd9a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -283,7 +283,7 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
  * Only for transfer and command rings where driver is the producer, not for
  * event rings.
  */
-static unsigned int xhci_num_trbs_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
+static unsigned int xhci_num_trbs_free(struct xhci_ring *ring)
 {
 	struct xhci_segment *enq_seg = ring->enq_seg;
 	union xhci_trb *enq = ring->enqueue;
@@ -1490,8 +1490,8 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
 		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
-static void xhci_handle_cmd_enable_slot(struct xhci_hcd *xhci, int slot_id,
-		struct xhci_command *command, u32 cmd_comp_code)
+static void xhci_handle_cmd_enable_slot(int slot_id, struct xhci_command *command,
+					u32 cmd_comp_code)
 {
 	if (cmd_comp_code == COMP_SUCCESS)
 		command->slot_id = slot_id;
@@ -1759,7 +1759,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	cmd_type = TRB_FIELD_TO_TYPE(le32_to_cpu(cmd_trb->generic.field[3]));
 	switch (cmd_type) {
 	case TRB_ENABLE_SLOT:
-		xhci_handle_cmd_enable_slot(xhci, slot_id, cmd, cmd_comp_code);
+		xhci_handle_cmd_enable_slot(slot_id, cmd, cmd_comp_code);
 		break;
 	case TRB_DISABLE_SLOT:
 		xhci_handle_cmd_disable_slot(xhci, slot_id);
@@ -2141,9 +2141,7 @@ static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
  * driver won't clear the halt in that case, so we need to issue a Set Transfer
  * Ring Dequeue Pointer command manually.
  */
-static int xhci_requires_manual_halt_cleanup(struct xhci_hcd *xhci,
-		struct xhci_ep_ctx *ep_ctx,
-		unsigned int trb_comp_code)
+static int xhci_requires_manual_halt_cleanup(struct xhci_ep_ctx *ep_ctx, unsigned int trb_comp_code)
 {
 	/* TRB completion codes that may require a manual halt cleanup */
 	if (trb_comp_code == COMP_USB_TRANSACTION_ERROR ||
@@ -2328,8 +2326,7 @@ static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_STOPPED_LENGTH_INVALID:
 		goto finish_td;
 	default:
-		if (!xhci_requires_manual_halt_cleanup(xhci,
-						       ep_ctx, trb_comp_code))
+		if (!xhci_requires_manual_halt_cleanup(ep_ctx, trb_comp_code))
 			break;
 		xhci_dbg(xhci, "TRB error %u, halted endpoint index = %u\n",
 			 trb_comp_code, ep->ep_index);
@@ -2804,8 +2801,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					 slot_id, ep_index);
 			}
 			if (trb_comp_code == COMP_STALL_ERROR ||
-			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
-							      trb_comp_code)) {
+			    xhci_requires_manual_halt_cleanup(ep_ctx, trb_comp_code)) {
 				xhci_handle_halted_endpoint(xhci, ep, NULL,
 							    EP_HARD_RESET);
 			}
@@ -2925,8 +2921,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 		if (trb_is_noop(ep_trb)) {
 			if (trb_comp_code == COMP_STALL_ERROR ||
-			    xhci_requires_manual_halt_cleanup(xhci, ep_ctx,
-							      trb_comp_code))
+			    xhci_requires_manual_halt_cleanup(ep_ctx, trb_comp_code))
 				xhci_handle_halted_endpoint(xhci, ep, td,
 							    EP_HARD_RESET);
 		} else {
@@ -3046,8 +3041,7 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 }
 
 /* Clear the interrupt pending bit for a specific interrupter. */
-static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
-					 struct xhci_interrupter *ir)
+static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
 {
 	if (!ir->ip_autoclear) {
 		u32 irq_pending;
@@ -3068,7 +3062,7 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 	int err;
 	u64 temp;
 
-	xhci_clear_interrupt_pending(xhci, ir);
+	xhci_clear_interrupt_pending(ir);
 
 	/* Event ring hasn't been allocated yet. */
 	if (!ir->event_ring || !ir->event_ring->dequeue) {
@@ -3241,7 +3235,7 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 
 	if (ep_ring != xhci->cmd_ring) {
 		new_segs = xhci_ring_expansion_needed(xhci, ep_ring, num_trbs);
-	} else if (xhci_num_trbs_free(xhci, ep_ring) <= num_trbs) {
+	} else if (xhci_num_trbs_free(ep_ring) <= num_trbs) {
 		xhci_err(xhci, "Do not support expand command ring\n");
 		return -ENOMEM;
 	}
@@ -3416,8 +3410,7 @@ static void giveback_first_trb(struct xhci_hcd *xhci, int slot_id,
 	xhci_ring_ep_doorbell(xhci, slot_id, ep_index, stream_id);
 }
 
-static void check_interval(struct xhci_hcd *xhci, struct urb *urb,
-						struct xhci_ep_ctx *ep_ctx)
+static void check_interval(struct urb *urb, struct xhci_ep_ctx *ep_ctx)
 {
 	int xhci_interval;
 	int ep_interval;
@@ -3458,7 +3451,7 @@ int xhci_queue_intr_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	struct xhci_ep_ctx *ep_ctx;
 
 	ep_ctx = xhci_get_ep_ctx(xhci, xhci->devs[slot_id]->out_ctx, ep_index);
-	check_interval(xhci, urb, ep_ctx);
+	check_interval(urb, ep_ctx);
 
 	return xhci_queue_bulk_tx(xhci, mem_flags, urb, slot_id, ep_index);
 }
@@ -4263,7 +4256,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 * Check interval value. This should be done before we start to
 	 * calculate the start frame value.
 	 */
-	check_interval(xhci, urb, ep_ctx);
+	check_interval(urb, ep_ctx);
 
 	/* Calculate the start frame and put it in urb->start_frame. */
 	if (HCC_CFC(xhci->hcc_params) && !list_empty(&ep_ring->td_list)) {
-- 
2.25.1


