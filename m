Return-Path: <linux-usb+bounces-20099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D88A2723B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3E741884EF3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC3B212B1A;
	Tue,  4 Feb 2025 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH9Jv4F0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE300211A03
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672993; cv=none; b=I4vfPfpIzr2O1qEqqqHpAUzgxI/o/gJJEp6rJGEjPJpRMxqcmO4jNCpgbgUXloEq72xjDNbggaNXtK02A0sP9buhKcDPf4fx5HDnEVKoO5LOsvsLhVvYP94CuT9bBkzKE5WGnJ9c/m4+cwkecN+XYcEdlYvz7144JDhke1JqaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672993; c=relaxed/simple;
	bh=C781r29TPpIBvUttd0VbFZf06v0cEqsFmrTBDwlFEjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOL3P0kicVsH6kT5pW3iMo4VVk9/XzH3h59q5oz3TG0YXLyNt4btY3BzThx4yB6Hqrre1E7g2fnCF2t2XkSwJ6SBG/FJimLWo5PeRckJTuhZL3hIQOvLYnMLWEqXdFkQYkGsf513XGHBO7Qe5N+CJs+mfYh8X3PJuSJKxV6XkoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OH9Jv4F0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738672992; x=1770208992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C781r29TPpIBvUttd0VbFZf06v0cEqsFmrTBDwlFEjk=;
  b=OH9Jv4F0s7hIg9G74+HSJ7rV5YO1HvVfkuK2bfrrYN0masxEXLcmfoRG
   Gh8G9t7X1LUrd5B7CR2KfWZnaXLGMByoGtPrgf35Xyp3Aihqz/qxOyOXF
   TBbCaK5pN1H4lCEU5pB8BKzlN0QlElO0YGmbaceis4C0yr/lsx1SGkUea
   DguZ/sZd7L/fkOqMuAsn+c7kitMmVyBQ0+FWJ1vKoLD1sHykOoIovKzkX
   0rUI3WOOB9nVt3KArS1ypFYnHu3ohVCLGpHJwMaK0dhi4aEJNu+emDg9o
   +1y0GhLNmP6BhjGSISdLITGmxUime0Vpfp3SMxIELuSAj9oBkMZ7F7zaQ
   w==;
X-CSE-ConnectionGUID: WEBYScTERn+CnN3j6VDC+w==
X-CSE-MsgGUID: AcUddW7yQXWmQs6TEYMGpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38898558"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="38898558"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 04:43:11 -0800
X-CSE-ConnectionGUID: h1PP3v7OT/+Kecn94F0Yew==
X-CSE-MsgGUID: KHthyGg6RZScCTZWmjS1sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141437078"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2025 04:43:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 71A32399; Tue, 04 Feb 2025 14:43:08 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v3 2/2] usb: xhci: set page size to the xHCI-supported size
Date: Tue,  4 Feb 2025 14:41:44 +0200
Message-ID: <20250204124145.3998098-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
References: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current xHCI driver does not validate whether a page size of 4096
bytes is supported. Address the issue by setting the page size to the
value supported by the xHCI controller, as read from the Page Size
register. In the event of an unexpected value; default to a 4K page size.

Additionally, this commit removes unnecessary debug messages and instead
prints the supported and used page size once.

The xHCI controller supports page sizes of (2^{(n+12)}) bytes, where 'n'
is the Page Size Bit. Only one page size is supported, with a maximum
page size of 128 KB.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
V3:
 * Rename local variable 'page_shift' to 'page_size'.

 drivers/usb/host/xhci-mem.c | 34 ++++++++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index dc5bcd8db4c0..c2ee0d32f5cd 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1953,7 +1953,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->interrupters = NULL;
 
 	xhci->page_size = 0;
-	xhci->page_shift = 0;
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
@@ -2372,6 +2371,22 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
+static void xhci_hcd_page_size(struct xhci_hcd *xhci)
+{
+	u32 page_size;
+
+	page_size = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;
+	if (!page_size || page_size & (page_size - 1)) {
+		xhci_warn(xhci, "Invalid page size register = 0x%x\n", page_size);
+		/* Fallback to 4K page size, since that's common */
+		page_size = 1;
+	}
+
+	xhci->page_size = page_size << 12;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
+		       xhci->page_size >> 10);
+}
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct xhci_interrupter *ir;
@@ -2379,7 +2394,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	dma_addr_t	dma;
 	unsigned int	val, val2;
 	u64		val_64;
-	u32		page_size, temp;
+	u32		temp;
 	int		i;
 
 	INIT_LIST_HEAD(&xhci->cmd_list);
@@ -2388,20 +2403,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
 	init_completion(&xhci->cmd_ring_stop_completion);
 
-	page_size = readl(&xhci->op_regs->page_size);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size register = 0x%x", page_size);
-	val = ffs(page_size) - 1;
-	if (val < 16)
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size of %iK", (1 << (val + 12)) / 1024);
-	else
-		xhci_warn(xhci, "WARN: no supported page size\n");
-	/* Use 4K pages, since that's common and the minimum the HC supports */
-	xhci->page_shift = 12;
-	xhci->page_size = 1 << xhci->page_shift;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"HCD page size set to %iK", xhci->page_size / 1024);
+	xhci_hcd_page_size(xhci);
 
 	/*
 	 * Program the Number of Device Slots Enabled field in the CONFIG
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c3..5b8751b86008 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -211,6 +211,9 @@ struct xhci_op_regs {
 #define CONFIG_CIE		(1 << 9)
 /* bits 10:31 - reserved and should be preserved */
 
+/* bits 15:0 - HCD page shift bit */
+#define XHCI_PAGE_SIZE_MASK     0xffff
+
 /**
  * struct xhci_intr_reg - Interrupt Register Set
  * @irq_pending:	IMAN - Interrupt Management Register.  Used to enable
@@ -1514,10 +1517,7 @@ struct xhci_hcd {
 	u16		max_interrupters;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	/* 4KB min, 128MB max */
-	int		page_size;
-	/* Valid values are 12 to 20, inclusive */
-	int		page_shift;
+	u32		page_size;
 	/* MSI-X/MSI vectors */
 	int		nvecs;
 	/* optional clocks */
-- 
2.47.2


