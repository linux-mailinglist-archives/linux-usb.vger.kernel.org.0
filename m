Return-Path: <linux-usb+bounces-30567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B7C63E7F
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDEEB4EDC6A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCBE32B9B6;
	Mon, 17 Nov 2025 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7u0Wa66"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D805A32B984
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379825; cv=none; b=m2TaTkbw2xgwRLfVHN/QLIL7w1k1hCQ3E0O8dhUDH6HfoDtwvnqhveRX3sZG/G8IUF9R9GbJ9xcbtdo+3DAPPNsm1yUiSQHj9z+BTGGAchXv3IMfGtTreqEaToyEtfInejwo7tMK+qyf81bL38dNh6I3Sloevvowf3VbEPfzzts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379825; c=relaxed/simple;
	bh=Rbvc5BbDiJixM4UBS/J7eEAGkLVB9qe2XDrxnYBA90U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5voLdty3ZmMGUx7kMsjz0RiwZCu/X57TgwIP1EfrWkgbFfehd9QwGSCGzeeBKmyGF+gx2p6bUQqlvtvMTZNZnp1B5fnZeIy4Ve8KOCWcGAeuAg7QEY6AtaEV3+W4Vc2bBHEMgRiBHXZxofU3peBrsqJgWxZJGrR++hGjgjeSQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7u0Wa66; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379823; x=1794915823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rbvc5BbDiJixM4UBS/J7eEAGkLVB9qe2XDrxnYBA90U=;
  b=e7u0Wa66ISOJwkYJbWNxqL0HeZRaGeSSh3FaKC0XghzEYpCXltL2c+lq
   3fT03krnHPLfd9mzzdXdrs8LWmgsczkuKNnqy22FYGyp15/BRcGMKdmza
   ajGTLLY+eZnuwAth2OZ1c5XyssYGLi0PU8tppaCZxg6Mh2BlL6bGxDuam
   oEJ4XVn2X0V0LN80a5z37ATwm7KTyhn+NC8w1lhPWfJX3EnmSG/lSEPKJ
   3JHpRc4Ic2XuZr6X7bzH8i/Sddt8oaxEh15MxeTYyOFYZl2/Zst3a8/RU
   ZiC0Yema4HyPkSo/0YtkODwrdCzVPT9PiKpT5O4GmU3SWok8vwYVuFsQY
   w==;
X-CSE-ConnectionGUID: dYlzvZkWRRKvHE7708Syrg==
X-CSE-MsgGUID: dPO4WlFoQMOOANdwXtOqgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82763834"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82763834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:43 -0800
X-CSE-ConnectionGUID: ru5veAipRBGqL8k2A8MHDg==
X-CSE-MsgGUID: ta+sVymtRfGbNvYroenEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="191218376"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 03:43:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id D229898; Mon, 17 Nov 2025 12:43:40 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 9/9] usb: xhci: remove duplicate '0x' prefix from DMA addresses
Date: Mon, 17 Nov 2025 12:42:41 +0100
Message-ID: <20251117114242.3507856-10-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefix "0x" is automatically added by '%pad'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 8 ++++----
 drivers/usb/host/xhci-ring.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0e7d1a174f83..3eb0ff27fc16 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -988,14 +988,14 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	if (!dev->out_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d output ctx = 0x%pad (dma)\n", slot_id, &dev->out_ctx->dma);
+	xhci_dbg(xhci, "Slot %d output ctx = %pad (dma)\n", slot_id, &dev->out_ctx->dma);
 
 	/* Allocate the (input) device context for address device command */
 	dev->in_ctx = xhci_alloc_container_ctx(xhci, XHCI_CTX_TYPE_INPUT, flags);
 	if (!dev->in_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d input ctx = 0x%pad (dma)\n", slot_id, &dev->in_ctx->dma);
+	xhci_dbg(xhci, "Slot %d input ctx = %pad (dma)\n", slot_id, &dev->in_ctx->dma);
 
 	/* Initialize the cancellation and bandwidth list for each ep */
 	for (i = 0; i < 31; i++) {
@@ -2410,7 +2410,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-		       "Device context base array address = 0x%pad (DMA), %p (virt)",
+		       "Device context base array address = %pad (DMA), %p (virt)",
 		       &xhci->dcbaa->dma, xhci->dcbaa);
 
 	/*
@@ -2471,7 +2471,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is %pad",
 		       &xhci->cmd_ring->first_seg->dma);
 
 	/*
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a49043a39a4d..b04390f04347 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -746,7 +746,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	}
 
 	if ((ep->ep_state & SET_DEQ_PENDING)) {
-		xhci_warn(xhci, "Set TR Deq already pending, don't submit for 0x%pad\n",
+		xhci_warn(xhci, "Set TR Deq already pending, don't submit for %pad\n",
 			  &addr);
 		return -EBUSY;
 	}
@@ -754,7 +754,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	/* This function gets called from contexts where it cannot sleep */
 	cmd = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 	if (!cmd) {
-		xhci_warn(xhci, "Can't alloc Set TR Deq cmd 0x%pad\n", &addr);
+		xhci_warn(xhci, "Can't alloc Set TR Deq cmd %pad\n", &addr);
 		return -ENOMEM;
 	}
 
-- 
2.50.1


