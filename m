Return-Path: <linux-usb+bounces-7340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3686CB14
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A48521C21459
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A220F135A4F;
	Thu, 29 Feb 2024 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4fITFqb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53E134CE0
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215997; cv=none; b=ZTVejcBtgInLzqKGF9wYmMgr0rGa2WlJ9ooLo5MwwZG7quZXts8gCUzg4Gl4H6lh1fqEvj0PMfzVQ2d3gKtV4tiBnTsr/XylxHsA3yG2Z7sPtaue5LM1mPlmAw7ApSd4Vt2UGNAfGG9SkO/cN5zM3CNn4MAkA+kO3yWNRrMXH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215997; c=relaxed/simple;
	bh=AiFpotYi6DkxOYrV7id3qofwyLCWC6u3/fvZZDqKzLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e35PN1zxrR8g8qyCQfoPFuDahl4kPllVBqoIKezfl+2FfI07GubI9BJzyF70J23KXhalUcfjJzqo1x3ULAms2HZroEqMcArKTlLPRC/zGWxW3Q1Mrdr9r+GWaSl5R4+0oJpX8Lj+7am2wsKvNRNsXIgI3ueXMjoavsBnIdsRro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4fITFqb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215996; x=1740751996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AiFpotYi6DkxOYrV7id3qofwyLCWC6u3/fvZZDqKzLw=;
  b=l4fITFqbf+ME08vLLf/lyDIVZzH++FuUjReT9NYjQacdnIwNwNRxW3Sc
   0N07BOyi0xyNX4xWyOD79WkNwQ/qEd+WT0dqfv4B8W5DOeicfWwbsYggr
   gwUEtk+mLYsU81fHVP8EMcZposOEB8JrQdgom0pI7iy6Zwb8AqCQmecer
   kqOkASxTbvlhAnWNLkNJG+SrWh/uTZMrh9R6P5uN8s3cc2NQ4KebaK9Oj
   2ko/XJ2a7hmySVtwWIxDOYlKLZvIon4Qey6hqBH0V7acF2wB5bsQGlDfD
   BDoM+z7yIwjHltbkbTqXJsyK2Xl8SUPqUvEodMMAyLw2zkp+zLvXfadZt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609395"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609395"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035992"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035992"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:13 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/9] xhci: fix matching completion events with TDs
Date: Thu, 29 Feb 2024 16:14:35 +0200
Message-Id: <20240229141438.619372-7-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

A trb_in_td() call is used to determine if a completion event matches
any TRB of the currently executing TD. This function is told to start
searching right after the last finished TD, which is not at all where
the currently expected TD is guaranteed to begin, because some TDs in
between may have been cancelled.

Not only is a pointless work performed, but a bug resulting in the HC
executing cancelled TDs was seen to trick the driver into associating
events from a TD just cancelled with an unrelated future TD.

Since the ring is being traversed for the specific purpose of finding
a match with the current TD, always start from its first TRB. This is
the most reliable bit of information that we posses.

Tracking of HC's work progress is not affected, except for cases when
a misattributed event would have moved dequeue past a pending TD.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 95ed26114ee8..b2116501048c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2813,7 +2813,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			td_num--;
 
 		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(xhci, ep_ring->deq_seg, ep_ring->dequeue,
+		ep_seg = trb_in_td(xhci, td->start_seg, td->first_trb,
 				td->last_trb, ep_trb_dma, false);
 
 		/*
@@ -2881,9 +2881,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					"part of current TD ep_index %d "
 					"comp_code %u\n", ep_index,
 					trb_comp_code);
-				trb_in_td(xhci, ep_ring->deq_seg,
-					  ep_ring->dequeue, td->last_trb,
-					  ep_trb_dma, true);
+				trb_in_td(xhci, td->start_seg, td->first_trb,
+					  td->last_trb, ep_trb_dma, true);
 				return -ESHUTDOWN;
 			}
 		}
-- 
2.25.1


