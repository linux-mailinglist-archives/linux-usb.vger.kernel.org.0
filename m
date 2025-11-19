Return-Path: <linux-usb+bounces-30686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7180CC6E223
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E3334E6D7B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 11:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E593502B0;
	Wed, 19 Nov 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz3s5KyD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755F634F47E
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550236; cv=none; b=FeRtJe4kcXUagI4OCck9KkevX+1BGQNK2JVg8C3od/Zh0KBqr1T8CoEJczNqCAesn5bfxa+OjfMlvk8ufbDS12lL/DpeYQJKcpUrGmh2QM3iyPALmt3BzcQaYdLCliWh25yhP0c8g8iK5s/y1I/CzNRIIiqLVS1W2ILmOgnCv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550236; c=relaxed/simple;
	bh=4mSerw4vYazyDfgyl8j1CLDy2pYsgGbR8tF9bgVF6JA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPxOXqqbtAj/1Y7RJyeG69hhizcdMTXITvvpZrSZKYLd+6Ad+MIRI7HwAMEPbLCJwhVqtqnrAx5PAFni/uO5lpCNwWS1/T8Apaw9PoI8lPPFpifBMH6LtMMH0HwSq1r8ft7H2GM4fyQi/yaf+DJvSzvMy4AtxwwG9GZXsNtQ/jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz3s5KyD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73669bdcd2so917425166b.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 03:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550230; x=1764155030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdPiRm4LzogiWqW/lnu08ToTWmpvxJj4XqcowJynZMA=;
        b=Pz3s5KyDCiqAc6CmRV1sN6+hWcfnmA6cIwXzPUD+BKO83rwiZs1t/92Q1i1q3XBI8K
         ZvGT6kRHEW8p4Zmzg9IXIPczj51PMZqiRa5ums3FzJSmQe+SOHMvdZxMoyNoOrP7njFX
         V4PTlPiQqEpU5S26P0izNsPEhLanqfmuCvu0cn0zxHQIJYX8O+lygKZZeO3jUhwLIlHS
         ddhz8GXprusbXnLVUn8sNTI/E8qAPt/ZYxBwAXkuyRwQ0YYRBdibTOts6Mzf8xUYEwoA
         vn7RC7536ClWCBUCG6kqbBOkHRcfBLsCQP6JNB5ileUk6XyYL1zIN4spx1O1C7B9L5e0
         v63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550230; x=1764155030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EdPiRm4LzogiWqW/lnu08ToTWmpvxJj4XqcowJynZMA=;
        b=szD5sxFiUvqbZpaw7OuRjUMIsjuM5Kgr5VVtPpeC6Rxa+1iHuYUJ9ZTHWBLdk+k2N6
         N2I2SPZO5gCJfvd8BW4WhvYMhCtr3XsmFf+/guIDd9EYm6tBrDlTXoM64ae6EzA9/yAt
         SYKzWeBvcJwZgatxlnjKpBLrwuWhPwx18w+SYOcYQLAehzeoewtJz7NIoVcaBmW6VT7y
         xVUiPycSZc1kaAdzG7gOJo82imfK87BqIlpafohkPqXZeeYbYwiBvjM9VkFb46VtEwh+
         MV+e0FmRlstFZ86yTeqwZm9tBgZUnanMwZvMxsP7DQs09OEuDTJdnwlCc5ya4DKvOOGG
         Faag==
X-Gm-Message-State: AOJu0YwWGJdYKj4gwcjPP0+n2nIHPiFld00AIE/l66KB4EojvJeMZy1P
	XtPZoxnvLAm20Axn32ZTnki7uFXpit1h5IHtYZDuDOA57QPrv74VKvqg
X-Gm-Gg: ASbGncsmyZB2h2u2Ev8nlnRJMI9iSCOGh2KjQqsmu3XzWH8ENeyWFTM1usFMBYwZ+wq
	5Fr08EY8VMJoovnt0w4YZB6sDHgWL5pvW66cXP9/LmqYz9kkuEkd26WXrEv1Ux9a4p6ar/aNSWb
	zbDn6TRWGdlcFQwmNo9pq6XObGR1068VVlxBd2s7cbaIUSAcgUlNRN5Lpc3RtSKZqH+yvmQ/lBM
	kQyVHqh4e4MiS5quJoqgWQxHGhatwn+raeJvMHg9g+UH/aS3lEfKVWOcZ2NeFfQswBNuHRjqfWF
	2EiVKSvkCC8cTUU7+jSg7oaxfu00404p5ZW2FEn56EUtwPZd8GBCRe2KOhk9oFu1fXKVW6PjUpD
	gx7A+lTz6+FR0c1bVrsqHpvA4q5tlNZ7IzXN/fgRl4Q3vwN8g9g+xT5pHkcm+eRayXFhhzDQHqh
	uPMAbvCD/0Rz3IzDuQmizg6bw=
