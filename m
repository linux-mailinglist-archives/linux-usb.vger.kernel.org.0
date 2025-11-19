Return-Path: <linux-usb+bounces-30685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3DC6E205
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F3B24E2999
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 11:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F102F34DCFE;
	Wed, 19 Nov 2025 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzRWnHon"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A234BA59
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550179; cv=none; b=YjMCMAdccak5gFV8IHLw/AH4qQqJ1uPIyQ0jgiLfp4OE8PvDJtx+dPnica2JV/sEafKdP/4sr9/T+i6qbCkX+sOCS29kIrhweHNO348/owThLvo1XguZVVPu+Vb25slxumKKiBYrmHDHOWexNjA/hmN6q3nb1y5hFd6u+S18WvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550179; c=relaxed/simple;
	bh=V0DYnRKMnrb8+bWaJoEpsdLkMGo2LxBu9YTMLIkbsPk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2yveGDE4Oa+giXJ2q7AvMav0XYVbX/i1QcbilJ2ZjeHOWa+HhRFYPRuXuHLUFZU2S1GQRHGNNl+2q/iYlpwJGf3iZRWlh6DK9PdA27gYiuYxe87Q8VNYfeD1wVI2jXY3NK8s3tvdfjcgliBvT+xKN2xtKg5WkTHuLWBFaySX6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzRWnHon; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so10262805a12.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 03:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550176; x=1764154976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxMv2kZg4qEx22u+xZ5qZqSeqxeWZf4xoX9x5+oSd88=;
        b=hzRWnHonYHccly/JadVVHf6Hab3MhVxLKybONX/30nvywd8TpwEX6dbQ4+tfEa71bK
         njzAnKUGFXoQI94TKshZz4eX0QN8jZ+O6p+lnXh9z5me676JB6a3SFVP0F5GnGfhB0uz
         RsCao5uRFoARLl1LwJws/2tg44d+TxIrLLuXgGzrA52gYvwguodh97WzVOktydmbzQ5q
         bYkVE0PbDmOQ1RVr13PGhAlsThUOx01JQw4FkqesAvnmHlCWTZ0RkGizyMQZpoxzxuQi
         EzLctDbHXt4pxfY9o5zCmHbSJwu3OIayKEoDvsTV1mqNOS8VESHJta/+imCN4j47uJeq
         qsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550176; x=1764154976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zxMv2kZg4qEx22u+xZ5qZqSeqxeWZf4xoX9x5+oSd88=;
        b=V/cfsRs0RtNhjlvJoxz7wu+GzqY/zoXXsmWSRTbZyu7zbU2hP+6lCB3R+bT39Dimj8
         B6ujWL260IpyIN+U+CSw4d05y3vr/J4asY0YvGR9F7MPySLgQZ3FJQUmqTP5/7Ms075r
         o2y+q8PbpovQbMm99zcurDCm32hxYQIk+1cBCIqOg1yVdYO7BiRdIVbpzMbxcvr0E+Fd
         NMvv0Xq5L84lKsdpUdp60itMcCdb0dlsjOyssul91uLlkoWVhaTR+LKPOdTM/XPIGs/O
         E9M+Cv8v6lUnfLHs2VZfd34nsNPaveTC5BSvKZi1mPGeNzumfUSXMwVELoedK6XQ0y2X
         kIHA==
X-Gm-Message-State: AOJu0YyCe9c431sFXIr43XZe+0bZY18AorWWrnDRwX8CaYDj0FRoXvTg
	0eQQUqTwI8f4A0Rm26ere0zLTqtjZaiESIuY0ZQRIfUkDnL7Vt5tQitY
X-Gm-Gg: ASbGncv1BVVKa6UIT9SJr1vKYx90Qwc4y5JsW29RHLd2Q/hFQdXTdqXCwv+l/MVGI/M
	eraO+0PEly9YmhhvjDHZ1NAJwvwyo5X6zy5XzHZhAZHxpMJ34g9Aw8duF7kKGdG6FSBqt3Jp4Dn
	kicLR5TAhU3PyvCfuEf/BHT3pkmVRfjyhj/RVA2VehXxRczVK8ukbcIYF7HyNUNngt34wr9gbpR
	AeaAwfwYX+hAEKgL8wvv6gaWAKAjvD/3JlzwggantowHUrjCHc6FDlfx5KFtTrPBw60hPf96Sar
	jsuOruLc1VktI4hhlpqrhRHNbSFdIKb1zRnOeMVkEZLVZm9sUSPhNxaZbumeELF8AyXI/k2EJ9/
	7KiLnud33J0fwarFDU25k932R7gBaBEGW4KbxmLsOgjul+Qo1y4QBXbpMvN0+umzW/b4TI4C6uX
	3KzqCTC3Mi69XdsBK5QOVurcqX/W7GceiZ5t6AIAniK0WY
X-Google-Smtp-Source: AGHT+IFc/TKsZa7xUbm2Wx9G077Nk+OerGKYYxWpHLbgIy+HjaQWP5BenLaKeSngCdU5CygLpBIVcg==
X-Received: by 2002:a17:906:6a06:b0:b73:8639:cd93 with SMTP id a640c23a62f3a-b738639d0ecmr1556659266b.14.1763550175592;
        Wed, 19 Nov 2025 03:02:55 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7359bfb238sm1517689666b.14.2025.11.19.03.02.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Nov 2025 03:02:55 -0800 (PST)
Date: Wed, 19 Nov 2025 12:02:52 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] usb: xhci: Track transfer ring dequeue progress
 properly
