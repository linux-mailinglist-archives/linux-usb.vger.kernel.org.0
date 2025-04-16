Return-Path: <linux-usb+bounces-23142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35B9A9054C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99823AF5C1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD9B2222D1;
	Wed, 16 Apr 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRlDAFHg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7220222566
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811178; cv=none; b=dn/OPCiHfm/kOvBxe6hZxb5icr9R2t6RQtI44EvR07UFfCKDfU3aYtfh1EdgAQJFuSK/nd9dA2+p+NWoJCGs4PMtScVi97uWWvnAY1mUBsxjqpbNwzsuVE16+JVF5Sd3psK6wCfYoJAdaN7g/MjLwyNLSJ2t332WOw+j/U1WAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811178; c=relaxed/simple;
	bh=zLrYJFb+GK+TbyRnoLgeAbEj9plTO60qKVfsRuKziGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kc2FyGp8CF/5PBbIY+lKtEVFqw13Ul1S1eaBAopaa24XyrK3jv8IA71TwlgFMTXzCAu64FX4x7fxcrwbABCtLRPtsTjktlE4onuQNR8/lDEpiBBK9kIiifaeSPZZd/CP9IPwlPtVsJaqrH60w6u+pbysfXDX1Uxi+/zauy2cKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRlDAFHg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811176; x=1776347176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zLrYJFb+GK+TbyRnoLgeAbEj9plTO60qKVfsRuKziGk=;
  b=VRlDAFHgczOZjjRaZAut78spqwiqSC+4YOcCDc1kueOCMNWznxssMKy2
   usOkhy+oVDzxWz9+e5/SUQZvG5tzelGPzmZ0XSWqdTaTff3T8d5yno9IM
   jOcQwC8oDNMQ8m5V698HPMRMX7k0xkF343R8+8j087SCZjj0WZCGTE+im
   Cnp6EcIa+KB2hSrdy8s3UL05NazqyPXVxyrADh6ZT9if0nKubP/3y9gXW
   6VjutJGpfQOzaB/JuS/bsSMCncJS5aXwnrFrVfhlKnKo5V7VYcSpfQ0AC
   gdtv/SWwqjATMLzAwucE9IorGKZorOFXE/bONLQ8d/2DZb6zy1Z4CWQvV
   A==;
X-CSE-ConnectionGUID: 66qh4kTBT4GPNyULsMwenA==
X-CSE-MsgGUID: w5occoLGQWyv5ycTDp27ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074466"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:15 -0700
X-CSE-ConnectionGUID: 95OFqUyFRt2f9jCpZO8uJg==
X-CSE-MsgGUID: pVSJ/CZwQBiMucnbQ9Xj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659177"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 56D78260; Wed, 16 Apr 2025 16:46:13 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 08/11] usb: xhci: remove error handling from xhci_add_interrupter()
Date: Wed, 16 Apr 2025 16:45:07 +0300
Message-ID: <20250416134510.2406543-9-niklas.neronin@linux.intel.com>
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
v2:
 * Set 'err' to '0' in case of available interrupt index. Due to rebase.

 drivers/usb/host/xhci-mem.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 226013ee443a..75ad30d52507 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2287,24 +2287,13 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
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
@@ -2325,8 +2314,6 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 
 	/* Set the event ring dequeue address of this interrupter */
 	xhci_set_hc_event_deq(xhci, ir);
-
-	return 0;
 }
 
 struct xhci_interrupter *
@@ -2351,13 +2338,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
 		for (i = 1; i < xhci->max_interrupters; i++) {
 			if (!xhci->interrupters[i]) {
-				err = xhci_add_interrupter(xhci, ir, i);
+				xhci_add_interrupter(xhci, ir, i);
+				err = 0;
 				break;
 			}
 		}
 	} else {
-		if (!xhci->interrupters[intr_num])
-			err = xhci_add_interrupter(xhci, ir, intr_num);
+		if (!xhci->interrupters[intr_num]) {
+			xhci_add_interrupter(xhci, ir, intr_num);
+			err = 0;
+		}
 	}
 	spin_unlock_irq(&xhci->lock);
 
@@ -2461,8 +2451,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!ir)
 		goto fail;
 
-	if (xhci_add_interrupter(xhci, ir, 0))
-		goto fail;
+	xhci_add_interrupter(xhci, ir, 0);
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-- 
2.47.2


