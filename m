Return-Path: <linux-usb+bounces-19145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EA9A05E91
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 15:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42B3D1886B94
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 14:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151E91FC7DD;
	Wed,  8 Jan 2025 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya3PpK60"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B81DB37B
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346566; cv=none; b=BPk5hKUwBoOFN6/dh5uPXZacDqvMfbogLyBFjusHDpc96PwGnQNlCHCzxxD6IT16Q5I6QhibOYTLrtIhTXB+ViOnMJ/Eije0vVh8mx6Gc6vgkUwkYwqRHlmJeQ53PoCXgsRYL718wHap9zMXRxSYVuoR3dfgIVkpAYF04bMjgFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346566; c=relaxed/simple;
	bh=eTJ4t0d12NXjuy0E+MNGs/s220tlheJjlHyIduLFwdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7eVWc+vpB8OTJB1LKMeqWBvPfwtdF5XN80PmyhPe6S8bH1KbzMFz9pLomR/VjSTBRWLHH95dhqtdbQNPSCO2KQF06+VA1oJrvVOwsSA51Tu3b3qJ6cq0QyXfKiLJ1X1Z6ml9XUcBt4UoLPexvTTolMeNhHWW6mK8XKNnOPwbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya3PpK60; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736346565; x=1767882565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eTJ4t0d12NXjuy0E+MNGs/s220tlheJjlHyIduLFwdc=;
  b=Ya3PpK60+y9QP2D7f0oeeLHfgi7SHmmPuvGpkvyqWwytAVtmKV7h9ZjJ
   Gnd/MSRJAfY5S4kRvnU6eo36ugEugtkTAE0jmDjowzJgiGQSLws035bCa
   Uylg/mDaMiSWNUTa5t8hNnugqSG/TVLXGe1KYFLSYS3mp7j7PSLQ5wvS0
   9WH6ODe+sljTzEAk8HHo1XOJBmnWOICml9JBWRPi43odX7EnefW45AW3K
   Fij0TppDcmxNqsv6OvvGF1G8dlzb/NhoWgnwIHqpL+2N2Ut/dKzdmxrgk
   ImescYOUfAG9+WE938wF3GNFFIuxwe8iZzvQ7wye4LEOPwHdA0k24TT+E
   g==;
X-CSE-ConnectionGUID: NrsjfcutQge0/7UKPfmPZw==
X-CSE-MsgGUID: vCA+FN1eRCa4te1Tm/PBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35801037"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="35801037"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 06:29:24 -0800
X-CSE-ConnectionGUID: Vsfr8kNMSTKhD1hAADM5gA==
X-CSE-MsgGUID: 1J8Qu62SQXWD0gzzyslcUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108207992"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2025 06:29:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 15AA13EF; Wed, 08 Jan 2025 16:29:21 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/2] usb: xhci: set page size to the xHCI-supported size
Date: Wed,  8 Jan 2025 16:28:22 +0200
Message-ID: <20250108142822.649862-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
References: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
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
register.

Additionally, this commit removes unnecessary debug messages and instead
prints the supported and used page size once.

The xHCI controller supports page sizes of (2^{(n+12)}) bytes, where 'n'
is the Page Size Bit. Only one page size is supported, with a maximum
page size of 128 KB.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 28 ++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 66584aafc513..6828b75ad77b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1953,7 +1953,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->interrupters = NULL;
 
 	xhci->page_size = 0;
-	xhci->page_shift = 0;
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
@@ -2372,6 +2371,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
+static void xhci_hcd_page_size(struct xhci_hcd *xhci)
+{
+	u32 page_shift;
+
+	page_shift = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;
+	xhci->page_size = page_shift << 12;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
+		       xhci->page_size >> 10);
+}
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct xhci_interrupter *ir;
@@ -2379,7 +2388,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	dma_addr_t	dma;
 	unsigned int	val, val2;
 	u64		val_64;
-	u32		page_size, temp;
+	u32		temp;
 	int		i;
 
 	INIT_LIST_HEAD(&xhci->cmd_list);
@@ -2388,20 +2397,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
 	init_completion(&xhci->cmd_ring_stop_completion);
 
-	page_size = readl(&xhci->op_regs->page_size);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size register = 0x%x", page_size);
-	i = ffs(page_size) - 1;
-	if (i < 16)
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size of %iK", (1 << (i+12)) / 1024);
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
index 4914f0a10cff..238cf54ac59f 100644
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
@@ -1510,10 +1513,7 @@ struct xhci_hcd {
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
2.45.2


