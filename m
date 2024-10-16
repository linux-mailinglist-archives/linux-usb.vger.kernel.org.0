Return-Path: <linux-usb+bounces-16324-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 840379A0C0C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132FC1F24568
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 13:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5425420C029;
	Wed, 16 Oct 2024 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPaJ75P9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87120C025
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729087084; cv=none; b=h/aEgjx3+96TfHQt9NotsHo7eW7oz6OrRLJoF1KCsek9RcZj9Fm1fVVJIO4WlwqQqM4xgLyKJwyb4DLRJfWZe91beSy//8ZKhJM98sgvHp9IDznZyRwad3PTmIMUGSOawENZ20ifAotNgWUWIGix+4ysRIjUTbjF4wGCfgn5QYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729087084; c=relaxed/simple;
	bh=PpLVJHCs/Lsa4JXqIq9mfDwKCRL9WHKJbDQ+XqqtlOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pl0nWKXgtXYiJUc9wlGSr71mcnQEGeK6ITflbsaRFCUplCpvrFGXRuNHls+wLatK9uUG0QeFe9LKC/rqPgBLNZeoAB6IQ3j9kdWuUPjYnXQ8Xj0yZ4wvGMQRKEOGOFyUggrpwo2HFLDYfTIYRUgeCZwoIJ+88UdMiQkTb/AxC3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPaJ75P9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729087083; x=1760623083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PpLVJHCs/Lsa4JXqIq9mfDwKCRL9WHKJbDQ+XqqtlOY=;
  b=QPaJ75P9jHSFAIx72I33x/Btvju06ARrddC4eveZplC/xr62SRgllXW6
   bikpjqKdizTIpljR9qOZnNbG/Xb56R3Kii4w+nnwGIVUDyBui4cgUuuKf
   mKUy8H6QOZoyNn1uDGEoiuTOojFvuyL3hhJU1uiYwgCR8esFQx2e6VG41
   S3ABMhHUAB/V2sKNHOMfC+1mMux7udE+fmfTpz1uDxxAJLan6fN6wtSt4
   qPRGa9Tzr2PHhZFzAQ6KL0TKxp6P3a2lE3QL7DslpbNSspk4fe809dg4b
   op2DbYsBpqnwGYgNKG4KxqZueiHtRDeKj/Ca4mbh1IGp9Vezoe3xkTK0o
   g==;
X-CSE-ConnectionGUID: XsYf4EgjSuqmelg+7cuIBg==
X-CSE-MsgGUID: r5yo7d8hT4SSH7EASAd9gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28664028"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="28664028"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:58:02 -0700
X-CSE-ConnectionGUID: y0YE+u3YTgqA0qYJePdoMg==
X-CSE-MsgGUID: F5zpf+4GQ+udnP5Cqe1kjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="82776224"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2024 06:58:01 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] usb: xhci: Fix handling errors mid TD followed by other errors
Date: Wed, 16 Oct 2024 16:59:59 +0300
Message-Id: <20241016140000.783905-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016140000.783905-1-mathias.nyman@linux.intel.com>
References: <20241016140000.783905-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Some host controllers fail to produce the final completion event on an
isochronous TD which experienced an error mid TD. We deal with it by
flagging such TDs and checking if the next event points at the flagged
TD or at the next one, and giving back the flagged TD if the latter.

This is not enough, because the next TD may be missed by the xHC. Or
there may be no next TD but a ring underrun. We also need to get such
TD quickly out of the way, or errors on later TDs may be handled wrong.

If the next TD experiences a Missed Service Error, we will set the skip
flag on the endpoint and then attempt skipping TDs when yet another
event arrives. In such scenario, we ought to report the 'error mid TD'
transfer as such rather than skip it.

Another problem case are Stopped events. If we see one after an error
mid TD, we naively assume that it's a Force Stopped Event because it
doesn't match the pending TD, but in reality it might be an ordinary
Stopped event for the next TD, which we fail to recognize and handle.

Fix this by moving error mid TD handling before the whole TD skipping
loop. Remove unnecessary conditions, always give back the TD if the new
event points to any TRB outside it or if the pointer is NULL, as may be
the case in Ring Underrun and Overrun events on 1st gen hardware. Only
if the pending TD isn't flagged, consider other actions like skipping.

As a side effect of reordering with skip and FSE cases, error mid TD is
reordered with last_td_was_short check. This is harmless, because the
two cases are mutually exclusive - only one can happen in any given run
of handle_tx_event().

Tested on the NEC host and a USB camera with flaky cable. Dynamic debug
confirmed that Transaction Errors are sometimes seen, sometimes mid-TD,
sometimes followed by Missed Service. In such cases, they were finished
properly before skipping began.

[Rebase on 6.12-rc1 -Mathias]

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 66 ++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7dedf31bbddd..b6eb928e260f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2775,6 +2775,29 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	/*
+	 * xhci 4.10.2 states isoc endpoints should continue
+	 * processing the next TD if there was an error mid TD.
+	 * So host like NEC don't generate an event for the last
+	 * isoc TRB even if the IOC flag is set.
+	 * xhci 4.9.1 states that if there are errors in mult-TRB
+	 * TDs xHC should generate an error for that TRB, and if xHC
+	 * proceeds to the next TD it should genete an event for
+	 * any TRB with IOC flag on the way. Other host follow this.
+	 *
+	 * We wait for the final IOC event, but if we get an event
+	 * anywhere outside this TD, just give it back already.
+	 */
+	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
+
+	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
+		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
+		ep_ring->dequeue = td->last_trb;
+		ep_ring->deq_seg = td->last_trb_seg;
+		inc_deq(xhci, ep_ring);
+		xhci_td_cleanup(xhci, td, ep_ring, td->status);
+	}
+
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
@@ -2836,44 +2859,13 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
+			/* HC is busted, give up! */
+			xhci_err(xhci,
+				 "ERROR Transfer event TRB DMA ptr not part of current TD ep_index %d comp_code %u\n",
+				 ep_index, trb_comp_code);
+			trb_in_td(xhci, td, ep_trb_dma, true);
 
-				return -ESHUTDOWN;
-			}
+			return -ESHUTDOWN;
 		}
 
 		if (ep->skip) {
-- 
2.25.1


