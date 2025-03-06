Return-Path: <linux-usb+bounces-21435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1DA54E2A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B110216B28D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3460716F0E8;
	Thu,  6 Mar 2025 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoaEf+L+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E716DEB3
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272570; cv=none; b=uPXrdw6fKzyZWDHTo6gG8yM0ucOb+5uh88ishUSjrjtMn1S3DBUuWUWUmGBEjlataSUvKU7/V9aBGcvj5fOjjVOED54VQXS4g+AxVHco75fRbzRUreev2DGP/7aNlCn8BEoUgWizobx0IqMXm7G5CkbpKU2gTcrf7f0OJCkdSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272570; c=relaxed/simple;
	bh=ZhQp1SbanU9lG/QyxFdzp5uy0GZaoqivD0iflGquVMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcXJHcF9AGz088KD8LL12r/9tWWbSKBX3exNGggxX3Xs/c7bd5Vy8xlCsI9GYForyGVJsyoef7KG2uXU3HY71p4XKVOtNll0ViXTWOVDcYeHLFuXWx44hdi0XghUwKV5d8b6YKTSbCJDcaITs2X4buTGxSXCaoIWBW3GmsWfack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoaEf+L+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272569; x=1772808569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZhQp1SbanU9lG/QyxFdzp5uy0GZaoqivD0iflGquVMo=;
  b=PoaEf+L+v2wzqoKpvSY6x//cEC/LC576e14aWNmYrxqVo41v/jvfsEYz
   i1/91ArctiaWtJ2AEWcT0UeeS8YaqgBh83/KoZr0iWJkHQGvTBEvOnCCZ
   pdcyx2vvJdMUogwj2xmktR8HEE/pdMs/uRFq+QKUllMrk+q9unodRcuL0
   xtk2ElqwMDpzsurk8TuyqIfFKExGmvuShq6cI3bRoCJ+h9LRt9lg0HBwe
   O1LdRVnV1hGoXmzMgkpjh0Cx+T1hJX72i9Zmq/J6MBlMyA543+wxL1l9E
   jbuuWwCpUEKTjTMOCaHCJ+fKvd7i6pRf06BJVfpt9/wvA/8pcAO6/ENdl
   w==;
X-CSE-ConnectionGUID: BuQ3aAXGTQqfTmGNklt8sg==
X-CSE-MsgGUID: VEcd934qRWeOc3E0rarP+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657069"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:28 -0800
X-CSE-ConnectionGUID: Ry/zP7HuRVOA2UCA4WxyGA==
X-CSE-MsgGUID: Rb3TI7z7QTa3LgUorfcgtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954790"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:26 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/15] usb: xhci: remove redundant update_ring_for_set_deq_completion() function
Date: Thu,  6 Mar 2025 16:49:41 +0200
Message-ID: <20250306144954.3507700-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The function is a remnant from a previous implementation and is now
redundant. There is no longer a need to search for the dequeue pointer,
as both the TRB and segment dequeue pointers are saved within
'queued_deq_seg' and 'queued_deq_ptr'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 41 ++----------------------------------
 1 file changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..23cf20026359 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1332,43 +1332,6 @@ void xhci_hc_died(struct xhci_hcd *xhci)
 		usb_hc_died(xhci_to_hcd(xhci));
 }
 
-static void update_ring_for_set_deq_completion(struct xhci_hcd *xhci,
-		struct xhci_virt_device *dev,
-		struct xhci_ring *ep_ring,
-		unsigned int ep_index)
-{
-	union xhci_trb *dequeue_temp;
-
-	dequeue_temp = ep_ring->dequeue;
-
-	/* If we get two back-to-back stalls, and the first stalled transfer
-	 * ends just before a link TRB, the dequeue pointer will be left on
-	 * the link TRB by the code in the while loop.  So we have to update
-	 * the dequeue pointer one segment further, or we'll jump off
-	 * the segment into la-la-land.
-	 */
-	if (trb_is_link(ep_ring->dequeue)) {
-		ep_ring->deq_seg = ep_ring->deq_seg->next;
-		ep_ring->dequeue = ep_ring->deq_seg->trbs;
-	}
-
-	while (ep_ring->dequeue != dev->eps[ep_index].queued_deq_ptr) {
-		/* We have more usable TRBs */
-		ep_ring->dequeue++;
-		if (trb_is_link(ep_ring->dequeue)) {
-			if (ep_ring->dequeue ==
-					dev->eps[ep_index].queued_deq_ptr)
-				break;
-			ep_ring->deq_seg = ep_ring->deq_seg->next;
-			ep_ring->dequeue = ep_ring->deq_seg->trbs;
-		}
-		if (ep_ring->dequeue == dequeue_temp) {
-			xhci_dbg(xhci, "Unable to find new dequeue pointer\n");
-			break;
-		}
-	}
-}
-
 /*
  * When we get a completion for a Set Transfer Ring Dequeue Pointer command,
  * we need to clear the set deq pending flag in the endpoint ring state, so that
@@ -1473,8 +1436,8 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			/* Update the ring's dequeue segment and dequeue pointer
 			 * to reflect the new position.
 			 */
-			update_ring_for_set_deq_completion(xhci, ep->vdev,
-				ep_ring, ep_index);
+			ep_ring->deq_seg = ep->queued_deq_seg;
+			ep_ring->dequeue = ep->queued_deq_ptr;
 		} else {
 			xhci_warn(xhci, "Mismatch between completed Set TR Deq Ptr command & xHCI internal state.\n");
 			xhci_warn(xhci, "ep deq seg = %p, deq ptr = %p\n",
-- 
2.43.0


