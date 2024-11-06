Return-Path: <linux-usb+bounces-17187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB29BE3E0
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73191F24C33
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE641DE2C3;
	Wed,  6 Nov 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZSYhzVQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961911DBB35
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887986; cv=none; b=qtENUzRtylpAi1tKJ1CVXvFlI9x5NbrX6x/qJfi4pc2kRYT6/nxrU6xeO0vqaAolAE6ZqqeI6XpxMN4WMFk7TT63/ooDSmaaNz5T8TjUZum8MrgItupdWJ7z1O4l4yRkvF+wal0zbHL4X0LwsxXJRAc87DL3kmzZlqGerfuJPrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887986; c=relaxed/simple;
	bh=CAKESkKwV0uSPOP1JMP4q3iJ8Ss44fXqvGf8KiDcKIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jdTuAbNn9EjLReHyRtiu1qER2p2sPeRUyYy9/NF0Duq6qBpLOK+x+fd563y5lrPc8xUvBA3U9Rm+o4DoKVjeqTX6Gk5QwBtJ+1Hjbs6RpQpxHDLvDRPGtWCVlomxpJEOrHKTyHhqDRyLnBP3t+rjQSg+xyqHm6olgdhzd0dQWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZSYhzVQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887984; x=1762423984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CAKESkKwV0uSPOP1JMP4q3iJ8Ss44fXqvGf8KiDcKIU=;
  b=iZSYhzVQphMh8c+8UK6nzz6rRekY+rlU6bRFmXjgWsgZvG+XoROzQW+L
   XtCML+QHbMGgMeFIxu3IX8cqdAKXRXjhxxtbatZIcwKYoOmCkAu68OD5O
   24zEK6KIP1BOBzfQifF2SlvdcjnIvfSVKYRo3KKG7hwSQlNKn6xA/TUk3
   +nSsAjghNqo2Ku0/cnHXIkfutm91iwgv0BI3/oTPbzgMTnumq6wFeJAFw
   qNKKkJWHIfdpDLxuwwK27KCadQlIy1F3vT5rgaRCbcjO5bUjZ4ryF2Y8X
   UQ1CIUQZWMAjuFRNTihqzpDBDpydB1d3W2YNtCtz8ojfFq7jhFcVbu4ea
   w==;
X-CSE-ConnectionGUID: P6eVJohYQG+5GOojx7Ku7A==
X-CSE-MsgGUID: oxEHxiGKThGybvblCp1WVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059402"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059402"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:04 -0800
X-CSE-ConnectionGUID: cjI0xJQcQzGuwpwy6E0EcQ==
X-CSE-MsgGUID: qPY0anFxQUaYzebdEKVsUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813116"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:03 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/33] usb: xhci: adjust xhci_alloc_segments_for_ring() arguments
Date: Wed,  6 Nov 2024 12:14:38 +0200
Message-Id: <20241106101459.775897-13-mathias.nyman@linux.intel.com>
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

The function xhci_alloc_segments_for_ring() currently takes 7 arguments,
5 of which are components of the 'xhci_ring' struct. Refactor the function
to accept a pointer to the 'xhci_ring' struct instead of passing these
components separately.

The change reduces the number of arguments, making the function signature
cleaner and easier to understand.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 48 ++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 164b22d0b475..fa77a15dfde6 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -313,44 +313,38 @@ void xhci_initialize_ring_info(struct xhci_ring *ring)
 EXPORT_SYMBOL_GPL(xhci_initialize_ring_info);
 
 /* Allocate segments and link them for a ring */
-static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
-					struct xhci_segment **first,
-					struct xhci_segment **last,
-					unsigned int num_segs,
-					enum xhci_ring_type type,
-					unsigned int max_packet,
-					gfp_t flags)
+static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring *ring, gfp_t flags)
 {
 	struct xhci_segment *prev;
 	unsigned int num = 0;
 	bool chain_links;
 
-	chain_links = xhci_link_chain_quirk(xhci, type);
+	chain_links = xhci_link_chain_quirk(xhci, ring->type);
 
-	prev = xhci_segment_alloc(xhci, max_packet, num, flags);
+	prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
 	if (!prev)
 		return -ENOMEM;
 	num++;
 
-	*first = prev;
-	while (num < num_segs) {
+	ring->first_seg = prev;
+	while (num < ring->num_segs) {
 		struct xhci_segment	*next;
 
-		next = xhci_segment_alloc(xhci, max_packet, num, flags);
+		next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
 		if (!next)
 			goto free_segments;
 
-		xhci_link_segments(prev, next, type, chain_links);
+		xhci_link_segments(prev, next, ring->type, chain_links);
 		prev = next;
 		num++;
 	}
-	xhci_link_segments(prev, *first, type, chain_links);
-	*last = prev;
+	xhci_link_segments(prev, ring->first_seg, ring->type, chain_links);
+	ring->last_seg = prev;
 
 	return 0;
 
 free_segments:
-	xhci_free_segments_for_ring(xhci, *first);
+	xhci_free_segments_for_ring(xhci, ring->first_seg);
 	return -ENOMEM;
 }
 
@@ -379,8 +373,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 	if (num_segs == 0)
 		return ring;
 
-	ret = xhci_alloc_segments_for_ring(xhci, &ring->first_seg, &ring->last_seg, num_segs,
-					   type, max_packet, flags);
+	ret = xhci_alloc_segments_for_ring(xhci, ring, flags);
 	if (ret)
 		goto fail;
 
@@ -414,23 +407,24 @@ void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 				unsigned int num_new_segs, gfp_t flags)
 {
-	struct xhci_segment	*first;
-	struct xhci_segment	*last;
-	int			ret;
+	struct xhci_ring new_ring;
+	int ret;
 
-	ret = xhci_alloc_segments_for_ring(xhci, &first, &last, num_new_segs, ring->type,
-					   ring->bounce_buf_len, flags);
+	new_ring.num_segs = num_new_segs;
+	new_ring.bounce_buf_len = ring->bounce_buf_len;
+	new_ring.type = ring->type;
+	ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
 	if (ret)
 		return -ENOMEM;
 
 	if (ring->type == TYPE_STREAM) {
-		ret = xhci_update_stream_segment_mapping(ring->trb_address_map,
-						ring, first, flags);
+		ret = xhci_update_stream_segment_mapping(ring->trb_address_map, ring,
+							 new_ring.first_seg, flags);
 		if (ret)
 			goto free_segments;
 	}
 
-	xhci_link_rings(xhci, ring, first, last, num_new_segs);
+	xhci_link_rings(xhci, ring, new_ring.first_seg, new_ring.last_seg, num_new_segs);
 	trace_xhci_ring_expansion(ring);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_ring_expansion,
 			"ring expansion succeed, now has %d segments",
@@ -439,7 +433,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	return 0;
 
 free_segments:
-	xhci_free_segments_for_ring(xhci, first);
+	xhci_free_segments_for_ring(xhci, new_ring.first_seg);
 	return ret;
 }
 
-- 
2.25.1


