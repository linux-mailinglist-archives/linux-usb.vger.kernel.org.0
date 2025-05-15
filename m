Return-Path: <linux-usb+bounces-23997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA2AB88AD
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7964E3A05
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631681F8EFF;
	Thu, 15 May 2025 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kS+bDoaR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8F1F7580
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317418; cv=none; b=ENS2/Pp8r3BjT+FYl7a6EpDLjHtBgk1ynw23/BSBL8kuMC4NQq1BtvMggDRhreRRhV9c9jdk8NKcQkPha5gTTF9tDbLrA9Ey+vZJ0MGaFyjIpBSzx/fHpCt1H8QkVYkhbu5iCzhrrEfiS/nBeO+Bc0OUOFvaSpgnZ1eTk3g/S1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317418; c=relaxed/simple;
	bh=SU5S+vcTaKKuSKuMX5VoeYyPyuLtmdQubi15vwTw4rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cACugbCrCpp9ZOW7HdAHn+Bf01RhPTA6SIuKCn9+MCvUAIPmBNa4R+rxRBzN/gEUELoGtxkeCqjwOyV99Qh2FZVvpi++irJm2g79tun4RPIh2+7hi4wOyyH4xzZKVPYAOejSAyFJZRrYT/ls2M19vdCyJz7QOxk9IF2F0339g+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kS+bDoaR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317418; x=1778853418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SU5S+vcTaKKuSKuMX5VoeYyPyuLtmdQubi15vwTw4rc=;
  b=kS+bDoaRZ3saS2dEaRl7bBfMwGNKEA6bb53EjL8/k9K7s/CGu3wmosqZ
   5mUf7y2Xzs9Yi1BodHGrt5rS6vtCL1AeLyAT1rxpl4lX1l3ldg/CwaPeY
   aEkWH14hdFp8Z3ft4rmKma6F7kGoVquzVn1Jo8n7hCoZRL4hheDUb5sRs
   VmBNoHNOveh5mbMM4htID+r/4Kmqa1uB1qd7wjKufNj7MZwWlVFcLWPxc
   /5pWlqS46uzgJRd9IXMm/FUugqWTbSWSbei/VDTgy/ElV8A0d1hHq5nMK
   ugH5aIpcv4hSaurF7JRY/+nDF28MqnL09MWxty/JjVZdGII66nWgDL/Ic
   Q==;
X-CSE-ConnectionGUID: w5CH2Y8BQzOMHxuv+NXCBw==
X-CSE-MsgGUID: G+pLR7xaSiubVwufz9X2gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270078"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270078"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:58 -0700
X-CSE-ConnectionGUID: wHxdnbIvTC6v42Gkyorqkw==
X-CSE-MsgGUID: VFMNI56DQYe0zw/yGQagcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372330"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:55 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/24] usb: xhci: remove '0' write to write-1-to-clear register
Date: Thu, 15 May 2025 16:56:14 +0300
Message-ID: <20250515135621.335595-18-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c  |  2 +-
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.c      | 13 +++++++------
 drivers/usb/host/xhci.h      |  2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 486347776cb2..92bb84f8132a 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1907,7 +1907,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
 			 * prevent port event interrupts from interfering
 			 * with usb2 port resume process
 			 */
-			xhci_disable_interrupter(xhci->interrupters[0]);
+			xhci_disable_interrupter(xhci, xhci->interrupters[0]);
 			disabled_irq = true;
 		}
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 91a9ad687704..9efa0d1735df 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3167,7 +3167,7 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
 	dma_addr_t deq;
 
 	/* disable irq, ack pending interrupt and ack all pending events */
-	xhci_disable_interrupter(ir);
+	xhci_disable_interrupter(xhci, ir);
 
 	/* last acked event trb is in erdp reg  */
 	erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8cdb1a01a3ed..6c4bbabc3a70 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -331,7 +331,6 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	iman &= ~IMAN_IP;
 	iman |= IMAN_IE;
 	writel(iman, &ir->ir_set->irq_pending);
 
@@ -340,7 +339,7 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	u32 iman;
 
@@ -348,11 +347,13 @@ int xhci_disable_interrupter(struct xhci_interrupter *ir)
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
 
@@ -754,7 +755,7 @@ void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	xhci_disable_interrupter(ir);
+	xhci_disable_interrupter(xhci, ir);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -1189,7 +1190,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		xhci_disable_interrupter(xhci->interrupters[0]);
+		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 28c4ad7534c1..fc6b97add7fa 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1900,7 +1900,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 				    u32 imod_interval);
 int xhci_enable_interrupter(struct xhci_interrupter *ir);
-int xhci_disable_interrupter(struct xhci_interrupter *ir);
+int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-- 
2.43.0


