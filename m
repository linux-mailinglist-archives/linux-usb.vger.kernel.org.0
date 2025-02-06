Return-Path: <linux-usb+bounces-20218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76721A2A5DF
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 11:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54C23A8286
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 10:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EB122540E;
	Thu,  6 Feb 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PP+iz9W5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2B18B03
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838083; cv=none; b=DmqUyYBX2pZCbxz0v6Blm/8XO+qQQwcd13gdwHh36zfBYG/BMrOSsPKcdnRirUxUw0ZFksMscqj2+pyrb+hCbUB5Bh1++0s9z8DslDb+n7UZ6Db8o5ISB44UjQ6mxq+y7MrnVrQWuQuPxbSmMGm5cxET17T6n2D4DDJTm5MZmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838083; c=relaxed/simple;
	bh=2JiUcOM4qqRQm9DmI9zM1bg0+0tO17pH1C/43gMwfCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSPnc8b4bU0FQyJI8F4qWxNZNVipZQRqsstwNFEjkCregLMqQ/bO0K0EmoMljbKxKzACxleODyuv2J8fYAKpdB4Aqxgxe7WgTiqvzExiQmBkeebBGmO1zicez24+zjaG6BFe8otHbmOFDTQ8tFn749dsESdAM59LFbhR4CGrcNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PP+iz9W5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838082; x=1770374082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2JiUcOM4qqRQm9DmI9zM1bg0+0tO17pH1C/43gMwfCo=;
  b=PP+iz9W5ZcawRmMfHMRxwpKwCxA/EtLJVIW6fegvYHkVMn/I+p+IHBfS
   lYfCqyJWYDLVdK/4W4c9PrfIKK8ETe5geR3OllUnieJnpuQMAL/WsFke+
   3PoW8MQ6iX+PQe6/6R7EnW3XVgq+EEDC/J2q9fuNcoobtqESJ0IKISISX
   J+sKKCuWWMsuajqZqJXD6b6fbsYXt6geO6O5U/xjnRWFk0UW5gSBZfWNA
   RXeI72dd8b3kFqJ3+Ul1d3BXRnbACO+qOkJE2dz4/dLrEyL6rHCacvqBI
   yG019OWVaweT3K+u7X8PAONuTUPqZZ64/rfZBwv4wpFNEgPflswSP1fAB
   Q==;
X-CSE-ConnectionGUID: 2K1IUtEtRT6fTuNk5XFAjg==
X-CSE-MsgGUID: wa1D6dZZTiqGK0BwBgHHng==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43189420"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43189420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:34:41 -0800
X-CSE-ConnectionGUID: veHBgPZlRZSXIUXBBc5XjA==
X-CSE-MsgGUID: lOXdCIz8T9qJ55txsDytTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116364501"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 02:34:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id DF53EEE; Thu, 06 Feb 2025 12:34:38 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/4] usb: xhci: modify trb_in_td() to be more modular
Date: Thu,  6 Feb 2025 12:34:28 +0200
Message-ID: <20250206103428.1034784-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206103428.1034784-1-niklas.neronin@linux.intel.com>
References: <20250206103428.1034784-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lay the ground work for future handle_tx_event() rework, which will
require a function which checks if a DMA address is in queueu.

To its core, trb_in_td() checks if a TRB falls within the specified start
and end TRB/segment range, a common requirement. For instance, a ring has
pointers to the queues first and last TRB/segment, which means that with
slight modifications and renaming trb_in_td() could work for other
structures not only TDs.

Modify trb_in_td() to accept pointer to start and end TRB/segment, and
introduce a new function that takes a 'xhci_td' struct pointer, forwarding
its elements to dma_in_range(), previously trb_in_td().

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 41 ++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 23337c9d34c1..34699038b7f2 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -278,24 +278,28 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 }
 
 /*
- * If the suspect DMA address is a TRB in this TD, this function returns that
- * TRB's segment. Otherwise it returns 0.
+ * Check if the DMA address of a TRB falls within the specified range.
+ * The range is defined by 'start_trb' in 'start_seg' and 'end_trb' in 'end_seg'.
+ * If the TRB's DMA address is within this range, return the segment containing the TRB.
+ * Otherwise, return 'NULL'.
  */
-static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t dma)
+static struct xhci_segment *dma_in_range(struct xhci_segment *start_seg, union xhci_trb *start_trb,
+					 struct xhci_segment *end_seg, union xhci_trb *end_trb,
+					 dma_addr_t dma)
 {
-	struct xhci_segment *seg = td->start_seg;
+	struct xhci_segment *seg = start_seg;
 
-	if (td->start_seg == td->end_seg) {
-		if (td->start_trb <= td->end_trb) {
-			if (xhci_trb_virt_to_dma(td->start_seg, td->start_trb) <= dma &&
-			    dma <= xhci_trb_virt_to_dma(td->end_seg, td->end_trb))
+	if (start_seg == end_seg) {
+		if (start_trb <= end_trb) {
+			if (xhci_trb_virt_to_dma(start_seg, start_trb) <= dma &&
+			    dma <= xhci_trb_virt_to_dma(end_seg, end_trb))
 				return seg;
 			return NULL;
 		}
 
 		/* Edge case, the TD wrapped around to the start segment. */
-		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma &&
-		    dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
+		if (xhci_trb_virt_to_dma(end_seg, end_trb) < dma &&
+		    dma < xhci_trb_virt_to_dma(start_seg, start_trb))
 			return NULL;
 		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))
 			return seg;
@@ -304,24 +308,29 @@ static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t dma)
 
 	/* Loop through segment which don't contain the DMA address. */
 	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {
-		if (seg == td->end_seg)
+		if (seg == end_seg)
 			return NULL;
 
 		seg = seg->next;
-		if (seg == td->start_seg)
+		if (seg == start_seg)
 			return NULL;
 	}
 
-	if (seg == td->start_seg) {
-		if (dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
+	if (seg == start_seg) {
+		if (dma < xhci_trb_virt_to_dma(start_seg, start_trb))
 			return NULL;
-	} else if (seg == td->end_seg) {
-		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma)
+	} else if (seg == end_seg) {
+		if (xhci_trb_virt_to_dma(end_seg, end_trb) < dma)
 			return NULL;
 	}
 	return seg;
 }
 
+static struct xhci_segment *trb_in_td(struct xhci_td *td, dma_addr_t dma)
+{
+	return dma_in_range(td->start_seg, td->start_trb, td->end_seg, td->end_trb, dma);
+}
+
 /*
  * Return number of free normal TRBs from enqueue to dequeue pointer on ring.
  * Not counting an assumed link TRB at end of each TRBS_PER_SEGMENT sized segment.
-- 
2.47.2


