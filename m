Return-Path: <linux-usb+bounces-30687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03681C6E283
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 993AA355004
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 11:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1903C350D5D;
	Wed, 19 Nov 2025 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDbesPcu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521A350A31
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550276; cv=none; b=LbNBRGAtZ9+lzr9FCas2fyMvGkdIM+DnnFbQoWWCQG4tJzNMItPGwzuTTwa8aTR07roo+o+HBxg2Lx7r/m2fh2X6MrLoXkSNK+pICLQSR4eFmLCNR/gqRVdP5kbKTxeISUs7FrCkjxyRI/2lUBpkKka+WnBDbydIcyF5xN+DFtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550276; c=relaxed/simple;
	bh=G7JunY/3iWsoDP1AL4Uu9VZnCup1j693fiMcSMDqWug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZUpMSsnRMGjEbxISHyzP2RvPDYo/+kkyv8IYKqnD/MMYLinYusajMFeTzLOeQP7BXk4qq7M1CQkc0O6idP0aOLKa1L8s696VbMc5boo0PHK6kQiBnGZDH1MKrStXPAOl6574vjMhgoGk+qQBZ9oSv05qALZSyDTDyu7N1Jpwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDbesPcu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso10490250a12.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550273; x=1764155073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jECqb7FpaGoNZmYZTTPNeoOaaYauInUDkmHh57LIczM=;
        b=dDbesPcuvxue7WMUgbtZcB7fENPmcsJYO5oP7rnq3aXOnGzg0jiDc151ubwRYbxbqR
         L6yE2KbZ+9KUfL89pBwWTb7fyZZL1n9vc+w6FxKsDHd3uUWKfQ9WOJsg7CFl3MWQ9Zlf
         g24QvPs5GtNKfoGkqw5e+zK+4H/6FELJI7HWXgQRs2xsWT54sdc/GrwoWh/Fa3p9iiXK
         i/I3Hmvxwod81m/OU0uQ3FomPh5wpM0lzrp/yE9LyHGV1BTop4IDepY0NF7bBzpjosYX
         /gMuAY2DcayDJTEcqD6HTYpYUgW9reDMF4lazuhOH00uoi+Pe/t80GflfLpbReOXkIDc
         cbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550273; x=1764155073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jECqb7FpaGoNZmYZTTPNeoOaaYauInUDkmHh57LIczM=;
        b=p1qao+RBHD0IBMxFaWIiO9LvvIYUT8xhnbxwE9ialsUU6WrcXUFZjJAzA7plDC+j0E
         hBuUBOgr3d++bS0ZEWfxYBArVefIhQv+3/jhjGVGghoNHHSJcFIwjFFybev9H5gL79Y4
         Asui4m4av/Oz2kNxbRXkZn75W2d59SxLwKkesNlyQTfaiiTmiXmYybnGFUPvPJUnyBrg
         JvguWix1oc08wPyu1hBnbsjaW55We9FdBgnfa7KCoYRKnum2Zp6JYJ6Luix9f6Pmmbjw
         MY/g+fQw7dxWan4ESKZLNqFXBA0nEUVtf0WVi2OpKXGN6VfEFu6Pp+MFJ5uwxi88VRTE
         TXgw==
X-Gm-Message-State: AOJu0YzMWq/riuyi6fhoJN5oWM9z1nkilPPqLh5n5pvyWCXX+QDWx+8t
	Yyv6tfYXEs22DFtSvbZtiZrXr+aNswgP6P7FVRy4QsjsOk7UAkyraCpE
