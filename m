Return-Path: <linux-usb+bounces-22959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404DA857AC
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E864C8A6777
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFBB2980DF;
	Fri, 11 Apr 2025 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kx8KHB7r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC920298CA5
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362781; cv=none; b=Ul8KhKwrujwC+CkyeRdSMADcFvyrAZCBCMFKPKjq6/QnVVl8IaoHepx2OM/covjhwZ3QmpF4rJroZGpGMUZuvtZRNcWGd2waKKbqrqQgS6xMrUXI871XZCZckUUUrkicBivuVemz5riwLcl3M6VkagUbIJofYfr1Nw3JGspjaiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362781; c=relaxed/simple;
	bh=G/2dOQgkDxcM8anKzzLP2er/JP7B+cRI/BiFND3iUPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0IBb5y1UqRU3jvPxkA4025Zsg0nTocz9bXNCngDx+uPEj4Dbztv/XI4AXX7v0gah99xJrDpi4Xxmrcsil/y99QpKHwQOuRr3QfXE0iaj4gShqgjBNBzcHn4XG7QbtB1gbCXCVB2brh1E9RCoDhZ+PAC8AYxnC03+Xzw4+sLdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kx8KHB7r; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362780; x=1775898780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G/2dOQgkDxcM8anKzzLP2er/JP7B+cRI/BiFND3iUPQ=;
  b=kx8KHB7rOgUbWP93Zbv60o9j//9eqv2Y345iGC1n3BlSE61O+bydLrGC
   yOWM0xIlY+V3Q+WGILnaGGjD+HnqsAwcdhAmgIe7GGdPj4+zZgIaVyH4c
   rGkFlU1jIcjlwo9nF41YYo64fe0KZ4bUiy4bO8m//I3yqBEJXPiqou2/v
   +t9OQEa1wlRCJKqa1F4hRp3SO8hRt/J/mE/gmNuhOqy3FI/pwIu380Cgk
   5zB26HzCs508n67pNKOTNfbaJkqEWpRy5OPLbGY92X6urgbr67IY0rr/U
   VGZYUgsPPIiTolP8A8oWSg+opQUocv9qwTMkHqm3pREG6BOh7Jy4zb3bF
   Q==;
X-CSE-ConnectionGUID: fwaScDfRSieuh3oy3/bXMw==
X-CSE-MsgGUID: LPYYK8nmQwyIU5PJ+CrQpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798955"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:13:00 -0700
X-CSE-ConnectionGUID: Etl636DsQaqSDYqgLKOeuw==
X-CSE-MsgGUID: fYaIsW5kTTmmuHLLtn7wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008686"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id EAD6A7BC; Fri, 11 Apr 2025 12:12:57 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 09/11] usb: xhci: move initialization of the primary interrupter
Date: Fri, 11 Apr 2025 12:11:53 +0300
Message-ID: <20250411091155.3386971-10-niklas.neronin@linux.intel.com>
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

Move the primary interrupter (0) initialization from xhci_mem_init() to
xhci_init(). This change requires us to save the allocated interrupter
somewhere before initialization. Therefore, store it in the 'interrupters'
array and rework xhci_add_interrupter() to retrieve the interrupter from
the array.

This is part of the ongoing effort to separate allocation and
initialization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 19 +++++++------------
 drivers/usb/host/xhci.c     |  4 ++++
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ce632a288c41..2d1f320e5fd6 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2282,14 +2282,13 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
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
 
@@ -2332,7 +2331,8 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
 	for (i = 1; i < xhci->max_interrupters; i++) {
 		if (xhci->interrupters[i] == NULL) {
-			xhci_add_interrupter(xhci, ir, i);
+			xhci->interrupters[i] = ir;
+			xhci_add_interrupter(xhci, i);
 			break;
 		}
 	}
@@ -2360,7 +2360,6 @@ EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
-	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 
@@ -2435,14 +2434,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index 8fe217cdf80f..c7380ebdb680 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -577,6 +577,10 @@ static int xhci_init(struct usb_hcd *hcd)
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
index b8e6ce888032..4c32ad36c493 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1934,6 +1934,7 @@ unsigned int count_trbs(u64 addr, u64 len);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
+void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.47.2


