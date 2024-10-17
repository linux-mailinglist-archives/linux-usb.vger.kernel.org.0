Return-Path: <linux-usb+bounces-16371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A49A2302
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A50DE1F22C4B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5461DE2B0;
	Thu, 17 Oct 2024 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNtvM9xQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1931DDC2B
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170449; cv=none; b=heXGujvEFs4ivR58/DXAK+BOuTlshDUQVKwBAnCxdaQO63yqCtFIJAo92xkH31enK4jXSytvygKhe8iaKfjbhQpBkMGkjcsGgJ3OIO90iyRUrn3RPowvrf94/dn/9Xg3Uq3q1+TFEe9Mbv4pBVZF2NpB3ms/a7kF+JpKtvJhDC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170449; c=relaxed/simple;
	bh=V7gZE8pdZLR/373Jy6krcx30yqQ2G77xsfs5If+mI9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNNXfTtz1mJAmXFeqmV7adN4fvLfUJGHLDijlYAwHdXVUJW+3klmGvZYBrif1AsrzevT+ygASCFKI6Itq3smKtGkSRDSCrWynNun2Yvm4s1+cR6es34lZAk2cX7vIYx4XwhH3EyUuHOERXEjjOoN+/rIvdxG22gtoij18bddtxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNtvM9xQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170446; x=1760706446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7gZE8pdZLR/373Jy6krcx30yqQ2G77xsfs5If+mI9A=;
  b=RNtvM9xQ1pu9IxnwRHBN+12hnlKxGt2DtqtBGg2HiMR2dY3JkkKAx0wQ
   fKo+4Mn/lYxTZSJ5YNc79WSJunJ4NLqCGqerh7buN2xP8HSCTOKs2HC1N
   IaDywZqJX9EF352uAUby+1zvy5Uu9K51IfNc7urBsV8pHJELxeEUyA9V6
   PWyB2oq5H1077SJSKUtQxzkbIt/p+zMo8VXdfRDR/WQiaCToqmGIgY6xd
   golSchCISDsrzg963Q4d9/zdg1hkw/swM+2jA567ytEepvgyYBjMOC6S3
   ozXUTJZBb41MR+RfWN9I/VG5d9QGl5t6aGKNH8qiLiHRwNiWzvaZKddn+
   A==;
X-CSE-ConnectionGUID: 1lzp6aaKR82bdzgEheBk7Q==
X-CSE-MsgGUID: AwfQog0HTc2dDQCXhXSJXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32452113"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="32452113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:24 -0700
X-CSE-ConnectionGUID: HKqzuONbQe6Tpxqxglxo6A==
X-CSE-MsgGUID: ybsyqkOpQDqKYCwZeEqQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109354611"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 06:07:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id D7F58256; Thu, 17 Oct 2024 16:07:22 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 7/8] usb: xhci: add help function xhci_dequeue_td()
Date: Thu, 17 Oct 2024 16:05:07 +0300
Message-ID: <20241017130508.1293021-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xhci_dequeue_td() helper function to reduce code duplication.

Function xhci_dequeue_td() advances the dequeue pointer past the specified
Transfer Descriptor (TD) and releases the TD.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 13eadee89839..7221547683d8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -859,6 +859,16 @@ static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 	}
 }
 
+/* Give back previous TD and move on to the next TD. */
+static void xhci_dequeue_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xhci_ring *ring,
+			    u32 status)
+{
+	ring->dequeue = td->end_trb;
+	ring->deq_seg = td->end_seg;
+	inc_deq(xhci, ring);
+
+	xhci_td_cleanup(xhci, td, ring, status);
+}
 
 /* Complete the cancelled URBs we unlinked from td_list. */
 static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
@@ -2258,12 +2268,7 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	}
 
-	/* Update ring dequeue pointer */
-	ep_ring->dequeue = td->end_trb;
-	ep_ring->deq_seg = td->end_seg;
-	inc_deq(xhci, ep_ring);
-
-	xhci_td_cleanup(xhci, td, ep_ring, td->status);
+	xhci_dequeue_td(xhci, td, ep_ring, td->status);
 }
 
 /* sum trb lengths from the first trb up to stop_trb, _excluding_ stop_trb */
@@ -2496,12 +2501,7 @@ static void skip_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	/* calc actual length */
 	frame->actual_length = 0;
 
-	/* Update ring dequeue pointer */
-	ep->ring->dequeue = td->end_trb;
-	ep->ring->deq_seg = td->end_seg;
-	inc_deq(xhci, ep->ring);
-
-	xhci_td_cleanup(xhci, td, ep->ring, status);
+	xhci_dequeue_td(xhci, td, ep->ring, status);
 }
 
 /*
@@ -2791,10 +2791,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
-		ep_ring->dequeue = td->end_trb;
-		ep_ring->deq_seg = td->end_seg;
-		inc_deq(xhci, ep_ring);
-		xhci_td_cleanup(xhci, td, ep_ring, td->status);
+		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
 	if (list_empty(&ep_ring->td_list)) {
-- 
2.45.2


