Return-Path: <linux-usb+bounces-24001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41070AB88BA
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A61A01885B53
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020717261A;
	Thu, 15 May 2025 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn7yswd6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3743208994
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317425; cv=none; b=Dwia6dSw31c96f0rfVloWi5RYntLnc/g535e1U8h9eTMShFGvK9nrObgaj5yguJYMVkOhnPeeCWAhEjewB78+ce33JruIxxcHxgs4RRC8pIuR3wG186eFcxQQOCdnnXWIi6C52rtxRL5Wgrz0Pxs1+LqVreH3mlg2EMVcSUgEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317425; c=relaxed/simple;
	bh=UN+z83K9KdPUceqsoBAVrOBbdAo3NalO16EplV8qwF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WutgrA70MZNSqOBf3VwPkn0hdTBxTAHMcUvdMPnanDcDDyzDcqxTIKZavPfABI6wI8VRq2O+1BGg6TvASwI01dFxCtEeugdEPdi8dV5qSAjuoUaV5HXOJFHDIyjwZ4q4QWuAdsJewZoq9iu2S7ZvNtWKbJuor3O35F7q/uFL2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn7yswd6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317424; x=1778853424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UN+z83K9KdPUceqsoBAVrOBbdAo3NalO16EplV8qwF8=;
  b=Vn7yswd6ivfUJ4F95tiDiTxdv0LOwlzQ0yxcrxvKtD0IlEH8CjV3xIfV
   Az6uLj3NY1s4MHwu7e6X+HrE/syUq7I+CVJjh6IZh7FCwD/dqYAHo6kYC
   YnZZUOXT8CjKpwOeCD42xs5jFhDl9phi6rgByMktUPkjFYixUTeHERZFX
   4EfLxmnf2UiJODX6SiromVTy3fyThVB+KQNfvE7Dw3Z8UHWxcpeKZcH+f
   f9FfS/g3upe9VXObxe9ec4e7zFj3HkY4DxDwhl5B0rO9j4TuQ2Vz7t5AY
   5yAJdVjXxbqA89s+XIHUpB+QIdUpJBXOQqQxE3AJjcoHNdbRc4ikKYFKT
   A==;
X-CSE-ConnectionGUID: hVPRL01wSR6s14uKbnu8hw==
X-CSE-MsgGUID: mSSfwcMaQci/YQsDz7IxfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270097"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:57:04 -0700
X-CSE-ConnectionGUID: jeof90TzR0uJ8dsSOuuJ/w==
X-CSE-MsgGUID: wn33ycFqTT6qMos/eZNQnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372410"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:57:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 21/24] usb: xhci: rename 'irq_pending' to 'iman'
Date: Thu, 15 May 2025 16:56:18 +0300
Message-ID: <20250515135621.335595-22-mathias.nyman@linux.intel.com>
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

The Interrupt Register Set contains Interrupt Management register (IMAN).
The IMAN register contains the following fields:
 - Bit 0:	Interrupt Pending (IP)
 - Bit 1:	Interrupt Enable (IE)
 - Bits 31:2:	RsvdP (Reserved and Preserved)

