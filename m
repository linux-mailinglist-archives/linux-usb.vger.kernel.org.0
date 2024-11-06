Return-Path: <linux-usb+bounces-17185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0499BE3DE
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69FED1F24C3D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF411DE2B2;
	Wed,  6 Nov 2024 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLkBTL9b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042931DDA17
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887983; cv=none; b=ONXq9D8JfRZe3/LwV8DSrigiRAJoSYADRRAZpO031j/sQZd+zp7EqiFOeMkR4IecscVJXrpAg6yADDujksxGGd5+4YUlrHbpLzJftgv+KbvINQs9b5nZuGfe9BWGECVlILPsW+lSR8jY1jHxyTlRNVbpCZczgnWpZ0quzAETyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887983; c=relaxed/simple;
	bh=7FMZEg3rWBCfXHTP9nAeVFE261EGB/fafGgy/2IQiGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MFqTjPYztBpYXWhJq5/kFPpTf3FX4IM/dk4q4q3oGJCTMhZRVP0SwvyuaGCT6tqKycLB2X56eibCIw4RdmYNps8qLb/e+aY1Hyub8kjqNjDZUJT47UKT7l8W31baPHTp6tumXXjpp9urbjllTl/79/5S+1yjkxBIoIBky0zdibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLkBTL9b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887982; x=1762423982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7FMZEg3rWBCfXHTP9nAeVFE261EGB/fafGgy/2IQiGo=;
  b=GLkBTL9bnQ9p1Yd6voDSViy8jJVLe17IMUt0WzrlVD6FvQZzKzCa4kZ7
   wDRcZQZZUm/7jN8W4BVbcEA2HYGlRnr+8ZCfH/4kRH4KKUkwXQJQGLP2l
   pboOOV3qSUfO0Qj2SpqjY2H2DfOqFqcE441T+dLD1CxlRtUpa5XgkyoBW
   IEAr6mnmPypfQS+acG+qC8ukAiOVVal4LnQARNqzCRv1IfBJYTT1ucWqt
   yyAmfROLxye/rab4Rzwzt4rPFK6GS86XOeyOjolNRnMnXiPSmntDmWqOR
   88jWwM0rPt1wkxBEu29mATcs4busb/47aqG+rPJtfamsA1Rf1YRIfmthJ
   Q==;
X-CSE-ConnectionGUID: D9t18XGJSCClnJLu4WVE5A==
X-CSE-MsgGUID: 4sLacFaESo6wyg9hHhJW5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059396"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:01 -0800
X-CSE-ConnectionGUID: rpJRtWNdSCe97A8v9svAOQ==
X-CSE-MsgGUID: A9M8sLjpTmKUj+fbv6yKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813077"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:00 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/33] usb: xhci: introduce macro for ring segment list iteration
Date: Wed,  6 Nov 2024 12:14:36 +0200
Message-Id: <20241106101459.775897-11-mathias.nyman@linux.intel.com>
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

Add macro to streamline and standardize the iteration over ring
segment list.

xhci_for_each_ring_seg(): Iterates over the entire ring segment list.

