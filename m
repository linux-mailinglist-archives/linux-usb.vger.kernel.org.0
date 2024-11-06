Return-Path: <linux-usb+bounces-17177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5A9BE3D4
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96D21F24D9E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9679A1DDA0E;
	Wed,  6 Nov 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZBwvlsn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589411DD531
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887971; cv=none; b=r1+cqq9UxekJsxNc/vBYw9sp5HpYHA3u8qaRuABvEfdWe1qVXJrmU/3PMm5hXoYcV9oAVF3JzYC3uUZ/z4KAfevAocMrmCkHzNuyGnb4VcGSMcHDMaaRBQixMG+c3zMJYeNEwAofzoQf9a5SuPI5Mgs3zh8b0y9TLgGNA7OmA3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887971; c=relaxed/simple;
	bh=22ZFcOSJb95wTMIMowmmrHcqZcVCP0h0ks/wawdpMVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ju1lWU7r+U7r79t62D2rkLiPs1dRSUPcXd+jyr9xxEWUr82fr+QyZ3CfnGQqTIOCcXrYXFUKF7H2CZEPea4ulqNAKEadwS5KW04S8htC17G4hsIQjH9qhH4Jx+sb8G9q46Euei1+SCDqnK6o9TGc+ZvtBFNGESqzzEdxV9edYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZBwvlsn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887969; x=1762423969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=22ZFcOSJb95wTMIMowmmrHcqZcVCP0h0ks/wawdpMVU=;
  b=cZBwvlsn///4bjxOjWujRBQqOGc5Fr7bcaCJhifwiM/bS9MZMBYEKW+i
   4oa8jZV/FD7rWzwZ+YsrC5Ry4SLfqZ5MxMY5ZZ7WE4jItcePly766c+nr
   KajO17atQsHWBo1M3uJJftM0tmqjP42lV5Gg9gpKlhDAoLHgxiEPGFEse
   jHN6vJTxky7nxLqMeEnTFo4biL6tu7O1ze15bsjdGeNWIeK7CyW+sdpPR
   8pP8g51lcOajAbB8mvPRNjQVFsKFP5BUQSwwmONOmF//EDjMT4sQ+NkvW
   xdEl7N9y6emhOK2WcTAL63nGlUC7Pt3axHFFqNyaxX/TgeACDz/dwxTd5
   w==;
X-CSE-ConnectionGUID: c0jXKY5sRsOaXV2hjYllWQ==
X-CSE-MsgGUID: XPv8DXHIRAS4U7yK0XC4Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059371"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059371"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:49 -0800
X-CSE-ConnectionGUID: DMUtuaEqQjyfP5KUKTX0Xw==
X-CSE-MsgGUID: //OzX9ujS36NBS0SK+V0iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812924"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:48 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/33] usb: xhci: Remove unused parameters of next_trb()
Date: Wed,  6 Nov 2024 12:14:28 +0200
Message-Id: <20241106101459.775897-3-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

The function has two parameters which it doesn't use and hasn't ever
used. One caller even puts NULL there, knowing it will work anyway.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9f1e150a1c76..36ccf0dac7fa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -145,10 +145,8 @@ static void trb_to_noop(union xhci_trb *trb, u32 noop_type)
  * TRB is in a new segment.  This does not skip over link TRBs, and it does not
  * effect the ring dequeue or enqueue pointers.
  */
-static void next_trb(struct xhci_hcd *xhci,
-		struct xhci_ring *ring,
-		struct xhci_segment **seg,
-		union xhci_trb **trb)
+static void next_trb(struct xhci_segment **seg,
+			union xhci_trb **trb)
 {
 	if (trb_is_link(*trb) || last_trb_on_seg(*seg, *trb)) {
 		*seg = (*seg)->next;
@@ -446,9 +444,9 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * avoiding corrupting the command ring pointer in case the command ring
 	 * is stopped by the time the upper dword is written.
 	 */
-	next_trb(xhci, NULL, &new_seg, &new_deq);
+	next_trb(&new_seg, &new_deq);
 	if (trb_is_link(new_deq))
-		next_trb(xhci, NULL, &new_seg, &new_deq);
+		next_trb(&new_seg, &new_deq);
 
 	crcr = xhci_trb_virt_to_dma(new_seg, new_deq);
 	xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
@@ -678,7 +676,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 		    link_trb_toggles_cycle(new_deq))
 			new_cycle ^= 0x1;
 
-		next_trb(xhci, ep_ring, &new_seg, &new_deq);
+		next_trb(&new_seg, &new_deq);
 
 		/* Search wrapped around, bail out */
 		if (new_deq == ep->ring->dequeue) {
@@ -756,7 +754,7 @@ static void td_to_noop(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 		if (trb == td->last_trb)
 			break;
 
-		next_trb(xhci, ep_ring, &seg, &trb);
+		next_trb(&seg, &trb);
 	}
 }
 
@@ -2273,7 +2271,7 @@ static int sum_trb_lengths(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	union xhci_trb *trb = ring->dequeue;
 	struct xhci_segment *seg = ring->deq_seg;
 
-	for (sum = 0; trb != stop_trb; next_trb(xhci, ring, &seg, &trb)) {
+	for (sum = 0; trb != stop_trb; next_trb(&seg, &trb)) {
 		if (!trb_is_noop(trb) && !trb_is_link(trb))
 			sum += TRB_LEN(le32_to_cpu(trb->generic.field[2]));
 	}
-- 
2.25.1


