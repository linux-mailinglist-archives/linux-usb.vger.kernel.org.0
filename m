Return-Path: <linux-usb+bounces-17188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CE9BE3E1
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56CB1F24D2B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010F71DDC13;
	Wed,  6 Nov 2024 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUh3dJiG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278F81DE2BE
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887987; cv=none; b=jDa7JN7FlMXebqWtx4J0juKd0OOXN2BoYyr1VuXMcEmnI4FqMogovbPM5Qpst9DqsNqQv8l9x+rLFolQoAC1NU+N+ymRwc6HZaiTPLsV1M9rEEBeQZcMb0dKUfDRiQKcyElbeDUaOR/umtyYHmAZciyqrmW6+Afp5nwAb2Kl/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887987; c=relaxed/simple;
	bh=+y9R/qFelJ+85F4fjV7ozxcVNNVmzDsZZR0MCX7xqLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XoznK6SrjLhPwLy6mCsdfsoSCR/Z9IrwxnzdzVGPZRRIpU3QYHk8VN/FFf/tKYd0rTTyWMrjALea8arsfq3WIX19OMcKDs7IkL1e6iw3TPiw/McFMLFTRNuP6F0NW4XVkIQd7djSXBNGzBn3o6qmL58a04Vq3ARfoXXEPtf59CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUh3dJiG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887986; x=1762423986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+y9R/qFelJ+85F4fjV7ozxcVNNVmzDsZZR0MCX7xqLs=;
  b=PUh3dJiGJVga8JVLU/EM8L1AxRl99BPUJhODyK5cB9DCz8+//+qd58js
   f8qzPMGtL1llBwyP27qkSXEZ1enkvzINdfDDsrG3W11/BUM9mPIYzkgoD
   q94clQeLbWjcsk6HrDFyv/b2fHxtHguYZwfbGNul22WtfY1u0p7wHMCzy
   CQxEfxhZJpnA68Lh8LgvKUzXThiMsG4YMDWblVWn8ED9M0y2nvZTbakSK
   03vnbywBiMt9hbz7O44S/gZbjID3R6hhNsLZo+MNsL8qETuRIeznK/Cuu
   KnerDPa2W0DO6B63ee5rajD/gj5XX5vmGQwyZMFKitr+aBKvMgSEMVMGU
   g==;
X-CSE-ConnectionGUID: ALrfO2KYSyelEiXGxRuj1w==
X-CSE-MsgGUID: Im2htf8BQiSOIId9mox+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059404"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:06 -0800
X-CSE-ConnectionGUID: 8lRwI+4WQO67KwJoOahJUA==
X-CSE-MsgGUID: qYISQAnkTTmPRrlkHGv7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813139"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:05 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/33] usb: xhci: rework xhci_free_segments_for_ring()
Date: Wed,  6 Nov 2024 12:14:39 +0200
Message-Id: <20241106101459.775897-14-mathias.nyman@linux.intel.com>
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

The segment list is only relevant within the context of the ring.
Thus, it is more logical to pass the ring itself when freeing all segments
from a ring, rather than passing the ring list.

Rename the function to "xhci_ring_segments_free" to align with the naming
convention of xhci_segment_free().

To make the freeing process more intuitive, free segments sequentially
from start to end (i.e., 0, 1, 2, 3, ...) instead of freeing the first
segment last (i.e., 1, 2, 3, ... 0).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fa77a15dfde6..e46be4c49b2f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -71,18 +71,18 @@ static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
 	kfree(seg);
 }
 
-static void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
-				struct xhci_segment *first)
+static void xhci_ring_segments_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
 {
-	struct xhci_segment *seg;
+	struct xhci_segment *seg, *next;
+
+	ring->last_seg->next = NULL;
+	seg = ring->first_seg;
 
-	seg = first->next;
-	while (seg && seg != first) {
-		struct xhci_segment *next = seg->next;
+	while (seg) {
+		next = seg->next;
 		xhci_segment_free(xhci, seg);
 		seg = next;
 	}
-	xhci_segment_free(xhci, first);
 }
 
 /*
@@ -282,7 +282,7 @@ void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring)
 	if (ring->first_seg) {
 		if (ring->type == TYPE_STREAM)
 			xhci_remove_stream_mapping(ring);
-		xhci_free_segments_for_ring(xhci, ring->first_seg);
+		xhci_ring_segments_free(xhci, ring);
 	}
 
 	kfree(ring);
@@ -344,7 +344,8 @@ static int xhci_alloc_segments_for_ring(struct xhci_hcd *xhci, struct xhci_ring
 	return 0;
 
 free_segments:
-	xhci_free_segments_for_ring(xhci, ring->first_seg);
+	ring->last_seg = prev;
+	xhci_ring_segments_free(xhci, ring);
 	return -ENOMEM;
 }
 
@@ -433,7 +434,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	return 0;
 
 free_segments:
-	xhci_free_segments_for_ring(xhci, new_ring.first_seg);
+	xhci_ring_segments_free(xhci, &new_ring);
 	return ret;
 }
 
-- 
2.25.1


