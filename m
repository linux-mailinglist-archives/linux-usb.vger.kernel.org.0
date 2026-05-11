Return-Path: <linux-usb+bounces-37278-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK2bFbksAmq/ogEAu9opvQ
	(envelope-from <linux-usb+bounces-37278-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:23:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD35515109
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 21:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 826CE3019D07
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 19:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDAC4D2ECE;
	Mon, 11 May 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLyYWOSH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5443D51E
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527295; cv=none; b=MbNLYDgGUgyXDIYCIbguYCSwd6IcKPr8GtN4a2CCnzUSWSUEtx5M4WHtnFxQ+WRuG60Wi0HAqJDawFW8nCPrgH/hpwJGPrWCbHoTp2Tm0ahy9qJVucyFx3ed2MzU/So+dnK00DB7Bp3HeUvcnogF9ODyqFCHmqbum2HtFZtCLbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527295; c=relaxed/simple;
	bh=LRUt9TzYLerYGYE58mBm7aR+eGfEVz7mAc+j5la95YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8XaTwDAkqWOGaQBRTr+4RPvz9ASZJ8ivdCxsLS/WJHcyqw2s3X8kTdBJx8tPypCXd1CVyQgknNQ2MF6kcsOt6NOIdZKEnomloSl3zN0dymux75pdefBggPQ4NbJv06/+TPwhOiIWq+ITMXzKP5x2t+eFVrs5beqpF6NTsDHw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLyYWOSH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778527292; x=1810063292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LRUt9TzYLerYGYE58mBm7aR+eGfEVz7mAc+j5la95YA=;
  b=DLyYWOSH1wG2vffnrjJMtCeW4Pdcr1VokMRmUZQ8egYO2LlbnB2G2p3T
   JZ6+l2LQqYLqlyWMC6D28hQ5yC+kaQgZUYWkehavxJXWyppu//ZFQMdYZ
   py8dRLdeEmnwrn7jICUMlfrGpwVLqWX32Nozy4KG2u0TAQceMYfqezaFw
   PypQIPklYPCqQ/7SDFt/WFRNgfQpj5QnJSCCRlxLB1SjjBoNRyYK4xWhE
   kZJe3sO3z4CjwoP2F9PNnGPFiVAobT5DL3/XJcMFYLRYe3dRI3W3Azk3x
   fSmjIGbwiGEItio8oi6henT6PKgmVqqChLrr9gm5/m9LkLo53PQBF0Gyo
   g==;
X-CSE-ConnectionGUID: 24/ZuSI6Rjm69qnyyxHlSA==
X-CSE-MsgGUID: zTujXRuyTA+RIMvSb/NZDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90807941"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90807941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:21:32 -0700
X-CSE-ConnectionGUID: QguLLMtlRE28vsPn9lnJYg==
X-CSE-MsgGUID: eN9hGexZQfyxW0XsMaJoUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="241534456"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.61])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:21:30 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: dylan_robinson@motu.com
Cc: linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	michal.pecio@gmail.com,
	stern@rowland.harvard.edu,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
Date: Mon, 11 May 2026 22:21:05 +0300
Message-ID: <20260511192105.3756809-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FD35515109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,gmail.com,rowland.harvard.edu,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-37278-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,linux.intel.com:server fail,intel.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Action: no action

Always calculate estimated start frame, and set urb->start_frame

Fix valid frame window start and end calculation to match xhci
spec 4.11.2.5

Don't inclease frame id with 1 if a URB mod transfer is queued late.
Queue it with next expected frame ID but print a message if URB is
next expected frame id does not fir valid frame window range (URB mid
transfer is queued late)

This patch doesn't switch to URB_ISO_ASAP /SIA scheduling if URB is queued
late, not sure if that would help as it only moves the frame id glitch
problem forward, unless _every_ URB queued after a late URB is forced to
use SIA, which again would defeat the point of Frame ID use.

get rid of the annoying 'xep' and 'xdev' variables, xhci driver uses
ep and vdev naming everywhere else

Contains some FIXMEs, patch for initial testing purposes

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  |   1 +
 drivers/usb/host/xhci-ring.c | 189 ++++++++++++++---------------------
 drivers/usb/host/xhci.h      |   7 +-
 3 files changed, 80 insertions(+), 117 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..58714e10773f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1499,6 +1499,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 		return -ENOMEM;
 
 	virt_dev->eps[ep_index].skip = false;