The xhci_free_segments_for_ring() function's while loop has not been
updated to use the new macro. This function has some underlying issues,
and as a result, it will be handled separately in a future patch.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c |  5 +----
 drivers/usb/host/xhci-mem.c     | 24 +++++++-----------------
 drivers/usb/host/xhci.c         | 20 ++++++++------------
 drivers/usb/host/xhci.h         |  3 +++
 4 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 35247cd50c74..4f0c1b96e208 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -214,14 +214,11 @@ static void xhci_ring_dump_segment(struct seq_file *s,
 
 static int xhci_ring_trb_show(struct seq_file *s, void *unused)
 {
-	int			i;
 	struct xhci_ring	*ring = *(struct xhci_ring **)s->private;
 	struct xhci_segment	*seg = ring->first_seg;
 
-	for (i = 0; i < ring->num_segs; i++) {
+	xhci_for_each_ring_seg(ring->first_seg, seg)
 		xhci_ring_dump_segment(s, seg);
-		seg = seg->next;
-	}
 
 	return 0;
 }
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2952737ccf6c..7aee76f846bc 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -224,7 +224,6 @@ static int xhci_update_stream_segment_mapping(
 		struct radix_tree_root *trb_address_map,
 		struct xhci_ring *ring,
 		struct xhci_segment *first_seg,
-		struct xhci_segment *last_seg,
 		gfp_t mem_flags)
 {
 	struct xhci_segment *seg;
@@ -234,28 +233,22 @@ static int xhci_update_stream_segment_mapping(
 	if (WARN_ON_ONCE(trb_address_map == NULL))
 		return 0;
 
-	seg = first_seg;
-	do {
+	xhci_for_each_ring_seg(first_seg, seg) {
 		ret = xhci_insert_segment_mapping(trb_address_map,
 				ring, seg, mem_flags);
 		if (ret)
 			goto remove_streams;
-		if (seg == last_seg)
-			return 0;
-		seg = seg->next;
-	} while (seg != first_seg);
+	}
 
 	return 0;
 
 remove_streams:
 	failed_seg = seg;
-	seg = first_seg;
-	do {
+	xhci_for_each_ring_seg(first_seg, seg) {
 		xhci_remove_segment_mapping(trb_address_map, seg);
 		if (seg == failed_seg)
 			return ret;
-		seg = seg->next;
-	} while (seg != first_seg);
+	}
 
 	return ret;
 }
@@ -267,17 +260,14 @@ static void xhci_remove_stream_mapping(struct xhci_ring *ring)
 	if (WARN_ON_ONCE(ring->trb_address_map == NULL))
 		return;
 
-	seg = ring->first_seg;
-	do {
+	xhci_for_each_ring_seg(ring->first_seg, seg)
 		xhci_remove_segment_mapping(ring->trb_address_map, seg);
-		seg = seg->next;
-	} while (seg != ring->first_seg);
 }
 
 static int xhci_update_stream_mapping(struct xhci_ring *ring, gfp_t mem_flags)
 {
 	return xhci_update_stream_segment_mapping(ring->trb_address_map, ring,
-			ring->first_seg, ring->last_seg, mem_flags);
+			ring->first_seg, mem_flags);
 }
 
 /* XXX: Do we need the hcd structure in all these functions? */
@@ -438,7 +428,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 
 	if (ring->type == TYPE_STREAM) {
 		ret = xhci_update_stream_segment_mapping(ring->trb_address_map,
-						ring, first, last, flags);
+						ring, first, flags);
 		if (ret)
 			goto free_segments;
 	}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fdb1b71eeec2..44e4ae201048 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -40,15 +40,15 @@ MODULE_PARM_DESC(quirks, "Bit flags for quirks to be enabled as default");
 
 static bool td_on_ring(struct xhci_td *td, struct xhci_ring *ring)
 {
-	struct xhci_segment *seg = ring->first_seg;
+	struct xhci_segment *seg;
 
 	if (!td || !td->start_seg)
 		return false;
-	do {
+
+	xhci_for_each_ring_seg(ring->first_seg, seg) {
 		if (seg == td->start_seg)
 			return true;
-		seg = seg->next;
-	} while (seg && seg != ring->first_seg);
+	}
 
 	return false;
 }
@@ -785,14 +785,10 @@ static void xhci_clear_command_ring(struct xhci_hcd *xhci)
 	struct xhci_segment *seg;
 
 	ring = xhci->cmd_ring;
-	seg = ring->deq_seg;
-	do {
-		memset(seg->trbs, 0,
-			sizeof(union xhci_trb) * (TRBS_PER_SEGMENT - 1));
-		seg->trbs[TRBS_PER_SEGMENT - 1].link.control &=
-			cpu_to_le32(~TRB_CYCLE);
-		seg = seg->next;
-	} while (seg != ring->deq_seg);
+	xhci_for_each_ring_seg(ring->deq_seg, seg) {
+		memset(seg->trbs, 0, sizeof(union xhci_trb) * (TRBS_PER_SEGMENT - 1));
+		seg->trbs[TRBS_PER_SEGMENT - 1].link.control &= cpu_to_le32(~TRB_CYCLE);
+	}
 
 	xhci_initialize_ring_info(ring, 1);
 	/*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 89337562440b..753d9343a4b1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1263,6 +1263,9 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define AVOID_BEI_INTERVAL_MIN	8
 #define AVOID_BEI_INTERVAL_MAX	32
 
+#define xhci_for_each_ring_seg(head, seg) \
+	for (seg = head; seg != NULL; seg = (seg->next != head ? seg->next : NULL))
+
 struct xhci_segment {
 	union xhci_trb		*trbs;
 	/* private to HCD */
-- 
2.25.1


