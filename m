Return-Path: <linux-usb+bounces-30689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD08C6E22C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 464402DC1E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 11:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A06F34DCE7;
	Wed, 19 Nov 2025 11:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwTfBbWa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DFA34CFB4
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550368; cv=none; b=KWt6zGAwrpTJBHwIUFAUP5VmidKa7gxZ47M0sX4H3vf7NAYsHtxnetYpHWLhVI+8hO2YBQZs5MNVl9f6dOF7s5yr6QjFGfs2KPAjEh1LjdFL4Hug/n9KGvqPggDiUfuqQ53WHzhIGgH1xf38MbWi330VxYi7A1rDyFYerNMVEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550368; c=relaxed/simple;
	bh=+2d51D44sRDt8eBybkvWwVZvcXIsPb6EJ/QSrTukauM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjeMmjzU0ncTYB7cz5zbNzG4EfZQvFc+q7kqvgGZ69oOa6wCc3rrQYgNZ/ROY/Tk4PH/ctsjALF/JqID8m/49xiww4KWQPu1BuZ+PrujiRlQQz0f1kbeAYKoaj3ZDWrL356hkon0yEDJI+LVYd1bGjmi6lzXvkRT5h7J1kM8ZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwTfBbWa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b71397df721so978937966b.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550364; x=1764155164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjhqYSqklyXctCvXY19E4xXbS28k7b49erlVOkL0uaU=;
        b=JwTfBbWaJw1pvaovYWi9cZnu+Kb7Ed6nng7fOE1u66mDATB0H9+GwCQgeyC+TguWNd
         6gRzqcPrPt5VJDspuuV3gZiirXAMRiKsK6aNZNEY52A0gDGyP7z4l/1pA3xzbD3AAQ/B
         z8jn0lVdXQbsgXnmAQPpztd1aGhM4XGChS8aa88ta0XITn09kdLGi//2S99FAvWUOxbK
         8H5LhwpasiYit6IALb/qGrRwmgSV+mwryCXgZEIJEjoP9XnBjzBa1Z8uBiduwaJ9dKCw
         LRATbvO2LsihU2E4VgUXHi447MCfYdvf7OdtGiMm6CiQr2HHiDgxdUG/c7U4qBeaeK1C
         m/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550364; x=1764155164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjhqYSqklyXctCvXY19E4xXbS28k7b49erlVOkL0uaU=;
        b=iOk3KC12Fffh8XTNtfbOZuAPbQU7+uiavzYRBtqKAofTiFwDaY4jGeDOWglYBj2Z50
         Psb0YHfU5gOpDSeDSmOOSLavvtSP5Ngo/pzjlvVYs1DwqAEMsHm6R4JuNz71P4SRhz0Q
         bpN1ZgfJ4aUKF/wtXgXycN+IMDE5MyDTdt+asUVZYEOUtJgieAxBRL5PE354qmTgmOVP
         cUOIR5mRmrpjad3FdqDPaZiLDmou6hl4dL/h4Y5DHEwYCXcqbvxzFJdAeshJ5CTisjfh
         QWgKLX5ymKNvi2jyLQ87GLXjDlFtGnUcrFicIARTbjtawziLYNyVt8xjtksYWhBdDIrQ
         9NQQ==
X-Gm-Message-State: AOJu0Yyt+Ls4OmIJN+532InyBbBwc5G4+wx1J8aGZpwicSZC7UQiiUtx
	tvxrwRVMdQhn1eb1FGr/Xk4l6wEzSXHYkeYEy8QaHkSqkRskwW5IwtKHhDpH1w==
X-Gm-Gg: ASbGncsB2R4+R2I70yA9i3/C4YcWl7iXL0YKwv8IAb0aqtJo2MPDcpHUCtwkZ5wBUm8
	mef6CBAFprNPchT+11ATrMmqzxA79Hrpw6E5mmoEFko7mZp4RiYdU+vFWPqoy76zOscvFZrrQnN
	falpNUCNnSH/cc5R/FAkBzmwe9tH4vv7uyXKFNaN4cdenMWSZMy5V0mslUlkPc6ObSlq4YkwGL5
	Y2RSMn71gx5cWYqjg/nUd9HVcLRDlLePY71WiBWoWdmJAT4c0kujlchZCZrEe7yLCSqqD0kl37p
	SJ7mQ48P+Ue+qydxN7lusNxVKUhV37gPLnp2KyaG2YMyz83Ye5iApRK0D0q90zXEcbCOWRt65Bg
	1plYkrpmxLJkI4L0CauS0Bug4Gjx7+7IU4o+sUqx2785VKBHnZwB36d1wkbGNVPjmrS/EiBgNr+
	7SenN5Gjh/Mcl8zgpYTE9HjMw=
