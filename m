Return-Path: <linux-usb+bounces-37387-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOSmHqyNBGoKLgIAu9opvQ
	(envelope-from <linux-usb+bounces-37387-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:41:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 036055354C0
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E1CD30B508D
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 14:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0134A44E021;
	Wed, 13 May 2026 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlnyW6y6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6736C9D0
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682958; cv=none; b=usa/RGJoTsc1sjSNPV9Jbxv3358KeZVXqnuo7M7ubNgws76mbkBmJ18FaEAjfME9LDf6OaYTB9MB7FgufP4JGCrmoLYdGOOZJT5sImMNINtFHa970AMbfdOw7nqExtLDfzm7b8rnAXTobFIXzx7rXMdr+7WOMQLvkJKAu8uZtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682958; c=relaxed/simple;
	bh=0XPOu4XmvqvzIBfjbaHsiqjkyKgMuNYGWJdtSVLP118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6hGZo9ZI9+PjAIWLP4QrsX1GkzBHCTCGasqWqWhXIO/dHim64rFyHMwQve4w7knqMN3069dAGDQA0SjGksdR4ILFJHaPT9BiFGp8OV+j1P4j09ovNadx8k1h9vgpzVGwbc+U3kIvhzAvax6sLJsWS5XIDbedcCwX2/r/umxbXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlnyW6y6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778682954; x=1810218954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0XPOu4XmvqvzIBfjbaHsiqjkyKgMuNYGWJdtSVLP118=;
  b=TlnyW6y6cyjky1Ys5Q/0JuzoWvCTQEXrfYgFVV4GNOqkZ5JaLlk4kEwr
   kOtbDn+F3jdSygPGLghfTbI87oUoEhyS14HDLfUUD4xX48JmwUWBNjIbD
   hJczFBkCN07T8EyWL4gk9/9mHH7jwOTEdhKZX5kTp9WWGVlwV88fIbFun
   eNInVLTsEuOYZV7xAttnf30cJCP/NJ4Ud+sD+dX+2CkeuhYu3we/hzhmc
   pslTm3/S8V2jqkbBrg31+S3750dvkT1HDZ8daMrCJR4/n8o5f2VCM1a0h
   84odqnkJflWSHlpIoAi/jCC57YGysuRZtvYT63vOi6iGTX6AbEtYYPpl5
   g==;
X-CSE-ConnectionGUID: LAZREWvlRKS+buWIrbdnvg==
X-CSE-MsgGUID: yIBcrRUhSja9PFFjf9SLoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97180754"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97180754"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:35:53 -0700
X-CSE-ConnectionGUID: a45s3Wz6Rpic+dVqxPSZVw==
X-CSE-MsgGUID: jjABClW9S0+HIkF+1cFNqg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:35:51 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: dylan_robinson@motu.com,
	michal.pecio@gmail.com
Cc: mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	stern@rowland.harvard.edu
Subject: [RFT PATCHv2 1/2] xhci: fix frame id calculation and checks for isoc URBs
Date: Wed, 13 May 2026 17:35:32 +0300
Message-ID: <20260513143533.52992-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
References: <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 036055354C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37387-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[motu.com,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Check if the expected frame IDs for a isochronous URB submitted
mid stream is within the valid frame time window that xHC controller
is capable of queuing TDs.

The range only needs to be checked once per URB as the isoc TDs of an
URB are queued in one go with spinlock held and interrupts disabled.

Calculate the valid frame window start and end frame id in frames
instead of microframes to better match how xhci specification
section 4.11.2.5 does it.

Don't add frame id gaps or change scheduling to SIA mid stream if
the start frame is outside the valid frame winow.
Only print a debug message.
Some devices can't handle gaps in isochronous transfers.

Calculate a valid start frame for the first URB of a stream, and
align it to a full frame, or to interval start if interval is longer
than a frame

Set urb->start_frame value for every URB

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  |   1 +
 drivers/usb/host/xhci-ring.c | 180 +++++++++++++++--------------------
 drivers/usb/host/xhci.h      |   7 +-
 3 files changed, 84 insertions(+), 104 deletions(-)

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
index e47e644b296e..b1318515ae58 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3977,80 +3977,79 @@ static int xhci_ist_microframes(struct xhci_hcd *xhci)
 }
 
 /*
- * Calculates Frame ID field of the isochronous TRB identifies the
- * target frame that the Interval associated with this Isochronous
- * Transfer Descriptor will start on. Refer to 4.11.2.5 in 1.1 spec.
+ * Check if frame is in the valid frame window, including start and end.
+ * If start > end then assume window wrapped around at a limit the frame
+ * value won't exceed.
+ */
+static bool xhci_frame_in_range(u32 frame, u32 start, u32 end)
+{
+	/* frame window end wrapped around */
+	if (start > end)
+		return frame >= start || frame <= end;
+
+	return frame >= start && frame <= end;
+}
+
+/*
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
+	u32 curr_frame, start_uframe;
+	u32 urb_start, urb_end;
+	u32 win_start, win_end;
+	bool frame_unit;
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
 
+	/* get current microframe index and isoc scheduling threshold */
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
+	// FIXME, used to check if !list_empty(&ep_ring->td_list)), is that reliable
 
-	if (start_frame_id < end_frame_id) {
-		if (start_frame > end_frame_id ||
-				start_frame < start_frame_id)
-			ret = -EINVAL;
-	} else if (start_frame_id > end_frame_id) {
-		if ((start_frame > end_frame_id &&
-				start_frame < start_frame_id))
-			ret = -EINVAL;
+	/* Is this the first URB starting the whole isoc transfer */
+	if (ep->next_uframe < 0) {
+		/* align first URB to next interval boundary, or at last to full frame */
+		start_uframe = mfindex + ist + XHCI_CFC_DELAY;
+		start_uframe = roundup(start_uframe, 8);
+		start_uframe = roundup(start_uframe, uinterval) % MAX_UFRAMES;
 	} else {
-			ret = -EINVAL;
-	}
+		/* URB is mid stream and expected to handle the next frame */
+		start_uframe = ep->next_uframe;
+		urb_start = start_uframe / 8;
+		urb_end = (start_uframe + urb->number_of_packets * uinterval) / 8;
+		urb_end %= MAX_FRAMES;
 
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
+		if (!xhci_frame_in_range(urb_start, win_start, win_end))
+			xhci_dbg(xhci, "Ill-timed isoc URB %p for start frame %d, range %d-%d\n",
+				 urb, urb_start, win_start, win_end);
 
-	if (ret) {
-		xhci_warn(xhci, "Frame ID %d (reg %d, index %d) beyond range (%d, %d)\n",
-				start_frame, current_frame_id, index,
-				start_frame_id, end_frame_id);
-		xhci_warn(xhci, "Ignore frame ID field, use SIA bit instead\n");
-		return ret;
+		if (!xhci_frame_in_range(urb_end, win_start, win_end))
+			xhci_dbg(xhci, "Ill-timed isoc URB %p for end frame %d, range %d-%d\n",
+				 urb, urb_start, win_start, win_end);
 	}
+	/* set urb->start_frame */
+	urb->start_frame = frame_unit ? start_uframe / 8 : start_uframe;
 
-	return start_frame;
+	return start_uframe;
 }
 
 /* Check if we should generate event interrupt for a TD in an isoc URB */
@@ -4091,6 +4090,8 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	bool more_trbs_coming;
 	struct xhci_virt_ep *xep;
 	int frame_id;
+	int uinterval = urb->interval;
+	int start_uframe;
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
@@ -4106,6 +4107,12 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_cycle = ep_ring->cycle_state;
 
 	urb_priv = urb->hcpriv;
+
+	if (urb->dev->speed == USB_SPEED_FULL || urb->dev->speed == USB_SPEED_LOW)
+		uinterval = urb->interval * 8;
+
+	start_uframe = xhci_get_isoc_start_frame(xhci, urb, xep);
+
 	/* Queue the TRBs for each TD, even if they are zero-length */
 	for (i = 0; i < num_tds; i++) {
 		unsigned int total_pkt_count, max_pkt;
@@ -4137,14 +4144,15 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 			goto cleanup;
 		}
 		td = &urb_priv->td[i];
+
 		/* use SIA as default, if frame id is used overwrite it */
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
@@ -4223,9 +4231,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		}
 	}
 
-	/* store the next frame id */
-	if (xhci->hcc_params & HCC_CFC)
-		xep->next_frame_id = urb->start_frame + num_tds * urb->interval;
+	xep->next_uframe = (start_uframe + num_tds * uinterval) % MAX_UFRAMES;
 
 	if (xhci_to_hcd(xhci)->self.bandwidth_isoc_reqs == 0) {
 		if (xhci->quirks & XHCI_AMD_PLL_FIX)
@@ -4272,11 +4278,9 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	struct xhci_virt_device *xdev;
 	struct xhci_ring *ep_ring;
 	struct xhci_ep_ctx *ep_ctx;
-	int start_frame;
+	struct xhci_virt_ep *xep;
 	int num_tds, num_trbs, i;
 	int ret;
-	struct xhci_virt_ep *xep;
-	int ist;
 
 	xdev = xhci->devs[slot_id];
 	xep = &xhci->devs[slot_id]->eps[ep_index];
@@ -4302,38 +4306,8 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
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
+		xep->next_uframe = -1;
 
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


