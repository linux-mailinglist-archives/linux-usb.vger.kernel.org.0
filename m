Return-Path: <linux-usb+bounces-23983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0ACAB88A1
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4423BBE2E
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7991917D0;
	Thu, 15 May 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5SVJCeQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055BD15573F
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317395; cv=none; b=K6jD8RppmI7TuZSIPbVYZeLB8ICSoOTDG1XqWko922aP/FaJOwoRt63VXG38S6sJc1KVRWwkImq+kyPiyrMNOXU2VIN6QPTmVNreMZu2JvAek4RzJVCLhvOUHGgswPbFRoaIJwXoV7jujTBXW5uaNP0mOx+eQZbR00VQVKNvIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317395; c=relaxed/simple;
	bh=/Z6ELDNh51tsdwgqg5Cze5zClI2U+WqoTwT4A1Uay3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CD1SIqfCCN1zlRR10kM3ETFEhPJp/98w1ZfyvHP4R9WLGFJJatdu1wcFiPnjvJcCOb+RmpQctQ8rhm62gmJJktvj4SxLkfHNLyEnz3+jZFEGD/TnniFIuJBMD+77Iz+TWumynU5/XCBhPH6aLqWt6dLjuxlkSEdvCRg5kJ10xBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5SVJCeQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317394; x=1778853394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Z6ELDNh51tsdwgqg5Cze5zClI2U+WqoTwT4A1Uay3k=;
  b=M5SVJCeQLFw8XiEN+gISuHHFPuTsEXIytNIk6FAfwz1AmSlfQxOlRs5E
   Q9cLh8AekamnbekLxBrMZDQZ6gmc0BW2XudIAKOCwSp3VKjBHYXVKIMQ/
   ZRbYF4T55KegkDf3uwIsVEjoC+UM7ZtUGg6CHFcueDklhnrgyrU7ybY07
   HQCotH0Lkl1sfc/Bk2V/5+Bj+3UzZ9Qz2PrcHgO8Jd9tN26QJLPg0deO8
   RAVlihj3uyx7V8B63q+5rFosmv1P4DVW0G1eX627Na4zsF0KAzz4ILILb
   yZbyeISyTzdrlkuMtZoR9lu8DaprSl4m7Gz1Go/4dFZsxA4D7RpojOPf+
   A==;
X-CSE-ConnectionGUID: R6nY6z4jTfS7NAd9FEbirw==
X-CSE-MsgGUID: 4OJR3Oo7QMeBPPMZ1maK7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60269998"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60269998"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:34 -0700
X-CSE-ConnectionGUID: CPnIROJDTDqDfzmyZe4YaQ==
X-CSE-MsgGUID: 115JENeAQJKdyZH2J/NyqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372081"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:32 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/24] usb: xhci: relocate pre-allocation initialization
Date: Thu, 15 May 2025 16:56:00 +0300
Message-ID: <20250515135621.335595-4-mathias.nyman@linux.intel.com>
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

Move pre-allocation initialization from xhci_mem_init() to xhci_init().
This change is part of an ongoing effort to separate initialization from
allocation within the xhci driver. By doing so, it will enable future
patches to re-initialize xhci driver memory without the necessity of fully
recreating it.

Additionally, compliance mode recovery initialization has been adjusted to
only occur after successful memory allocation.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 28 ----------------------------
 drivers/usb/host/xhci.c     | 29 ++++++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7ff6a47d3198..a7955e02905c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2414,22 +2414,6 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
-static void xhci_hcd_page_size(struct xhci_hcd *xhci)
-{
-	u32 page_size;
-
-	page_size = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;
-	if (!is_power_of_2(page_size)) {
-		xhci_warn(xhci, "Invalid page size register = 0x%x\n", page_size);
-		/* Fallback to 4K page size, since that's common */
-		page_size = 1;
-	}
-
-	xhci->page_size = page_size << 12;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
-		       xhci->page_size >> 10);
-}
-
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct xhci_interrupter *ir;
@@ -2438,15 +2422,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	unsigned int	val, val2;
 	u64		val_64;
 	u32		temp;
-	int		i;
-
-	INIT_LIST_HEAD(&xhci->cmd_list);
-
-	/* init command timeout work */
-	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
-	init_completion(&xhci->cmd_ring_stop_completion);
-
-	xhci_hcd_page_size(xhci);
 
 	/*
 	 * Program the Number of Device Slots Enabled field in the CONFIG
@@ -2567,9 +2542,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-	for (i = 0; i < MAX_HC_SLOTS; i++)
-		xhci->devs[i] = NULL;
-
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
 	if (xhci_setup_port_arrays(xhci, flags))
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index fd9d41fe3224..b073e9d91665 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -461,6 +461,21 @@ static int xhci_all_ports_seen_u0(struct xhci_hcd *xhci)
 	return (xhci->port_status_u0 == ((1 << xhci->usb3_rhub.num_ports) - 1));
 }
 
+static void xhci_hcd_page_size(struct xhci_hcd *xhci)
+{
+	u32 page_size;
+
+	page_size = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;
+	if (!is_power_of_2(page_size)) {
+		xhci_warn(xhci, "Invalid page size register = 0x%x\n", page_size);
+		/* Fallback to 4K page size, since that's common */
+		page_size = 1;
+	}
+
+	xhci->page_size = page_size << 12;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
+		       xhci->page_size >> 10);
+}
 
 /*
  * Initialize memory for HCD and xHC (one-time init).
@@ -474,11 +489,18 @@ static int xhci_init(struct usb_hcd *hcd)
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int retval;
 
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_init");
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 	spin_lock_init(&xhci->lock);
 
+	INIT_LIST_HEAD(&xhci->cmd_list);
+	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
+	init_completion(&xhci->cmd_ring_stop_completion);
+	xhci_hcd_page_size(xhci);
+	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
+
 	retval = xhci_mem_init(xhci, GFP_KERNEL);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished xhci_init");
+	if (retval)
+		return retval;
 
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
@@ -486,7 +508,8 @@ static int xhci_init(struct usb_hcd *hcd)
 		compliance_mode_recovery_timer_init(xhci);
 	}
 
-	return retval;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
+	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.43.0