X-Google-Smtp-Source: AGHT+IHTBHx15yNRGnMidAAcOO2NJhpnoMhv5pnLm2GpLTZ+cNsXO29k/8OCuAvMMM9Y/toDz1Chwg==
X-Received: by 2002:a17:907:fdcb:b0:b73:8757:68ad with SMTP id a640c23a62f3a-b7387577ab2mr1700356166b.47.1763550364225;
        Wed, 19 Nov 2025 03:06:04 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73783ef841sm1215393966b.46.2025.11.19.03.06.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Nov 2025 03:06:03 -0800 (PST)
Date: Wed, 19 Nov 2025 12:06:01 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] usb: xhci: Handle short transfers as "done TDs"
Message-ID: <20251119120601.77c46152.michal.pecio@gmail.com>
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

Short transfers (on any endpoint type) are similar to isochronous
errors mid TD - the TD can be given back, but we need to keep track
of xHC's progress through its TRBs and handle some more events. And
here too there are buggy HCs which don't generate expected events.

Reuse the "done TD" mechanism to also handle short transfers on all
endpoints other than control, which have some special requirements.
Done TD is more accurate than the previous code, because it matches
events with TDs by TRB pointers, not by completion codes alone.

Remove the SPURIOUS_SUCCESS quirk, as we can now detect missing end
TRB events automatically and reliably. Ensure that no xhci_dbg()
shows on every short transfer, which can be 8000 times per second.

The patch was tested on isochronous and bulk endpoints at FS/HS/SS
with several host controllers from various vendors. Behavior after
Short Packet mid TD varies:

1. NEC uPD720200 and Etron EJ168 ignore IOC on the last TRB.
2. Renesas uPD720202 and AMD Carrizo APU generate Success with
   residual equal to last TRB size.
3. Fresco Logic FL1100 generates Short Packet, residual as above.
4. Various ASMedia HCs and AMD Promontory generate Short Packet
   again with repeated residual, even if the last TRB is shorter.
5. VIA VL805 generates Success with zero residual.

No case of a Success with non-zero residual was observed, but commit
1530bbc6272d ("xhci: Add new short TX quirk for Fresco Logic host.")
says that some Fresco Logic hardware (FL1000?) does that.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-mtk.c  |  5 ----
 drivers/usb/host/xhci-pci.c  |  5 ----
 drivers/usb/host/xhci-ring.c | 51 +++++++++---------------------------
 drivers/usb/host/xhci.c      |  7 -----
 drivers/usb/host/xhci.h      |  3 +--
 5 files changed, 13 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 208558cf822d..d85f84e39291 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -454,11 +454,6 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
 
 	xhci->quirks |= XHCI_MTK_HOST;
-	/*
-	 * MTK host controller gives a spurious successful event after a
-	 * short transfer. Ignore it.
-	 */
-	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 	if (mtk->u2_lpm_disable)
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d292adc65e5a..bcfe45d23f17 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -454,11 +454,6 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
 		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042_XHCI) {
-		/*
-		 * try to tame the ASMedia 1042 controller which reports 0.96
-		 * but appears to behave more like 1.0
-		 */
-		xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 		xhci->quirks |= XHCI_BROKEN_STREAMS;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2b889caff0f5..a21d403305f1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2450,16 +2450,16 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
-		if (remaining) {
-			frame->status = short_framestatus;
-			sum_trbs_for_length = true;
+		/* check transfer completeness, some HCs may lie */
+		if (ep_trb == td->end_trb && !remaining) {
+			frame->status = 0;
 			break;
 		}
-		frame->status = 0;
-		break;
+		fallthrough;
 	case COMP_SHORT_PACKET:
 		frame->status = short_framestatus;
 		sum_trbs_for_length = true;
+		more_events = ep_trb != td->end_trb;	/* xHCI 4.10.1.1.2 */
 		break;
 	case COMP_BANDWIDTH_OVERRUN_ERROR:
 		frame->status = -ECOMM;
@@ -2547,6 +2547,8 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	struct xhci_slot_ctx *slot_ctx;
 	u32 trb_comp_code;
 	u32 remaining, requested, ep_trb_len;
+	/* Expect more events for this TD after short transfers before the last TRB */
+	bool more_events = false;
 
 	slot_ctx = xhci_get_slot_ctx(xhci, ep->vdev->out_ctx);
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
@@ -2568,6 +2570,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	case COMP_SHORT_PACKET:
 		td->status = 0;
+		more_events = ep_trb != td->end_trb;	/* xHCI 4.10.1.1.2 */
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
 		td->urb->actual_length = remaining;
@@ -2604,11 +2607,11 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = 0;
 	}
 
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb, false);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb, more_events);
 }
 
 /*
- * Process events for an already finished TD. See xHCI 4.9.1.
+ * Process events for an already finished TD. See xHCI 4.9.1 and 4.10.1.1.2.
  */
 static void process_done_td(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 				 struct xhci_segment *ep_seg, union xhci_trb *ep_trb,
@@ -2661,17 +2664,6 @@ static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_
 	return 0;
 }
 
