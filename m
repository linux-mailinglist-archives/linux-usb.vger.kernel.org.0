Return-Path: <linux-usb+bounces-17204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092849BE3F7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B5841C23B76
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867F91DDC13;
	Wed,  6 Nov 2024 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpOMooQx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967A1DE2C6
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888013; cv=none; b=G1fHkKau9Tm7Hemg8azytRT57KnLpXHJyBihkLz3lOhj8n/JDTHvVHteCf+0uNlfEhXXcGguY2BTTL9JqSJ0oYTiSzZZl3ZAHjJUYaXOD+yncVpV801njLZgA4pM/Ry8WoNIAxrpC/rioaleMQvMme0ME1QUpcq+bgH/oQO04nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888013; c=relaxed/simple;
	bh=gUZflQ5NspE5kw2dcAJ47lrITY3ywa95RGkw6sAvbjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kbJZF/41i8wJTE+upaTaF1y1Fvva1y8FsyA5HDQ4XC8iyNWsbOaMS6M5qKI/eSwz+3/uing8eZ62SKUsftol0jj2W2gDNsYffx3s1ObdckysBUb70QuJ2LI+7QZc06zYMfInGi/ocNe3HeuA0C1P68sVmSJgLco30y6fYBD/RXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpOMooQx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888011; x=1762424011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUZflQ5NspE5kw2dcAJ47lrITY3ywa95RGkw6sAvbjU=;
  b=PpOMooQx3v14WyXaqLg6qJFJcz4oG5arS0TfXYtE0Rq5pvV0obnh5tFI
   7hVHo2ieUED1O7kfH8RL6bWLDzU+CPqtR5KxuTH+f6XWY3A0M6wVSOADE
   yoduh0qdSqCzfZNTz5Lz67S03sba1+BeP20dYangdG4LoVr9p3bN8rwtA
   kPSJqRS25OU1FZsy/dphOBF6HEcvE9RkzZVrrwIQFK6C2AnNOdPn0v8or
   bzgGe3ZXAnuUV0MNG8fsJ8Y6/Z5FQO0MIeVm2TYMb36FNon/LD7H6odKA
   d6fUbXw4ixbv4/3KifO1q4pvWieZHsu0KwMWAgzHHxpLGOhq6JjpFuuYg
   Q==;
X-CSE-ConnectionGUID: b22OtKF6Seeu0XdtiuyrTg==
X-CSE-MsgGUID: KqTd2zAYSiKKSDgVOXMCKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059482"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:31 -0800
X-CSE-ConnectionGUID: BW+VCDFiQaqsGIyLXBnhMw==
X-CSE-MsgGUID: lFtLJMfaSwCZfNBnAnY8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813459"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:30 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 29/33] usb: xhci: add help function xhci_dequeue_td()
Date: Wed,  6 Nov 2024 12:14:55 +0200
Message-Id: <20241106101459.775897-30-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Add xhci_dequeue_td() helper function to reduce code duplication.

Function xhci_dequeue_td() advances the dequeue pointer past the specified
Transfer Descriptor (TD) and releases the TD.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e48ee58fdb46..c9c0c4a7588a 100644
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
2.25.1


