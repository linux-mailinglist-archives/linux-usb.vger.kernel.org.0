Return-Path: <linux-usb+bounces-23990-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318AAB88AF
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3679C1BC11EA
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C9D1A83E5;
	Thu, 15 May 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoXnfsPz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92A189915
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317406; cv=none; b=nckPVWGfTVpFTIyDcZRLBnX0Ci0ry6QrUuZa+25WeX3FeBchj9VoYT+WzWOlFPtSOBNTyu392PpquWS5HnZVM5OI67xSownZ017vwCck0JVPzGGu+SqNEvNfpSLOl1oSJXXWjrOw+trqHHVEPdP2KBRVua8ZHR+khePqrk5MtMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317406; c=relaxed/simple;
	bh=0libbAjaInygRtFKsO5/DBr/KSzoVJPMib1L4sSZjfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBsCWiLbIGfMlzxsvPZR2g355yqMMVe7W6FNADMiXuQtP9EvRNPR1T88Pjwll+4HKvFxdX/MrfaoKSVXoa9aK4Fl8wcBGCkqgIOWhtPBQp8HkH/cyqgsfakypGNWX5KummV3Sfgv4nVyd85/wHwTuYJYcNQS6b8ILTS1y+3sbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoXnfsPz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317406; x=1778853406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0libbAjaInygRtFKsO5/DBr/KSzoVJPMib1L4sSZjfE=;
  b=IoXnfsPztFi+5JIhjrLndNcPMI497NKUVGPsoKoQfRpgPznI16paqzXe
   kKXqraKRBXMPvxzCiK/yaWGJnZiu3Y7nrqTuYnLRc0oI/JKDb83Bhimg6
   e4gBKxDMBYsKcMTAF2FWkVXAw86VuDsV5sBqCRGBi3WxDBGUHu8iOY9yV
   CJbUykmtfWEcCv+axHpAeIrXUcn9nmWb8/L+CK0ZH0vhq98VuPwi+iE14
   9UqXJ0RldX+VyTNj5uM+SuvXm7U6c4gQykkZhMFw/74bsrqzdhFOPa/Vl
   T4C29puWSZpmw0MSmXhNJvp7i3/MfypJS3/CGfW1onkI8dQ6PrY1dB2AL
   w==;
X-CSE-ConnectionGUID: UV1wbi5JQX+WVreKd3O28w==
X-CSE-MsgGUID: PTdNXNytRpev6l607tW8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270031"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:46 -0700
X-CSE-ConnectionGUID: z4OwKEifQ/OqfBQi0CSJzQ==
X-CSE-MsgGUID: oiNn7PjEQ/SAQ+huEyKhBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372194"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:43 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/24] usb: xhci: remove error handling from xhci_add_interrupter()
Date: Thu, 15 May 2025 16:56:07 +0300
Message-ID: <20250515135621.335595-11-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 718354bd7fb2..bfb01c432b23 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2321,24 +2321,13 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
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
@@ -2359,8 +2348,6 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 
 	/* Set the event ring dequeue address of this interrupter */
 	xhci_set_hc_event_deq(xhci, ir);
-
-	return 0;
 }
 
 struct xhci_interrupter *
@@ -2385,13 +2372,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
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
 
@@ -2504,8 +2494,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!ir)
 		goto fail;
 
-	if (xhci_add_interrupter(xhci, ir, 0))
-		goto fail;
+	xhci_add_interrupter(xhci, ir, 0);
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-- 
2.43.0


