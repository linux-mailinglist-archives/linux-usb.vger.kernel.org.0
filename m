Return-Path: <linux-usb+bounces-22744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EEFA8042B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF12A1885BA8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5250C26A1B7;
	Tue,  8 Apr 2025 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ44BODq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F4826A1AA
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113593; cv=none; b=WfQZsfhbDI/GVCEqEqWvJfmKhzBChHjTXMVjTuwuKodVGoBoGCuDAvjmNf5o4+AbWQmwG5/33R5F52xBFw04D9OgyKs3naLDb3fUjAzBVUHE5d5LGaUqP5kK5WDrVTMVZP0qDvRgcQN0hMk9zYXJmvGitIl46kVY9k4x8Jy6gj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113593; c=relaxed/simple;
	bh=/fFCq7nnsecdTAtuMCaemaquPThROFf3JLlI0F7AQ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRlR5o5IQ0ZPmhdw8HxabvnZdIvgyRmXeGHKQQHzdpjNkqbsNBVUGCqHs7r/CfYUy40V5vJclWPN4ryb30Ti0vYYjtnXjBfiL9QEck+raUiNfENbM6euQVO1bjf9KSsJqkK7DO2Un+NpgQSqiwgoXzIDZcy+aA6G0cimXCgPtlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ44BODq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113592; x=1775649592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/fFCq7nnsecdTAtuMCaemaquPThROFf3JLlI0F7AQ8A=;
  b=gQ44BODqCmm3e79AXI4HN67HQjfhT9tlZkkKn9aHecSGErHdom/lwpDw
   tUWDZQxuRJK1lwFmMyO+2HncADtU+EicWOuTiArMU68jNo61c9QNfMT+b
   V23quaAR8vZ8Sxh2J7GVQffmMqhE2kL1noku531q32LvTyB1Svyh2tjKt
   TxZ34PkgWkftnTzxOi74DeHuYvFi8sawfppemp9+vFWAzGkrfn/l5FQs+
   4jIsge/lZtrqC40y4zhP4XOBlTtfC9K8ClFffuKndXoRjoaaIt4iegnwW
   u60Z6PEqoSyE/ejW0RTDXic2p4BWB8iSengXWxewDZtcWigvxamkrKfXJ
   w==;
X-CSE-ConnectionGUID: nxT4bfGsRoaj3oVejA/Itg==
X-CSE-MsgGUID: e9deomGwR4ew/tb+cP+2kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676468"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:51 -0700
X-CSE-ConnectionGUID: BOvGLa4aQYCAJC2Hiepkag==
X-CSE-MsgGUID: jlc47zUTQY2rNnEm8ejTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428053"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 77C8B398; Tue, 08 Apr 2025 14:59:49 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/9] usb: xhci: remove '0' write to write-1-to-clear register
Date: Tue,  8 Apr 2025 14:57:47 +0300
Message-ID: <20250408115752.1344901-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xHCI specification 1.2, section 5.5.2.1.
Interrupt Pending bit is RW1C (Write-1-to-clear), which means that
writing '0' to is has no effect and is removed.

The Interrupt Pending (IP) bit is cleared at the start of interrupt
handling; xhci_clear_interrupt_pending(). This could theoretically
cause a new interrupt to be issued before the xhci driver reaches
the interrupter disable functions.
To address this, the IP bit is read after Interrupt Enable is
disabled, and a debug message is issued if the IP bit is still set.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 93daaac102f7..a41337360535 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -330,7 +330,6 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	iman &= ~IMAN_IP;
 	iman |= IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
@@ -339,7 +338,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+static int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	u32 iman;
 
@@ -347,11 +346,13 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	iman &= ~IMAN_IP;
 	iman &= ~IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
-	readl(&ir->ir_set->irq_pending);
+	iman = readl(&ir->ir_set->irq_pending);
+	if (iman & IMAN_IP)
+		xhci_dbg(xhci, "%s: Interrupt pending\n", __func__);
+
 	return 0;
 }
 
@@ -650,7 +651,7 @@ void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	xhci_disable_interrupter(ir);
+	xhci_disable_interrupter(xhci, ir);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -1102,7 +1103,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		xhci_disable_interrupter(xhci->interrupters[0]);
+		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
-- 
2.47.2


