Return-Path: <linux-usb+bounces-22958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7979A857A8
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D940A7AE6FD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99D1298CAF;
	Fri, 11 Apr 2025 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdQY6lLk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0690F298CA3
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362780; cv=none; b=US8CJIOq0usfunDpNDPEz4RKLv7Y8Pk7dbBE4jr7KXNGPMHqJ/mZMUMdO7lOZ7pW9fqJC/IJ8/X69t4PnD9GLUrxLCiy+vUlYNIYaV9/r/s9ZPzrbzQFq5rQQ03HxU66BN+DENhOq40883mV1S8s6ZBDgMfoUeJH7suoYxypWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362780; c=relaxed/simple;
	bh=Jf5KNj5OTRe+FFcvyJ6IqcKVRutJTblT9MnjKfrD0bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABAivxKMs6kldiPT4IVgF8RMnUC1AE3dU4XVv4xjjjtLIUi3WlzQIGepmEHvLsNTvRSq9pUTb0pA/TyIrA8QltytFuNjAgUBdR4v5C89obu5F2G41XU/aQR+KY3g5n7fLif8IIJVmYwW7gzTOTNTquYRTTXatuYJcxWlm/bLEP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdQY6lLk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362779; x=1775898779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jf5KNj5OTRe+FFcvyJ6IqcKVRutJTblT9MnjKfrD0bU=;
  b=AdQY6lLkbH5QCKFoURnZ6cARxbpNcsOihsY6YAkaBldw4aUWGeRtkhU0
   B+5ESF8/l8RrF3tK37pf/FWKXo4Qx+wYKzTdev8QVlrC+NAIeQO3G175j
   BRCujIL/C/lbVO+OULBAxVK4iQvYiD2jFswQXQ1lFzcymRFsy38BZTPTq
   eZE3xMuhes1XPSQCX6CTz1LzD10TzPlHvlQrEY0IqrLVmx6D1XPY3CuuR
   ud2GQACTKFYzQjir0XlXx5hsgsOJBGZnnn00jQ6qF0VX4JbLvSrJpLGrq
   Zp/v/KU/8hxZmNJ67BtByUa9pxfUWXbf6NN53l2G2w73Z7ijQS+nGU45E
   g==;
X-CSE-ConnectionGUID: ryOdmOlCQFqwixdmnGFbXw==
X-CSE-MsgGUID: BEnGzvp8RmmJmifaCSsgUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798954"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:59 -0700
X-CSE-ConnectionGUID: nToYSc3dTp+YKt1zynUPAw==
X-CSE-MsgGUID: 0j1pyjl+TZKirGgE+TVxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 1E6A057F; Fri, 11 Apr 2025 12:12:57 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 08/11] usb: xhci: remove error handling from xhci_add_interrupter()
Date: Fri, 11 Apr 2025 12:11:52 +0300
Message-ID: <20250411091155.3386971-9-niklas.neronin@linux.intel.com>
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

Remove redundant error handling from xhci_add_interrupter() instead of
trying to accommodate them in future changes.

======== Reasoning for the removal ========

Function xhci_add_interrupter() is invoked in two scenarios:

Primary Interrupter Setup (ID 0):
 The maximum number of interrupters is always greater than zero, and the
 primary interrupter is always allocated as part of the driver's
 initialization process. In case of failure, the xHCI driver errors and
 exits.

Secondary Interrupter Creation (ID >= 1):
 The interrupter is pre-allocated, and an empty slot is identified before
 invoking xhci_add_interrupter().

In both cases, the existing error handling within xhci_add_interrupter() is
redundant and unnecessary.

Upcoming Changes:
 In the subsequent commit, interrupter initialization will move from
 xhci_mem_init() to xhci_init(). This change is necessary to facilitate
 the ability to restart the xHCI driver without re-allocating memory.
 As a result, the allocated interrupter must be stored in the interrupters
 pointer array before initialization.

 Consequently, xhci_create_secondary_interrupter() would need to handle
 pointer removal for allocated 'interrupters' array upon failure, although
 xhci_add_interrupter() will never fail.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 1b05704a1852..ce632a288c41 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2282,24 +2282,13 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	return ir;
 }
 
-static int
+static void
 xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 		     unsigned int intr_num)
 {
 	u64 erst_base;
 	u32 erst_size;
 
-	if (intr_num >= xhci->max_interrupters) {
-		xhci_warn(xhci, "Can't add interrupter %d, max interrupters %d\n",
-			  intr_num, xhci->max_interrupters);
-		return -EINVAL;
-	}
-
-	if (xhci->interrupters[intr_num]) {
-		xhci_warn(xhci, "Interrupter %d\n already set up", intr_num);
-		return -EINVAL;
-	}
-
 	xhci->interrupters[intr_num] = ir;
 	ir->intr_num = intr_num;
 	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
@@ -2320,8 +2309,6 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 
 	/* Set the event ring dequeue address of this interrupter */
 	xhci_set_hc_event_deq(xhci, ir);
-
-	return 0;
 }
 
 struct xhci_interrupter *
@@ -2331,7 +2318,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
 	unsigned int i;
-	int err = -ENOSPC;
+	int err;
 
 	if (!xhci->interrupters || xhci->max_interrupters <= 1)
 		return NULL;
@@ -2345,14 +2332,14 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
 	for (i = 1; i < xhci->max_interrupters; i++) {
 		if (xhci->interrupters[i] == NULL) {
-			err = xhci_add_interrupter(xhci, ir, i);
+			xhci_add_interrupter(xhci, ir, i);
 			break;
 		}
 	}
 
 	spin_unlock_irq(&xhci->lock);
 
-	if (err) {
+	if (i == xhci->max_interrupters) {
 		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
 			  xhci->max_interrupters);
 		xhci_free_interrupter(xhci, ir);
@@ -2452,8 +2439,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!ir)
 		goto fail;
 
-	if (xhci_add_interrupter(xhci, ir, 0))
-		goto fail;
+	xhci_add_interrupter(xhci, ir, 0);
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-- 
2.47.2


