Return-Path: <linux-usb+bounces-23719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75591AA93B7
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 14:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 265137A5865
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 12:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0422024DFFE;
	Mon,  5 May 2025 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+ZnRh11"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B1A20298D
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449845; cv=none; b=ElYjSGbCEzaXBzdNyH0NJ8BcbVfqUO166YIv0HqF5h7AZj4CFd5az6rDR49gyR2Mn2l2ZFtiifJmujlXaWL+gE/R4kv+5uFJGmSxBYtyQnL1jXYCdJMZOLtoPnU5zVAmWT2MehGyMeeeACc3hf7QrKgjgQhkOMYmkXaAvBRTGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449845; c=relaxed/simple;
	bh=RBGQJqtZQXL16vBQbxnBmYQSX1XnLkbrVgf1MiPjBW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptEQSh+T2YUcdbEibw8qf01qWpQ8FjpbAm750pK2xmayu/PpnNALW/lrWnRluT1SyHrTsWEqf1H9QHDqD2RKVoQN3ODOQe+NjiI2JC9Mtv5MLqDAI92lD487OC0iGVqaRpwbW2Uw4okV95HGN9ilgFu0O0CJffU6nnC95/n/MK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+ZnRh11; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746449844; x=1777985844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RBGQJqtZQXL16vBQbxnBmYQSX1XnLkbrVgf1MiPjBW4=;
  b=U+ZnRh117Ys69YdZhxAPG9HFWNQe/S9mZgsVgEMsVr9PUbqBGOxfi1Nm
   1ON26a5A3QHTzUWwt3HQnGLvlLbMB/7AbHRaQyoHEAwMS5QR/HIH4bgNa
   dWrGZRhuYNQwsbNGrZi/WX4OqNvQSPePVOGPqfYCLlNLtoF8MnqRB7v52
   Hk6qujsGdisJLETapktbD129IlEvww2z+4dtBTrElXEXRHqaLg0Lawbiv
   c14TTGgN97iZT8eon2xPhopTYrgV3tFcXPkmgu6z4X5bnQDqTXr+uXlyB
   3nrBvE6saHhpsvuvsTdQXU3d/+UnCw2lgAHOre0SgLeJ69kxkWjnI/Y/O
   g==;
X-CSE-ConnectionGUID: 9jwRnOiNROCwshVq4IPa2w==
X-CSE-MsgGUID: oLnX6b8PSNmpxsK1fkm32A==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="35675906"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="35675906"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 05:57:22 -0700
X-CSE-ConnectionGUID: YtD9pA7FSzmz04pKh1ie1g==
X-CSE-MsgGUID: thOr+mXZTCOdO6/dR5867w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135151082"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2025 05:57:19 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Jonathan Bell <jonathan@raspberrypi.org>,
	Oliver Neukum <oneukum@suse.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/2] usb: xhci: Don't trust the EP Context cycle bit when moving HW dequeue
Date: Mon,  5 May 2025 15:56:29 +0300
Message-ID: <20250505125630.561699-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505125630.561699-1-mathias.nyman@linux.intel.com>
References: <20250505125630.561699-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

VIA VL805 doesn't bother updating the EP Context cycle bit when the
endpoint halts. This is seen by patching xhci_move_dequeue_past_td()
to print the cycle bits of the EP Context and the TRB at hw_dequeue
and then disconnecting a flash drive while reading it. Actual cycle
state is random as expected, but the EP Context bit is always 1.

This means that the cycle state produced by this function is wrong
half the time, and then the endpoint stops working.

Work around it by looking at the cycle bit of TD's end_trb instead
of believing the Endpoint or Stream Context. Specifically:

- rename cycle_found to hw_dequeue_found to avoid confusion
- initialize new_cycle from td->end_trb instead of hw_dequeue
- switch new_cycle toggling to happen after end_trb is found

Now a workload which regularly stalls the device works normally for
a few hours and clearly demonstrates the HW bug - the EP Context bit
is not updated in a new cycle until Set TR Dequeue overwrites it:

[  +0,000298] sd 10:0:0:0: [sdc] Attached SCSI disk
[  +0,011758] cycle bits: TRB 1 EP Ctx 1
[  +5,947138] cycle bits: TRB 1 EP Ctx 1
[  +0,065731] cycle bits: TRB 0 EP Ctx 1
[  +0,064022] cycle bits: TRB 0 EP Ctx 0
[  +0,063297] cycle bits: TRB 0 EP Ctx 0
[  +0,069823] cycle bits: TRB 0 EP Ctx 0
[  +0,063390] cycle bits: TRB 1 EP Ctx 0
[  +0,063064] cycle bits: TRB 1 EP Ctx 1
[  +0,062293] cycle bits: TRB 1 EP Ctx 1
[  +0,066087] cycle bits: TRB 0 EP Ctx 1
[  +0,063636] cycle bits: TRB 0 EP Ctx 0
[  +0,066360] cycle bits: TRB 0 EP Ctx 0

Also tested on the buggy ASM1042 which moves EP Context dequeue to
the next TRB after errors, one problem case addressed by the rework
that implemented this loop. In this case hw_dequeue can be enqueue,
so simply picking the cycle bit of TRB at hw_dequeue wouldn't work.

Commit 5255660b208a ("xhci: add quirk for host controllers that
don't update endpoint DCS") tried to solve the stale cycle problem,
but it was more complex and got reverted due to a reported issue.

Cc: Jonathan Bell <jonathan@raspberrypi.org>
Cc: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b906bc2eea5f..423bf3649570 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -699,7 +699,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	int new_cycle;
 	dma_addr_t addr;
 	u64 hw_dequeue;
-	bool cycle_found = false;
+	bool hw_dequeue_found = false;
 	bool td_last_trb_found = false;
 	u32 trb_sct = 0;
 	int ret;
@@ -715,25 +715,24 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
 	new_seg = ep_ring->deq_seg;
 	new_deq = ep_ring->dequeue;
-	new_cycle = hw_dequeue & 0x1;
+	new_cycle = le32_to_cpu(td->end_trb->generic.field[3]) & TRB_CYCLE;
 
 	/*
-	 * We want to find the pointer, segment and cycle state of the new trb
-	 * (the one after current TD's end_trb). We know the cycle state at
-	 * hw_dequeue, so walk the ring until both hw_dequeue and end_trb are
-	 * found.
+	 * Walk the ring until both the next TRB and hw_dequeue are found (don't
+	 * move hw_dequeue back if it went forward due to a HW bug). Cycle state
+	 * is loaded from a known good TRB, track later toggles to maintain it.
 	 */
 	do {
-		if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_deq)
+		if (!hw_dequeue_found && xhci_trb_virt_to_dma(new_seg, new_deq)
 		    == (dma_addr_t)(hw_dequeue & ~0xf)) {
-			cycle_found = true;
+			hw_dequeue_found = true;
 			if (td_last_trb_found)
 				break;
 		}
 		if (new_deq == td->end_trb)
 			td_last_trb_found = true;
 
-		if (cycle_found && trb_is_link(new_deq) &&
+		if (td_last_trb_found && trb_is_link(new_deq) &&
 		    link_trb_toggles_cycle(new_deq))
 			new_cycle ^= 0x1;
 
@@ -745,7 +744,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 			return -EINVAL;
 		}
 
-	} while (!cycle_found || !td_last_trb_found);
+	} while (!hw_dequeue_found || !td_last_trb_found);
 
 	/* Don't update the ring cycle state for the producer (us). */
 	addr = xhci_trb_virt_to_dma(new_seg, new_deq);
-- 
2.43.0


