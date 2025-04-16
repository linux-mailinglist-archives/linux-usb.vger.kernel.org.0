Return-Path: <linux-usb+bounces-23134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC843A90545
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3418E06E1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B976221F2E;
	Wed, 16 Apr 2025 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URJuTEWM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4871ACECF
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811173; cv=none; b=I5CaDZH84MiavHKGgazTSLxE9E6S2H74yrUnGDxsEcOuKhBCPbD+j2SZq7AUiWq9a7xZoorIGKvpeOzcL9ZwffpbQ3692PAMM6RigsplmLF2KPWobAXaRflGwgjEyoy4sKcOMTKibv/nfVul81emxDTWd+aJYGCOBkKWHK55wsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811173; c=relaxed/simple;
	bh=C20cBz7e2yLMFoIDGNo0fq9xw2QEejAUM1eEgmJWTZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHjDh1dpZvt3pLd4YD6OA0yvnsEaYaxvfoUxjxYd/wckIk6eqyd8V/XgsqsVBiD4cXLx3x6wbq0FZSBANrbu5uRCsPbjSM10q/CmJpe7ljLx0cDn2/gdNOV5ZJzimhK6Tie8inUXEzar+4X+HHW+vnDmrtpSkzBKhLVqlftYoHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URJuTEWM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811170; x=1776347170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C20cBz7e2yLMFoIDGNo0fq9xw2QEejAUM1eEgmJWTZ0=;
  b=URJuTEWMrexialWz2dZtR4j99vWBNqytJDCwcjKcKH91+Jcdb7WGVB+o
   LxuznLppc7nieZTfxm5hufDKVf9C0OUMm9YBIspuvgrWetlrA/ilwZJs1
   X2ncQS/ql502J2u4a+XBIwoNFay302XVeUZH58aKSXu0Yi8Evrpw2rDsV
   CKBN06RbSh7Bk0pez1hCGDDrDloZXmzkYkYu7sxOscUJc+rhZr3cqrPyb
   saoBuLlNG6OrJEn4NOOLcgLYumWxIhRmTUhvIPJhx7IchDGFSBh04a8nk
   jCZ3RjnkNRGpPju+5aFHoIKGYYL3e4F5OYtw0JvnG/Ti6FIh2pjtD9Hqh
   w==;
X-CSE-ConnectionGUID: eJ63rSVCSliTC3kAG7iACQ==
X-CSE-MsgGUID: cvA3GxzVRS26zuXX8SU7oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074446"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074446"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:10 -0700
X-CSE-ConnectionGUID: Y9Sb+FhATza+6YGFGObBpw==
X-CSE-MsgGUID: a/QbwmHBRIGyEb1ilcBN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659137"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 3CC6E260; Wed, 16 Apr 2025 16:46:08 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 01/11] usb: xhci: relocate pre-allocation initialization
Date: Wed, 16 Apr 2025 16:45:00 +0300
Message-ID: <20250416134510.2406543-2-niklas.neronin@linux.intel.com>
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

Move pre-allocation initialization from xhci_mem_init() to xhci_init().
This change is part of an ongoing effort to separate initialization from
allocation within the xhci driver. By doing so, it will enable future
patches to re-initialize xhci driver memory without the necessity of fully
recreating it.

Additionally, compliance mode recovery initialization has been adjusted to
only occur after successful memory allocation.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 28 ----------------------------
 drivers/usb/host/xhci.c     | 29 ++++++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ed36df46b140..d309e8e9d508 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2380,22 +2380,6 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
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
@@ -2404,15 +2388,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2524,9 +2499,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-	for (i = 0; i < MAX_HC_SLOTS; i++)
-		xhci->devs[i] = NULL;
-
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
 	if (xhci_setup_port_arrays(xhci, flags))
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index cfda35004754..ec2e4a2d8af0 100644
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
2.47.2


