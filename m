Return-Path: <linux-usb+bounces-22955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6154A857AA
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32A9F8A4839
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26582989B6;
	Fri, 11 Apr 2025 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="busm01bW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD312989B1
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362777; cv=none; b=k6+Oxmm69RIOuHqoVMaflnvGhWhwgpHiieaEDzbN3kmUXVrJL4YL+hztWzQPH0TkgMBgIhx519VLDo+g7Gq86c2xr4RqZ+OZgSPjqHEgkSX2fIai27n7KFtba2Qk2G8E28TJiMei9AwE3edQAc47yR3NZ243qXurYfaIfSBnnYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362777; c=relaxed/simple;
	bh=kOZZ8kyvXReJEhVz31UF8zyLlyzuXgYE006SAQVR8eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQbgZoGSLsntJI/c+j2/bij1sVmQZVRPYf3NEcfmp+eB/cvh27lgKV83h2WDfsgmzmfmQ6jo9b825NRXKHPGYIBZ3j0wY5lupPXz4bjnskhQxeVEYNoiyHyq5OUCk8CSSb4/sWuNZldZOiAcTo2zCHAtTOiogOfY4Kwgrv6xawg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=busm01bW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362776; x=1775898776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kOZZ8kyvXReJEhVz31UF8zyLlyzuXgYE006SAQVR8eA=;
  b=busm01bWVBWHlMW+evwLIV/mil0ExUrH3j3JRtvq209TI6VQaWOMchye
   7C++/iMIrL/LS21/qz/2GJe4FEBdOEallO/ZSlOs/wCSzeqEw5pYH0kv+
   bOR0oacMf0Pv8IlA49KeCFescRWgpjSJ4YTD1YnyEcq5GAY1rA25y1/nZ
   H97I0+KuFFV0FLYTuN6wyTBrPPdFUdXDYoLpdPkb6EAzXQz3k0v8+iWIp
   UU797+X6+uZfD7MGI+jbwrYYGr2JUi4cJx5wMNYR2QI24AKnf6bsDsYGW
   BLLoO+UYVC8H2v9avZdhe59AE3J1xiabyerB8ZEcmIejfm4pNvkrkZRZy
   g==;
X-CSE-ConnectionGUID: eXS/W02PQvqjvbcG/bC9Eg==
X-CSE-MsgGUID: NDqth6uWQ5uHI/E0j9nKdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798950"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:56 -0700
X-CSE-ConnectionGUID: cCSDhHqpQyqqRMuAkPRf+w==
X-CSE-MsgGUID: 2VPPjhyER/2VEjLr46BHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008632"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id D9A8578B; Fri, 11 Apr 2025 12:12:53 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 05/11] usb: xhci: move DCBAA pointer write
Date: Fri, 11 Apr 2025 12:11:49 +0300
Message-ID: <20250411091155.3386971-6-niklas.neronin@linux.intel.com>
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

Move the Device Context Base Address Array (DCBAA) pointer write from
xhci_mem_init() to xhci_init(). This is part of the ongoing effort to
separate allocation and initialization.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 1 -
 drivers/usb/host/xhci.c     | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 47b804aa328d..4e6289d9a89a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2391,7 +2391,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Device context base array address = 0x%pad (DMA), %p (virt)",
 			&xhci->dcbaa->dma, xhci->dcbaa);
-	xhci_write_64(xhci, dma, &xhci->op_regs->dcbaa_ptr);
 
 	/*
 	 * Initialize the ring segment pool.  The ring must be a contiguous
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5f630e74b323..431c922b3f2d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -544,6 +544,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set the address in the Command Ring Control register */
 	xhci_set_cmd_ring_deq(xhci);
 
+	/* Set Device Context Base Address pointer */
+	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
-- 
2.47.2


