Return-Path: <linux-usb+bounces-22952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995C7A857A2
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05BCF4A7175
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15D7298990;
	Fri, 11 Apr 2025 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fE4vHTbF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4841C5F09
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362773; cv=none; b=igxvUu2y51OpLPSilm5qDs4z2U4ounccZ5KsFi8+1nIjlOYmEHQ7bE4dz9srRSl/0AKe40W0aM4ofdiemspbQNIHBtlIcslRsK53Ai31NQRg9VZpZAHl/kDQyn1Anl3Ii6sNF2+g0InO/mwU0DcSm6xwVycgJrVoULGdnYCnt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362773; c=relaxed/simple;
	bh=OhPnpowHE7D5rebclwYiIVH7ahH+eDMDc4a937snweA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ag4ajSHILzgm7Qcfjz1EWhAYG+WTom1NdcWzu8Ww/4lP7e5ZfUf2LBMeopq1O8WH93mWIzySPrP1JvX5+Jtdelh19WDBbMNGtSS8WtLhv2uSqjPacQUOHhNZBAP6JW2DXXVKR11lRK3U56FYrEuOBV0sqY05+KKkJPmJJjOr9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fE4vHTbF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362772; x=1775898772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OhPnpowHE7D5rebclwYiIVH7ahH+eDMDc4a937snweA=;
  b=fE4vHTbFWnysq57weMB4Mi/0TV8ZWKv3n98cGy/lfW4sqVcPVjoGiyzS
   WM7pcwsC6Wno7vmTZoLxhNiKxRzTfKQUnYZXIex+daeupUiJPrzFuZMh+
   qVjBDSYGF1m1WSLuo45MLsXoTY9CgGAb5UiIpnvpRI9/3f+FFVYMlUyyr
   /0YKfYA2jWcQDgHEqVwU/QsGv7oO7n6tTLJz3cuHHfLBQKk3CU4HI2vVd
   piOZYjNZnAlwgKvTjUt8XLE3+ha8vN5pBzBEllFyX8xkX0DtBaMZPZe58
   B5lPb2zdU2+aoqviGy/5RBzwXCU73gFW7uaTLSMlm03X2En7lOFh/zA0H
   g==;
X-CSE-ConnectionGUID: 089Qnj6uTdu2AJLKBeJzEw==
X-CSE-MsgGUID: E6B/bIhyQb2ugGt3nr+Eeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798945"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:51 -0700
X-CSE-ConnectionGUID: dFkEt5jWSOi0EU2ngEZqVw==
X-CSE-MsgGUID: el6gu9QJTA2MP771qvDMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008505"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 0FE5357F; Fri, 11 Apr 2025 12:12:48 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 02/11] usb: xhci: move device slot enabling register write
Date: Fri, 11 Apr 2025 12:11:46 +0300
Message-ID: <20250411091155.3386971-3-niklas.neronin@linux.intel.com>
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
index eb07445687bb..5086d6108d3e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2376,23 +2376,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index abc5115a2839..1e4850542a2e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -476,6 +476,24 @@ static void xhci_hcd_page_size(struct xhci_hcd *xhci)
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
@@ -501,6 +519,9 @@ static int xhci_init(struct usb_hcd *hcd)
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


