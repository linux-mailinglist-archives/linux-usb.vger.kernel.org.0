Return-Path: <linux-usb+bounces-23140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6C6A90544
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0451B19E1FB9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A95D22259E;
	Wed, 16 Apr 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmxOwPFe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F52222D1
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811177; cv=none; b=Y/EkMGR4hprsjWVncD68fyTPeohRMhS2nH5TY3XidEUadz1KrOC37lR6ADFOnKUcJ9BBw2GYwDkrLJ+Umx8D7jA9Y5TSNbbjtKF3fEfQNUblrX0VFXzz9RfpYdNpz4gOckdwAskj1df6pgcfPD1FTlSA8YkdJxxpCwbKvWbFwTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811177; c=relaxed/simple;
	bh=tfv9k20NMxxTGkuACHVfh8qjkJ1Shl2CSvwK/I2/aGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pD+RBf/m2RT3x9EUm39p7tYQJzxwEhNef3BOoLDVuUx62KFvTZLwxMD1E7tCVj54WXU3/f2traX5BLLsOjuj7lTVkvdNyiT6EedmNOYj5IPd+biw/EII69R0ig7UL9/Y/I9VgzaLjri8In0DyA1anq/B81stnNcv9Kmrf8bxV0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmxOwPFe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811176; x=1776347176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tfv9k20NMxxTGkuACHVfh8qjkJ1Shl2CSvwK/I2/aGw=;
  b=JmxOwPFex0HSAGGV/MqmAXw1KaZpnNn2LOW1a1HyJ2eVf+NQHM6ZIDQc
   PPW3EVrQ8z3VwiJaTJg7SYd6FJEiTMBZFbD+E8nhJGZtLABiP9Dq1aMZt
   ke+Xr/c6p3dDVFzpR8ojL05CKCxL26OoB1cbMOf75uvO0Y/52prlgvRQs
   1RqQBhp/6zZwGqxRwcC4oO/wucCU19Kkhel3EWxh6LnfoOmSpFz7xJ82f
   ncG3a9lvPjWtgYZsRjlValM3uMB1g0JCj8yq1J/hJWHx2HFCtM/XgRC9t
   Lzl/r4lnTYNSaIh3i82qOIkjPkNGQkGw2T4tFz12Sa4Hk6cGXyn5x/UEA
   A==;
X-CSE-ConnectionGUID: 6DEJ9NtaR4+vJgWc/txSbQ==
X-CSE-MsgGUID: lTcFLeKSQM+1uZKvuhwpVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50168109"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50168109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:16 -0700
X-CSE-ConnectionGUID: gk+w/gQET2GJKLDvB05eSw==
X-CSE-MsgGUID: jRwdgdBWSRSXWTiUYd2rMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135290236"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 06:46:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 0547981D; Wed, 16 Apr 2025 16:46:13 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 09/11] usb: xhci: move initialization of the primary interrupter
Date: Wed, 16 Apr 2025 16:45:08 +0300
Message-ID: <20250416134510.2406543-10-niklas.neronin@linux.intel.com>
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

Move the primary interrupter (0) initialization from xhci_mem_init() to
xhci_init(). This change requires us to save the allocated interrupter
somewhere before initialization. Therefore, store it in the 'interrupters'
array and rework xhci_add_interrupter() to retrieve the interrupter from
the array.

This is part of the ongoing effort to separate allocation and
initialization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
 * Add the same logic to specific 'intr_num'. Due to rebase.

 drivers/usb/host/xhci-mem.c | 22 +++++++++-------------
 drivers/usb/host/xhci.c     |  4 ++++
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 75ad30d52507..007536879c24 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2287,14 +2287,13 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	return ir;
 }
 
-static void
-xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
-		     unsigned int intr_num)
+void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 {
+	struct xhci_interrupter *ir;
 	u64 erst_base;
 	u32 erst_size;
 
-	xhci->interrupters[intr_num] = ir;
+	ir = xhci->interrupters[intr_num];
 	ir->intr_num = intr_num;
 	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
 
@@ -2338,14 +2337,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
 		for (i = 1; i < xhci->max_interrupters; i++) {
 			if (!xhci->interrupters[i]) {
-				xhci_add_interrupter(xhci, ir, i);
+				xhci->interrupters[i] = ir;
+				xhci_add_interrupter(xhci, i);
 				err = 0;
 				break;
 			}
 		}
 	} else {
 		if (!xhci->interrupters[intr_num]) {
-			xhci_add_interrupter(xhci, ir, intr_num);
+			xhci->interrupters[intr_num] = ir;
+			xhci_add_interrupter(xhci, intr_num);
 			err = 0;
 		}
 	}
@@ -2372,7 +2373,6 @@ EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
-	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 
@@ -2447,14 +2447,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
 					  flags, dev_to_node(dev));
 
-	ir = xhci_alloc_interrupter(xhci, 0, flags);
-	if (!ir)
+	xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
+	if (!xhci->interrupters[0])
 		goto fail;
 
-	xhci_add_interrupter(xhci, ir, 0);
-
-	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
-
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
 	if (xhci_setup_port_arrays(xhci, flags))
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 18d8637773cb..1cc58d10776d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -578,6 +578,10 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set USB 3.0 device notifications for function remote wake */
 	xhci_set_dev_notifications(xhci);
 
+	/* Initialize the Primary interrupter */
+	xhci_add_interrupter(xhci, 0);
+	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c05c3eab005b..97da9f2853f3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1945,6 +1945,7 @@ void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
 void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
+void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.47.2


