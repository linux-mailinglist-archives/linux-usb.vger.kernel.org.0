Return-Path: <linux-usb+bounces-11682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED7918152
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FA411F24EDA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1DB185E74;
	Wed, 26 Jun 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avAkHPHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B21822F7
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406018; cv=none; b=QEk15PkGxVEC1JiGy0aYdQed6OyTMswAalu7eL11DI8QnZVQb/WRp3jdrkmXxCHNvedggs6lx2UT8epwpqp0rW7jGfyL46h1DxNUu1miX8eFN2M3RPAb2IsFCYaMu20B6BbYnPNh4VN7M2SDcNIZk5P6FiFYSZFdCr8pp3bi/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406018; c=relaxed/simple;
	bh=YJk6v0xpGnY8jY3nTxxXSL+QxgXF22oqRT5S8JlFqkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DVBtjmG4B/BQ2f79JWdklYwQleOcG7is26xFr1o84DWDmh7kTidufn00yRhtPG3f3PqNfHtzmz+ECL0gpdNMGJaHxPjiRyHqb2/KWg7XCs6y0pXsPY4Aq/qSgZOMPyTi12dWR2RKyQWxi/JZAwKTF8SyA+Ku3lU2KGwd0h4xrns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avAkHPHW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406017; x=1750942017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YJk6v0xpGnY8jY3nTxxXSL+QxgXF22oqRT5S8JlFqkA=;
  b=avAkHPHWELij6oZkPIITUMrrwiiQ1WlVWmb7t9RTR0HOZelew8StH0Ng
   aUdgKe3h78YfiVJBNGg+Y5OkFyHsIeUy3HASqvNsPN6BCDxQTFCnKHp3o
   ajIYd5sspYkInLB/fJuc66438W6taWcboJ1L4tMNZu+hijeJhUum4ITf/
   0WGo+761GPrqjg6oXZRJge9l7etS43hSUUONsSN4e466a9nTKXKDZdvRs
   eQYZNK0jhU6SmCnEZovEVZ8Qu7lOewcDSxx+p+XilzWBPcC45lD7bgwKE
   4+7YXhu7U2AS0iJBys2kBP0GLNd3togTICKZCRp6lX7NJCn3jfHshfAMC
   A==;
X-CSE-ConnectionGUID: L24eO/kjT5eZWsb6yqFvdQ==
X-CSE-MsgGUID: SG0baQjfQECDrFEyWX/0Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353391"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:56 -0700
X-CSE-ConnectionGUID: CUzDAhRARm6K4gh6xr/5Bg==
X-CSE-MsgGUID: 8fBJgB98S4CmPMLBABjQuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442642"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:55 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/21] usb: xhci: move link chain bit quirk checks into one helper function.
Date: Wed, 26 Jun 2024 15:48:23 +0300
Message-Id: <20240626124835.1023046-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Older 0.95 xHCI hosts and some other specific newer hosts require the
chain bit to be set for Link TRBs even if the link TRB is not in the
middle of a transfer descriptor (TD).

move the checks for all those cases  into one xhci_link_chain_quirk()
function to clean up and avoid code duplication.

No functional changes.

[skip renaming chain_links flag, reword commit message -Mathias]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 10 ++--------
 drivers/usb/host/xhci-ring.c |  8 ++------
 drivers/usb/host/xhci.h      |  7 +++++--
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3100219d6496..68994ce21933 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -136,10 +136,7 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	if (!ring || !first || !last)
 		return;
 
-	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
-	chain_links = !!(xhci_link_trb_quirk(xhci) ||
-			 (ring->type == TYPE_ISOC &&
-			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+	chain_links = xhci_link_chain_quirk(xhci, ring->type);
 
 	next = ring->enq_seg->next;
 	xhci_link_segments(ring->enq_seg, first, ring->type, chain_links);
@@ -335,10 +332,7 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 	struct xhci_segment *prev;
 	bool chain_links;
 
-	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
-	chain_links = !!(xhci_link_trb_quirk(xhci) ||
-			 (type == TYPE_ISOC &&
-			  (xhci->quirks & XHCI_AMD_0x96_HOST)));
+	chain_links = xhci_link_chain_quirk(xhci, type);
 
 	prev = xhci_segment_alloc(xhci, cycle_state, max_packet, num, flags);
 	if (!prev)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e9130c7c2c53..8502776d84d6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -250,9 +250,7 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		 * AMD 0.96 host, carry over the chain bit of the previous TRB
 		 * (which may mean the chain bit is cleared).
 		 */
-		if (!(ring->type == TYPE_ISOC &&
-		      (xhci->quirks & XHCI_AMD_0x96_HOST)) &&
-		    !xhci_link_trb_quirk(xhci)) {
+		if (!xhci_link_chain_quirk(xhci, ring->type)) {
 			next->link.control &= cpu_to_le32(~TRB_CHAIN);
 			next->link.control |= cpu_to_le32(chain);
 		}
@@ -3250,9 +3248,7 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		/* If we're not dealing with 0.95 hardware or isoc rings
 		 * on AMD 0.96 host, clear the chain bit.
 		 */
-		if (!xhci_link_trb_quirk(xhci) &&
-		    !(ep_ring->type == TYPE_ISOC &&
-		      (xhci->quirks & XHCI_AMD_0x96_HOST)))
+		if (!xhci_link_chain_quirk(xhci, ep_ring->type))
 			ep_ring->enqueue->link.control &=
 				cpu_to_le32(~TRB_CHAIN);
 		else
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 4298513f0f71..65c84185c7fd 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1748,9 +1748,12 @@ static inline void xhci_write_64(struct xhci_hcd *xhci,
 	lo_hi_writeq(val, regs);
 }
 
-static inline int xhci_link_trb_quirk(struct xhci_hcd *xhci)
+
+/* Link TRB chain should always be set on 0.95 hosts, and AMD 0.96 ISOC rings */
+static inline bool xhci_link_chain_quirk(struct xhci_hcd *xhci, enum xhci_ring_type type)
 {
-	return xhci->quirks & XHCI_LINK_TRB_QUIRK;
+	return (xhci->quirks & XHCI_LINK_TRB_QUIRK) ||
+	       (type == TYPE_ISOC && (xhci->quirks & XHCI_AMD_0x96_HOST));
 }
 
 /* xHCI debugging */
-- 
2.25.1


