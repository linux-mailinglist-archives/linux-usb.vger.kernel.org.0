Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1747A3E0DCD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 07:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhHEFha (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 01:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhHEFh3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Aug 2021 01:37:29 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1278C0613C1
        for <linux-usb@vger.kernel.org>; Wed,  4 Aug 2021 22:37:15 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t3so5728186plg.9
        for <linux-usb@vger.kernel.org>; Wed, 04 Aug 2021 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtXPZITj9/cZw6y65jk9HHFp5QsiIc4OD7U5vZcSmno=;
        b=U9ahdyKvczO7zvzFqRt64kHYezBarwRZRA119vsRVE5/qE9dCCbDQllHLimjJ5sHYw
         SaK2C36oeU66vof88EuhP4oA9CXuqcSupBNJizWGAAdG9+pnpwdMV1iMEphZf2TnALaV
         5PJLt7oW/kGWsKwKhfRMCqw++nffiBgUtoRBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtXPZITj9/cZw6y65jk9HHFp5QsiIc4OD7U5vZcSmno=;
        b=AL2iBFdgp2SqTUOcoSsBAiECQ31TK9nxVLei+vsRiWXUzRqU7abgGGiH8wKY5IL/0G
         q7Ixe9Isc2PmN8O2B2TWN7Pyn4tVCY1p6v7RWAAUUsoZmrThSElFOyPy/Cqf9s+uvUKn
         l01yNzOD3FRVr9oUxGoGNiH1hV0IFA6qYSujZ/G6U2NT5KLU7Q89XtMBGegwCb25ifVJ
         +ziMS3rQ4Kv1+rjgLTnVy7TUpkLJSMS/Ey2T+0iiaSqm8fqn7INZYeKvpR8u9M1e0+hW
         kt8/UyjMP8MPP1SPcnmJy+29OqL8Uz//anW97VYaPXLHP0CSYCc1G4Ephft8w4yqvUBk
         pKtw==
X-Gm-Message-State: AOAM533du+eo12HAlk2jRZ54oc3XGLhaiqGfrOsq9omhEBqIonAWyaJZ
        KY/5YXBE02Hum4bpm+Cy40XGkIMDaccEZA==
X-Google-Smtp-Source: ABdhPJyAxe1NNkh3e8eb1HP5i9Ihsd7C99EJ1O/XiYcNOuPQYLQmO8bDFKXvJbas5psYEdQBfgGNrg==
X-Received: by 2002:a63:1d41:: with SMTP id d1mr271733pgm.199.1628141834924;
        Wed, 04 Aug 2021 22:37:14 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:7a1c:b216:fca0:2cc2])
        by smtp.gmail.com with ESMTPSA id y14sm4845163pfa.166.2021.08.04.22.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 22:37:14 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v2] xhci: fix unmatched num_trbs_free
Date:   Thu,  5 Aug 2021 13:37:00 +0800
Message-Id: <20210805053700.1465295-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When unlinked urbs are queued to the cancelled td list, many tds
might be located after hw dequeue pointer and just marked as no-op
but not reclaimed to num_trbs_free. This bias can leads to unnecessary
ring expansions and leaks in atomic pool.

To prevent this bias, this patch counts free TRBs every time xhci moves
dequeue pointer. This patch utilizes existing
update_ring_for_set_deq_completion() function, renamed it to move_deq().

When it walks through to the new dequeue pointer, it also counts
free TRBs manually. This patch adds a fast path for the most cases
where the new dequeue pointer is still in the current segment.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v2:
- Do not use move_deq() in finish_td() path.
- small cleanup in move_deq()

 drivers/usb/host/xhci-ring.c | 113 ++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8fea44bbc266..80562915f025 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -152,6 +152,55 @@ static void next_trb(struct xhci_hcd *xhci,
 	}
 }
 
+/* Forward dequeue pointer to the specific position,
+ * walk through the ring and reclaim free trb slots to num_trbs_free
+ */
+static int move_deq(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
+		    struct xhci_segment *new_seg, union xhci_trb *new_deq)
+{
+	unsigned int steps;
+	union xhci_trb *deq;
+	struct xhci_segment *seg = ep_ring->deq_seg;
+
+	if (ep_ring->dequeue == new_deq)
+		return 0;
+
+	/* new_deq is still in the current segment */
+	if ((ep_ring->deq_seg == new_seg) &&
+	    (ep_ring->dequeue <= new_deq)) {
+		steps = new_deq - ep_ring->dequeue;
+		deq = new_deq;
+		goto found;
+	}
+
+	/* fast walk to the next segment */
+	seg = seg->next;
+	steps = (TRBS_PER_SEGMENT - 1) -
+		(ep_ring->dequeue - ep_ring->deq_seg->trbs);
+	deq = &seg->trbs[0];
+
+	while (deq != new_deq) {
+		if (trb_is_link(deq)) {
+			seg = seg->next;
+			deq = seg->trbs;
+		} else {
+			steps++;
+			deq++;
+		}
+		if (deq == ep_ring->dequeue) {
+			xhci_warn(xhci, "Unable to find new dequeue pointer\n");
+			return -ENOENT;
+		}
+	}
+
+found:
+	ep_ring->deq_seg = seg;
+	ep_ring->dequeue = deq;
+	ep_ring->num_trbs_free += steps;
+
+	return 0;
+}
+
 /*
  * See Cycle bit rules. SW is the consumer for the event ring only.
  */
