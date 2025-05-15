Return-Path: <linux-usb+bounces-23992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E546AB88A5
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D2254E372A
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91981ACEAC;
	Thu, 15 May 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VakCIPHs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BEE189915
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317410; cv=none; b=AYa0WRQoTXIpSkTKNCtuxM6ZwgDID9BTj74Euny9yrKmkaQ46t7HclDeC0nCCUAfhBtBB7wCLBaQIvA7goxTfdgSpdUDpQp1B6hGIOXx4x1ymUcQSkyFc89pPWnFNOOmjPZgfVwKqTxWpXM8/oI71+CrbyNTimBA6BtKxshnBXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317410; c=relaxed/simple;
	bh=AVIiMIWQZy/uanVXoizLMAyWlSQaKi2tM9mgsQkhkKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiOfPr5IKiAI559mveSk7qs4TBQwOXlxPYdpm53ek3IcwPcFvsjq81CjUIzLsPbTs56n8gtnuFv7J0K2Q7FcntDc/IodT5tiyfHqoICyQOH+ueReM8NuNf/cm9rSeopK0nI0eFNexnOs2Eo4N3it6Vn1z6cZiC6Z6BhEqu8GqVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VakCIPHs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317409; x=1778853409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVIiMIWQZy/uanVXoizLMAyWlSQaKi2tM9mgsQkhkKE=;
  b=VakCIPHs1utOjS4nTbUTzBDOFPx4GlvPupV6JnLQfodWPiHMiA/Mui/Q
   QY8ekS9h8BTvJ7xzPMIYiAEL4Q2LqaQZfB7hl8a7Vd9lFK+O7MRqG83+M
   IOmR0vOR696wSiZcX9cBpG4wgnVvNCrdfmTaogKAg5+ps6RVZ5UT1PsR0
   HCdjBcdspGIvA+wqgz2L4B1KnzmO7w48qYXFTThr3HI0BUPfdjbI7iYr0
   dclfE38dw7cXhAwW1+mMJENefgBoZ8eSdZPNe65RJ6060xVgjjh6fnps1
   ioge6lsarE1eopZwWLBv8tbYxNG8OmY0d9+90vVYhcjiINmI+L51MTXDV
   A==;
X-CSE-ConnectionGUID: CzNOtP8WS8GkTmnOpIFwbg==
X-CSE-MsgGUID: TSs1hIIbQ4SJ0C+QPKDYLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270040"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:49 -0700
X-CSE-ConnectionGUID: Gmn7atP5RKigh3niad84/w==
X-CSE-MsgGUID: zpap/U4lRZWsGMibA8LBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372237"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:47 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/24] usb: xhci: add individual allocation checks in xhci_mem_init()
Date: Thu, 15 May 2025 16:56:09 +0300
Message-ID: <20250515135621.335595-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Break up the existing multi-allocation checks into individual checks.
Add missing allocation check for 'xhci->interrupters'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index eb076f5ed1d0..8cadd785ac0e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2437,11 +2437,13 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	else
 		xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
 				TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE, xhci->page_size);
+	if (!xhci->segment_pool)
+		goto fail;
 
 	/* See Table 46 and Note on Figure 55 */
 	xhci->device_pool = dma_pool_create("xHCI input/output contexts", dev,
 			2112, 64, xhci->page_size);
-	if (!xhci->segment_pool || !xhci->device_pool)
+	if (!xhci->device_pool)
 		goto fail;
 
 	/* Linear stream context arrays don't have any boundary restrictions,
@@ -2450,12 +2452,17 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->small_streams_pool =
 		dma_pool_create("xHCI 256 byte stream ctx arrays",
 			dev, SMALL_STREAM_ARRAY_SIZE, 16, 0);
+	if (!xhci->small_streams_pool)
+		goto fail;
+
 	xhci->medium_streams_pool =
 		dma_pool_create("xHCI 1KB stream ctx arrays",
 			dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
 	/* Any stream context array bigger than MEDIUM_STREAM_ARRAY_SIZE
 	 * will be allocated with dma_alloc_coherent()
 	 */
+	if (!xhci->medium_streams_pool)
+		goto fail;
 
 	/* refer to xhci rev1_2 protocol 5.3.3 max ports is 255.
 	 * refer to xhci rev1_2 protocol 6.4.3.14 port bandwidth buffer need
@@ -2464,9 +2471,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->port_bw_pool =
 		dma_pool_create("xHCI 256 port bw ctx arrays",
 			dev, GET_PORT_BW_ARRAY_SIZE, 16, 0);
-
-	if (!xhci->small_streams_pool || !xhci->medium_streams_pool ||
-		!xhci->port_bw_pool)
+	if (!xhci->port_bw_pool)
 		goto fail;
 
 	/* Set up the command ring to have one segments for now. */
@@ -2489,6 +2494,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		       "Allocating primary event ring");
 	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
 					  flags, dev_to_node(dev));
+	if (!xhci->interrupters)
+		goto fail;
 
 	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
 	if (!xhci->interrupters[0])
-- 
2.43.0


