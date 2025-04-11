Return-Path: <linux-usb+bounces-22960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD3A857A4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4FB54A5CE8
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EB1298CBC;
	Fri, 11 Apr 2025 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUEjLPQM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E7298CB6
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362782; cv=none; b=lFhTOJKs5tZGVzNi6yxR+8f/bsEDxZ7ct69mm8qdUt61ckLfnVqZ/zkk1MxBfJxUvXtxD9monDxuhglonb6/4rhk1fUryQ4DKYpSzMUPyAAmMW7//9F/wtd1POE7IG9ViRTFnCeLFSfRdy2DdvmGVW1oh2w5kLopUtHFwpIYans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362782; c=relaxed/simple;
	bh=J53z98lnqHeakF7LnnF19xXHKf3xvK1fGryDtkrGUYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STIGvpXCv4TxZDd1EXxZ0WuWGAvKUT3uz6ZaQt26y6Q0oqDJatPziHcZlKJ0yfVshwI38UGBlPpwyPx44anBDjF2BV/tqnZn5nWew4h3HfoQ0OHwoJ8BSG2Fr6kUlbEcWU5nb3DdeJq/TiVSgltXXV5WXt6C1VOed/K9H/l/B9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUEjLPQM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362782; x=1775898782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J53z98lnqHeakF7LnnF19xXHKf3xvK1fGryDtkrGUYQ=;
  b=IUEjLPQMA5lxEv5NPswfkru1Bvch7ddz3qAAD3ZiVKJ7AxjgK2oFkHfP
   u/ODV4tKAtL89goVDrqcp3USs9uV3vHReqNcRuY7Us300TIJ253ViLLn/
   Cvrc+FGatRYgid9UxXG45kACkIWhzc5ioDKitbj47xyPk4aMGqXCWbl5T
   ofqksZtbxM1c6zg2t/k6JB8cW/V82X9gYTaZVFEntcjaUX6/IS7U97ibW
   Qy6Mv2w0AgUMpkWOkJttmPMUsizogGYUCnjy0i4txrbbQBYjYvcY2OjZ/
   xDcRMRPQ9CqZUMSjU1lg3herxt6plJPHJQWfIso2J7Gl+qESQvd801Mw0
   g==;
X-CSE-ConnectionGUID: PPaH4LjxTfSkqFmx30iE2Q==
X-CSE-MsgGUID: h5yn2chyRWCkb8fNgkT06A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798957"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:13:01 -0700
X-CSE-ConnectionGUID: GxBGvxbRQwCf4k67nUubKQ==
X-CSE-MsgGUID: PuEYSjajSjGJXhaqewkHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008702"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:13:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id CAE0378B; Fri, 11 Apr 2025 12:12:58 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 10/11] usb: xhci: add individual allocation checks in xhci_mem_init()
Date: Fri, 11 Apr 2025 12:11:54 +0300
Message-ID: <20250411091155.3386971-11-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
References: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
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
index 2d1f320e5fd6..a45d96a5ef5f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2390,11 +2390,13 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2403,6 +2405,9 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->small_streams_pool =
 		dma_pool_create("xHCI 256 byte stream ctx arrays",
 			dev, SMALL_STREAM_ARRAY_SIZE, 16, 0);
+	if (!xhci->small_streams_pool)
+		goto fail;
+
 	xhci->medium_streams_pool =
 		dma_pool_create("xHCI 1KB stream ctx arrays",
 			dev, MEDIUM_STREAM_ARRAY_SIZE, 16, 0);
@@ -2410,7 +2415,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * will be allocated with dma_alloc_coherent()
 	 */
 
-	if (!xhci->small_streams_pool || !xhci->medium_streams_pool)
+	if (!xhci->medium_streams_pool)
 		goto fail;
 
 	/* Set up the command ring to have one segments for now. */
@@ -2433,6 +2438,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		       "Allocating primary event ring");
 	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
 					  flags, dev_to_node(dev));
+	if (!xhci->interrupters)
+		goto fail;
 
 	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
 	if (!xhci->interrupters[0])
-- 
2.47.2