X-Gm-Gg: ASbGncs0dWWYFidR9o7Verv6L0kaSSk15qd38ZbsdqZ6BSIwxxwCEGraUqh5HmLrkn9
	G3AxK/p8KVuEUdl86pG52eD7b7T7JqbOehFZq0yE0bt24FBVIbv4GmgIsVuA1+a3nk3xOHGkzKf
	g0O+pbz5AKTQy2wZyKrsNQ+dO709krcqQUgWDYiMOU59Aj+fEjYRlculV3+jMz52A8Gf/06PxAW
	/BUz8BbOnzmmy7jylvTIuFaZ9yqF7F2depyEMeazzYIQ7AaThdCH5gfBJwYecpwhkMfNQH3F6rD
	JgHcESvAURBh7/VwGhhZcLBTOgfiOY5YDuXmJVD8uPv7NtLu4nGEaXEFA3Tkp6IgwF2XX4UjHmd
	R/0wYMrbPDI+TYAuS6MNQsTIFoj3ElSoI3WkxMUnhM+oTtr7m0COOrWdZmIDVvDW22+G3bGHAMF
	66WdhN3ea4teFwmrTojr5g7RU=
X-Google-Smtp-Source: AGHT+IGAn8aA94Gjc6rB7edvmJijL47gT2Orqoh2HUXTMCcoqOAgk+7GqJFDZKDrLhN1hgbOGdfvkQ==
X-Received: by 2002:a05:6402:3506:b0:640:9b62:a8bb with SMTP id 4fb4d7f45d1cf-64350e89ad2mr17322636a12.22.1763550273047;
        Wed, 19 Nov 2025 03:04:33 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-644f13ff4d4sm5588048a12.12.2025.11.19.03.04.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Nov 2025 03:04:32 -0800 (PST)
Date: Wed, 19 Nov 2025 12:04:30 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] usb: xhci: Refactor and generalize trb_in_td()
Message-ID: <20251119120430.5e41bf74.michal.pecio@gmail.com>
In-Reply-To: <20251119120208.6a025eb0.michal.pecio@gmail.com>
References: <20251119120208.6a025eb0.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Replace the internal logic of trb_in_td() with a new one which works
on (virtual) TRB pointers instead of DMA addresses. Since driver data
structures use virtual pointers, the function and some of its callers
will be simplified. Optimize for common case of trb == end_trb.

Extract the implementation into a lower level trb_in_range() function
which works with arbitrary TRB ranges.

Create a new trb_in_td() as the obvious wrapper around trb_in_range().
Create a new dma_in_td() using xhci_dma_to_trb() and trb_in_td().

Update former trb_in_td() callers to use new functions appropriately.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 101 +++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 531e2f207b17..a2257e1dc396 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -113,6 +113,11 @@ static bool trb_is_link(union xhci_trb *trb)
 	return TRB_TYPE_LINK_LE32(trb->link.control);
 }
 
+static bool trb_on_seg(struct xhci_segment *seg, union xhci_trb *trb)
+{
+	return in_range((uintptr_t) trb, (uintptr_t) seg->trbs, TRB_SEGMENT_SIZE);
+}
+
 static bool last_trb_on_seg(struct xhci_segment *seg, union xhci_trb *trb)
 {
 	return trb == &seg->trbs[TRBS_PER_SEGMENT - 1];
@@ -304,54 +309,58 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 }
 
 /*
- * If the suspect DMA address is a TRB in this TD, this function returns that
- * TRB's segment. Otherwise it returns 0.
+ * Check if seg:trb is a TRB in the range between start_trb and end_trb, inclusive.
+ * If start_trb == end_trb, the range is one TRB, not the full ring. The range may
+ * cycle back and end in an earlier segment or on earlier TRB in start_trb segment.
  */