-static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
-					   struct xhci_ring *ring)
-{
-	switch (ring->old_trb_comp_code) {
-	case COMP_SHORT_PACKET:
-		return xhci->quirks & XHCI_SPURIOUS_SUCCESS;
-	default:
-		return false;
-	}
-}
-
 /*
  * If this function returns an error condition, it means it got a Transfer
  * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
@@ -2733,11 +2725,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * transfer type
 	 */
 	case COMP_SUCCESS:
-		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0) {
-			trb_comp_code = COMP_SHORT_PACKET;
-			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td comp code %d\n",
-				 slot_id, ep_index, ep_ring->old_trb_comp_code);
-		}
 		break;
 	case COMP_SHORT_PACKET:
 		break;
@@ -2857,7 +2844,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	/*
 	 * Check if we are expecting more events for a "done" TD, which has been given back before
-	 * the xHC finished traversing all its TRBs, because it completed with an error.
+	 * the xHC finished traversing all its TRBs, because it completed short or with an error.
 	 */
 	if (ep_ring->done_end_trb) {
 		if (trb_in_range(xhci, ep_ring->dequeue, ep_ring->done_end_trb, ep_seg, ep_trb)) {
@@ -2880,8 +2867,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		if (trb_comp_code != COMP_STOPPED &&
 		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
-		    !ring_xrun_event &&
-		    !xhci_spurious_success_tx_event(xhci, ep_ring)) {
+		    !ring_xrun_event) {
 			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
 				  slot_id, ep_index);
 		}
@@ -2942,17 +2928,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				return 0;
 			}
 
-			/*
-			 * Some hosts give a spurious success event after a short
-			 * transfer or error on last TRB. Ignore it.
-			 */
-			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
-				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
-					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
-				ep_ring->old_trb_comp_code = 0;
-				return 0;
-			}
-
 			/* HC is busted, give up! */
 			goto debug_finding_td;
 		}
@@ -2972,8 +2947,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
-	ep_ring->old_trb_comp_code = trb_comp_code;
-
 	/* Get out if a TD was queued at enqueue after the xrun occurred */
 	if (ring_xrun_event)
 		return 0;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6da583c7778b..4e32cbe1c6b8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5473,13 +5473,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (get_quirks)
 		get_quirks(dev, xhci);
 
-	/* In xhci controllers which follow xhci 1.0 spec gives a spurious
-	 * success event after a short transfer. This quirk will ignore such
-	 * spurious event.
-	 */
-	if (xhci->hci_version > 0x96)
-		xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
-
 	if (xhci->hci_version == 0x95 && link_quirk) {
 		xhci_dbg(xhci, "QUIRK: Not clearing Link TRB chain bits");
 		xhci->quirks |= XHCI_LINK_TRB_QUIRK;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a1dd9ce5f8aa..e72eda6cee62 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1380,7 +1380,6 @@ struct xhci_ring {
 	unsigned int		bounce_buf_len;
 	enum xhci_ring_type	type;
 	union xhci_trb		*done_end_trb;
-	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
 };
 
@@ -1587,7 +1586,7 @@ struct xhci_hcd {
 #define XHCI_RESET_EP_QUIRK	BIT_ULL(1) /* Deprecated */
 #define XHCI_NEC_HOST		BIT_ULL(2)
 #define XHCI_AMD_PLL_FIX	BIT_ULL(3)
-#define XHCI_SPURIOUS_SUCCESS	BIT_ULL(4)
+#define XHCI_SPURIOUS_SUCCESS	BIT_ULL(4) /* Deprecated */
 /*
  * Certain Intel host controllers have a limit to the number of endpoint
  * contexts they can handle.  Ideally, they would signal that they can't handle
-- 
2.48.1

