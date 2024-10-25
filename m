Return-Path: <linux-usb+bounces-16712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F49B0156
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 13:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3C2A1F22AE5
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 11:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D64B201017;
	Fri, 25 Oct 2024 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxGcJZQp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640881FBF66
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855683; cv=none; b=AD6ZyFxEMDgiWNDJTc9BRQCkOcCBwPfIy5vvBOOKEW3Eb2yNP/08e0BfZ6DqwnQ5cD9meWmdgkFrFnKV6PmGeBvDikjztTxo71d5uw6vCLMl9YIKSNQM1vwy5R02hoCDOA9EQjhacWfyZZeaoH9MymDa2QkRDX+uDAqW5Rj8H4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855683; c=relaxed/simple;
	bh=MM677giUgOH6Uk13G2JwgP4NkOeaA71KmmEEiSUmJOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS6ao18gvkgDl2t+e0Y+RwQKtX72gWo9kWS1MRDYq7pLTuc2rXrfh6igpqAB82Jc38n5++t+b/CUqbHyOrQFwkidilkFLtTysbT0m7kmvwEXPbfWc88FoVPnWvdYf9yDdKWhTYvdKrk1dDsrtyNBD0zhChe10JsRB3oV8FAPg7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxGcJZQp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729855681; x=1761391681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MM677giUgOH6Uk13G2JwgP4NkOeaA71KmmEEiSUmJOA=;
  b=SxGcJZQpIrwGRIJkdKO0rSD9eQh5rHO7AincWWG0djPwmSf0dhi/bnyn
   VEqQQ174FljtgDdgLRbhcg8Tc9pDUkPEGxkBWO4sWk46CzMGlAU+s5/8u
   Xk4WVQTD/gVTWGu4LZSxTOOVrnSwS1HA2FPbwm1RD8aNQgecP16mvTuQE
   jDMe/Jl0hK/OHVL8wYN7vGYFoB+0hAIs9XgIt3BBtKbot1fcjwEdXYyq4
   r7WJV0youyk5SbSTnvgImswATnn6yloMYQADLKzMcyLlaqGc9SjG7petn
   F2TKkS5Rxye4qn/mBAX6+LzzH6wSryQbiJ7vzdEeJi1wuH06x/GTFqZvv
   Q==;
X-CSE-ConnectionGUID: Ss/lrF2uQwGkxpfQ/Og4kw==
X-CSE-MsgGUID: /aTDu86RTbmFUHGX9c+sDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40896753"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40896753"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:28:01 -0700
X-CSE-ConnectionGUID: R9qw+M17Qv607L1dxFnEWQ==
X-CSE-MsgGUID: TuymiUWQR8aL+RQ/p6VU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="111699179"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 04:28:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 94D9A35B; Fri, 25 Oct 2024 14:27:58 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/2] usb: xhci: improve HCD page size validation and setting
Date: Fri, 25 Oct 2024 14:27:00 +0300
Message-ID: <20241025112701.303035-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025112701.303035-1-niklas.neronin@linux.intel.com>
References: <20241025112701.303035-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xHC supports a page size of (2^(n+12)), where 'n' is the Page Size Bit.
The page size of 4096 bytes is common and always supported. Consequently,
the xHCI driver always sets the 'page_size' to 4096 (i.e., (1 << 12)).

At present, the xHCI driver reads the Page Size register but does not use
the value, except for printing a two useless debug traces. This introduces
unnecessary code into xhci_mem_init(), which is already quite large.
Although the page size is not currently modified, it may be in the future.

To balance both current and future needs, the page size setting code is
moved to a separate function. This rework ensures that the Page Size
register is not read for the minimum value (4096). However, if a different
value is provided, it will not be ignored, rather clamped between the
valid min and max page size.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 40 ++++++++++++++++++++++---------------
 drivers/usb/host/xhci.h     |  9 ++++++---
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d2900197a49e..8a6b91862cae 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1959,7 +1959,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->interrupters = NULL;
 
 	xhci->page_size = 0;
-	xhci->page_shift = 0;
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
@@ -2378,6 +2377,27 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
+static void xhci_hcd_page_size(struct xhci_hcd *xhci)
+{
+	u32 page_size;
+
+	if (xhci->page_size <= HCD_PAGE_MIN) {
+		xhci->page_size = HCD_PAGE_MIN;
+	} else {
+		/* Max page size is 2^(n+12), where 'n' is the first 15:0 bit set */
+		page_size = readl(&xhci->op_regs->page_size) & HCD_PAGE_SIZE_MASK;
+		page_size = 1 << (ffs(page_size) + 12);
+
+		if (page_size < xhci->page_size)
+			xhci->page_size = page_size;
+		else
+			xhci->page_size = (1 << ffs(xhci->page_size));
+	}
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
+		       xhci->page_size / 1024);
+}
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct xhci_interrupter *ir;
@@ -2385,7 +2405,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	dma_addr_t	dma;
 	unsigned int	val, val2;
 	u64		val_64;
-	u32		page_size, temp;
+	u32		temp;
 	int		i;
 
 	INIT_LIST_HEAD(&xhci->cmd_list);
@@ -2394,20 +2414,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
 	init_completion(&xhci->cmd_ring_stop_completion);
 
-	page_size = readl(&xhci->op_regs->page_size);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size register = 0x%x", page_size);
-	i = ffs(page_size);
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
+	/* If 'page_size' is not set, use 4K pages, since that's common and always supported */
+	xhci_hcd_page_size(xhci);
 
 	/*
 	 * Program the Number of Device Slots Enabled field in the CONFIG
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f0fb696d5619..f998df70f80f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -211,6 +211,11 @@ struct xhci_op_regs {
 #define CONFIG_CIE		(1 << 9)
 /* bits 10:31 - reserved and should be preserved */
 
+/* bits 15:0 - HCD page shift bit */
+#define HCD_PAGE_SIZE_MASK      0xffff
+/* HCD page size 4KB up to 128MB, Rev 1.2 Section 5.4.3. */
+#define HCD_PAGE_MIN            (1 << 12)
+
 /**
  * struct xhci_intr_reg - Interrupt Register Set
  * @irq_pending:	IMAN - Interrupt Management Register.  Used to enable
@@ -1502,10 +1507,8 @@ struct xhci_hcd {
 	u16		max_interrupters;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	/* 4KB min, 128MB max */
+	/* Always set to HCD_PAGE_MIN (4KB) */
 	int		page_size;
-	/* Valid values are 12 to 20, inclusive */
-	int		page_shift;
 	/* MSI-X/MSI vectors */
 	int		nvecs;
 	/* optional clocks */
-- 
2.45.2


