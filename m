Return-Path: <linux-usb+bounces-30566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45143C63E2B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 04B42289C0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC4032B9B4;
	Mon, 17 Nov 2025 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7Jigclb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F432ABDC
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379825; cv=none; b=HLqDmeKjcj+ZPOTiBE5QXRQ1FSsC3JvOZEMB1gERswM4EI4rZ3x3SDe5rBVJ4Jf5FHHsrxuH2xDKM09JmZkwnKcaPqK661VxqZt863AJxQ0ivh+CpMCWO2YWC+40FA8O+XS2w4vEYgch11SfJOdJZf6SdJ38pugGspTTaONBFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379825; c=relaxed/simple;
	bh=oPmvXsmD2jeJb55I6kP0HOl0k/0hUbrJNvla2uKlx8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGXzCoO2kpjN6rHo6C+mQ1nmf6GS7Uhk1bHYdGnOz8KZyhq/jCBsoaA+OLTMUKHow23AHylvLPFhCF/MQ9a2IeKm4E0Hiqa+L6oFayAYRBM2AbhRJRfm6YStMgMrSIJJtEpCD790uf59BQEv0zV/aUA3F3nJC4sXF+8X0F18YJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7Jigclb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379823; x=1794915823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oPmvXsmD2jeJb55I6kP0HOl0k/0hUbrJNvla2uKlx8w=;
  b=Z7JigclbLVBEBC1Gb6sN/fIiL/rvsVcZjrJjo3bvSwZPpy28GNumSoFJ
   dhLbNtwK7A2fBgmG8o2lHufDQ9ePhJaNfkiG/oi0AFbSWnfaZC63b0rbf
   NVxboRgRI9hZBkb8woyeDEBzOR8S4O2GHs7rjcd4NyAZljBHKvJCSopr2
   KrkjVvDjOUknODBuEdJ9XrgWdRGEFiQxpcBvVy+eKHWYBrF+uWFvJzsa0
   J5oKMot/8TEiiVRD+yCSaMel+N+T6rpGMO6t81YmCcG/hY9g9lE7y149L
   USyjjQGKp1wbE7sk7C/kxxfhHDUFMpBovQOFwqEqFcDnt7mJ6Wdyqh0rB
   g==;
X-CSE-ConnectionGUID: QyU8AqXyQsuzf/6GaX5ajA==
X-CSE-MsgGUID: qDoW6nnQRvGQdXQbTD2k/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82763833"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82763833"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:42 -0800
X-CSE-ConnectionGUID: NudzGGYhS9ylGFU9PzCfiA==
X-CSE-MsgGUID: bRdHoXziTzmeCgahR5yWQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="191218378"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 03:43:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id C118E99; Mon, 17 Nov 2025 12:43:39 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 7/9] usb: xhci: simplify USBSTS register reset
Date: Mon, 17 Nov 2025 12:42:39 +0100
Message-ID: <20251117114242.3507856-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code clears the USB Status Register (USBSTS) and then sets
the Enable Interrupt (EINT) bit to '1'. A mask (~0x1fff) is used to avoid
modifying reserved bits 31:13, but it also inadvertently excludes reserved
bits 7:5, 1. These fields are defined as RsvdZ, so writing '0' to them has
no effect.

According to the xHCI specification, section 5.1.1:
"System software shall mask all reserved fields (Rsvd, RsvdP or RsvdZ) to
 '0' before evaluating a register or data structure value. This will enable
 current system software to run with future xHCI implementations that
 define the reserved fields."

Given this, it is safe to write zero to all bits of USBSTS except EINT.
This allows the mask and the register read to be removed, simplifying the
code, avoiding potential future issues and removing unexplained hex.

USB Status Register; xHCI Specification, version 1.2 section 5.4.2

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/usb/host/xhci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e8856f6bafc6..04a9e9571384 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -698,7 +698,6 @@ EXPORT_SYMBOL_GPL(xhci_run);
  */
 void xhci_stop(struct usb_hcd *hcd)
 {
-	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir = xhci->interrupters[0];
 
@@ -733,8 +732,7 @@ void xhci_stop(struct usb_hcd *hcd)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Disabling event ring interrupts");
-	temp = readl(&xhci->op_regs->status);
-	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
+	writel(STS_EINT, &xhci->op_regs->status);
 	xhci_disable_interrupter(xhci, ir);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
@@ -1171,8 +1169,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			return retval;
 
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
-		temp = readl(&xhci->op_regs->status);
-		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
+		writel(STS_EINT, &xhci->op_regs->status);
 		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
-- 
2.50.1


