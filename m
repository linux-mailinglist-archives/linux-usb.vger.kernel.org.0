Return-Path: <linux-usb+bounces-30191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9DC3F575
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 11:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84AAC3AB2C7
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 10:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2BD2FD1B1;
	Fri,  7 Nov 2025 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hci9UXQa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D242DC33D
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510126; cv=none; b=dmoDpp3fUVsvprGCzQ7ZdyV9rHoE1sk4m6Kq2SRoXPu10yzE734Cs9jU2saIKw7IkhFOTbWx9loE7ypTzYjW1sGGOqSc2O6OPAFQomWqtlKLfrqds49fZXfCJT7ZmW4nERZpIwi9WXctyF78z0D4I3M2Bpm85YNGJ6vr+3t0fd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510126; c=relaxed/simple;
	bh=7Y2CqIaQTvHSqDioWx6fdpKSnjpXozl6yC8+SNHwrNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mxIolS4+A+vuIUnKNT7QyvikeLB+x18P4B5ZxfMV+UbRofTqjo3brHOjJZUNrhTNMEx10hmLMqeuxy7c1AHNUVrkxPXiyuIAWAJK+S9MGO6HJ/wZG066C3iwNzkxO2pPlscBIdi7UvOxWDl6AtC+HEdzc9nPoW5qLg/Mk6JiiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hci9UXQa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so1082600a12.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 02:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762510122; x=1763114922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/T5ZL5ZUM3ZTHx5g9Obu8aj3FYGAeWtndV+CEH9cdc=;
        b=hci9UXQaeNde6vLbFbjpIJeV9DLY3h6m7LiZ0r49cA2vRkWyZjTLGk95sWrgLUZvko
         arx5QDDFrYvumcUK9YBQ0/UwGXDOEa5azo1mHqi6KrDD9pDS7TxyloHx6I3wKrRPZi+S
         hVkB8AT400sgnfbaZLoCGO8Qf4p0fDjwSJfXXwEBo1k9aipxveI4CQQERkYc0c9LKjJF
         WJLODmBnKhzCgRZUXfjx8LsVUlBkZAtElIue+/U8A15gWFZMAiLJtCNwO+XmLCg1rXIz
         QeXzPuXdB+mUyPZf418VSUgM19hUSo6IlkzRmd6Q+pKSMt92FbFHdq0+xmjt+n/8cnWe
         2COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510122; x=1763114922;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/T5ZL5ZUM3ZTHx5g9Obu8aj3FYGAeWtndV+CEH9cdc=;
        b=Z2jc//Hmbc7aF+9CC+InmsFN4RoOgJY7aDnGWkhNs+Q+dE+Tm32N1lSOXDE/oeB1/i
         1IHeFeUkhxbJgQ+4E/9zEeNQPMVpcdsb71k2lB3SglToS+zQ8UG1cEZHidSFyqhaYedG
         hoMNNp8Jt5mxKVDV/h336O4ziJ/5Ymyj1ultahbbqiG9YbvLabgSeHA7ebGfxFnhvpdf
         5YF1bPfMiCnuK7vjPXmhy0sVrxZ0Ibrwd/8QJvWhThyCU2/pcv3NGmtSWZ7lFH+ogzfZ
         1/VjPUT+ocLztSK/kSHUSZJgBnSueXm0K7pKOq/U9zFr47PLXv/NeDdMGWdnOC/kfBLk
         piog==
X-Gm-Message-State: AOJu0Yz3O34GhIHFUBg4vZokq5WrVs+/oFpkKa4DSbd2ZNIQcqma53LO
	gsQQLDui0WYMF4mOZkJGrVzf7SHS0mILl0Xc3xwnYJ/4u4urmWUhmrl2
X-Gm-Gg: ASbGncuqEtzKt8HMrVwyofq7PYpX8QjAF7lF5oU7UUQBz/jg/3xX8Oe8hw4p4FzP9e5
	eBCctWRXHuuAxrF1Q9mz2rBTNMclSJTJzrDOve5fRuwVz2YBUtKOP7PEVr/QP+HKktkLTjk4a/G
	Mo22Kx0zjgtP5DRkKu0P5bWEe+YiIxQ0BV/tQzDjuF/8fQ+b9Mv5vLTrZ181qDwLsa8tSzrHvtD
	IDJEUVc5/ZeKiC7paA/xLAVh3h4pSQye+akDMlBAn+uUvUow7564EbL8y15RrWhUly6RJxDtQDv
	jzR7Iqs/+fkmXC+jMX5zEc7ywsLz0/Ez/oaXOY0IVsK19NOPxuWGnN0xeEcQmP/KLaDLTMEEycw
	n7K/VdL927Dglu/NJ8ZKLdfUqhB2r1rtnN+vwRqGPsBDEH9EEbkydCymmvLftA++ahIjhNgk8ro
	SlO+0Y9rkYsXaAgg==
