Return-Path: <linux-usb+bounces-22951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1805A857A5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F863B0CFC
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2CB2980D9;
	Fri, 11 Apr 2025 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsxwGrn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED027CB39
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362759; cv=none; b=qEOmHV5JpKldf5osQmb8vuhBiVbdGutILW1fjnC3w2e4e5jOMVlwwEKAt2pQJWvpFEEn2Ddo6owmDXRLaLgopX/NsflvoR2sWC8t5HpC9/u4iEjojuwVPq/4utNZygAHFhNK00HlImhvZFFAm+8jj1y0B6Dgr06OGWh5LPXWVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362759; c=relaxed/simple;
	bh=8HSgT548SJtyjGc/dP+XJalXIk45cGYogs5L6Q5PJFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gmc+mWyxokAHML7xxpT18ZPiuDD2ayyNzpGu3Sn/cDkBxhjNS/6PNRbWdV6XuhDo4kO7RSV6z6s/0GdUnbZpAWDttDXSSFwLAjhEeL/Sb4rrgujgf4wfV+5LndlrdYHIndRg4dRDj9EMuik24plDMlvuQ+xPXIpx0WNG6Y3UHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsxwGrn9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362758; x=1775898758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8HSgT548SJtyjGc/dP+XJalXIk45cGYogs5L6Q5PJFo=;
  b=lsxwGrn97ddGVKrygqTfYoUMFDoXDIdK1/UpW7RM8ZqoeXlgDLqtEzKu
   sGYJti9kgdgW7fzlojeuAy2ivXuIystIdivHHm6XEnrVCVOKBdLE9zPwN
   X6QdZvXosiDXB+uuwDYHcgWZHoN4xBRPMfqPMmA1FrjtvdwTmh/aEBFKl
   uVK9WVQMqg9TlJDXwS59HLP05KDWBxqSIlNbgXzIwB0830W7yfxhvafLh
   7zHMaXelkajH9sbYGkEHYDOQDNtcuPjU/Y2IKN9T4cvUiDdDSKX/qdlwX
   mwANSjcMJ0Lq8h7ox5PZSjooqCLQhsrx4DL/oU1FUPXX1JxzFXfesCWjz
   w==;
X-CSE-ConnectionGUID: rWi2GA/0QrCfIljfNdpZpw==
X-CSE-MsgGUID: zuYD6yIbQ2arWodaCB6/aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48617948"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="48617948"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:37 -0700
X-CSE-ConnectionGUID: /IymIXf9RieVwqOuu14cag==
X-CSE-MsgGUID: Catcd6o6RD2rPQ6sPA8Vrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="166335666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2025 02:12:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 1A64E78B; Fri, 11 Apr 2025 12:12:35 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 01/11] usb: xhci: relocate pre-allocation initialization
Date: Fri, 11 Apr 2025 12:11:45 +0300
Message-ID: <20250411091155.3386971-2-niklas.neronin@linux.intel.com>
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
index d698095fc88d..eb07445687bb 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2371,22 +2371,6 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
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
@@ -2395,15 +2379,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
@@ -2515,9 +2490,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-	for (i = 0; i < MAX_HC_SLOTS; i++)
-		xhci->devs[i] = NULL;
-
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
 	if (xhci_setup_port_arrays(xhci, flags))
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0452b8d65832..abc5115a2839 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -460,6 +460,21 @@ static int xhci_all_ports_seen_u0(struct xhci_hcd *xhci)
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
@@ -473,11 +488,18 @@ static int xhci_init(struct usb_hcd *hcd)
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
@@ -485,7 +507,8 @@ static int xhci_init(struct usb_hcd *hcd)
 		compliance_mode_recovery_timer_init(xhci);
 	}
 
-	return retval;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
+	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.47.2


