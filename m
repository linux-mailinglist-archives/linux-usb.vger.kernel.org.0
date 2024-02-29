Return-Path: <linux-usb+bounces-7339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1986CB13
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 261B71C20DD5
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410241350E4;
	Thu, 29 Feb 2024 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/P5MMat"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F01353F8
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215995; cv=none; b=GBulqwQ5SqqH7Zf5N6ItIwKgDSoGxU8Z9rjWq+CJYdAsaL2lKbxNwxIxMr/1ZCP8ICcUsZ8egv5LOhUFdhkvOJdAd9C8L1zaFPEjbWSCLZtsA+3QQrBJbbKhw72cCtQGMMA8uJV9nX5AWgMC9hqyI3+4X5ddXDYHwv5X+pMrZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215995; c=relaxed/simple;
	bh=Z6DY0qIGWgmvJ6mAgiD/sc+se094n4EBqRsAcAl9ue0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MTGMo/NGRvtF3i17S0BpCjHRomalSsGUDzeBsVUyLiPgpyjzeZ9zBhqTLKMoCV9/jxqlRFpLMrFpsjnatEYsuNzDDOKzLZGphHEtDkwc0eRNBzKKmebsFwrzhJavEj8vfg90u5+bZvx0/Az0tgHDx5RZL17c8tjaQJbOQXM5xGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/P5MMat; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215994; x=1740751994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6DY0qIGWgmvJ6mAgiD/sc+se094n4EBqRsAcAl9ue0=;
  b=L/P5MMatJrHXoqiKqjSSIi63BN7aZeNnkeq30kJ5BX44A7tBm2R8EyUj
   FZOemIGj2CGOKy+JE4c2rt28Vxedz3OJwN6lcXcMPiSnUKJQNc01U8TPd
   mqyJwYMHqCRtx7rdZHxZK1bxtHZ+jiGV9kjBRCuoeKhTFykUA7ir9eYFX
   SdQUS+JxrBQMcUPAraes8+KR6wyTHcEjQTQEHc/Cwl9oYM9mGHWq7IAey
   ToL1urxp5heMHIt+E1SqVe9AdMEq9ccZNKjoSyDs84CIiyc2s96QBgLho
   PLiVEOBu9aDnKGq4gaeR3GhjD6wV1lfEY5Cb43T66io3Wy+I5ZiLnZO0T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609390"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609390"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035991"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035991"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:12 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/9] usb: xhci: utilize 'xhci_free_segments_for_ring()' for freeing segments
Date: Thu, 29 Feb 2024 16:14:34 +0200
Message-Id: <20240229141438.619372-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Refactor the code to improve readability by using
'xhci_free_segments_for_ring()' function for freeing ring segments.
This replaces the custom while loop previously used within
'xhci_ring_expansion()' and 'xhci_alloc_segments_for_ring()'.

Slightly modify 'xhci_free_segments_for_ring()' to handle lists
which do not loop. This makes it possible to use it in error
paths of 'xhci_alloc_segments_for_ring()'.

This change also prepares for switching the custom xhci linked segment
list into to more standard list.h lists.

[minor commit message rewording -Mathias]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c4b3e425bd19..69dd86669883 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -84,7 +84,7 @@ static void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
 	struct xhci_segment *seg;
 
 	seg = first->next;
-	while (seg != first) {
+	while (seg && seg != first) {
 		struct xhci_segment *next = seg->next;
 		xhci_segment_free(xhci, seg);
 		seg = next;
@@ -351,17 +351,10 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 
 		next = xhci_segment_alloc(xhci, cycle_state, max_packet, num,
 					  flags);
-		if (!next) {
-			prev = *first;
-			while (prev) {
-				next = prev->next;
-				xhci_segment_free(xhci, prev);
-				prev = next;
-			}
-			return -ENOMEM;
-		}
-		xhci_link_segments(prev, next, type, chain_links);
+		if (!next)
+			goto free_segments;
 
+		xhci_link_segments(prev, next, type, chain_links);
 		prev = next;
 		num++;
 	}
@@ -369,6 +362,10 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
 	*last = prev;
 
 	return 0;
+
+free_segments:
+	xhci_free_segments_for_ring(xhci, *first);
+	return -ENOMEM;
 }
 
 /*
@@ -444,19 +441,11 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	if (ret)
 		return -ENOMEM;
 
-	if (ring->type == TYPE_STREAM)
+	if (ring->type == TYPE_STREAM) {
 		ret = xhci_update_stream_segment_mapping(ring->trb_address_map,
 						ring, first, last, flags);
-	if (ret) {
-		struct xhci_segment *next;
-		do {
-			next = first->next;
-			xhci_segment_free(xhci, first);
-			if (first == last)
-				break;
-			first = next;
-		} while (true);
-		return ret;
+		if (ret)
+			goto free_segments;
 	}
 
 	xhci_link_rings(xhci, ring, first, last, num_new_segs);
@@ -466,6 +455,10 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 			ring->num_segs);
 
 	return 0;
+
+free_segments:
+	xhci_free_segments_for_ring(xhci, first);
+	return ret;
 }
 
 struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
-- 
2.25.1


