Return-Path: <linux-usb+bounces-23984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F8AB88A4
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1CA81BC11C3
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8639198E60;
	Thu, 15 May 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSSte6al"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615918D620
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317397; cv=none; b=R6Mw22U7I88ZHhj08RxIJGvpkssYos5TLTt1Y8RwGa8oFfj507kMWXPfQUOzEtQlWh+15sxZWgL1aoBxzWbJj39SvwsgU6f5oJAhfCULVuN0WvvZc3LOspvrCOTT3z/oaLVkkRSeL9fZ4zZmnI1Rt2xXfOjLHEOO7LggG17POS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317397; c=relaxed/simple;
	bh=ov6UnBrgg4JHzjssCs44OetyQP4W4ytVmHrTR54gu5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShCHJbwe6X0WInnFfKYuhBgLBckGIZsI5hx3R7uAWa6Uy0eLKTyIsAAxTNFgsJN8sB/0bgmS9C9MACxQLTuLpSsEtCl0jppDXXPNV3+/mfZLqAvCraAc7oX6lx1WcWy8iyyEk4ag1+IKPMpwYFDN2tL4Vi2Uz6/D7zQiMIkDwA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSSte6al; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317396; x=1778853396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ov6UnBrgg4JHzjssCs44OetyQP4W4ytVmHrTR54gu5I=;
  b=ZSSte6alejDRrlxPqB5oLi96EkChUHxOT9jxlWG2U1kcPW4ABq/JDKpo
   dUIDQL3a1WviO4F8ObEmQOX7mtKJLBQQxDsiD5+daUK5DIfsH+FynaivI
   1oFxVMTcAd/rIMbYZloYnJ5fVWCp2efGZqWiPhO29FLnUY8XxFGsGCF6x
   GnC+x/fq8Dw1VwGCzbA+CFWnyA18/ZdoHH2yyoC6M9EPxnxLYczm2K8rN
   pqyE+r6xuiJy9+/Y+0YwJd4DtX9sffPNHfu7cltYrAImaQ8uGjvNf+y34
   Y6yflbaQwdNQE0Ip6FSGxRNOB5qfe6/wU0NnAQ+Yl4Z2b7BQuKwhsrnsT
   A==;
X-CSE-ConnectionGUID: Dj+EDBCZQeGHFEszIIE8/g==
X-CSE-MsgGUID: sQnq8u4BRo2jWRZq2zMjPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270001"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270001"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:36 -0700
X-CSE-ConnectionGUID: OEj9nYyETfmUVGdYUloiPw==
X-CSE-MsgGUID: ADJyqbLETmaYUxHKJZpMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372094"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:34 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/24] usb: xhci: move device slot enabling register write
Date: Thu, 15 May 2025 16:56:01 +0300
Message-ID: <20250515135621.335595-5-mathias.nyman@linux.intel.com>
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

Refactor the setting of the Number of Device Slots Enabled field into a
separate function, relocating it to xhci_init().

The xHCI driver consistently sets the number of enabled device slots to the
maximum value. The new function is named to reflect this behavior.

Remove the "// " prefix from trace messages, as it is unnecessary and
distracting.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 15 +--------------
 drivers/usb/host/xhci.c     | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a7955e02905c..e03109a24a50 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2419,23 +2419,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index b073e9d91665..ec0a2fa7d003 100644
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
2.43.0


