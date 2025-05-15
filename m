Return-Path: <linux-usb+bounces-23988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5317AB88AC
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F279A01122
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B77C1F3FE3;
	Thu, 15 May 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYfKQ/vi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60272189915
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317403; cv=none; b=OkUIUjrBolu57nt1AqUc/4yI61is0YVzLHLiqEeDUgU+e1ry/OM99pLz8tjC7Ksa1338atxtWQI/+/KfuIbWEGs6IbtZPS2RHiP+7kVgp7VCZHHJIMIVqrEYyGotrchzJAhX+je/J+QsAldn4FXv5elAz0k5LOHO7X7NAted8J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317403; c=relaxed/simple;
	bh=Hkf238qAzYuhFYf8BimZrM4mszOFfj9yxXGC5DxjBNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEVvAqN6kQrQZGMquhJp4974RYyv6bId2+6dM1q7x2OHb9MAN+tYPjow18k3hdR6mBKvUv8hwsNwhRuHPcoYI06kskdrUcUF0NdyTK3Ay4FxAcQihHM8eHSqOgOum7+EocEcgEIaf2Kkf3r+Nf8QENFWx0wg6WEzhQ8iycNAI3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYfKQ/vi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317403; x=1778853403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hkf238qAzYuhFYf8BimZrM4mszOFfj9yxXGC5DxjBNw=;
  b=UYfKQ/vi5HLHsoUQ65EWSjCCzKhAHqpFy/NhLoqXqtGSgeBe1llFJpnU
   ty3laIqGLPYZGrDEwckmXNeRXyTsE9LZWh5IVdRql3GGPQaVuk0Nmt0EC
   HTlPm0nmOY0AYT9I0OdIziq4Hjzw9xKWrp1X++Fp0fYMu676cBXSImmVy
   V6/4J8O7N1ZY26ugPm4V7tMAO51CnVEQz7TSG5NMMDGWm/k1KdJaScNBI
   OnoZzkoCLlJsynCFg6TOu3rnD5+swAUyjykq/XLh7lUNKNf0BjuC0+D/6
   ul+O+mPHKGiIr8dpR73+aTW3ahkOpc/Eks3gA8lytxpr4VHNPQIxtY3qi
   A==;
X-CSE-ConnectionGUID: ReUibY4nSJWkoenGR2UcBw==
X-CSE-MsgGUID: k42F6JOnT7+zd1C74oTVuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270018"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:42 -0700
X-CSE-ConnectionGUID: 7PF1ET4eQf+3a1vzYkL2OQ==
X-CSE-MsgGUID: Ht/sC+uIRQqL7TkpZ/bpJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372152"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:40 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/24] usb: xhci: move doorbell array pointer assignment
Date: Thu, 15 May 2025 16:56:05 +0300
Message-ID: <20250515135621.335595-9-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
index ac96f0155cab..2f4dbb67b1bf 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2419,7 +2419,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	unsigned int	val;
 	u32		temp;
 
 	/*
@@ -2496,13 +2495,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index e8c262865188..0639d8b7372b 100644
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
2.43.0


