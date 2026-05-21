Return-Path: <linux-usb+bounces-37898-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHGzLuE9D2o1IQYAu9opvQ
	(envelope-from <linux-usb+bounces-37898-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 19:16:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989485AA03D
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 19:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3870D32EED5E
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 15:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5FF34AB03;
	Thu, 21 May 2026 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ez+ic2SA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DAE32ED34
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377250; cv=none; b=JEmKaL7tbWCt69qOQOxV3mfZOCwkqG7oeU/D0GRpmu/QHYT1jJjvjXhHr1lewc//r9V5El44e9noTPZdnfC9kxQ/hYcCEkgZxjp7zos1g2lkZOY8w+9RPFjOItGFjpjdfD8u24TYcDujd9hru7rf6D76b159kNibLU2EawIr/k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377250; c=relaxed/simple;
	bh=0XPOu4XmvqvzIBfjbaHsiqjkyKgMuNYGWJdtSVLP118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciPAgX1TcWFR/dn5ueyLCssEFFOzMNgPtYL2LzSzbDi5XY8x5jST9SKNbHNrd3gKwUl++BYPdGhtnBZnJZO+j+YebOS8f0qOl7qB/XZlq0AlEsICqjpgXoxPlXUHSWN5qS0cyJcetiXBp12RPQ7OXayb8wX2JxhGFQIqvuugLVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ez+ic2SA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779377248; x=1810913248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0XPOu4XmvqvzIBfjbaHsiqjkyKgMuNYGWJdtSVLP118=;
  b=Ez+ic2SA4DlEJJLXxTTcNxYGY4qwqJth+5PQLGMibHYgPGUnbiohRBCO
   MFGggZ3erIqzLOnyVraUHi9JU4r1duiEInbbyfkADig/vV23fz72ELi8j
   orxM449WNdV8bRxKokR5VYYCc2wgeX4UlxNDJRh7W/oALc+qDEgjB2bwk
   O4z5G4nmHBCOWTmLQWURamEWM4JBRJLN147bBfbDMTrmn/je4U/NOVvub
   vElz1SKLHxhcYpjiBdfcM0BQarORg1Q8VKCKiO4JOiSravtTcjc24Mhln
   xAG87aUlQcZmu1MhVxeqCf2a3sJl3t2Dd7Y7ydqW9t1qFOGoWJNnSin8e
   A==;
X-CSE-ConnectionGUID: AhYLUKSxSuejI/XiLbZ7ew==
X-CSE-MsgGUID: +IEitlnTTRCYYmejWcJXcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91406256"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="91406256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:27:28 -0700
X-CSE-ConnectionGUID: xkvQ9tjhRKK4grwTocAM9w==
X-CSE-MsgGUID: UQOKVDkbQD2UsekamRH17A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="236306681"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:27:26 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: dylan_robinson@motu.com,
	michal.pecio@gmail.com
Cc: mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	stern@rowland.harvard.edu
Subject: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for isoc URBs
Date: Thu, 21 May 2026 18:27:12 +0300
Message-ID: <20260521152715.288995-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37898-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[motu.com,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 989485AA03D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


