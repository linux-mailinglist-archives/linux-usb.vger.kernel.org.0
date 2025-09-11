Return-Path: <linux-usb+bounces-27949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C91B534E6
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 16:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5582E1734D1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 14:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFF0337688;
	Thu, 11 Sep 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ2AtMQK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F243375CD
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757599725; cv=none; b=uJkGSlNh0Ol0qSPgbDx6/aS8VyqSgQ6e1xA3wa7bzbJRnkRJ+4REGyN3dMRNrrRyVOixIgdWjl2qhVqnrtMi6xFWu6ioyAiMQzNBTA2ZuBlmvP8kvBgBhzAToaNBLTBj+CQD8NpZIHZj8BdhwBOCYQEe+cAWQF3xOnh0mtYIiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757599725; c=relaxed/simple;
	bh=mOLt+XGUrVj19AXzeQRFbEHbu7fcm3XZRuCyxtrI6Cw=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTOtJnARsGELilymgDlIzFDJ3zM5hWZzDtCdSgfiR63mH5BtZa0b99oI/f4aSPZIO+1QQvwAywTG/TiAX7bupmH/91yb5sxgASlZ6mVRSXURVKO07DhQqHyKhWJ9qbp5Cwp7gNQ/DgzxX4ie3kJQ/XOE/eG09TZd7ZU0u1m1+JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ2AtMQK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-337cc414358so5918621fa.3
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757599721; x=1758204521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7ikg4uEXf2zepRARGuys+VOvsS77v9Qe7k9flW+NsE=;
        b=TQ2AtMQKb4I3fai+WqFH+MVtgI3QiXx8qyo8311k5t6ggUl3Mu4xDATzoCTOO5ay1n
         pWNlWvqRJll2S10BmSYe3iYMVm8SqU8CI9XyhIhlAk0KML1AnFZMp96AeLJSfbBmwwcI
         7MrFhRgGPaP4+zoh0/QT/d7VOnaBRw0rq72oWeSjZQyB6ZW3lYHD0VBxS/HEMnlCZOiS
         6qN5nTfnI0k6SjtoqQmECwAZwtIBLw9++MvZKonKo8XvTFgL0ZaENHL0qYGbYf6SA7B0
         SHZGzcFDXJ+mXknyWjQXDjaSE9oedIxzFHksE0UJYvPPhRHfQ7W5w0S1og9EWXOAKbke
         J9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757599721; x=1758204521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7ikg4uEXf2zepRARGuys+VOvsS77v9Qe7k9flW+NsE=;
        b=ibhD4LsMdKYkSwDJnh71Fo9Vv8jiuJk3tIzAUJYv+6svePx0V8mxv9bN+yhWaSLhfu
         fpDgmxekH79xWQU95nSQ8NUwYfkxf+IBylXFZ/n+EYoapyiWFGzXLQsW3Kjs+W6rQ8rF
         cOWKWfQp7yc6O9xcBOhxsrUlaeiSMZ/BruNn4QOZRPtkOuUrG/+/jmoYsmVGWaT/GZ+H
         d02NzztYz/sqNeqBBKho5U5d1dMUfx2HR83uk2XkOeIuzuI1WoCuk6ZPc0geXTd2OrDw
         jqGWPBAlARopkg7lLZg4nPT1argWibNumgg0EePJ9hHcoVHpKIpvB52p2yZ+Z3Pv/KZo
         VOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrO1fFpMH8nAHNvRSeeOCEeec86Bdx5lyzXtwvnZhKsMJVmMyU8hVjk5UEDAFEAf2OLPOjYGxvLFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzObkayDnFmqSvI+9W9RaGWtwHePtQjQdGhHxEj23eLAE+y6rnU
	SzVKqI6drLLAGmW0BG5iLK1ERDjVE/4FT27Oc4dLqhnSvavqzpyT908u
X-Gm-Gg: ASbGncuC/jZc+TXo1vLvrPjKzIBioxB05Nib8L01reJ+Uc/1GVwd6pi2xbFrFTyJ4Nw
	uOWAtYTXl/vNS91Pl3GekLi2N8/eZLVYUDuXeWnAzyd18jwtR77sWbLoJGjfPMu39z5jERApMWD
	ZWGQi2EkkvpLjS3cPGp6chHbDvQD9SfJaBdLM4DSRxyTz2kiG8xcbifyAsPjTMFxnJZJXn6LF6r
	k6nxayY0tltg9rvO7TYKZr9RjjTpYzTpnsQOnZ1YljbSuj0V77rxE5bDzuBa2yZRDRrvhTvCiHm
	kk9W+ktkfsG9D+4jAfU1LckyBJQNA9chT7qcPj/HjvvBcit9ZKgUKZxo4SAj985uiq0RbuPjPFM
	3pdZQHoOg7uTYBoE2QGJIZbFXhkh0MVQ4MuA=