@@ -1243,52 +1292,6 @@ void xhci_stop_endpoint_command_watchdog(struct timer_list *t)
 			"xHCI host controller is dead.");
 }
 
-static void update_ring_for_set_deq_completion(struct xhci_hcd *xhci,
-		struct xhci_virt_device *dev,
-		struct xhci_ring *ep_ring,
-		unsigned int ep_index)
-{
-	union xhci_trb *dequeue_temp;
-	int num_trbs_free_temp;
-	bool revert = false;
-
-	num_trbs_free_temp = ep_ring->num_trbs_free;
-	dequeue_temp = ep_ring->dequeue;
-
-	/* If we get two back-to-back stalls, and the first stalled transfer
-	 * ends just before a link TRB, the dequeue pointer will be left on
-	 * the link TRB by the code in the while loop.  So we have to update
-	 * the dequeue pointer one segment further, or we'll jump off
-	 * the segment into la-la-land.
-	 */
-	if (trb_is_link(ep_ring->dequeue)) {
-		ep_ring->deq_seg = ep_ring->deq_seg->next;
-		ep_ring->dequeue = ep_ring->deq_seg->trbs;
-	}
-
-	while (ep_ring->dequeue != dev->eps[ep_index].queued_deq_ptr) {
-		/* We have more usable TRBs */
-		ep_ring->num_trbs_free++;
-		ep_ring->dequeue++;
-		if (trb_is_link(ep_ring->dequeue)) {
-			if (ep_ring->dequeue ==
-					dev->eps[ep_index].queued_deq_ptr)
-				break;
-			ep_ring->deq_seg = ep_ring->deq_seg->next;
-			ep_ring->dequeue = ep_ring->deq_seg->trbs;
-		}
-		if (ep_ring->dequeue == dequeue_temp) {
-			revert = true;
-			break;
-		}
-	}
-
-	if (revert) {
-		xhci_dbg(xhci, "Unable to find new dequeue pointer\n");
-		ep_ring->num_trbs_free = num_trbs_free_temp;
-	}
-}
-
 /*
  * When we get a completion for a Set Transfer Ring Dequeue Pointer command,
  * we need to clear the set deq pending flag in the endpoint ring state, so that
@@ -1375,8 +1378,8 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			/* Update the ring's dequeue segment and dequeue pointer
 			 * to reflect the new position.
 			 */
-			update_ring_for_set_deq_completion(xhci, ep->vdev,
-				ep_ring, ep_index);
+			move_deq(xhci, ep_ring, ep->queued_deq_seg,
+				 ep->queued_deq_ptr);
 		} else {
 			xhci_warn(xhci, "Mismatch between completed Set TR Deq Ptr command & xHCI internal state.\n");
 			xhci_warn(xhci, "ep deq seg = %p, deq ptr = %p\n",
@@ -2210,9 +2213,13 @@ static int finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	}
 
 	/* Update ring dequeue pointer */
-	ep_ring->dequeue = td->last_trb;
-	ep_ring->deq_seg = td->last_trb_seg;
-	ep_ring->num_trbs_free += td->num_trbs - 1;
+	if (ep_ring->dequeue == td->first_trb) {
+		ep_ring->dequeue = td->last_trb;
+		ep_ring->deq_seg = td->last_trb_seg;
+		ep_ring->num_trbs_free += td->num_trbs - 1;
+	} else {
+		move_deq(xhci, ep_ring, td->last_trb_seg, td->last_trb);
+	}
 	inc_deq(xhci, ep_ring);
 
 	return xhci_td_cleanup(xhci, td, ep_ring, td->status);
@@ -2432,9 +2439,7 @@ static int skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	frame->actual_length = 0;
 
 	/* Update ring dequeue pointer */
-	ep->ring->dequeue = td->last_trb;
-	ep->ring->deq_seg = td->last_trb_seg;
-	ep->ring->num_trbs_free += td->num_trbs - 1;
+	move_deq(xhci, ep->ring, td->last_trb_seg, td->last_trb);
 	inc_deq(xhci, ep->ring);
 
 	return xhci_td_cleanup(xhci, td, ep->ring, status);
-- 
2.32.0.554.ge1b32706d8-goog

