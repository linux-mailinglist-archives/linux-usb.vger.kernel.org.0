Return-Path: <linux-usb+bounces-22749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8FA8043C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4CC71B61C43
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AF526A1A8;
	Tue,  8 Apr 2025 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPJjakN+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4522226AAA1
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113599; cv=none; b=o9hE3MeV1iu5p6FcCo/dxk8C788q3d0TKmtIXcq1zoMeomEgXMRP2Z3JYSuSkoqFRzqqmqBu6/m9OzTiACqDKIr0w/MoMQEg0fO+J8WeiJbui2BryAqdySZRjB0waYCr6HAUOAJ8aao2CQBn+W0BHR/SW7SqdxLMrlV+EJvYKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113599; c=relaxed/simple;
	bh=caYpHf7zFLI92uKJs2tHRJa0e7brab0b4dDy95e5Wbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGyY8F90A+A/EOAikvvu/bHdukCptA9Qa4PCSGLy6lUlkgug9zaX1gZqjgt59EdVw39XC3pjJO7zcj7vmSjDyV1lx2BSC/7gD2Jr+LK8md3PlWLPtwMj2JmZi88AdfbsUOPMf5+pBYFkMI1vbpZbMqhft1r124KEgbS0caffIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPJjakN+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113597; x=1775649597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=caYpHf7zFLI92uKJs2tHRJa0e7brab0b4dDy95e5Wbw=;
  b=OPJjakN+FxefYgxiZP+s++Qe77oRMNyyhEXnhB0/nhItqFuo8s2AHb/k
   mrH+qrUt9xNMF+y72m0X/S1Ev1w6K4x0jx+hnx7/s+hx/JxSL17VE5gzy
   R61YdiRRyQnC1A7CAs0Dyq+KDqacIeqtUZS655TiRcMDg4b/whR8mNesH
   /jQOglM2MfqEHk066S6D1M5NsrJXVQ06Wc1vffeAFAsvIJmqCxKVzM4rc
   1kLKRLOEppNmEoB4RH48OE3hC6hE/8zSzEQrYknMi5qlObFw/+0pQeajb
   FWn10OlAO8d1nH+eQxp9z2dfR97f+Zk4mYn6X2UkErw1FSTELHaPGkZ3L
   w==;
X-CSE-ConnectionGUID: B+X1Uo4rR2uoPlJeM3QhKQ==
X-CSE-MsgGUID: 2JmaWg7pTxy4CAWpsWDPxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676477"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:56 -0700
X-CSE-ConnectionGUID: OH5ErdHcSiOJIdF0U3QWPA==
X-CSE-MsgGUID: k1QJBtmyQZWWF0MjD7/J4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428062"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 27799398; Tue, 08 Apr 2025 14:59:54 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 8/9] usb: xhci: rename 'irq_pending' to 'iman'
Date: Tue,  8 Apr 2025 14:57:51 +0300
Message-ID: <20250408115752.1344901-9-niklas.neronin@linux.intel.com>
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
---
 drivers/usb/host/xhci-ring.c | 10 +++++-----
 drivers/usb/host/xhci.c      | 16 ++++++++--------
 drivers/usb/host/xhci.h      |  8 ++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 412eb90c29fb..aa04a910c855 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3087,14 +3087,14 @@ static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
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
index a41337360535..2b4dd527c64d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -329,12 +329,12 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
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
 
@@ -345,11 +345,11 @@ static int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupt
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
 
@@ -730,7 +730,7 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
 		ir->s3_erst_size = readl(&ir->ir_set->erst_size);
 		ir->s3_erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
 		ir->s3_erst_dequeue = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-		ir->s3_irq_pending = readl(&ir->ir_set->irq_pending);
+		ir->s3_iman = readl(&ir->ir_set->iman);
 		ir->s3_irq_control = readl(&ir->ir_set->irq_control);
 	}
 }
@@ -754,7 +754,7 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
 		writel(ir->s3_erst_size, &ir->ir_set->erst_size);
 		xhci_write_64(xhci, ir->s3_erst_base, &ir->ir_set->erst_base);
 		xhci_write_64(xhci, ir->s3_erst_dequeue, &ir->ir_set->erst_dequeue);
-		writel(ir->s3_irq_pending, &ir->ir_set->irq_pending);
+		writel(ir->s3_iman, &ir->ir_set->iman);
 		writel(ir->s3_irq_control, &ir->ir_set->irq_control);
 	}
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 715b860995f3..05e35f1303c3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -212,7 +212,7 @@ struct xhci_op_regs {
 
 /**
  * struct xhci_intr_reg - Interrupt Register Set, v1.2 section 5.5.2.
- * @irq_pending:	IMAN - Interrupt Management Register. Used to enable
+ * @iman:		IMAN - Interrupt Management Register. Used to enable
  *			interrupts and check for pending interrupts.
  * @irq_control:	IMOD - Interrupt Moderation Register. Used to throttle interrupts.
  * @erst_size:		ERSTSZ - Number of segments in the Event Ring Segment Table (ERST).
@@ -227,7 +227,7 @@ struct xhci_op_regs {
  * updates the dequeue pointer.
  */
 struct xhci_intr_reg {
-	__le32	irq_pending;
+	__le32	iman;
 	__le32	irq_control;
 	__le32	erst_size;
 	__le32	rsvd;
@@ -235,7 +235,7 @@ struct xhci_intr_reg {
 	__le64	erst_dequeue;
 };
 
-/* irq_pending bitmasks */
+/* iman bitmasks */
 /* bit 0 - Interrupt Pending (IP), whether there is an interrupt pending. Write-1-to-clear. */
 #define	IMAN_IP			(1 << 0)
 /* bit 1 - Interrupt Enable (IE), whether the interrupter is capable of generating an interrupt */
@@ -1446,7 +1446,7 @@ struct xhci_interrupter {
 	bool			ip_autoclear;
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
-	u32	s3_irq_pending;
+	u32	s3_iman;
 	u32	s3_irq_control;
 	u32	s3_erst_size;
 	u64	s3_erst_base;
-- 
2.47.2


