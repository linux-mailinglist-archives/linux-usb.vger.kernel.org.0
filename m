Return-Path: <linux-usb+bounces-30688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C4C6E2B9
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 57E5734A99E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86477355057;
	Wed, 19 Nov 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv+oDTbg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F5352F96
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550331; cv=none; b=QgpQX4d8U7YbtOQ3TtRMG/RgP6B6PEYe0qsfaiOj/L2HWd8WVW13QWHMrTdTdNO26sNgZWoK21NspJaMThUvCoKtlQZkyXLwqCpVUENEToYPFYIAa1x/5HLTbm/AvKXeKug9OaIXhqqSPtwT40E8fyBKrFiglQXlvOizKMgJPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550331; c=relaxed/simple;
	bh=ZZlMYEL4UcoCzWKCh7+jEM7X2xcMYZBm/2G+suCYUWA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cnYifAMCzRU+jc5ydxkI/MtqOPBV3fuIChiUvFi2u8IL4dTi62TJFKJIQj5h4T+A5wm0R9A//jFws78+vs2T7/bwrzJwxEQmZtxex4gWY4X7DkIwgVsdqBOsWTsqVUen4qtkyIELagPjsimBgxUWSnmgIdQgBgmTtlktntMhES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv+oDTbg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7291af7190so954292166b.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550324; x=1764155124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2r3ybB/cy39+Bu51zs1AfwKD0YYeIolsm0blPv0hSA=;
        b=lv+oDTbgFdwuK37WwCmQ8t+i87fMV97ZseEEsSWR6d3i+BKB6cK1WtUoh8n7g9YZXc
         ko0YSNYxVUg/DCwRIOonVMPwPJv3nbqJqT0W2DicQGMtpyWBg2JTtcdXMXenptC7v8MR
         cBf/5JSRUEMDcBensGmeP78l77TFRDC6lJX2553rcZFID5lgSu5kNVki6AIkoo7Yyerp
         Mhk11na11IubK1a1XQQbN82CxFZpD/iSG8NnBxbiayDZUgapd5LXDzsh/bCmok7GLDA3
         oI3my9TQ8zptlU04+OOwwSVEJybp1LkRLEe8UhV1v5aCbbJBquP0fuViSXmnYetiq3L/
         UkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550324; x=1764155124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2r3ybB/cy39+Bu51zs1AfwKD0YYeIolsm0blPv0hSA=;
        b=Wly514St8700SV1Vp7Qbxzgl75KDifcgYwslzc1mjBYzqJcHwtIiJ2C+5Ca655gOjw
         mJyPj4TAf5/XST1JbSnpS3yZSR9+J9wqzFFdZqQTfVD89nqIjrNnCu/kXy4mLz9JewWn
         +TE64X8ALy/et0gUrGxR82wGj+Ee3P8qZY3axF2PQX7SqSD+cWwk0NlxrWXokw2+KR+P
         dXDKQUT/5dJ6MFnk4lmLd+YeDp6JPVVyyC0dwRMBQ34Vnu1TEPM4zpst1cJ6K9sM6FYl
         U5JWMJQkcXle607g6YmQyY5+A0WfFUZDpSFJQDyryiVavmAQu+xGc3ctJIVgM5asGWHm
         fPvQ==
X-Gm-Message-State: AOJu0Ywde0k5npZP06Sl1o0+5xZivaZK1xfdjR6ZChgRvEzkWaZlsiMI
	gTtVj6yGDcXfgsZWPEgi918f5H5eJbKc1zP08/neWwJALx5sQLgK85zZ
X-Gm-Gg: ASbGncvikuJfKPkqjrL5+hYjbZjKOkeNTLzwTgXkS/KnbkhIu8Ir0dRh4yGeiqENn2Z
	IyoorH0GwXITovoJ6S94/9cXoiccQ30NjQKBv41wC+tQPXQnpD54cSWavn3JFlP+lhyBasNDdZ+
	QHYgf+E10lZFU3yl3ceb84OJgJYQq/+ciZvJXJHYCc95CTBDbRKErs6Zuuw4zkrtJgdQrsogVbM
	TsDDUg+lHbHGlq4DuN/Dm8MH/Jw6bgu0SpI8AQbqKUVtSyYzdoEibf7w9Ptc0+Q+xMCKiphdIEV
	q2PTKhvQa5tny4X1qQoUah5IfmK+J97OYoJmXe9AWjWP4kezpibT7cWIgXtu94HrcfkzIsJ7Br0
	8wuG8KrtG9qa3WCeLBo57SRzH6tAktidHvzy8dAw7l3y6VBOOh3Koe12nGC4Tz+oCjlKL2QUzXw
	OS2/9WQnf17huo4zQGk3Q4WV8=
X-Google-Smtp-Source: AGHT+IEw5t/eIx5bVX1xsnAa+zaDwgtTnfVs0G0iRtj0eD3+nJI5zrqG9M+9zwSEwsT23oCUk2bCQw==
X-Received: by 2002:a17:907:7fa5:b0:b73:75ea:febf with SMTP id a640c23a62f3a-b7637a128afmr200845966b.55.1763550323812;
        Wed, 19 Nov 2025 03:05:23 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad45afsm1599924766b.24.2025.11.19.03.05.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Nov 2025 03:05:23 -0800 (PST)