Tn the xhci driver, the pointer currently named 'irq_pending' refers to the
IMAN register. However, the name "irq_pending" only describes one of the
fields within the IMAN register, rather than the entire register itself.
To improve clarity and better align with the xHCI specification,
the pointer is renamed to 'iman'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 10 +++++-----
 drivers/usb/host/xhci.c      | 16 ++++++++--------
 drivers/usb/host/xhci.h      |  8 ++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9efa0d1735df..e3c823e1caee 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3083,14 +3083,14 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
 {
 	if (!ir->ip_autoclear) {
-		u32 irq_pending;
+		u32 iman;
 
-		irq_pending = readl(&ir->ir_set->irq_pending);
-		irq_pending |= IMAN_IP;
-		writel(irq_pending, &ir->ir_set->irq_pending);
+		iman = readl(&ir->ir_set->iman);
+		iman |= IMAN_IP;
+		writel(iman, &ir->ir_set->iman);
 
 		/* Read operation to guarantee the write has been flushed from posted buffers */
-		readl(&ir->ir_set->irq_pending);
+		readl(&ir->ir_set->iman);
 	}
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6c4bbabc3a70..3450762fc7bd 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -330,12 +330,12 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
-	iman = readl(&ir->ir_set->irq_pending);
+	iman = readl(&ir->ir_set->iman);
 	iman |= IMAN_IE;
-	writel(iman, &ir->ir_set->irq_pending);
+	writel(iman, &ir->ir_set->iman);
 
 	/* Read operation to guarantee the write has been flushed from posted buffers */
-	readl(&ir->ir_set->irq_pending);
+	readl(&ir->ir_set->iman);
 	return 0;
 }
 
@@ -346,11 +346,11 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
-	iman = readl(&ir->ir_set->irq_pending);
+	iman = readl(&ir->ir_set->iman);
 	iman &= ~IMAN_IE;
-	writel(iman, &ir->ir_set->irq_pending);
+	writel(iman, &ir->ir_set->iman);
 
-	iman = readl(&ir->ir_set->irq_pending);
+	iman = readl(&ir->ir_set->iman);
 	if (iman & IMAN_IP)
 		xhci_dbg(xhci, "%s: Interrupt pending\n", __func__);
 
@@ -834,7 +834,7 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
 		ir->s3_erst_size = readl(&ir->ir_set->erst_size);
 		ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
 		ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-		ir->s3_irq_pending = readl(&ir->ir_set->irq_pending);
+		ir->s3_iman = readl(&ir->ir_set->iman);
 		ir->s3_irq_control = readl(&ir->ir_set->irq_control);
 	}
 }
@@ -858,7 +858,7 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
 		writel(ir->s3_erst_size, &ir->ir_set->erst_size);
 		xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
 		xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
-		writel(ir->s3_irq_pending, &ir->ir_set->irq_pending);
+		writel(ir->s3_iman, &ir->ir_set->iman);
 		writel(ir->s3_irq_control, &ir->ir_set->irq_control);
 	}
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 4a4ce6784bf0..62d12d23617f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -211,7 +211,7 @@ struct xhci_op_regs {
 
 /**
  * struct xhci_intr_reg - Interrupt Register Set, v1.2 section 5.5.2.
- * @irq_pending:	IMAN - Interrupt Management Register. Used to enable
+ * @iman:		IMAN - Interrupt Management Register. Used to enable
  *			interrupts and check for pending interrupts.
  * @irq_control:	IMOD - Interrupt Moderation Register. Used to throttle interrupts.
  * @erst_size:		ERSTSZ - Number of segments in the Event Ring Segment Table (ERST).
@@ -226,7 +226,7 @@ struct xhci_op_regs {
  * updates the dequeue pointer.
  */
 struct xhci_intr_reg {
-	__le32	irq_pending;
+	__le32	iman;
 	__le32	irq_control;
 	__le32	erst_size;
 	__le32	rsvd;
@@ -234,7 +234,7 @@ struct xhci_intr_reg {
 	__le64	erst_dequeue;
 };
 
-/* irq_pending bitmasks */
+/* iman bitmasks */
 /* bit 0 - Interrupt Pending (IP), whether there is an interrupt pending. Write-1-to-clear. */
 #define	IMAN_IP			(1 << 0)
 /* bit 1 - Interrupt Enable (IE), whether the interrupter is capable of generating an interrupt */
@@ -1452,7 +1452,7 @@ struct xhci_interrupter {
 	bool			ip_autoclear;
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
-	u32	s3_irq_pending;
+	u32	s3_iman;
 	u32	s3_irq_control;
 	u32	s3_erst_size;
 	u64	s3_erst_base;
-- 
2.43.0


