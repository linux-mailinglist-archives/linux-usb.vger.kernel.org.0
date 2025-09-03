Return-Path: <linux-usb+bounces-27504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DD1B42783
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A03F1BC40B3
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDF3320A0D;
	Wed,  3 Sep 2025 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PICS07NM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C331AF2E
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918914; cv=none; b=joqTZtR+38OPjBdoDzlHbKmMm8fQLQxKDzLt4QvDJvjhJPisZeOd8Tgdh0Q7rKRJJI0s071KkRajcSVjLFYmh4QX98Zpkvc439UzeD65csZ2n7K8kIQ1/Kf8QrsqXS5SVsJQs6Np/v16Lvq4g5Oi8veCRcZnLaUO3/coUypNraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918914; c=relaxed/simple;
	bh=cGYycxz8EPuibR2lnduPXRebVvxfhBJwHlFgaTusvAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxjqUS5hXv2Da8IfQiXhUdStci6JntNKaQJa8VmOoYkWhZrxUJq/eUglqyTnEQ9OKqOYoe6IlOUL95XGfTlxoVdLrJ6PJnalTnzCx27Szunj+AJ+TspE+AMs9AYIBrWfiJNxdlFg66GHM3PX+2wSKbW05HxLwq/I+Mps61XYYLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PICS07NM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918914; x=1788454914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cGYycxz8EPuibR2lnduPXRebVvxfhBJwHlFgaTusvAw=;
  b=PICS07NMlbnP0gNv7Iz/gn4NJPgBEdVbkGc0YRx29OTNUfzGNeU47Pfu
   9ubXxoeehxz0DprhgMIqgdDLSXpcPgayeRyOjGCiMHdQzQqqtkVwwd9qX
   FIVjkLWO68OluSJ07klchj+1Xh4vEPzah2N8Ei/bfgNolCzdD5kCWPZfg
   H52Xs3Zd4QBzMOaaxnRLeNW1+h/VW6zVBvlNvpkwRWYLmPLnhvYncmNCS
   HDH9T7JmBqZIDHYI/EVWUuORUHi55cdarNHoBd5v6wUKXBxHjAMdmYkMR
   RV+QPJFahyHRyGjPPIAlIQejtyhxgR8H6NgryNXz3X/j95wC256I0l67K
   Q==;
X-CSE-ConnectionGUID: 4YQ5xDpqTiSQC4nfUiNeuQ==
X-CSE-MsgGUID: MN6gIyIfQXWkp2+vCPXSGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687958"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687958"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:53 -0700
X-CSE-ConnectionGUID: kyAUkBVzSLOh0gk4ktNqIg==
X-CSE-MsgGUID: ntcHebHES6mPDm4UhWFd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007552"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id CBE1698; Wed, 03 Sep 2025 19:01:50 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 6/7] usb: xhci: improve Event Ring Dequeue Pointer Register debugging
Date: Wed,  3 Sep 2025 19:01:26 +0200
Message-ID: <20250903170127.2190730-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve debugging output for Event Ring Dequeue Pointer Register (ERDP).
The ERDP registers consist of the following fields:
 bits 2:0 - Dequeue ERST Segment Index
 bit  3 - Event Handler Busy
 bits 63:4 - Event Ring Dequeue Pointer, is 16-byte aligned.

Instead of printing the entire 64-bit register as a single block, each
field is now printed separately. This approach enhances the readability.

xHCI specification, section 5.5.2.3.3

Why not use 'dma_addr_t' for the address?
The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
system architecture or xHCI driver flags, whereas the 64-bit address field
size remains constant. Since hardware cannot be fully trusted, it's better
to print the entire 64-bit address to detect any non-zero values in the
upper 32 bits. This approach ensures that potential issues are easily
detected.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4526989169a3..c7fa82f8b853 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -634,7 +634,7 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
  */
 int xhci_run(struct usb_hcd *hcd)
 {
-	u64 temp_64;
+	u64 erdp;
 	int ret;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir = xhci->interrupters[0];
@@ -651,10 +651,9 @@ int xhci_run(struct usb_hcd *hcd)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
-	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	temp_64 &= ERST_PTR_MASK;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
+	erdp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "ERST ptr %llx DESI %llu EHB %llu",
+		       erdp & ERST_PTR_MASK, erdp & ERST_DESI_MASK, erdp & ERST_EHB);
 
 	xhci_set_interrupter_moderation(ir, xhci->imod_interval);
 
-- 
2.50.1


