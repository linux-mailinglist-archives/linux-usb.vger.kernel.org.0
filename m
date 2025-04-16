Return-Path: <linux-usb+bounces-23137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86FA90541
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 529E719E17FD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5D62222B7;
	Wed, 16 Apr 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5mDkDVs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD3D2222BC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811176; cv=none; b=WOqifNWFzHO8wyaVeOcFWVi8zUU7kktO+RaczFa9RxScTh9WnkdgvEUnuLktHltF04uBMWoflhhe0+klhBxHQJVpie3f7T+JmaT6NIrwYeuJdxKx6Ola40Lk3UH774b/l9XGdPduM2FR/oGvyQyqVexA4gK+Rb7feBLl6tAnA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811176; c=relaxed/simple;
	bh=SpVzuFuhhHYWD7hiQD8LBpIz1PPXCTHuYNotsp919J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2y1SyOXel1AMZWZzkJugViux18YTPdNVGhhKSzME6P7XeSCfWPZJks4g62iT+WeX0tlamrn9w4GZKvx6LBS+iediHPnsvuzz8+1Xy+n4oAm/d4FdQ3JV5JrUIHw2tpxJSFkTlvPpYftnQu9k7hALVWIb0ygxbxN2FBfD8L3nLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5mDkDVs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811174; x=1776347174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SpVzuFuhhHYWD7hiQD8LBpIz1PPXCTHuYNotsp919J8=;
  b=F5mDkDVsJD9CW86Gbafn2mgBAQWiswLWnrjDAZ7vdlRP0453xJLrhUT0
   yAv/y5Et/VsGTwXfBneo0+EIGtDtDWkN1abJWu+qQIaqkNCofmKs9K9Sa
   qJCQuAQQDL6vhbTOEYTICG97BjWYLeyNozoXgu2oiq8OxNENcFZQyZHBx
   Cb4conSqKGiGuKUsR683LbRg44OUJwMtFxn+Q2cpv5DXLJoiDOTHEep/x
   bGO7VYYJgXriGInKXeCcyrolFPc2m3HJBBNYMYKZBZeW8b+xaYpzajtD1
   VaUxc9dYn8hZybgE7WOb9ADkeZQpLXuk6MgdhOd85PWCnTD4MKbdXG2M6
   A==;
X-CSE-ConnectionGUID: Q4PyWWQfSnqEbnEV8rVlLg==
X-CSE-MsgGUID: EcJEPqedRzSdW8hptdL2Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074460"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:14 -0700
X-CSE-ConnectionGUID: OoJ8pXYfRsyRd3emSoikmA==
X-CSE-MsgGUID: aQMCxdAuRLGL81GKjWx0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659168"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 1E136715; Wed, 16 Apr 2025 16:46:12 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 06/11] usb: xhci: move doorbell array pointer assignment
Date: Wed, 16 Apr 2025 16:45:05 +0300
Message-ID: <20250416134510.2406543-7-niklas.neronin@linux.intel.com>
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

Move the assignment of the doorbell array pointer from xhci_mem_init()
to xhci_init(). The assignment now utilizes the newly introduced
xhci_set_doorbell_ptr() function.

Doorbell Array Offset mask (DBOFF_MASK) is updated to directly specify its
bit range as 31:2, rather than using inverted reserved bits 1:0.
This change simplifies the mask representation, making it more intuitive
and easier to understand.

Remove the "// " prefix from trace messages, as it is unnecessary and
distracting.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h |  4 ++--
 drivers/usb/host/xhci-mem.c  |  8 --------
 drivers/usb/host/xhci.c      | 13 +++++++++++++
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index f6b9a00a0ab9..4b8ff4815644 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -62,8 +62,8 @@
 
 #define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
 
-/* db_off bitmask - bits 0:1 reserved */
-#define	DBOFF_MASK	(~0x3)
+/* db_off bitmask - bits 31:2 Doorbell Array Offset */
+#define	DBOFF_MASK	(0xfffffffc)
 
 /* run_regs_off bitmask - bits 0:4 reserved */
 #define	RTSOFF_MASK	(~0x1f)
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 19f756a57cb7..391dc2282360 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2385,7 +2385,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	unsigned int	val;
 	u32		temp;
 
 	/*
@@ -2453,13 +2452,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 */
 	xhci->cmd_ring_reserved_trbs++;
 
-	val = readl(&xhci->cap_regs->db_off);
-	val &= DBOFF_MASK;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-		       "// Doorbell array is located at offset 0x%x from cap regs base addr",
-		       val);
-	xhci->dba = (void __iomem *) xhci->cap_regs + val;
-
 	/* Allocate and set up primary interrupter 0 with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "Allocating primary event ring");
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ef93c1ae5215..00aae0619ccd 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -514,6 +514,16 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 	xhci_write_64(xhci, crcr, &xhci->op_regs->cmd_ring);
 }
 
+static void xhci_set_doorbell_ptr(struct xhci_hcd *xhci)
+{
+	u32 offset;
+
+	offset = readl(&xhci->cap_regs->db_off) & DBOFF_MASK;
+	xhci->dba = (void __iomem *)xhci->cap_regs + offset;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+		       "Doorbell array is located at offset 0x%x from cap regs base addr", offset);
+}
+
 /*
  * Initialize memory for HCD and xHC (one-time init).
  *
@@ -548,6 +558,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set Device Context Base Address Array pointer */
 	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
 
+	/* Set Doorbell array pointer */
+	xhci_set_doorbell_ptr(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
-- 
2.47.2


