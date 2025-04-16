Return-Path: <linux-usb+bounces-23143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CAA9054D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB9663BE1B7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76164222566;
	Wed, 16 Apr 2025 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxutgpwL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB36222585
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811179; cv=none; b=jV4Z2qaPFQBY1NkM0C9Wglw8TAkyjP/GGrZyZhY6BkT9C6vRvRdRCEDrgGB4hem2p8wT4+MX4+JOVPLocEKiQVEc1QP8inIl6/9sgjUnth5oqbOCsL2x5nDg5eICpVILT26VR+Nz1TrhepGUDXCzWW20XAq+5EKgZ3EeTeshHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811179; c=relaxed/simple;
	bh=1Lz8KKBu9PZJ72w195lWYKl2VTg6lorL3JnsjbcTlZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWg/XEES0N5TT1WNRnLweO0LMtDBEqJ5mknECSz30GZRy7WbBNjsoRdb49Vg+k/8x0x5N+7/FkBB4p0pI9eyBtbf8Yq5C1gxholTWBLvLJcxT1ODcP4JMj3KdCW5ph4A6/rgiQfnk0SmDx/G9Kmrk6HwRVKBrCc3N9btN36xSD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxutgpwL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811177; x=1776347177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Lz8KKBu9PZJ72w195lWYKl2VTg6lorL3JnsjbcTlZg=;
  b=nxutgpwL5axcImEAlT+MeJJGF7M+4zYZi5J5OuelTF02amzFD5V4dMhf
   mrIgrlrTwnWvRthuqK/3LPaM3K7acwtlMbr6WJxX/Hg8kqx0J2S3ccgIq
   1hucqG2jE/zhN6M8a8YhXu54NQbF18sLeWLMTqbz5LNgWs7ykWEN/nb5y
   teaBgnNbKESWLaqVjQ4isYHN9B9XQU45W5szSA7BedzCgUq55iNdOIc98
   /aixkc5f2yiGx24OXZUR3ZmsQexnB6Siq7l4uWzK5V+2fwS1oMZYwraAb
   ek769wS2tgWaSnWzwrrX2sI/WNTkwp9clPyfzP7w5LydUcvjTtI6B7h2s
   Q==;
X-CSE-ConnectionGUID: 6IBpqr2lRDqNGCAflpVNeg==
X-CSE-MsgGUID: J96nuUzyRhy7mGtwHRSZ9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074469"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:16 -0700
X-CSE-ConnectionGUID: qWmfg0cvSOynJnAUiEilkg==
X-CSE-MsgGUID: WycA1XraT8yPdAMxNX8rfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659182"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id A9A66715; Wed, 16 Apr 2025 16:46:14 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 10/11] usb: xhci: add individual allocation checks in xhci_mem_init()
Date: Wed, 16 Apr 2025 16:45:09 +0300
Message-ID: <20250416134510.2406543-11-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
References: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break up the existing multi-allocation checks into individual checks.
Add missing allocation check for 'xhci->interrupters'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 007536879c24..3edb231af199 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2403,11 +2403,13 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2416,6 +2418,9 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->small_streams_pool =
 		dma_pool_create("xHCI 256 byte stream ctx arrays",
 			dev, SMALL_STREAM_ARRAY_SIZE, 16, 0);
+	if (!xhci->small_streams_pool)
+		goto fail;
+
 	xhci->medium_streams_pool =
 		dma_pool_create("xHCI 1KB stream ctx arrays",
 			dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
@@ -2423,7 +2428,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * will be allocated with dma_alloc_coherent()
 	 */
 
-	if (!xhci->small_streams_pool || !xhci->medium_streams_pool)
+	if (!xhci->medium_streams_pool)
 		goto fail;
 
 	/* Set up the command ring to have one segments for now. */
@@ -2446,6 +2451,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		       "Allocating primary event ring");
 	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
 					  flags, dev_to_node(dev));
+	if (!xhci->interrupters)
+		goto fail;
 
 	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
 	if (!xhci->interrupters[0])
-- 
2.47.2