Date: Wed, 19 Nov 2025 12:05:20 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] usb: xhci: Reduce error mid TD latency with a new "done
 TD" mechanism
Message-ID: <20251119120520.7827bfa7.michal.pecio@gmail.com>
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

No data transfer will occur after an error mid TD, so the TD can be
given back to class driver without waiting for the final completion
event. This reduces latency, particularly on buggy HCs from vendors
like NEC or ASMedia which ignore the IOC flag after errors, making
the TD wait until next ESIT to be given back.

Since we can no longer expect the 'xhci_td' to stay around after it
is given back, copy minimum metadata to 'ep_ring' which will enable
recognition of subsequent events for the done TD. Existing solution
with trb_in_td() proved very effective, so use a similar mechanism.

Also take over handling out-of-spec Etron events, because we can do
it more accurately than the previous implementation.

We no longer need to handle Missed Service Errors with NULL 'ep_trb'
for the sake of TDs stuck in error mid TD state, so drop that.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 116 +++++++++++++++++++----------------
 drivers/usb/host/xhci.h      |   2 +-
 2 files changed, 64 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a2257e1dc396..2b889caff0f5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1542,6 +1542,8 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			 */
 			ep_ring->deq_seg = ep->queued_deq_seg;
 			ep_ring->dequeue = ep->queued_deq_ptr;
+			/* If we were waiting for a done TD, we aren't anymore */
+			ep_ring->done_end_trb = NULL;
 		} else {
 			xhci_warn(xhci, "Mismatch between completed Set TR Deq Ptr command & xHCI internal state.\n");
 			xhci_warn(xhci, "ep deq seg = %p, deq ptr = %p\n",
@@ -2260,7 +2262,7 @@ int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code)
 
 static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		      struct xhci_ring *ep_ring, struct xhci_td *td, u32 trb_comp_code,
-		      struct xhci_segment *ep_seg, union xhci_trb *ep_trb)
+		      struct xhci_segment *ep_seg, union xhci_trb *ep_trb, bool more_events)
 {
 	struct xhci_ep_ctx *ep_ctx;
 
@@ -2300,6 +2302,9 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	/* update ring dequeue state */
 	ep_ring->deq_seg = ep_seg;
 	ep_ring->dequeue = ep_trb;
+	/* td is done and going away, but it may still get more events */
+	if (more_events)
+		ep_ring->done_end_trb = td->end_trb;
 
 	xhci_td_cleanup(xhci, td, ep_ring, td->status);
 }
@@ -2408,7 +2413,7 @@ static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = requested;
 
 finish_td:
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb, false);
 }
 
 /*
@@ -2426,6 +2431,11 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	bool sum_trbs_for_length = false;
 	u32 remaining, requested, ep_trb_len;
 	int short_framestatus;
+	/* Expect more events for this TD after certain events before the last TRB */
+	bool more_events = false;
+	/* On Etron SuperSpeed endpoints some errors on any TRB trigger more events */
+	bool etron_ss_bug = xhci->quirks & XHCI_ETRON_HOST &&
+				td->urb->dev->speed == USB_SPEED_SUPER;
 
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
 	urb_priv = td->urb->hcpriv;
@@ -2440,9 +2450,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
-		/* Don't overwrite status if TD had an error, see xHCI 4.9.1 */
-		if (td->error_mid_td)
-			break;
 		if (remaining) {
 			frame->status = short_framestatus;
 			sum_trbs_for_length = true;
@@ -2462,14 +2469,12 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		fallthrough;
 	case COMP_ISOCH_BUFFER_OVERRUN:
 		frame->status = -EOVERFLOW;
-		if (ep_trb != td->end_trb)
-			td->error_mid_td = true;
+		more_events = ep_trb != td->end_trb || etron_ss_bug;	/* xHCI 4.9.1 */
 		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		frame->status = -EXDEV;
 		sum_trbs_for_length = true;
-		if (ep_trb != td->end_trb)
-			td->error_mid_td = true;
+		more_events = ep_trb != td->end_trb;	/* xHCI 4.11.2.5.2, no Etron bug */
 		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
@@ -2478,8 +2483,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_USB_TRANSACTION_ERROR:
 		frame->status = -EPROTO;
 		sum_trbs_for_length = true;
-		if (ep_trb != td->end_trb)
-			td->error_mid_td = true;
+		more_events = ep_trb != td->end_trb || etron_ss_bug;	/* xHCI 4.9.1 */
 		break;
 	case COMP_STOPPED:
 		sum_trbs_for_length = true;
@@ -2501,9 +2505,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	}
 
-	if (td->urb_length_set)
-		goto finish_td;
-
 	if (sum_trbs_for_length)
 		frame->actual_length = sum_trb_lengths(td, ep_trb) +
 			ep_trb_len - remaining;
