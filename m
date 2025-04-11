Return-Path: <linux-usb+bounces-22956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766FA857A6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97E847ACF6A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAEA2980DB;
	Fri, 11 Apr 2025 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6lQuKhx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52EE29899B
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362778; cv=none; b=NZUwb5S5NcZ3GPgZ11uv9NrfT4XhvLceBohEDlJP1LWRTW3NNmwrAGKuGIR8GvlkU8pNhPgIW9VpyUK/J3RLCAO1hnD+rMYvGVWqvKPfJB9N6xJcdcb31yOReKHf9y40I4eWtSnBZ3VYRVslKHIirDuILiWmxpw9u6Nm2698ADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362778; c=relaxed/simple;
	bh=reKwCvZKTUUhdeikCJyBd0C1N9/axccVxpC2XNP93E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNliGNZmdeEGyX3WVoc6caQS3lITXm7slaxYFBt62X22EzHS7A3a1nKC7qW7e7ZCvuB/UexWGiSZs4b7eMpdKx0r3gEQAjyaZtQaNlMZt0OqfA70ogt1GVoKHF197012rnLptcvpIh5+0VdvWhxcxFL/Eahr/WB6i+7LSBIOF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6lQuKhx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362777; x=1775898777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=reKwCvZKTUUhdeikCJyBd0C1N9/axccVxpC2XNP93E4=;
  b=G6lQuKhx6eg9+vYRqdtzdMXiS0ImwDUVaY/XsdzFhuwKOBRq3hX/rnvM
   2iRRVlBj+dNAKlRd5XSpWBesaSm2674vr/PqTHGOGShrg0GX7waQ4/sP2
   DkHJ8y9t6Ehi8YfFCsx2r+nxpapA49GYMf/DB0ShxX5YTywAQBotTPgym
   sZOMGVLSsLFyUnwOET2a8QfJbHP2BWQ6B/IltQ5f8Kzw1yzLGUtJ2g11B
   2vslv0vZ8ei4nARO9KPSqbXbgObJgu+kvoEVCMITl20pW/N1jOFXlBYHJ
   6bonwRs135owNaCgyEnIeBYLqjV5gwqjnubgFRYm/txDdzHP+XrU7Szo7
   A==;
X-CSE-ConnectionGUID: jFGRwyc4QTKEOzfDFdIsSQ==
X-CSE-MsgGUID: yP982odwS/mRE8mjc/16OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798951"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:57 -0700
X-CSE-ConnectionGUID: nf2WkqOZSd2t5ICK1hge+A==
X-CSE-MsgGUID: oDGP/K2JQGSTe75+k9AVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008641"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 30E8957F; Fri, 11 Apr 2025 12:12:55 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 06/11] usb: xhci: move doorbell array pointer assignment
Date: Fri, 11 Apr 2025 12:11:50 +0300
Message-ID: <20250411091155.3386971-7-niklas.neronin@linux.intel.com>
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
index 4e6289d9a89a..7525713f0774 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2376,7 +2376,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	unsigned int	val;
 	u32		temp;
 
 	/*
@@ -2444,13 +2443,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index 431c922b3f2d..e5e5a50d9617 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -513,6 +513,16 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
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
@@ -547,6 +557,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set Device Context Base Address pointer */
 	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
 
+	/* Set Doorbell array pointer */
+	xhci_set_doorbell_ptr(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
-- 
2.47.2