X-Google-Smtp-Source: AGHT+IFUbBUcCK13yeA0k8qhq4r3gnoVR9oHPMnyYIO0T9X3b3cXg8FejWBAQz57kfQRPAuIhT9Bbw==
X-Received: by 2002:a17:907:987:b0:b70:30c8:c35 with SMTP id a640c23a62f3a-b72c0dab9bemr224682466b.62.1762510122350;
        Fri, 07 Nov 2025 02:08:42 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be184sm199997866b.56.2025.11.07.02.08.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 07 Nov 2025 02:08:41 -0800 (PST)
Date: Fri, 7 Nov 2025 11:08:37 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Don't unchain link TRBs on quirky HCs
Message-ID: <20251107110837.7b7d686b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Some old HCs ignore transfer ring link TRBs whose chain bit is unset.
This breaks endpoint operation and sometimes makes it execute other
ring's TDs, which may corrupt their buffers or cause unwanted device
action. We avoid this by chaining all link TRBs on affected rings.

Fix an omission which allows them to be unchained by cancelling TDs.

The patch was tested by reproducing this condition on an isochronous
endpoint (non-power-of-two TDs are sometimes split not to cross 64K)
and printing link TRBs in trb_to_noop() on good and buggy HCs.

Actual hardware malfunction is rare since it requires Missed Service
Error shortly before the unchained link TRB, at least on NEC and AMD.
I have never seen it after commit bb0ba4cb1065 ("usb: xhci: Apply the
link chain quirk on NEC isoc endpoints"), but it's Russian roulette
and I can't test all affected hosts and workloads. Fairly often MSEs
happen after cancellation because the endpoint was stopped.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a9e468ea19c5..fc0043ca85a4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -128,11 +128,11 @@ static void inc_td_cnt(struct urb *urb)
 	urb_priv->num_tds_done++;
 }
 
-static void trb_to_noop(union xhci_trb *trb, u32 noop_type)
+static void trb_to_noop(union xhci_trb *trb, u32 noop_type, bool unchain_links)
 {
 	if (trb_is_link(trb)) {
-		/* unchain chained link TRBs */
-		trb->link.control &= cpu_to_le32(~TRB_CHAIN);
+		if (unchain_links)
+			trb->link.control &= cpu_to_le32(~TRB_CHAIN);
 	} else {
 		trb->generic.field[0] = 0;
 		trb->generic.field[1] = 0;
@@ -465,7 +465,7 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 		xhci_dbg(xhci, "Turn aborted command %p to no-op\n",
 			 i_cmd->command_trb);
 
-		trb_to_noop(i_cmd->command_trb, TRB_CMD_NOOP);
+		trb_to_noop(i_cmd->command_trb, TRB_CMD_NOOP, false);
 
 		/*
 		 * caller waiting for completion is called when command
@@ -797,13 +797,18 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
  * (The last TRB actually points to the ring enqueue pointer, which is not part
  * of this TD.)  This is used to remove partially enqueued isoc TDs from a ring.
  */
-static void td_to_noop(struct xhci_td *td, bool flip_cycle)
+static void td_to_noop(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			struct xhci_td *td, bool flip_cycle)
 {
+	bool unchain_links;
 	struct xhci_segment *seg	= td->start_seg;
 	union xhci_trb *trb		= td->start_trb;
 
+	/* link TRBs should now be unchained, but some old HCs expect otherwise */
+	unchain_links = !xhci_link_chain_quirk(xhci, ep->ring ? ep->ring->type : TYPE_STREAM);
+
 	while (1) {
-		trb_to_noop(trb, TRB_TR_NOOP);
+		trb_to_noop(trb, TRB_TR_NOOP, unchain_links);
 
 		/* flip cycle if asked to */
 		if (flip_cycle && trb != td->start_trb && trb != td->end_trb)
@@ -1091,16 +1096,16 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 						  "Found multiple active URBs %p and %p in stream %u?\n",
 						  td->urb, cached_td->urb,
 						  td->urb->stream_id);
-					td_to_noop(cached_td, false);
+					td_to_noop(xhci, ep, cached_td, false);
 					cached_td->cancel_status = TD_CLEARED;
 				}
-				td_to_noop(td, false);
+				td_to_noop(xhci, ep, td, false);
 				td->cancel_status = TD_CLEARING_CACHE;
 				cached_td = td;
 				break;
 			}
 		} else {
-			td_to_noop(td, false);
+			td_to_noop(xhci, ep, td, false);
 			td->cancel_status = TD_CLEARED;
 		}
 	}
@@ -1125,7 +1130,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 				continue;
 			xhci_warn(xhci, "Failed to clear cancelled cached URB %p, mark clear anyway\n",
 				  td->urb);
-			td_to_noop(td, false);
+			td_to_noop(xhci, ep, td, false);
 			td->cancel_status = TD_CLEARED;
 		}
 	}
@@ -4273,7 +4278,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	urb_priv->td[0].end_trb = ep_ring->enqueue;
 	/* Every TRB except the first & last will have its cycle bit flipped. */
-	td_to_noop(&urb_priv->td[0], true);
+	td_to_noop(xhci, xep, &urb_priv->td[0], true);
 
 	/* Reset the ring enqueue back to the first TRB and its cycle bit. */
 	ep_ring->enqueue = urb_priv->td[0].start_trb;
-- 
2.48.1

