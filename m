Return-Path: <linux-usb+bounces-11683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B2E918153
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37591C21E59
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B81C186296;
	Wed, 26 Jun 2024 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqBAxqYh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E781822EF
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406019; cv=none; b=l0H1DEhMaMtEYvA7WIWGDQ2qzmmPjKfTsUnZ/vSrNPlFLWbt8vyXL3OJbUcjAZgqqVCUqJDmPhIUW4mI095X8xsKnM7qk2uP/O8cBd9Fu10NdMQUIBnizkfaiSle2uEvVUhpDzJxCqOW+eS/JpdJ4TEbg1MmJtY5vCZMJNjViQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406019; c=relaxed/simple;
	bh=7p/GwfP6Ur9H7rPJHPEZwv2XZhgpwg2kH6lHtILt9kY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fIzTlIO/9OITNHTREsHxmcZBZVsqeIeLwx59MB7tIs6eL+NGeqCL2m8nL5724R5f35FUDTJjL7rk+pYXhZDPjMr58V34/FWWrIDbJYPeeUSPZ+Ddm27KoM+NqAZ22gQpcQKd4nSLRx0gnH/syYQOUO5xf4U7wap94zKhNo0u8LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqBAxqYh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406018; x=1750942018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7p/GwfP6Ur9H7rPJHPEZwv2XZhgpwg2kH6lHtILt9kY=;
  b=iqBAxqYhliBLRf5lg2pPdtn8dCQIvdw1mJ0OKWH5gS96JjJEwOw96fuA
   sMvDzH2tPOTz/IeL1HI5JScIECauhsthvtF9Y63kVJX/2SdBzZLgZJ2JY
   LZtqUj4GU+jNyGiEMBqZz8jAFdDtDAKRkxzOzlugivi8jVrQnHXi5+xE3
   IsEUz3bte207MUGTUIyTbwAsygMILQl2CGZ/JwWMXE5Du/mgOGpSLVslw
   HTbRKSFvOD8YmQffRkpQA6Ta7OX1Z+Vlv7BqZq1Cp+Wb3zkliE9Phv08y
   6fglaxKtAhSSaXsf8jgR2PHv0OiADGBDioK83qdaYBWHTG3e/DYRRGtFI
   A==;
X-CSE-ConnectionGUID: spRguPK9TvOT758o5iXF4w==
X-CSE-MsgGUID: NJUPvoHfQlm9W8+p5miUjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353394"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:58 -0700
X-CSE-ConnectionGUID: XGZgt2RzRBmtmB5F/ZaYNg==
X-CSE-MsgGUID: fjbYAFyOT6CMJ5BGhw7cRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442647"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:56 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/21] usb: xhci: move all segment re-numbering to xhci_link_rings()
Date: Wed, 26 Jun 2024 15:48:24 +0300
Message-Id: <20240626124835.1023046-11-mathias.nyman@linux.intel.com>
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

This is a preparation patch for switching from custom segment list
handling to using list.h functions.

Contain all segment re-numbering in xhci_link_rings() which links two
segments lists together, and performs all necessary adjustments for
them to fit together.

No need to send segment number to xhci_alloc_segments_for_ring()
as a parameter after this.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 68994ce21933..020a23ece74f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -153,7 +153,7 @@ static void xhci_link_rings(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		ring->last_seg = last;
 	}
 
-	for (seg = last; seg != ring->last_seg; seg = seg->next)
+	for (seg = ring->enq_seg; seg != ring->last_seg; seg = seg->next)
 		seg->next->num = seg->num + 1;
 }
 
@@ -324,12 +324,16 @@ EXPORT_SYMBOL_GPL(xhci_initialize_ring_info);
 
 /* Allocate segments and link them for a ring */
 static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci,
-		struct xhci_segment **first, struct xhci_segment **last,
-		unsigned int num_segs, unsigned int num,
-		unsigned int cycle_state, enum xhci_ring_type type,
-		unsigned int max_packet, gfp_t flags)
+					struct xhci_segment **first,
+					struct xhci_segment **last,
+					unsigned int num_segs,
+					unsigned int cycle_state,
+					enum xhci_ring_type type,
+					unsigned int max_packet,
+					gfp_t flags)
 {
 	struct xhci_segment *prev;
+	unsigned int num = 0;
 	bool chain_links;
 
 	chain_links = xhci_link_chain_quirk(xhci, type);
@@ -388,9 +392,8 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 	if (num_segs == 0)
 		return ring;
 
-	ret = xhci_alloc_segments_for_ring(xhci, &ring->first_seg,
-			&ring->last_seg, num_segs, 0, cycle_state, type,
-			max_packet, flags);
+	ret = xhci_alloc_segments_for_ring(xhci, &ring->first_seg, &ring->last_seg, num_segs,
+					   cycle_state, type, max_packet, flags);
 	if (ret)
 		goto fail;
 
@@ -428,10 +431,8 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	struct xhci_segment	*last;
 	int			ret;
 
-	ret = xhci_alloc_segments_for_ring(xhci, &first, &last,
-			num_new_segs, ring->enq_seg->num + 1,
-			ring->cycle_state, ring->type,
-			ring->bounce_buf_len, flags);
+	ret = xhci_alloc_segments_for_ring(xhci, &first, &last, num_new_segs, ring->cycle_state,
+					   ring->type, ring->bounce_buf_len, flags);
 	if (ret)
 		return -ENOMEM;
 
-- 
2.25.1


