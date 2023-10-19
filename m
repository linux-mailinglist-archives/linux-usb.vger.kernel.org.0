Return-Path: <linux-usb+bounces-1901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221F7CF538
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFDFDB21173
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6C2199A3;
	Thu, 19 Oct 2023 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShPmnSso"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FF61865A
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB941126
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711291; x=1729247291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dHy1mXUjjI7/6YaPw2UxMuL3svve7N6IvlToFGvD4P8=;
  b=ShPmnSso6gAOSRd4AJtTJjCjEBul2hqEhSvRqY2TgbgNkT4yvWLQl3zZ
   QBaos25fd+D5LVHrQRjpsjNfoksYJBzEgPamDv/i1WBBSq48OJMyr4LJG
   Z1Is4S917TKP3RXo2IST6CcvUM8FSvWHNG+cLtbkhbhqxeQ2DmHcwHL/J
   pnPdRbz+BCkhBter9iNMucvkSPl8q258rE1DAXUm4BKvq0ajc/iy0da3Z
   ht477MEcNDVhNs+Te8HnvGqanReeEskFcHElDGVAv5u+5s7/FWRxu5QcR
   0xuFWxGMwOoaFRvLEWnOpQJnsme7onFiG9wq7129GQ8Lxae/zOmg4t7FV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075822"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075822"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557628"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557628"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/19] xhci: Adjust segment numbers after ring expansion
Date: Thu, 19 Oct 2023 13:29:11 +0300
Message-Id: <20231019102924.2797346-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

Initial xhci_ring allocation has just been amended to assign a
monotonically increasing number to each ring segment.

However rings may be expanded after initial allocation.

So number newly inserted segments starting from the preceding segment in
the ring and renumber all segments succeeding the newly inserted ones.

This is not a fix because ring expansion currently isn't done on the
Event Ring and that's the only ring type using the segment number.
It's just in preparation for when either Event Ring expansion is added
or when other ring types start making use of the segment number.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a8a8fc2cc4a5..1c0f5263cf81 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -130,7 +130,7 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		struct xhci_segment *first, struct xhci_segment *last,
 		unsigned int num_segs)
 {
-	struct xhci_segment *next;
+	struct xhci_segment *next, *seg;
 	bool chain_links;
 
 	if (!ring || !first || !last)
@@ -153,6 +153,9 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 			|= cpu_to_le32(LINK_TOGGLE);
 		ring->last_seg = last;
 	}
+
+	for (seg = last; seg != ring->last_seg; seg = seg->next)
+		seg->next->num = seg->num + 1;
 }
 
 /*
@@ -322,11 +325,11 @@ void xhci_initialize_ring_info(struct xhci_ring *ring,
 /* Allocate segments and link them for a ring */
 static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 		struct xhci_segment **first, struct xhci_segment **last,
-		unsigned int num_segs, unsigned int cycle_state,
-		enum xhci_ring_type type, unsigned int max_packet, gfp_t flags)
+		unsigned int num_segs, unsigned int num,
+		unsigned int cycle_state, enum xhci_ring_type type,
+		unsigned int max_packet, gfp_t flags)
 {
 	struct xhci_segment *prev;
-	unsigned int num = 0;
 	bool chain_links;
 
 	/* Set chain bit for 0.95 hosts, and for isoc rings on AMD 0.96 host */
@@ -392,7 +395,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 		return ring;
 
 	ret = xhci_alloc_segments_for_ring(xhci, &ring->first_seg,
-			&ring->last_seg, num_segs, cycle_state, type,
+			&ring->last_seg, num_segs, 0, cycle_state, type,
 			max_packet, flags);
 	if (ret)
 		goto fail;
@@ -432,7 +435,8 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	int			ret;
 
 	ret = xhci_alloc_segments_for_ring(xhci, &first, &last,
-			num_new_segs, ring->cycle_state, ring->type,
+			num_new_segs, ring->enq_seg->num + 1,
+			ring->cycle_state, ring->type,
 			ring->bounce_buf_len, flags);
 	if (ret)
 		return -ENOMEM;
-- 
2.25.1


