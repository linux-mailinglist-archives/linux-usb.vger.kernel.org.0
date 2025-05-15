Return-Path: <linux-usb+bounces-24002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 856B3AB88BC
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B773A68B8
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4E31D6DBB;
	Thu, 15 May 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/4jQ4t3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7477419E99E
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317427; cv=none; b=hHpe8o1KWMYUdhnfJdFEa3HSeOXi74Vx/NxfZTo7A4HLtW3ORNqu7bQy1LzL3xlOtk4G+RyYOMuIgKq0ve6fJ2e2hqcMQNQLvI52QcTkFDbBv4AthNjnFJSUJr46IfYhlf7osQwfHrhqCzrX1wytRL+nqH+sVyaeqJbleRMFfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317427; c=relaxed/simple;
	bh=0jJ2KWQsIclt6DFM38ynvWMOaZtsJUxTtg173Rx5I1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nch8L4CAkB9Fc6M9epY7CKmuE8gklxjhcueKrxMO7V0p0oVpQCkDBnnR+KwNtO32Gb/OdWzoMHs41bMcNlUcA7OQXgOD6j3Y3xQ9hmUcgzPi+VQKAnjC17SNITj22ELHA1j03KF5HuWrFUFiWpMQmA9VeEFW/S2kXMQluCccPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/4jQ4t3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317426; x=1778853426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0jJ2KWQsIclt6DFM38ynvWMOaZtsJUxTtg173Rx5I1A=;
  b=K/4jQ4t3Obr7oPz/Cmun3iR1aU8I2yK7k9mugMPzoJDqajJzwRJg8X3d
   0wMuZ/IRBCqHGG2ZVtqiPN81iHdsvCIsS0po6m+Q/FDCnItbAfOQPy+4i
   U5QUKr6TNvgEFubFkVp+L2tzM/+pLvy7IrQPbRL/kWUONiAKo89Caxjw/
   ni9Y/GK+3OMJ54lnBoYASsvKXvXRIV5I2+zCdSLjKwJmZ8dlGvZyedBKZ
   gfvuwD3an+rqExfS6qDHH2IBnGWq8EPOTLr+6BiWnImHGmGoi9QoRPLmN
   aWXF2OtovH921la0FFaOEmKEyVFDdPhtIYTy2QtQJnXghcNxIw6NWEj4n
   w==;
X-CSE-ConnectionGUID: oRKbhMj1QueoQBhY2Xxliw==
X-CSE-MsgGUID: 9yvvVGihQAaLDv47qeQNEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270105"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:57:06 -0700
X-CSE-ConnectionGUID: fCmnpkwGTLmCQnFmI6yoTg==
X-CSE-MsgGUID: 0vI/NzepRQ2DJ8CYbTGcvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372423"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:57:04 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 22/24] usb: xhci: rename 'irq_control' to 'imod'
Date: Thu, 15 May 2025 16:56:19 +0300
Message-ID: <20250515135621.335595-23-mathias.nyman@linux.intel.com>
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

The Interrupt Register Set contains Interrupt Moderation register (IMOD).
The IMOD register contains the following fields:
 - Bits 15:0:	Interrupt Moderation Interval (IMODI)
 - Bits 31:16:	Interrupt Moderation Counter (IMODC)

In the xHCI driver, the pointer currently named 'irq_control' refers to the
IMOD register. However, the name 'irq_control' does not accurately describe
the register or its contents, and the xHCI specification does not use the
term "irq control" or "interrupt control" for this register. To improve
clarity and better align with the xHCI specification, the pointer is
renamed to 'imod'.

Additionally, the IMOD register fields IMODI & IMODC have their own masks,
which are also renamed for consistency:
 * 'ER_IRQ_INTERVAL_MASK' -> 'IMODI_MASK'
 * 'ER_IRQ_COUNTER_MASK' -> 'IMODC_MASK'

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 12 ++++++------
 drivers/usb/host/xhci.h | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3450762fc7bd..9769c68b2e9f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -367,12 +367,12 @@ int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 		return -EINVAL;
 
 	/* IMODI value in IMOD register is in 250ns increments */
-	imod_interval = umin(imod_interval / 250, ER_IRQ_INTERVAL_MASK);
+	imod_interval = umin(imod_interval / 250, IMODI_MASK);
 
-	imod = readl(&ir->ir_set->irq_control);
-	imod &= ~ER_IRQ_INTERVAL_MASK;
+	imod = readl(&ir->ir_set->imod);
+	imod &= ~IMODI_MASK;
 	imod |= imod_interval;
-	writel(imod, &ir->ir_set->irq_control);
+	writel(imod, &ir->ir_set->imod);
 
 	return 0;
 }
@@ -835,7 +835,7 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
 		ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
 		ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 		ir->s3_iman = readl(&ir->ir_set->iman);
-		ir->s3_irq_control = readl(&ir->ir_set->irq_control);
+		ir->s3_imod = readl(&ir->ir_set->imod);
 	}
 }
 
@@ -859,7 +859,7 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
 		xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
 		xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
 		writel(ir->s3_iman, &ir->ir_set->iman);
-		writel(ir->s3_irq_control, &ir->ir_set->irq_control);
+		writel(ir->s3_imod, &ir->ir_set->imod);
 	}
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 62d12d23617f..49887a303e43 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -213,7 +213,7 @@ struct xhci_op_regs {
  * struct xhci_intr_reg - Interrupt Register Set, v1.2 section 5.5.2.
  * @iman:		IMAN - Interrupt Management Register. Used to enable
  *			interrupts and check for pending interrupts.
- * @irq_control:	IMOD - Interrupt Moderation Register. Used to throttle interrupts.
+ * @imod:		IMOD - Interrupt Moderation Register. Used to throttle interrupts.
  * @erst_size:		ERSTSZ - Number of segments in the Event Ring Segment Table (ERST).
  * @erst_base:		ERSTBA - Event ring segment table base address.
  * @erst_dequeue:	ERDP - Event ring dequeue pointer.
@@ -227,7 +227,7 @@ struct xhci_op_regs {
  */
 struct xhci_intr_reg {
 	__le32	iman;
-	__le32	irq_control;
+	__le32	imod;
 	__le32	erst_size;
 	__le32	rsvd;
 	__le64	erst_base;
@@ -240,15 +240,15 @@ struct xhci_intr_reg {
 /* bit 1 - Interrupt Enable (IE), whether the interrupter is capable of generating an interrupt */
 #define	IMAN_IE			(1 << 1)
 
-/* irq_control bitmasks */
+/* imod bitmasks */
 /*
  * bits 15:0 - Interrupt Moderation Interval, the minimum interval between interrupts
  * (in 250ns intervals). The interval between interrupts will be longer if there are no
  * events on the event ring. Default is 4000 (1 ms).
  */
-#define ER_IRQ_INTERVAL_MASK	(0xffff)
+#define IMODI_MASK		(0xffff)
 /* bits 31:16 - Interrupt Moderation Counter, used to count down the time to the next interrupt */
-#define ER_IRQ_COUNTER_MASK	(0xffff << 16)
+#define IMODC_MASK		(0xffff << 16)
 
 /* erst_size bitmasks */
 /* bits 15:0 - Event Ring Segment Table Size, number of ERST entries */
@@ -1453,7 +1453,7 @@ struct xhci_interrupter {
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_iman;
-	u32	s3_irq_control;
+	u32	s3_imod;
 	u32	s3_erst_size;
 	u64	s3_erst_base;
 	u64	s3_erst_dequeue;
-- 
2.43.0