+	virt_dev->eps[ep_index].next_uframe = -1;
 	ep_ring = virt_dev->eps[ep_index].new_ring;
 	xhci_ring_init(xhci, ep_ring);
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..e63dc6920685 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3977,80 +3977,64 @@ static int xhci_ist_microframes(struct xhci_hcd *xhci)
 }
 
 /*
- * Calculates Frame ID field of the isochronous TRB identifies the
- * target frame that the Interval associated with this Isochronous
- * Transfer Descriptor will start on. Refer to 4.11.2.5 in 1.1 spec.
+ * Set the urb->start_frame of the URB.
  *
- * Returns actual frame id on success, negative value on error.
+ * Returns microframe index of first TD
  */
-static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
-		struct urb *urb, int index)
+static int xhci_get_isoc_start_frame(struct xhci_hcd *xhci, struct urb *urb,
+				     struct xhci_virt_ep *ep)
 {
-	int start_frame, ist, ret = 0;
-	int start_frame_id, end_frame_id, current_frame_id;
+	int curr_frame, start_uframe;
+	int win_start, win_end;
+	bool frame_unit;
+	bool in_range;
+	int uinterval;
+	u32 mfindex;
+	int ist;
 
-	if (urb->dev->speed == USB_SPEED_LOW ||
-			urb->dev->speed == USB_SPEED_FULL)
-		start_frame = urb->start_frame + index * urb->interval;
-	else
-		start_frame = (urb->start_frame + index * urb->interval) >> 3;
+	/* check if urb uses frame units instead of microframes */
+	frame_unit = (urb->dev->speed == USB_SPEED_FULL ||
+		     urb->dev->speed == USB_SPEED_LOW);
+
+	uinterval = urb->interval;
+	if (frame_unit)
+		uinterval *= 8;
 
+	/* get current microframe index and isoc sheduling threshold */
+	mfindex = readl(&xhci->run_regs->microframe_index);
 	ist = xhci_ist_microframes(xhci);
 
-	/* Software shall not schedule an Isoch TD with a Frame ID value that
-	 * is less than the Start Frame ID or greater than the End Frame ID,
-	 * where:
-	 *
-	 * End Frame ID = (Current MFINDEX register value + 895 ms.) MOD 2048
-	 * Start Frame ID = (Current MFINDEX register value + IST + 1) MOD 2048
-	 *
-	 * Both the End Frame ID and Start Frame ID values are calculated
-	 * in microframes. When software determines the valid Frame ID value;
-	 * The End Frame ID value should be rounded down to the nearest Frame
-	 * boundary, and the Start Frame ID value should be rounded up to the
-	 * nearest Frame boundary.
-	 */
-	current_frame_id = readl(&xhci->run_regs->microframe_index);
-	start_frame_id = roundup(current_frame_id + ist + 1, 8);
-	end_frame_id = rounddown(current_frame_id + 895 * 8, 8);
+	/* calculate valid frame window, in frame units, see xhci 4.11.2.5 */
+	curr_frame = MFINDEX_TO_FRAME(mfindex);
+	win_start = (curr_frame + DIV_ROUND_UP_POW2(ist, 8) + 1) % MAX_FRAMES;
+	win_end = (curr_frame + 895) % MAX_FRAMES;
 
-	start_frame &= 0x7ff;
-	start_frame_id = (start_frame_id >> 3) & 0x7ff;
-	end_frame_id = (end_frame_id >> 3) & 0x7ff;
+	/* are we mid stream? is URB is queued inside the valid frame window */
+	// FIXME, used to check if !list_empty(&ep_ring->td_list)), is that reliable
+	if (ep->next_uframe >= 0) {
+		u32 frame = ep->next_uframe / 8;
 
-	if (start_frame_id < end_frame_id) {
-		if (start_frame > end_frame_id ||
-				start_frame < start_frame_id)
-			ret = -EINVAL;
-	} else if (start_frame_id > end_frame_id) {
-		if ((start_frame > end_frame_id &&
-				start_frame < start_frame_id))
-			ret = -EINVAL;
-	} else {
-			ret = -EINVAL;
-	}
+		in_range = frame >= win_start && frame <= win_end;
+		/* valid frame window end wrapped around */
+		if (win_start > win_end)
+			in_range = frame >= win_start || frame <= win_end;
 
-	if (index == 0) {
-		if (ret == -EINVAL || start_frame == start_frame_id) {
-			start_frame = start_frame_id + 1;
-			if (urb->dev->speed == USB_SPEED_LOW ||
-					urb->dev->speed == USB_SPEED_FULL)
-				urb->start_frame = start_frame;
-			else
-				urb->start_frame = start_frame << 3;
-			ret = 0;
-		}
-	}
+		start_uframe = ep->next_uframe;
 
-	if (ret) {
-		xhci_warn(xhci, "Frame ID %d (reg %d, index %d) beyond range (%d, %d)\n",
-				start_frame, current_frame_id, index,
-				start_frame_id, end_frame_id);
-		xhci_warn(xhci, "Ignore frame ID field, use SIA bit instead\n");
-		return ret;
+		if (!in_range)
+			xhci_warn(xhci, "Frame ID %d for Isoc URB %p is outside range %d-%d\n",
+				  frame, urb, win_start, win_end);
+	} else {
+		/* align first URB to next interval boundary, or at last to full frame */
+		start_uframe = mfindex + ist + XHCI_CFC_DELAY;
+		start_uframe = roundup(start_uframe, 8);
+		start_uframe = roundup(start_uframe, uinterval);
 	}
 
-	return start_frame;
+	/* set urb->start_frame */
+	urb->start_frame = frame_unit ? start_uframe / 8 : start_uframe;
+
+	return start_uframe;
 }
 
 /* Check if we should generate event interrupt for a TD in an isoc URB */
@@ -4089,10 +4073,12 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u64 start_addr, addr;
 	int i, j;
 	bool more_trbs_coming;
-	struct xhci_virt_ep *xep;
+	struct xhci_virt_ep *ep;
 	int frame_id;
+	int uinterval = urb->interval;
+	int start_uframe;
 
-	xep = &xhci->devs[slot_id]->eps[ep_index];
+	ep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
 	ir = xhci->interrupters[0];
 
@@ -4106,12 +4092,17 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_cycle = ep_ring->cycle_state;
 
 	urb_priv = urb->hcpriv;
+
+	if (urb->dev->speed == USB_SPEED_FULL || urb->dev->speed == USB_SPEED_LOW)
+		uinterval = urb->interval * 8;
+
+	start_uframe = xhci_get_isoc_start_frame(xhci, urb, ep);
+
 	/* Queue the TRBs for each TD, even if they are zero-length */
 	for (i = 0; i < num_tds; i++) {
 		unsigned int total_pkt_count, max_pkt;
 		unsigned int burst_count, last_burst_pkt_count;
 		u32 sia_frame_id;
-
 		first_trb = true;
 		running_total = 0;
 		addr = start_addr + urb->iso_frame_desc[i].offset;
@@ -4137,14 +4128,14 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 			goto cleanup;
 		}
 		td = &urb_priv->td[i];
-		/* use SIA as default, if frame id is used overwrite it */
+
 		sia_frame_id = TRB_SIA;
-		if (!(urb->transfer_flags & URB_ISO_ASAP) &&
-		    (xhci->hcc_params & HCC_CFC)) {
-			frame_id = xhci_get_isoc_frame_id(xhci, urb, i);
-			if (frame_id >= 0)
-				sia_frame_id = TRB_FRAME_ID(frame_id);
+		if (!(urb->transfer_flags & URB_ISO_ASAP) && (xhci->hcc_params & HCC_CFC)) {
+			frame_id = (start_uframe + i * uinterval) / 8;
+			frame_id %= MAX_FRAMES;
+			sia_frame_id = TRB_FRAME_ID(frame_id);
 		}
+
 		/*
 		 * Set isoc specific data for the first TRB in a TD.
 		 * Prevent HW from getting the TRBs by keeping the cycle state
@@ -4156,7 +4147,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 			(i ? ep_ring->cycle_state : !start_cycle);
 
 		/* xhci 1.1 with ETE uses TD_Size field for TBC, old is Rsvdz */
-		if (!xep->use_extended_tbc)
+		if (!ep->use_extended_tbc)
 			field |= TRB_TBC(burst_count);
 
 		/* fill the rest of the TRB fields, and remaining normal TRBs */
@@ -4198,7 +4189,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				TRB_INTR_TARGET(0);
 
 			/* xhci 1.1 with ETE uses TD Size field for TBC */
-			if (first_trb && xep->use_extended_tbc)
+			if (first_trb && ep->use_extended_tbc)
 				length_field |= TRB_TD_SIZE_TBC(burst_count);
 			else
 				length_field |= TRB_TD_SIZE(remainder);
@@ -4223,9 +4214,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		}
 	}
 
