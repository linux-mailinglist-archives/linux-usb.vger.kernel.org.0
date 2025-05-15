Return-Path: <linux-usb+bounces-23991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58972AB88B0
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AB8A1BC42AF
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6851F4615;
	Thu, 15 May 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9or2SgC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDBF1A2557
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317408; cv=none; b=UcvCy25vTwbIguhy5T9OuAjx/Zo3uuRgkWGoF9iN2DPTGFJK1IHYiSNgxcYOJ6QeRTmc3mq3I7sCeOBFWXMxEEid5RZV53DyqtjWshRfapj6cMAVdqiHmpTWo+haDS4PM8TNJ/W8g+yJerogx5TEmLE/kysuNjaPWyu/bpEA8RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317408; c=relaxed/simple;
	bh=yal4PAWwTc0iA37X+F1mnuFRea+QSnhIdr3sxrXBnEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovUjVsvnd4Aq2zaR8CTVoYnmGqMviPdkPrCdg1r/lY7zLJ+wSXJFkDURSqx/bXcEPJUIms+g7ipQ8GnI7UJjJIJSRqFzxBVtZOYvSb+bXXDx1TQv0R4bcYvu+FFIPnxY3zBdhbsqTMfrZ2XKBtaLiComQ7hk5feqdaTT1qeEkLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9or2SgC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317408; x=1778853408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yal4PAWwTc0iA37X+F1mnuFRea+QSnhIdr3sxrXBnEw=;
  b=W9or2SgCxw3aqOzJD9lj6x1j46BT0w4CsIJ6YTwcVDRgE2HfK5upGoNn
   V39DL1jQYTIbvziA+DEgrpaHErl1G/Zz9CXszKhG7AYYwUR8hXGSYQFdG
   C+W2bGc7s3RumStXjT3lq4Vw1a981Ys6hlE/6sWFyNRD1x56uQJVQJFZo
   PUx6FRnYa6aI2LgArfxml0kzr7lvPh7eSiQQcAo6yUUVdyRfeDPRuwndB
   77jba9Y+Od0NMuiFuimh7Yr7e2N2XON9Y3y7cQaoBe/DMHeW2mscdEN07
   S8sjA5RnxHrBs3xPGKjMKMmd7WGyNbGBYuwFhRs0bz6GcgeWnp6rc9Ylf
   w==;
X-CSE-ConnectionGUID: ofetMobqTtWFfAyoHPjN+A==
X-CSE-MsgGUID: IEJqPxAYThyJ8PUU1InFdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270038"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270038"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:47 -0700
X-CSE-ConnectionGUID: Z6KxzsHxQAa+h/FC43JwzA==
X-CSE-MsgGUID: vc/1jNuMS6GCHrdW6v1GPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372210"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/24] usb: xhci: move initialization of the primary interrupter
Date: Thu, 15 May 2025 16:56:08 +0300
Message-ID: <20250515135621.335595-12-mathias.nyman@linux.intel.com>
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

Move the primary interrupter (0) initialization from xhci_mem_init() to
xhci_init(). This change requires us to save the allocated interrupter
somewhere before initialization. Therefore, store it in the 'interrupters'
array and rework xhci_add_interrupter() to retrieve the interrupter from
the array.

This is part of the ongoing effort to separate allocation and
initialization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 22 +++++++++-------------
 drivers/usb/host/xhci.c     |  4 ++++
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index bfb01c432b23..eb076f5ed1d0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2321,14 +2321,13 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
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
 
@@ -2372,14 +2371,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
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
@@ -2406,7 +2407,6 @@ EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
-	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 
@@ -2490,14 +2490,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index fa80cc30c3fe..c6b517401c94 100644
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
index 31d945c4ac07..b0b16cd7df91 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1959,6 +1959,7 @@ void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
 void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
+void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.43.0


