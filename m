Return-Path: <linux-usb+bounces-23135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F57A9053E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783E419E0FBF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2676B2222C3;
	Wed, 16 Apr 2025 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF6mBO2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FF221F16
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811174; cv=none; b=HwngUFp7HfpO+qpi3rY0vsrfmeDAuXt0aCrTBa4FqFT+dhHe+HcpaADpxJwaVUy5H5hmT95rxqfN+prNpBd6vwloiSya9FUVAWhiNAJGqFMFwLpBJD3cjdgtmYPZ56o1Elf8Qr09qb/8FG9wvBdGYYtQxx6Lo7jz9V3BL0xgUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811174; c=relaxed/simple;
	bh=vKqksaxq1lqFhLE/VEiL3uiUEVcRAT0Iob6kSCJV4G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9cSYem9Vc3w5qF3OfnbBnJyjyKau49v7BqNYLRRuZQStuPDfMzeAsHYgBkc2pYma9GZhjlwA+wBBOXtQoclemQLQ3dDlmb+HuT70D2kIHtE7AGXfrvLQQD7rdOdtpcsyyLEjRxYDLYfHy2M6r33b71dxsePebfD+Wa2mTskgos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF6mBO2A; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811172; x=1776347172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vKqksaxq1lqFhLE/VEiL3uiUEVcRAT0Iob6kSCJV4G4=;
  b=FF6mBO2AFr3DtUE6+S2HJtQvK89c9Zp7miMwrdPrt5h/OX4nrhdaVDOd
   VwhZb9szA6F8nIwRvzdRUZYiGhbkeKWliTYmNiZK0H1oGeQfCjfk+HZzi
   WzXlruRbkCQ0JPjdZ33H2XuCKmY0dDN6RqCSbX7dIan6uIVzhLlxeeiwu
   xhjzHXN9dtrkk8nSWNN95lo+y600Q7hkX3IIH5e5zVAo7MhmRTKVqIdNl
   LYYEu+etQBMYKEk6AqzlpIf908h2y8lxqyu8CwEI/jhnCueK0Enczc5yn
   0+tXMlX0KFfLBf5jvlkv4LdMn7wl7pgbsi13fOJhdzhN20y0r6b9MpMGJ
   g==;
X-CSE-ConnectionGUID: y1KRrYn6TOmWwoba0pIoyA==
X-CSE-MsgGUID: ExPX6FNTQQKnHoNRVOaKHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074449"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074449"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:11 -0700
X-CSE-ConnectionGUID: Y13jcE+NTGCxlldh5X9J6w==
X-CSE-MsgGUID: EHTx3sGVTtKMKxnpeZYoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659144"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 3B4BF715; Wed, 16 Apr 2025 16:46:09 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 02/11] usb: xhci: move device slot enabling register write
Date: Wed, 16 Apr 2025 16:45:01 +0300
Message-ID: <20250416134510.2406543-3-niklas.neronin@linux.intel.com>
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

Refactor the setting of the Number of Device Slots Enabled field into a
separate function, relocating it to xhci_init().

The xHCI driver consistently sets the number of enabled device slots to the
maximum value. The new function is named to reflect this behavior.

Remove the "// " prefix from trace messages, as it is unnecessary and
distracting.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 15 +--------------
 drivers/usb/host/xhci.c     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d309e8e9d508..dbf0187086db 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2385,23 +2385,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	unsigned int	val, val2;
+	unsigned int	val;
 	u64		val_64;
 	u32		temp;
 
-	/*
-	 * Program the Number of Device Slots Enabled field in the CONFIG
-	 * register with the max value of slots the HC can handle.
-	 */
-	val = HCS_MAX_SLOTS(readl(&xhci->cap_regs->hcs_params1));
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// xHC can handle at most %d device slots.", val);
-	val2 = readl(&xhci->op_regs->config_reg);
-	val |= (val2 & ~HCS_SLOTS_MASK);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"// Setting Max device slots reg = 0x%x.", val);
-	writel(val, &xhci->op_regs->config_reg);
-
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
 	 * "physically contiguous and 64-byte (cache line) aligned".
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ec2e4a2d8af0..4de51ba851d8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -477,6 +477,24 @@ static void xhci_hcd_page_size(struct xhci_hcd *xhci)
 		       xhci->page_size >> 10);
 }
 
+static void xhci_enable_max_dev_slots(struct xhci_hcd *xhci)
+{
+	u32 config_reg;
+	u32 max_slots;
+
+	max_slots = HCS_MAX_SLOTS(xhci->hcs_params1);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xHC can handle at most %d device slots",
+		       max_slots);
+
+	config_reg = readl(&xhci->op_regs->config_reg);
+	config_reg &= ~HCS_SLOTS_MASK;
+	config_reg |= max_slots;
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting Max device slots reg = 0x%x",
+		       config_reg);
+	writel(config_reg, &xhci->op_regs->config_reg);
+}
+
 /*
  * Initialize memory for HCD and xHC (one-time init).
  *
@@ -502,6 +520,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	if (retval)
 		return retval;
 
+	/* Set the Number of Device Slots Enabled to the maximum supported value */
+	xhci_enable_max_dev_slots(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
-- 
2.47.2