Message-ID: <20251119120252.74379adb.michal.pecio@gmail.com>
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

xHCI 4.9.2 has clear requirements regarding transfer ring management:

  Software uses the Dequeue Pointer to determine when a Transfer Ring
  is full. As it processes Transfer Events, it updates its copy of
  the Dequeue Pointer with the value of the Transfer Event TRB Pointer
  field. If advancing the Enqueue Pointer would make it equal to the
  Dequeue Pointer then the Transfer Ring is full and software shall
  wait for Transfer Events that will advance the Dequeue Pointer.

This and the first two rows of Table 4-2 in 4.6.9 imply that the xHC
is not required to atomically advance Dequeue to the next TRB after
completing one. The TRB referenced by latest event is still owned by
the xHC and not supposed to be reused for new transfers yet.

The driver allows such reuse and then worse. When a TD completes with
Short Packet, Dequeue is moved past remaining TRBs without waiting
for their completion. This opens them for reuse if it happens across
segment boundary and complicates handling events for those TRBs.

This is due to sloppy historic assumptions that Dequeue points to the
next TD to execute. Those assumptions stopped working when unlinking
was implemented and have been fully cleaned up last year. Dequeue is
now only used for free space tracking and in move_dequeue_past_td().

So let's fix this. When TD is given back, set Dequeue to the current
TRB pointer rather than past the TD. Future patch will also update
Dequeue when (and if) events are received for the remaining TRBs.

Note: updating Dequeue before giveback would break sum_trb_lengths().

Skipping moves Dequeue past the TD because it is triggered by events
outside the TD, so we know that the xHC has left it completely. That
being said, replace inc_deq() with next_trb() to ensure that Dequeue
doesn't get ahead of the xHC (and/or Enqueue) on Link TRBs.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index bf077cd13ffa..3d5124912a09 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -927,7 +927,7 @@ static void xhci_dequeue_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xh
 {
 	ring->dequeue = td->end_trb;
 	ring->deq_seg = td->end_seg;
-	inc_deq(xhci, ring);
+	next_trb(&ring->deq_seg, &ring->dequeue);
 
 	xhci_td_cleanup(xhci, td, ring, status);
 }
@@ -2229,8 +2229,8 @@ int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code)
 }
 
 static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
-		      struct xhci_ring *ep_ring, struct xhci_td *td,
-		      u32 trb_comp_code)
+		      struct xhci_ring *ep_ring, struct xhci_td *td, u32 trb_comp_code,
+		      struct xhci_segment *ep_seg, union xhci_trb *ep_trb)
 {
 	struct xhci_ep_ctx *ep_ctx;
 
@@ -2267,7 +2267,11 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		return; /* xhci_handle_halted_endpoint marked td cancelled */
 	}
 
-	xhci_dequeue_td(xhci, td, ep_ring, td->status);
+	/* update ring dequeue state */
+	ep_ring->deq_seg = ep_seg;
+	ep_ring->dequeue = ep_trb;
+
+	xhci_td_cleanup(xhci, td, ep_ring, td->status);
 }
 
 /* sum trb lengths from the first trb up to stop_trb, _excluding_ stop_trb */
@@ -2289,7 +2293,8 @@ static u32 sum_trb_lengths(struct xhci_td *td, union xhci_trb *stop_trb)
  */
 static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    struct xhci_ring *ep_ring,  struct xhci_td *td,
-			    union xhci_trb *ep_trb, struct xhci_transfer_event *event)
+			    struct xhci_segment *ep_seg, union xhci_trb *ep_trb,
+			    struct xhci_transfer_event *event)
 {
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
@@ -2373,7 +2378,7 @@ static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = requested;
 
 finish_td:
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb);
 }
 
 /*
@@ -2381,7 +2386,8 @@ static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
  */
 static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    struct xhci_ring *ep_ring, struct xhci_td *td,
-			    union xhci_trb *ep_trb, struct xhci_transfer_event *event)
+			    struct xhci_segment *ep_seg, union xhci_trb *ep_trb,
+			    struct xhci_transfer_event *event)
 {
 	struct urb_priv *urb_priv;
 	int idx;
@@ -2483,7 +2489,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb_length_set = true;
 		return;
 	}
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb);
 }
 
 static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
@@ -2511,7 +2517,8 @@ static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
  */
 static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 				 struct xhci_ring *ep_ring, struct xhci_td *td,
-				 union xhci_trb *ep_trb, struct xhci_transfer_event *event)
+				 struct xhci_segment *ep_seg, union xhci_trb *ep_trb,
+				 struct xhci_transfer_event *event)
 {
 	struct xhci_slot_ctx *slot_ctx;
 	u32 trb_comp_code;
@@ -2573,7 +2580,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = 0;
 	}
 
-	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
+	finish_td(xhci, ep, ep_ring, td, trb_comp_code, ep_seg, ep_trb);
 }
 
 /* Transfer events which don't point to a transfer TRB, see xhci 4.17.4 */
@@ -2941,11 +2948,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	/* update the urb's actual_length and give back to the core */
 	if (usb_endpoint_xfer_control(&td->urb->ep->desc))
-		process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
+		process_ctrl_td(xhci, ep, ep_ring, td, ep_seg, ep_trb, event);
 	else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
-		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
+		process_isoc_td(xhci, ep, ep_ring, td, ep_seg, ep_trb, event);
 	else
-		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
+		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_seg, ep_trb, event);
 	return 0;
 
 check_endpoint_halted:
-- 
2.48.1

