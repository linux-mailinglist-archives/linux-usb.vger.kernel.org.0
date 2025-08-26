Return-Path: <linux-usb+bounces-27305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183EB361CA
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 15:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E410F2A7081
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 13:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488F623026B;
	Tue, 26 Aug 2025 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJNHhvt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B3227BA4
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756213660; cv=none; b=iXDvVXNRa4EOSNqIveZ2whzkhbBfFdomAbhqGGymlDNhrC+OO++RyS/sQbNhsQIZXDYtY+KlScHX3rW0caHWyk4MeOJzXDe9MduxJdIlIrrcIqWI9dyMDv7VbK321W5fX+/Dlz+YR01qFi4psoGKgerqq9Fm5RmkeDFCw6Amu5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756213660; c=relaxed/simple;
	bh=xNGmJFOxIPr+UdX+9Zvuo2TjlcUOJLY66rnvzu7lY4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NkIfYT8gMFn10/hQ86gDo+5tv+hPBcKpheHSMogRDL2KWw8Rs+c9Iozfy7xvVe8aMcklpY4wvPgLXZBjriomawZ3apvD1f2vYisCMrIl2aDBqsckodoupRhFQZNF+BdZ8DV4X2w3YoEpPX5ZhRMSmt92mya8kFfZ+/6m2U5VKjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJNHhvt8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756213659; x=1787749659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xNGmJFOxIPr+UdX+9Zvuo2TjlcUOJLY66rnvzu7lY4w=;
  b=KJNHhvt8drWVtrRqwxMBFYQmhIljNzqXO27XGTv8wGmPW2lFllUch/7f
   cBoSv/dpPMJIZ4Q35ZSjTHqHrg2d/3S3ha6uZciAMrvWE+Al2mSh5oKAL
   x7GcWLWvvwzDbTzTjU0Q8Bs19/4hi4nvbdi5hYCOkZ6Mg0UyrDDpyHLRf
   Yx0Raw9ov7c2YOK3hSAHGkW0VZSg3kKkjoiUyDq1m6MDz2yUidMg6oah+
   xgp9i8eTBP0Xlb0SxwJz6jC1GgBp4CebZUVXR4rehxYaXvmsHwKhjflWN
   KMqpQyeGVnzRthMXo2l7pgyXQHGO8mUo5JJsVvNHYRMPlHr7KdwZ+y2cn
   A==;
X-CSE-ConnectionGUID: OL2tW2ukQ4CSHWc+JCDRLw==
X-CSE-MsgGUID: 42iJ+tZgThCCQDnFcwNIQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="76046861"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="76046861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:07:38 -0700
X-CSE-ConnectionGUID: ECZiQe9ZRmOeW1VdafBuWQ==
X-CSE-MsgGUID: 6sJGUfqMSLqRbt6jfSIkNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169745320"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2025 06:07:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 9C68495; Tue, 26 Aug 2025 15:07:35 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2] usb: xhci: improve TR Dequeue Pointer mask
Date: Tue, 26 Aug 2025 15:06:56 +0200
Message-ID: <20250826130656.277633-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address the naming and usage of the TR Dequeue Pointer mask in the xhci
driver. The Endpoint Context Field at offset 0x08 is defined as follows:
 Bit 0		Dequeue Cycle State (DCS)
 Bits 3:1	RsvdZ (Reserved and Zero)
 Bits 63:4	TR Dequeue Pointer

When extracting the TR Dequeue Pointer for an Endpoint without Streams,
in xhci_handle_cmd_set_deq(), the inverted Dequeue Cycle State mask
(~EP_CTX_CYCLE_MASK) is used, inadvertently including the Reserved bits.
Although bits 3:1 are typically zero, using the incorrect mask could cause
issues.

The existing mask, named "SCTX_DEQ_MASK," is misleading because "SCTX"
implies exclusivity to Stream Contexts, whereas the TR Dequeue Pointer is
applicable to both Stream and non-Stream Contexts.

Rename the mask to "TR_DEQ_PTR_MASK", utilize GENMASK_ULL() macro and use
the mask when handling the TR Dequeue Pointer field.

Function xhci_get_hw_deq() returns the Endpoint Context Field 0x08, either
directly from the Endpoint context or a Stream.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
* Rebased on top of 6.16.
* Combined all 3 patches from v1 into one patch.

 drivers/usb/host/xhci-ring.c | 12 ++++++------
 drivers/usb/host/xhci.h      |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ecd757d482c5..d2ccf19292aa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -711,7 +711,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 		return -ENODEV;
 	}
 
-	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
+	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id) & TR_DEQ_PTR_MASK;
 	new_seg = ep_ring->deq_seg;
 	new_deq = ep_ring->dequeue;
 	new_cycle = le32_to_cpu(td->end_trb->generic.field[3]) & TRB_CYCLE;
@@ -723,7 +723,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	 */
 	do {
 		if (!hw_dequeue_found && xhci_trb_virt_to_dma(new_seg, new_deq)
-		    == (dma_addr_t)(hw_dequeue & ~0xf)) {
+		    == (dma_addr_t)hw_dequeue) {
 			hw_dequeue_found = true;
 			if (td_last_trb_found)
 				break;
@@ -1066,7 +1066,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		 */
 		hw_deq = xhci_get_hw_deq(xhci, ep->vdev, ep->ep_index,
 					 td->urb->stream_id);
-		hw_deq &= ~0xf;
+		hw_deq &= TR_DEQ_PTR_MASK;
 
 		if (td->cancel_status == TD_HALTED || trb_in_td(td, hw_deq)) {
 			switch (td->cancel_status) {
@@ -1156,7 +1156,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
 
 	if (!list_empty(&ep->ring->td_list)) { /* Not streams compatible */
 		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
-		hw_deq &= ~0xf;
+		hw_deq &= TR_DEQ_PTR_MASK;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
 		if (trb_in_td(td, hw_deq))
 			return td;
@@ -1481,7 +1481,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		u64 deq;
 		/* 4.6.10 deq ptr is written to the stream ctx for streams */
 		if (ep->ep_state & EP_HAS_STREAMS) {
-			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
+			deq = le64_to_cpu(stream_ctx->stream_ring) & TR_DEQ_PTR_MASK;
 
 			/*
 			 * Cadence xHCI controllers store some endpoint state
@@ -1497,7 +1497,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 				stream_ctx->reserved[1] = 0;
 			}
 		} else {
-			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
+			deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
 		}
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a20f4e7cd43a..59ff84ba2d4a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -500,7 +500,8 @@ struct xhci_ep_ctx {
 
 /* deq bitmasks */
 #define EP_CTX_CYCLE_MASK		(1 << 0)
-#define SCTX_DEQ_MASK			(~0xfL)
+/* bits 63:4 - TR Dequeue Pointer */
+#define TR_DEQ_PTR_MASK			GENMASK_ULL(63, 4)
 
 
 /**
-- 
2.50.1