@@ -2512,14 +2513,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 	td->urb->actual_length += frame->actual_length;
 
-finish_td:
-	/* Don't give back TD yet if we encountered an error mid TD */
-	if (td->error_mid_td && ep_trb != td->end_trb) {
-		xhci_dbg(xhci, "Error mid isoc TD, wait for final completion event\n");
-		td->urb_length_set = true;
-		return;
-	}
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb, more_events);
 }
 
 static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
@@ -2610,7 +2604,34 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = 0;
 	}
 
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb, false);
+}
+
+/*
+ * Process events for an already finished TD. See xHCI 4.9.1.
+ */
+static void process_done_td(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
+				 struct xhci_segment *ep_seg, union xhci_trb *ep_trb,
+				 u32 trb_comp_code)
+{
+	switch (trb_comp_code) {
+	case COMP_STOPPED:
+	case COMP_STOPPED_LENGTH_INVALID:
+	case COMP_STOPPED_SHORT_PACKET:
+		/* stopped events don't terminate the TD */
+		break;
+	default:
+		/* clear done TD if this is the final event */
+		if (ep_trb == ep_ring->done_end_trb)
+			ep_ring->done_end_trb = NULL;
+		else	/* unexpected */
+			xhci_dbg(xhci, "Done TD '%s' before end_trb\n",
+					xhci_trb_comp_code_string(trb_comp_code));
+	}
+
+	/* release TRBs completed by the xHC */
+	ep_ring->deq_seg = ep_seg;
+	ep_ring->dequeue = ep_trb;
 }
 
 /* Transfer events which don't point to a transfer TRB, see xhci 4.17.4 */
@@ -2646,11 +2667,6 @@ static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
 	switch (ring->old_trb_comp_code) {
 	case COMP_SHORT_PACKET:
 		return xhci->quirks & XHCI_SPURIOUS_SUCCESS;
-	case COMP_USB_TRANSACTION_ERROR:
-	case COMP_BABBLE_DETECTED_ERROR:
-	case COMP_ISOCH_BUFFER_OVERRUN:
-		return xhci->quirks & XHCI_ETRON_HOST &&
-			ring->type == TYPE_ISOC;
 	default:
 		return false;
 	}
@@ -2800,15 +2816,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		/*
-		 * When encounter missed service error, one or more isoc tds
-		 * may be missed by xHC.
-		 * Set skip flag of the ep_ring; Complete the missed tds as
-		 * short transfer when process the ep_ring next time.
+		 * One or more isoc TDs were missed by the xHC and ep_trb points to the
+		 * last missed TD, or it may be NULL. Flag the endpoint and run skipping
+		 * now if we know the missed TDs or leave them to be skipped later.
+		 * See xHCI 4.10.3.2, note differences between spec rev 1.0 and later.
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
 			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
-			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
+			 slot_id, ep_index, ep_trb ? ", skip now" : "");
+		if (!ep_trb)
+			return 0;
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
@@ -2838,29 +2856,21 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	}
 
 	/*
-	 * xhci 4.10.2 states isoc endpoints should continue
-	 * processing the next TD if there was an error mid TD.
-	 * So host like NEC don't generate an event for the last
-	 * isoc TRB even if the IOC flag is set.
-	 * xhci 4.9.1 states that if there are errors in mult-TRB
-	 * TDs xHC should generate an error for that TRB, and if xHC
-	 * proceeds to the next TD it should genete an event for
-	 * any TRB with IOC flag on the way. Other host follow this.
-	 *
-	 * We wait for the final IOC event, but if we get an event
-	 * anywhere outside this TD, just give it back already.
+	 * Check if we are expecting more events for a "done" TD, which has been given back before
+	 * the xHC finished traversing all its TRBs, because it completed with an error.
 	 */
-	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
-
-	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_seg, ep_trb)) {
-		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
-		xhci_dequeue_td(xhci, td, ep_ring, td->status);
+	if (ep_ring->done_end_trb) {
+		if (trb_in_range(xhci, ep_ring->dequeue, ep_ring->done_end_trb, ep_seg, ep_trb)) {
+			process_done_td(xhci, ep_ring, ep_seg, ep_trb, trb_comp_code);
+			return 0;
+		}
+		/*
+		 * Some HCs don't generate these events and silently move forward. We get an event
+		 * for the next TD, or maybe Missed Service or Ring Underrun. Handle it normally.
+		 */
+		ep_ring->done_end_trb = NULL;
 	}
 
-	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
-		return 0;
-
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 485ea7fc0433..a1dd9ce5f8aa 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1314,7 +1314,6 @@ struct xhci_td {
 	struct xhci_segment	*bounce_seg;
 	/* actual_length of the URB has already been set */
 	bool			urb_length_set;
-	bool			error_mid_td;
 };
 
 /*
@@ -1380,6 +1379,7 @@ struct xhci_ring {
 	unsigned int		num_trbs_free; /* used only by xhci DbC */
 	unsigned int		bounce_buf_len;
 	enum xhci_ring_type	type;
+	union xhci_trb		*done_end_trb;
 	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
 };
-- 
2.48.1