X-Google-Smtp-Source: AGHT+IFgyVTFepwmJ2y3kGahtWZuiVh3MxIYfoCeuZo+rnD6QUmtcBuWMQiB2ayc/7YdDXfEDMrrbg==
X-Received: by 2002:a17:906:b205:b0:b73:7a44:b4d5 with SMTP id a640c23a62f3a-b737a44b692mr1432516766b.41.1763550230496;
        Wed, 19 Nov 2025 03:03:50 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1617324866b.6.2025.11.19.03.03.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Nov 2025 03:03:50 -0800 (PST)
Date: Wed, 19 Nov 2025 12:03:47 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] usb: xhci: Find transfer TRB early in handle_tx_event()
Message-ID: <20251119120347.70a02fde.michal.pecio@gmail.com>
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

As soon as we find the transfer ring to which an event belongs, we can
proceed to locate the exact TRB referenced by the event. This enables
better event handling and diagnostics, even if no TD matches the event.

Also set 'ep_seg' and remove its secondary use as a temporary boolean.

Bail out if event TRB pointer is not NULL and not a transfer TRB on the
endpoint's ring. This indicates that either the HC executes TRBs from a
wrong ring (bad Set TR Dequeue command, Link TRB damaged or ignored by
the HC) or its internal state is corrupted and the event is bogus.

No such event is going to match any TD on td_list and trying to handle
it would generally do nothing. On an isochronous endpoint we might skip
all pending TDs and create more chaos. Just log this error and get out.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3d5124912a09..531e2f207b17 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -82,6 +82,27 @@ dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg,
 	return seg->dma + (segment_offset * sizeof(*trb));
 }
 
+/*
+ * Look up a TRB by its DMA address, return NULL if not found on the ring.
+ * Search from start_seg to let callers optimize starting point selection.
+ * Write actual segment containing returned TRB to seg_out, if provided.
+ */
+static union xhci_trb *xhci_dma_to_trb(struct xhci_segment *start_seg, dma_addr_t dma,
+					struct xhci_segment **seg_out)
+{
+	struct xhci_segment *seg;
+
+	xhci_for_each_ring_seg(start_seg, seg) {
+		if (in_range(dma, seg->dma, TRB_SEGMENT_SIZE)) {
+			if (seg_out)
+				*seg_out = seg;
+			return seg->trbs + (dma - seg->dma) / sizeof(seg->trbs[0]);
+		}
+	}
+
+	return NULL;
+}
+
 static bool trb_is_noop(union xhci_trb *trb)
 {
 	return TRB_TYPE_NOOP_LE32(trb->generic.field[3]);
@@ -2672,6 +2693,15 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (!ep_ring)
 		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
 
+	/* get the corresponding transfer TRB pointer */
+	ep_trb = xhci_dma_to_trb(ep_ring->deq_seg, ep_trb_dma, &ep_seg);
+	if (!ep_trb && ep_trb_dma) {
+		xhci_warn(xhci, "Ignoring '%s' event out of ring on slot %d ep %d\n",
+				xhci_trb_comp_code_string(trb_comp_code), slot_id, ep_index);
+		/* XXX: other ring's TDs may be executing on this EP, should we kill it? */
+		return 0;
+	}
+
 	/* Look for common error cases */
 	switch (trb_comp_code) {
 	/* Skip codes that require special handling depending on
@@ -2846,9 +2876,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				      td_list);
 
 		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(td, ep_trb_dma);
-
-		if (!ep_seg) {
+		if (!trb_in_td(td, ep_trb_dma)) {
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				/* this event is unlikely to match any TD, don't skip them all */
@@ -2931,7 +2959,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (ring_xrun_event)
 		return 0;
 
-	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
 
 	/*
-- 
2.48.1

