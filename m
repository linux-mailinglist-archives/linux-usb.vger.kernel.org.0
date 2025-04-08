Return-Path: <linux-usb+bounces-22748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F4DA80480
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95A04A1196
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3537C2698AE;
	Tue,  8 Apr 2025 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqO4s/Pq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675726A0D9
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113598; cv=none; b=GTDnlA4E9IgJ7r6veQP37VNa1yffoPpy4mypm/KQLmV5hU6fPOnM8PLcQeUnTO0VkGIVqf0oH9e1iP9gSHt5eP/5vioZWy8WywYyHh0QHD3yMwdvyeeg7wumYIXID41JoHBlZU2F0lzbiz9iuP3t7q+sPKAtW4FTcJEAhnpnHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113598; c=relaxed/simple;
	bh=6TVVH8Q4IN4rDP4/apskBATgOniCGvrAdnAQPmWIuKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUr/01CW/avzJRvQTqaMnqotvBKj9KTN/QwBIb0xdQr9Fe7toMx5zHnepJIptXk98XnEr2asKPnDjAgQqNbeStOUhXtb3tvVvjIlZlzcmZIZ+zKdInQ2dY1rUPbHulDidiTFsLMJ6jFejsH6NWU6uYyIXACc3RzjGnRBc/m3+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqO4s/Pq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113597; x=1775649597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6TVVH8Q4IN4rDP4/apskBATgOniCGvrAdnAQPmWIuKk=;
  b=XqO4s/PqTYzd1yqV211e8a5kUPZHxnt2rmUhS9AJYULtV6VoZddIOTYN
   k7Wf1z9LSc0TRGkDU0vgLhyXaGPKoAgbNSeujYr1FejbAQ3pbuK38edqA
   MEIlMnwUc3eaLBPVR96y1438+UOBVOXtBINHxrSkF6iJHti+TbFmSpa/U
   Uc08P3PI0xSubWlS8FzvnOKOqBCY6GGQT3Zpu1yncuf9qRzFKXr6i1F3U
   4USJY36Ak0wDvf/UKqmee1Ssn0/0tt9B7fI8GfPsi9YmRRxE7iHilhy2q
   jBOPkgOKc2Im4NvbKArd4jRPyg/dlOBWusv991ZIDEBW04XheiUrhM4Ia
   g==;
X-CSE-ConnectionGUID: TDN41OInQpWBJB6C3TS1Zw==
X-CSE-MsgGUID: 9yqJwoirRAa+abw23F3U7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44681736"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44681736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:57 -0700
X-CSE-ConnectionGUID: m9wOa7OTSpGeClS4KIx4xQ==
X-CSE-MsgGUID: 63m/RrNbQLuRj1UkkvjIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128114724"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 04:59:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id E74A3484; Tue, 08 Apr 2025 14:59:54 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 9/9] usb: xhci: rename 'irq_control' to 'imod'
Date: Tue,  8 Apr 2025 14:57:52 +0300
Message-ID: <20250408115752.1344901-10-niklas.neronin@linux.intel.com>
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
---
 drivers/usb/host/xhci.c | 12 ++++++------
 drivers/usb/host/xhci.h | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2b4dd527c64d..ec88d2cacb13 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -366,12 +366,12 @@ int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
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
@@ -731,7 +731,7 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
 		ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
 		ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
 		ir->s3_iman = readl(&ir->ir_set->iman);
-		ir->s3_irq_control = readl(&ir->ir_set->irq_control);
+		ir->s3_imod = readl(&ir->ir_set->imod);
 	}
 }
 
@@ -755,7 +755,7 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
 		xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
 		xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
 		writel(ir->s3_iman, &ir->ir_set->iman);
-		writel(ir->s3_irq_control, &ir->ir_set->irq_control);
+		writel(ir->s3_imod, &ir->ir_set->imod);
 	}
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 05e35f1303c3..5eb01d1a3e7e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -214,7 +214,7 @@ struct xhci_op_regs {
  * struct xhci_intr_reg - Interrupt Register Set, v1.2 section 5.5.2.
  * @iman:		IMAN - Interrupt Management Register. Used to enable
  *			interrupts and check for pending interrupts.
- * @irq_control:	IMOD - Interrupt Moderation Register. Used to throttle interrupts.
+ * @imod:		IMOD - Interrupt Moderation Register. Used to throttle interrupts.
  * @erst_size:		ERSTSZ - Number of segments in the Event Ring Segment Table (ERST).
  * @erst_base:		ERSTBA - Event ring segment table base address.
  * @erst_dequeue:	ERDP - Event ring dequeue pointer.
@@ -228,7 +228,7 @@ struct xhci_op_regs {
  */
 struct xhci_intr_reg {
 	__le32	iman;
-	__le32	irq_control;
+	__le32	imod;
 	__le32	erst_size;
 	__le32	rsvd;
 	__le64	erst_base;
@@ -241,15 +241,15 @@ struct xhci_intr_reg {
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
@@ -1447,7 +1447,7 @@ struct xhci_interrupter {
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_iman;
-	u32	s3_irq_control;
+	u32	s3_imod;
 	u32	s3_erst_size;
 	u64	s3_erst_base;
 	u64	s3_erst_dequeue;
-- 
2.47.2


