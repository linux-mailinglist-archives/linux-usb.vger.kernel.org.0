Return-Path: <linux-usb+bounces-14190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BA9615CE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 428F9283BB6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AAA1CE6F9;
	Tue, 27 Aug 2024 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBRrB0Vk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD0126F1E
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724780941; cv=none; b=hh+mhpU2dxFazFklBX+I9SlP1PluL2G5oo5vCjF3K+FLsQyfVJfklaIe9eNfaCOpRb+htajhbIyzvnXCzncYonKVoXTlb//Nwbcwq6DJe4cZUmUsMhBkS3BEfWUsYFh/+41DOUSyXI1qFthCl99bAuFbNJG49eo6+9FXu2YiitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724780941; c=relaxed/simple;
	bh=x3ki8z+PVqilgsQNpCC4AANZUy4kOiNPhlf3z8v+zMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgECx8vob22pLmEj2XGjMRTihDE0ou8M1JtqWZg/CCVuRCtsU8f31K6i2xoeh9fqak1/7Ia2hYhzOpS0+aOxDpkoQmVvQn4n7MbAcpXzMIrH1mDh2yOiSoIrzXg3J5DDhX1K5D/OU0ezx+QkRvFNKUsNTKam1xtR+v+RQiYi8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBRrB0Vk; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5334e41c30bso6305004e87.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724780938; x=1725385738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjpxxAo35dHgSW7LwqUAtoBAZUT7VQh/LN/LjjD0fQw=;
        b=hBRrB0Vkt0jOh4Ugyv3egLh78X62bnyFghezN1DyqbZLJDBJZJKVSivN9mZjiX0bXu
         JE/4Qoh26pAPrNCfcamtwv1i7smwoMI1vec17oYjDNE4rsoNSSn44OrZY4w8+WQKBSwc
         WlU2OfwwCSKlTOdXjprborI6V9b5JQohsYUaYA9JGe5zOUP1Jnz0+fgs/7f1whQVXqKA
         KRECQpoatSkgLv2FrBuheSngrM5dL5JTVY/kxOxFlyC0m44tidD7gzAMy5o8ldbR4rnT
         gc4VCXztQFX/mPWeT9HNWiIAqRoT0OmCdxe7z9CHwRvsvsrPfSRwAi7rHWoUCVaZRLEW
         +2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724780938; x=1725385738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjpxxAo35dHgSW7LwqUAtoBAZUT7VQh/LN/LjjD0fQw=;
        b=AzQN1f66fPOHrL5ucDiwTkoRmwHBN6YJgxTjrFN8wRVb82XXraoKLdDrzMiRJUNljU
         bqRBksN4sZ8JwA26qlBkyIBY1Lj2rzy04Lxs99Fnr/jSsIuyHnIS51/UcM/m1m3WOcvz
         QUkAjsJ35QBLDo5jewBXAuL6iVsqoV7As792dspTYWgaikmVWVjxSeleXC02tF4Tf3pD
         H15IToh65UOwQgGdtqKH4DDhJS+NCEasGeJYKJ+I8Q5W4ixnc1WbS1b0m9ENX7MJ4NIa
         AqR7LmGiPrHKZpRTsPhNPG0wJ1YPGlVJKOnJrKild/sQb7Q2Y42YuK7TduhSChnrhCnz
         ExQw==
X-Gm-Message-State: AOJu0YxFkCKfT6GBwjKXpd0+FY/q9RsoKAIWvWqEcjAhspzNeh596sG0
	A7UKRte85eTbqwJG8a0X1KFA9qNQBzr5iyogKpXVGXFSkixE39I+
X-Google-Smtp-Source: AGHT+IHsOgwirv9eiiFT3rlYWLZ6MEFmhaYcOnecePmCwHkwkoC6owALE9NJZPDq6HhbCz1l5Yrfbg==
X-Received: by 2002:a05:6512:3c97:b0:530:e1f1:8dc9 with SMTP id 2adb3069b0e04-534387be5e5mr8898818e87.46.1724780937430;
        Tue, 27 Aug 2024 10:48:57 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea592a8sm1926757e87.137.2024.08.27.10.48.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:48:57 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:48:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 2/9] usb: xhci: Fix handling errors mid TD followed by other
 errors
Message-ID: <20240827194854.089ddf0d@foxbook>
In-Reply-To: <20240827194625.61be5733@foxbook>
References: <20240827194625.61be5733@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Some host controllers fail to produce the final completion event on an
isochronous TD which experienced an error mid TD. We deal with it by
flagging such TDs and checking if the next event points at the flagged
TD or at the next one, and completing the flagged TD if the latter.

This is not enough, because the next TD may be missed by the xHC. And
we need to do the check early, or errors on the next TD may confuse us.

If the next TD experiences a Missed Service Error, we will set the skip
flag on the endpoint and then attempt skipping TDs when yet another
event arrives. In such scenario, we ought to report the 'erorr mid TD'
transfer as such rather than skip it. We also need to detect that it is
there and in need of handling, despite never receiving a completion of
the subsequent TD. For this purpose, add a check for ep->skip flag and
move the whole error handling logic before the skipping logic.

