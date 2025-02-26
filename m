Return-Path: <linux-usb+bounces-21095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210DA46458
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 16:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC563ACD46
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 15:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66DD2222C6;
	Wed, 26 Feb 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aj+ZpG3p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A4226CE7
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582936; cv=none; b=FCfy2cxHSiJ3/8LWB2QvIUXg0huKaRahvNa6yCbtFT1+zKeN8BSF/Z6VMNdtRAzKLv/eyR3no/45WnPvyIh4ANUxehoTSkIjMAPnHYjgsBSUK/VBaVNhM0Gz+6oVOzzz7F4L3lsen4gap7v3GL74vf+GGuQkqNS1d9khh3afzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582936; c=relaxed/simple;
	bh=LbE4cDc2pS0xTjL4reeU7NsgnXN2n5Xc3uxRIDOlV9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nc075y9uHhTtgFyLtPvZsN+nyX5nbsZDHt9seg5c/nhYkzCDhJniItZnpVL95obGAY6Hkz96S74uE4UmC32FhhmZ1gfXxBUKIL9k9U2JJNCJ68it7l1oHgGR1suG34711CBRrNiI9E+d/nyDJU8i5B3SRwLX1FMAMd+YBQBVErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aj+ZpG3p; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740582935; x=1772118935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LbE4cDc2pS0xTjL4reeU7NsgnXN2n5Xc3uxRIDOlV9s=;
  b=Aj+ZpG3pG5b78+clEYvLXAQU6zb/dHMTEfe/dKmo1M68ow2u72i+ytbZ
   7KBBBOi2Dtb2GCBORh6gFo2rG/SlqutKRjpgK9/uzXnO+Gqmdp1oGa/7s
   fcjs3Y8qT6rAczHDGp828jRIcD5GG9euep6aCCsjR2WDTMJthzrhv6dFO
   bsBZ//0bM0YlTgnpPc+8g1EyZQ4Xi8iO38pPL53gcHjvNkZgxUdDlC66W
   vcnnmxyu1EXm51BcJeOn6hn9PoV7n0rwfL0WJxBWPO7Bgm/Mmx+LUd0yM
   T2o0vE6GjN/47d++yv07spxKfcZBkaeQYHpI5psDuhGvjVoRVS5a7IOhW
   Q==;
X-CSE-ConnectionGUID: NHARt6UlTP6oRJ90MgDnRQ==
X-CSE-MsgGUID: 1lrp0MLMS+yUhv1hFXXZBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41687028"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41687028"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 07:15:32 -0800
X-CSE-ConnectionGUID: hsDquoBvSG2j4Ju6QU50DQ==
X-CSE-MsgGUID: WHWeanw2SHqUgZSBennzsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121984196"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2025 07:15:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id CA7DD4BA; Wed, 26 Feb 2025 17:15:29 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/3] usb: xhci: replace hardcoded Endpoint context masks with corresponding macros
Date: Wed, 26 Feb 2025 17:14:57 +0200
Message-ID: <20250226151458.3871867-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
References: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Endpoint Context Field at Offset 0x08 is defined as follows:
 - Bit 0:	Dequeue Cycle State (DCS)
 - Bits 3:1:	RsvdZ (Reserved and Zero)
 - Bits 63:4:	TR Dequeue Pointer

Replace hardcoded Endpoint context masks with their corresponding macros.

In xhci_move_dequeue_past_td() move the use of TR Dequeue Pointer mask out
of the while loop. The TR dequeue pointer does not change during the loop.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9ff5ca4d5c1c..c45eabe34772 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -657,9 +657,10 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	}
 
 	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
+	new_cycle = hw_dequeue & EP_CTX_CYCLE_MASK;
+	hw_dequeue &= TR_DEQ_PTR_MASK;
 	new_seg = ep_ring->deq_seg;
 	new_deq = ep_ring->dequeue;
-	new_cycle = hw_dequeue & 0x1;
 
 	/*
 	 * We want to find the pointer, segment and cycle state of the new trb
@@ -669,7 +670,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	 */
 	do {
 		if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_deq)
-		    == (dma_addr_t)(hw_dequeue & ~0xf)) {
+		    == (dma_addr_t)hw_dequeue) {
 			cycle_found = true;
 			if (td_last_trb_found)
 				break;
@@ -1012,7 +1013,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		 */
 		hw_deq = xhci_get_hw_deq(xhci, ep->vdev, ep->ep_index,
 					 td->urb->stream_id);
-		hw_deq &= ~0xf;
+		hw_deq &= TR_DEQ_PTR_MASK;
 
 		if (td->cancel_status == TD_HALTED || trb_in_td(xhci, td, hw_deq, false)) {
 			switch (td->cancel_status) {
@@ -1102,7 +1103,7 @@ static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
 
 	if (!list_empty(&ep->ring->td_list)) { /* Not streams compatible */
 		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
-		hw_deq &= ~0xf;
+		hw_deq &= TR_DEQ_PTR_MASK;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
 		if (trb_in_td(ep->xhci, td, hw_deq, false))
 			return td;
-- 
2.47.2