-static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
+static bool trb_in_range(struct xhci_hcd *xhci, union xhci_trb *start_trb, union xhci_trb *end_trb,
+			 struct xhci_segment *seg, union xhci_trb *trb)
 {
-	dma_addr_t start_dma;
-	dma_addr_t end_seg_dma;
-	dma_addr_t end_trb_dma;
-	struct xhci_segment *cur_seg;
+	struct xhci_segment *seg_other;
 
-	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
-	cur_seg = td->start_seg;
+	if (!trb || !seg)
+		return false;
 
-	do {
-		if (start_dma == 0)
-			return NULL;
-		/* We may get an event for a Link TRB in the middle of a TD */
-		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
-				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
-		/* If the end TRB isn't in this segment, this is set to 0 */
-		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
-
-		if (end_trb_dma > 0) {
-			/* The end TRB is in this segment, so suspect should be here */
-			if (start_dma <= end_trb_dma) {
-				if (suspect_dma >= start_dma && suspect_dma <= end_trb_dma)
-					return cur_seg;
-			} else {
-				/* Case for one segment with
-				 * a TD wrapped around to the top
-				 */
-				if ((suspect_dma >= start_dma &&
-							suspect_dma <= end_seg_dma) ||
-						(suspect_dma >= cur_seg->dma &&
-						 suspect_dma <= end_trb_dma))
-					return cur_seg;
-			}
-			return NULL;
-		}
-		/* Might still be somewhere in this segment */
-		if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
-			return cur_seg;
+	/* Typically end_trb is near trb in the same segment */
+	if (trb_on_seg(seg, end_trb))
+		return trb <= end_trb
+			/* must not start between trb and end_trb */
+			? !(trb < start_trb && start_trb <= end_trb)
+			/* must start between end_trb and trb */
+			: end_trb < start_trb && start_trb <= trb;
 
-		cur_seg = cur_seg->next;
-		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
-	} while (cur_seg != td->start_seg);
+	/* The range ends in other segment, easy if it starts here */
+	if (trb_on_seg(seg, start_trb))
+		return start_trb <= trb;
 
-	return NULL;
+	/* Walk segments and see if end_trb is reached before start_trb */
+	for (seg_other = seg->next; seg_other != seg; seg_other = seg_other->next) {
+		bool found_start = trb_on_seg(seg_other, start_trb);
+		bool found_end = trb_on_seg(seg_other, end_trb);
+
+		if (found_end)
+			return found_start ? end_trb < start_trb : true;
+
+		if (found_start)
+			return false;
+	}
+
+	xhci_err(xhci, "TRB range boundaries not on ring\n");
+	return false;
+}
+
+static bool trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
+			struct xhci_segment *seg, union xhci_trb *trb)
+{
+	return trb_in_range(xhci, td->start_trb, td->end_trb, seg, trb);
+}
+
+static bool dma_in_td(struct xhci_hcd *xhci, struct xhci_td *td, dma_addr_t dma)
+{
+	struct xhci_segment *seg;
+	union xhci_trb *trb = xhci_dma_to_trb(td->start_seg, dma, &seg);
+
+	return trb_in_td(xhci, td, seg, trb);
 }
 
 /*
@@ -1094,7 +1103,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 					 td->urb->stream_id);
 		hw_deq &= TR_DEQ_PTR_MASK;
 
-		if (td->cancel_status == TD_HALTED || trb_in_td(td, hw_deq)) {
+		if (td->cancel_status == TD_HALTED || dma_in_td(xhci, td, hw_deq)) {
 			switch (td->cancel_status) {
 			case TD_CLEARED: /* TD is already no-op */
 			case TD_CLEARING_CACHE: /* set TR deq command already queued */
@@ -1184,7 +1193,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
 		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
 		hw_deq &= TR_DEQ_PTR_MASK;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
-		if (trb_in_td(td, hw_deq))
+		if (dma_in_td(ep->xhci, td, hw_deq))
 			return td;
 	}
 	return NULL;
@@ -2843,7 +2852,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
 
-	if (td && td->error_mid_td && !trb_in_td(td, ep_trb_dma)) {
+	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_seg, ep_trb)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
@@ -2876,7 +2885,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				      td_list);
 
 		/* Is this a TRB in the currently executing TD? */
-		if (!trb_in_td(td, ep_trb_dma)) {
+		if (!trb_in_td(xhci, td, ep_seg, ep_trb)) {
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				/* this event is unlikely to match any TD, don't skip them all */
-- 
2.48.1