-	/* store the next frame id */
-	if (xhci->hcc_params & HCC_CFC)
-		xep->next_frame_id = urb->start_frame + num_tds * urb->interval;
+	ep->next_uframe = (start_uframe + num_tds * uinterval) % MAX_UFRAMES;
 
 	if (xhci_to_hcd(xhci)->self.bandwidth_isoc_reqs == 0) {
 		if (xhci->quirks & XHCI_AMD_PLL_FIX)
@@ -4249,7 +4238,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	urb_priv->td[0].end_trb = ep_ring->enqueue;
 	/* Every TRB except the first & last will have its cycle bit flipped. */
-	td_to_noop(xhci, xep, &urb_priv->td[0], true);
+	td_to_noop(xhci, ep, &urb_priv->td[0], true);
 
 	/* Reset the ring enqueue back to the first TRB and its cycle bit. */
 	ep_ring->enqueue = urb_priv->td[0].start_trb;
@@ -4269,19 +4258,17 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
 {
-	struct xhci_virt_device *xdev;
+	struct xhci_virt_device *vdev;
 	struct xhci_ring *ep_ring;
 	struct xhci_ep_ctx *ep_ctx;
-	int start_frame;
+	struct xhci_virt_ep *ep;
 	int num_tds, num_trbs, i;
 	int ret;
-	struct xhci_virt_ep *xep;
-	int ist;
 
-	xdev = xhci->devs[slot_id];
-	xep = &xhci->devs[slot_id]->eps[ep_index];
-	ep_ring = xdev->eps[ep_index].ring;
-	ep_ctx = xhci_get_ep_ctx(xhci, xdev->out_ctx, ep_index);
+	vdev = xhci->devs[slot_id];
+	ep = &xhci->devs[slot_id]->eps[ep_index];
+	ep_ring = vdev->eps[ep_index].ring;
+	ep_ctx = xhci_get_ep_ctx(xhci, vdev->out_ctx, ep_index);
 
 	num_trbs = 0;
 	num_tds = urb->number_of_packets;
@@ -4302,38 +4289,8 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	check_interval(urb, ep_ctx);
 
-	/* Calculate the start frame and put it in urb->start_frame. */
-	if ((xhci->hcc_params & HCC_CFC) && !list_empty(&ep_ring->td_list)) {
-		if (GET_EP_CTX_STATE(ep_ctx) ==	EP_STATE_RUNNING) {
-			urb->start_frame = xep->next_frame_id;
-			goto skip_start_over;
-		}
-	}
-
-	start_frame = readl(&xhci->run_regs->microframe_index);
-	start_frame &= 0x3fff;
-	/*
-	 * Round up to the next frame and consider the time before trb really
-	 * gets scheduled by hardare.
-	 */
-	ist = xhci_ist_microframes(xhci);
-	start_frame += ist + XHCI_CFC_DELAY;
-	start_frame = roundup(start_frame, 8);
-
-	/*
-	 * Round up to the next ESIT (Endpoint Service Interval Time) if ESIT
-	 * is greate than 8 microframes.
-	 */
-	if (urb->dev->speed == USB_SPEED_LOW ||
-			urb->dev->speed == USB_SPEED_FULL) {
-		start_frame = roundup(start_frame, urb->interval << 3);
-		urb->start_frame = start_frame >> 3;
-	} else {
-		start_frame = roundup(start_frame, urb->interval);
-		urb->start_frame = start_frame;
-	}
-
-skip_start_over:
+	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
+		ep->next_uframe = -1;
 
 	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..bcb7b8c877db 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -287,6 +287,11 @@ struct xhci_run_regs {
 	struct xhci_intr_reg	ir_set[1024];
 };
 
+/* Bits [13:3] of the microframe index equals the 1ms frame index */
+#define MFINDEX_TO_FRAME(p)	(((p) >> 3) & 0x7ff)
+#define MAX_FRAMES		2048
+#define MAX_UFRAMES		(MAX_FRAMES * 8)
+
 /**
  * struct doorbell_array
  *
@@ -696,7 +701,7 @@ struct xhci_virt_ep {
 	struct list_head	bw_endpoint_list;
 	unsigned long		stop_time;
 	/* Isoch Frame ID checking storage */
-	int			next_frame_id;
+	int			next_uframe;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
-- 
2.43.0


