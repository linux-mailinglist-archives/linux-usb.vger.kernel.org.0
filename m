Return-Path: <linux-usb+bounces-22746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E26A8046E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A0D4A0FB6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835026AA90;
	Tue,  8 Apr 2025 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnaqJ4vl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031EE26A1C2
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113595; cv=none; b=cE9AA3YJhVl+O09s9oe3m1y8FX0c2v4xL2+oqhQxlxEcHdFhfoZqZSo4arG4vg/AZV83ix38MKklkoU/UXW8svOc94SMciz91yCcOfDinxKAFcn421Zr/1BoiGZgwht4H/LpU9F+jcu5wEfO8icrRKuYtCm31AHEn29wjRfvy1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113595; c=relaxed/simple;
	bh=gMJBYkaDozAuibLCBZKRcOn0bJzdUbP6HB3Kg2WgUaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFvzYiYy9dHx5fM3YCjuO4ziytN36WNnLk7AzI5qPEE1F+vBUEJhIxBc7BmXXoZQhYAv5/dWvsOlG2uWAd7f2de+Q15bwSPMHKX6GzE3Ac335ORZ1SxfQs3Zu4WtucqA1tniKk+Xy9ngT3hJedU2n6AlHrkN7Ye7zHm3oOLSEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnaqJ4vl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113594; x=1775649594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gMJBYkaDozAuibLCBZKRcOn0bJzdUbP6HB3Kg2WgUaY=;
  b=DnaqJ4vlowiVI6epPEWUCBEg/MoD3qb8TNKy1/BUzXrGtESLH/Fjjn5G
   rF++MCI2bTQ6OpbVZtu6p4OW0zZ4suOvOlluBtKlVN8DqFrb3ySdbior9
   A87dnzP0Eqbn4z9EnObOIQPyFuJEngD7U1rGJSkGu0bOsMLcg32NCjA4b
   5o5pQjE1y4DeFaCrtnJc/3Ri1WqsbY6+gjBCP5c1KyWJ7GQXqWNtmiI+p
   C9/wSA/Zuw1HyPZQf/R2tBNgaPSkjjESPah/Fsuy1/2A6MzXrKv6bA8MQ
   rTg7iKXE0By9J79E1T1q3zIuLll1Rzm0XmXyWyp3byClDUOMieDyewLhj
   A==;
X-CSE-ConnectionGUID: 5goVQqX+S3CqnF3sHe2wKw==
X-CSE-MsgGUID: IGgO6yo/Rf2TY/DWDav3SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44681732"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44681732"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:53 -0700
X-CSE-ConnectionGUID: /dkCZFypSF+oo8Vu1BtvCQ==
X-CSE-MsgGUID: Y+FAyOUPRbiiw8XOvcn3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128114715"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 04:59:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 214D14A3; Tue, 08 Apr 2025 14:59:51 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 6/9] usb: xhci: rework Event Ring Segment Table Address mask
Date: Tue,  8 Apr 2025 14:57:49 +0300
Message-ID: <20250408115752.1344901-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event Ring Segment Table Base Address Register contain two fields:
 - Bits 5:0:	RsvdP (Reserved and Preserved)
 - Bits 63:6:	Event Ring Segment Table Base Address

Currently, an inverted RsvdP mask (ERST_BASE_RSVDP) is used to extract
bits 63:6. Replaces the inverted mask with a non-inverted mask,
'ERST_BASE_ADDRESS_MASK', which makes the code easier to read.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 drivers/usb/host/xhci.h     | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index b6a2b0c01eb2..5ef38f97f7ea 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2311,8 +2311,8 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 	writel(erst_size, &ir->ir_set->erst_size);
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
-	erst_base &= ERST_BASE_RSVDP;
-	erst_base |= ir->erst.erst_dma_addr & ~ERST_BASE_RSVDP;
+	erst_base &= ~ERST_BASE_ADDRESS_MASK;
+	erst_base |= ir->erst.erst_dma_addr & ERST_BASE_ADDRESS_MASK;
 	if (xhci->quirks & XHCI_WRITE_64_HI_LO)
 		hi_lo_writeq(erst_base, &ir->ir_set->erst_base);
 	else
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5e5b71958745..2a4beb6a6695 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -256,7 +256,8 @@ struct xhci_intr_reg {
 #define	ERST_SIZE_MASK		(0xffff)
 
 /* erst_base bitmasks */
-#define ERST_BASE_RSVDP		(GENMASK_ULL(5, 0))
+/* bits 63:6 - Event Ring Segment Table Base Address Register */
+#define ERST_BASE_ADDRESS_MASK	GENMASK_ULL(63, 6)
 
 /* erst_dequeue bitmasks */
 /* Dequeue ERST Segment Index (DESI) - Segment number (or alias)
-- 
2.47.2