Note that when we see both td->error_mid_td and ep->skip, they surely
must have been set in this order. Otherwise, skip flag would have been
cleared when the error mid TD was being handled.

Another problem case are Stopped Endpoint events. If we see one after
an error mid TD, we naively assume that it's a Forced Stopped Event
because it doesn't match the pending TD, even though it might actually
be a Stopped Event on the next TD, which we fail to recognize. This is
fixed similarly, by reordering erorr handling before FSE handling.

Lastly, error mid TD handling is reordered with last_td_was_short. This
is harmless, because these two cases are mutually exclusive - only one
can happen in any given execution of handle_tx_event().

And if we are here, add a FIXME comment on the last_td_was_short thing
because it's a wholly broken idea.

Tested on the NEC host and a USB camera with flaky cable. Dynamic debug
confirmed that Transaction Errors are sometimes seen, sometimes mid-TD,
sometimes followed by Missed Service. In such cases, they were finished
properly before skipping began.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 78 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e960609dcf51..401c34ff2260 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2798,8 +2798,39 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 		/* Is this a TRB in the currently executing TD? */
 		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
 
+		if (!ep_seg) {
+			/*
+			 * xhci 4.10.2 states isoc endpoints should continue
+			 * processing the next TD if there was an error mid TD.
+			 * So host like NEC don't generate an event for the last
+			 * isoc TRB even if the IOC flag is set.
+			 * xhci 4.9.1 states that if there are errors in mult-TRB
+			 * TDs xHC should generate an error for that TRB, and if xHC
+			 * proceeds to the next TD it should genete an event for
+			 * any TRB with IOC flag on the way. Other host follow this.
+			 * So this event might be for the next TD.
+			 */
+			if (td->error_mid_td &&
+			    !list_is_last(&td->td_list, &ep_ring->td_list)) {
+				struct xhci_td *td_next = list_next_entry(td, td_list);
+
+				/* Is this a TRB in the next queued TD? */
+				/* *OR* did we miss some TDs meanwhile? */
+				ep_seg = trb_in_td(xhci, td_next, ep_trb_dma, false);
+				if (ep_seg || ep->skip) {
+					/* give back previous TD, start handling new */
+					xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
+					ep_ring->dequeue = td->last_trb;
+					ep_ring->deq_seg = td->last_trb_seg;
+					inc_deq(xhci, ep_ring);
+					xhci_td_cleanup(xhci, td, ep_ring, td->status);
+					td = td_next;
+				}
+			}
+		}
+
 		if (!ep_seg) {
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				skip_isoc_td(xhci, td, ep, status);
@@ -2820,53 +2851,24 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 			/*
 			 * Some hosts give a spurious success event after a short
 			 * transfer. Ignore it.
+			 * FIXME xHCI 4.10.1.1: this should be freed now, not mid-TD
 			 */
 			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
 			    ep_ring->last_td_was_short) {
 				ep_ring->last_td_was_short = false;
 				return 0;
 			}
 
-			/*
-			 * xhci 4.10.2 states isoc endpoints should continue
-			 * processing the next TD if there was an error mid TD.
-			 * So host like NEC don't generate an event for the last
-			 * isoc TRB even if the IOC flag is set.
-			 * xhci 4.9.1 states that if there are errors in mult-TRB
-			 * TDs xHC should generate an error for that TRB, and if xHC
-			 * proceeds to the next TD it should genete an event for
-			 * any TRB with IOC flag on the way. Other host follow this.
-			 * So this event might be for the next TD.
-			 */
-			if (td->error_mid_td &&
-			    !list_is_last(&td->td_list, &ep_ring->td_list)) {
-				struct xhci_td *td_next = list_next_entry(td, td_list);
-
-				ep_seg = trb_in_td(xhci, td_next, ep_trb_dma, false);
-				if (ep_seg) {
-					/* give back previous TD, start handling new */
-					xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
-					ep_ring->dequeue = td->last_trb;
-					ep_ring->deq_seg = td->last_trb_seg;
-					inc_deq(xhci, ep_ring);
-					xhci_td_cleanup(xhci, td, ep_ring, td->status);
-					td = td_next;
-				}
-			}
-
-			if (!ep_seg) {
-				/* HC is busted, give up! */
-				xhci_err(xhci,
-					"ERROR Transfer event TRB DMA ptr not "
-					"part of current TD ep_index %d "
-					"comp_code %u\n", ep_index,
-					trb_comp_code);
-				trb_in_td(xhci, td, ep_trb_dma, true);
-
-				return -ESHUTDOWN;
-			}
+			/* HC is busted, give up! */
+			xhci_err(xhci,
+				"ERROR Transfer event TRB DMA ptr not "
+				"part of current TD ep_index %d "
+				"comp_code %u\n", ep_index,
+				trb_comp_code);
+			trb_in_td(xhci, td, ep_trb_dma, true);
+			return -ESHUTDOWN;
 		}
 
 		if (ep->skip) {
 			xhci_dbg(xhci,
-- 
2.43.0


