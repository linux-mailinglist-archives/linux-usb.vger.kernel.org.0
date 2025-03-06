Return-Path: <linux-usb+bounces-21442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D096FA54E32
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A72A188E240
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1CF1898EA;
	Thu,  6 Mar 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJcITuAv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E51891AA
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272582; cv=none; b=Yktg8+FXD/LLn9VopG7IUwRP1mzlf+PT3GVWzHaonb9/7WmCQyncMUzFvDfOtUbtowiZobhSxeaZlRhIrRDRcuuZwPuH0wfYcyhR9NNSSDfw1fnLz+1dAVMQLbCqLjDARQEak3NEEGA5+JFURhtw/4JCt2Gc4eS9sgtCCF0tc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272582; c=relaxed/simple;
	bh=GxLFvvNYvF55jn3x/zainmiVwdhLBbfy7sYORdPaprY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7Zkb+EF+GSBCy1l/4m8XhXKkYZCiCBn7Qwe5XytKBr5DpqtzcwgPbCpLM4lVxDWhV/bj8QeB9fLBfk9M2tUs0Xn7tqtvYe57oMYz7uBugVTOtzqfFTBWPcQ6MJEnW1PK5sXacmfOBqOeK6McHbbkGe3qzl+DHEoib4fTPfCxec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJcITuAv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272581; x=1772808581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GxLFvvNYvF55jn3x/zainmiVwdhLBbfy7sYORdPaprY=;
  b=CJcITuAv2Tx5Qmwra/UUzPq7rA2WHWttqQmagXG95kqiq7C8A4kyI4lv
   MM7HVI4IFhotP6jUyNY7PXH9bhAShRnjuv4CrID74d0vDj2yXxMgXSb1i
   4RbgFg/zPNGOiIguR72IqFbTKfjd9mxONhjGbOKr0hqBKh3tV5amXK7Fa
   K++05rd0cLIa9WXRgFKZeFdDo9z7paoLJ0V0ZvT/NCYM905jUIxMLORga
   eBnaaVc3fY32nInek4imH0NuyQ/UxUOWWY+6r5JzHlOYFga/pQcAhFGDO
   3+VG5ReXi1nBnS/G6bK4MAdH+8Yu9WubXhYflXP6O4OP9UD51kQmxjwLf
   A==;
X-CSE-ConnectionGUID: T7fsq6OCTE2QqelJGyq3aA==
X-CSE-MsgGUID: SiPSegE/QKmp1fjQkg2KCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657108"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:40 -0800
X-CSE-ConnectionGUID: ND5sZ5TfTZ676eIjkki1lQ==
X-CSE-MsgGUID: I7IiUjgpQiWi3A5yJZIGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954842"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:39 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/15] usb: xhci: set page size to the xHCI-supported size
Date: Thu,  6 Mar 2025 16:49:48 +0200
Message-ID: <20250306144954.3507700-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 34 ++++++++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index dc5bcd8db4c0..a7fdfa00eb48 100644
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
+	if (!is_power_of_2(page_size)) {
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
2.43.0