X-Google-Smtp-Source: AGHT+IFUfW3kaUwJF5BeUHILYWUbIJE4ip74vjat1+eebjQt5+pDDB2w5zXRfmUuz8JAPqpbow2Bdg==
X-Received: by 2002:a05:651c:2221:b0:336:c310:6ff9 with SMTP id 38308e7fff4ca-33b4dab7891mr48661971fa.19.1757599720885;
        Thu, 11 Sep 2025 07:08:40 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-350a153c10fsm342271fa.3.2025.09.11.07.08.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 11 Sep 2025 07:08:40 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:08:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: xhci: Clean up TD status passing
Message-ID: <20250911160836.57e1d159.michal.pecio@gmail.com>
In-Reply-To: <20250911160632.46245dc4.michal.pecio@gmail.com>
References: <20250911160632.46245dc4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xhci_td_cleanup() has a 'status' parameter, which determines completion
status of the URB if this happens to be the last TD to be given back.
Most callers simply pass td->status here.

One bogus case is skip_isoc_td(), which is called with status determined
by some TD which triggered skipping, not the one being skipped, and the
status is later ignored anyway because it's an isochronous URB.

All those parameters can be removed and td->status used automatically by
xhci_td_cleanup(). This makes the URB status policy immediately clear.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 34905c8dee25..e0814282732b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -870,10 +870,10 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	seg->bounce_offs = 0;
 }
 
-static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
-			    struct xhci_ring *ep_ring, int status)
+static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td, struct xhci_ring *ep_ring)
 {
 	struct urb *urb = NULL;
+	int status = td->status;
 
 	/* Clean up the endpoint's TD list */
 	urb = td->urb;
@@ -917,14 +917,13 @@ static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 }
 
 /* Give back previous TD and move on to the next TD. */
-static void xhci_dequeue_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xhci_ring *ring,
-			    u32 status)
+static void xhci_dequeue_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xhci_ring *ring)
 {
 	ring->dequeue = td->end_trb;
 	ring->deq_seg = td->end_seg;
 	inc_deq(xhci, ring);
 
-	xhci_td_cleanup(xhci, td, ring, status);
+	xhci_td_cleanup(xhci, td, ring);
 }
 
 /* Complete the cancelled URBs we unlinked from td_list. */
@@ -941,7 +940,7 @@ static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
 		if (td->cancel_status == TD_CLEARED) {
 			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ring, td->status);
+			xhci_td_cleanup(ep->xhci, td, ring);
 		} else {
 			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
@@ -1305,7 +1304,8 @@ static void xhci_kill_ring_urbs(struct xhci_hcd *xhci, struct xhci_ring *ring)
 	struct xhci_td *tmp;
 
 	list_for_each_entry_safe(cur_td, tmp, &ring->td_list, td_list) {
-		xhci_td_cleanup(xhci, cur_td, ring, -ESHUTDOWN);
+		cur_td->status = -ESHUTDOWN;
+		xhci_td_cleanup(xhci, cur_td, ring);
 	}
 }
 
@@ -1347,8 +1347,8 @@ static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci,
 	}
 
 	list_for_each_entry_safe(cur_td, tmp, &ep->cancelled_td_list, cancelled_td_list) {
-		ring = xhci_urb_to_transfer_ring(xhci, cur_td->urb);
-		xhci_td_cleanup(xhci, cur_td, ring, -ESHUTDOWN);
+		cur_td->status = -ESHUTDOWN;
+		xhci_td_cleanup(xhci, cur_td, xhci_urb_to_transfer_ring(xhci, cur_td->urb));
 	}
 }
 
@@ -1510,7 +1510,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			td->cancel_status = TD_CLEARED;
 			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
+			xhci_td_cleanup(ep->xhci, td, ep_ring);
 		} else {
 			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
@@ -2278,7 +2278,7 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	}
 
-	xhci_dequeue_td(xhci, td, ep_ring, td->status);
+	xhci_dequeue_td(xhci, td, ep_ring);
 }
 
 /* sum trb lengths from the first trb up to stop_trb, _excluding_ stop_trb */
@@ -2500,8 +2500,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
-static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
-			 struct xhci_virt_ep *ep, int status)
+static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xhci_ring *ep_ring)
 {
 	struct urb_priv *urb_priv;
 	struct usb_iso_packet_descriptor *frame;
@@ -2517,7 +2516,7 @@ static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	/* calc actual length */
 	frame->actual_length = 0;
 
-	xhci_dequeue_td(xhci, td, ep->ring, status);
+	xhci_dequeue_td(xhci, td, ep_ring);
 }
 
 /*
@@ -2822,7 +2821,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	if (td && td->error_mid_td && !trb_in_td(td, ep_trb_dma)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
-		xhci_dequeue_td(xhci, td, ep_ring, td->status);
+		xhci_dequeue_td(xhci, td, ep_ring);
 	}
 
 	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
@@ -2862,7 +2861,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
 
-				skip_isoc_td(xhci, td, ep, status);
+				skip_isoc_td(xhci, td, ep_ring);
 
 				if (!list_empty(&ep_ring->td_list)) {
 					if (ring_xrun_event) {
-- 
2.48.1

