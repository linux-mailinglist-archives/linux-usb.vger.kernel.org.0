Return-Path: <linux-usb+bounces-23995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B389AB88B3
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C446BA02B7B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22DA1B21B8;
	Thu, 15 May 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSUSgHid"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC3A1F4E39
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317415; cv=none; b=sJS6dRUoY5JM1lD2TXc3frxqBqUFfgm3OUVQBQCWzmeR4dRi90oEo4EJeL7N6rv37K2slvEic29lgSM8kMZ3IcRjyWmcLTMrPw/T3XxJ+GoVQ/lRyeaVlnGoBMWZflp/XYK7lALNsPKPVbQsbHi5CSLCw51qjiP7Ko1xXHLquqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317415; c=relaxed/simple;
	bh=l5IVKatMUFrq0KHqFhtXf+4Ua0sowlFP1pm3oYP/Q9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSDBI30qi9oTDlxNln73j/J/GH/i+TVtjRKvncBlzMk9cPRMoM7Uq0jn/FGZoykFbUOjnBoK8RJ1ioNF94yBHLOuGVZerEpN13isab5w+hWuxrARQW28qthu07CBw+XIZUc8Bx42Jd7QA/CNQcENzn4CtEktCX4phbV1UD/3z/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSUSgHid; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317414; x=1778853414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l5IVKatMUFrq0KHqFhtXf+4Ua0sowlFP1pm3oYP/Q9o=;
  b=RSUSgHidx//HFEmCa+bclxQmcyL7Pf3x2BwZPOhqhUe8kAngUvT1Raki
   w6KRi4ZV0RgRMW0IP0yNRktQ/Gw20NzaVT6P8T8yF+wMCwJMOEER2FB/K
   A0b6hF8GRL3Ka/RjQ1wMEagMSsn3FPKMIfSykLjZDklOR5DaMlevdW5cX
   g54aCM+kFUzrDeJ79EirJrq97Qr/ljKCLukjg5uxMs6H1hkog710j8y8y
   sPMw5CRKMhsGEDq1BF0RRuK1azfaq72AuWWZiHCH1kyQ5pTorlmrxiP5T
   yNvBAOambxVNJth9vjnWEsOonarHW7Sgs3Z664R919gDH4C5CZPHEon6z
   w==;
X-CSE-ConnectionGUID: seQR6vS6TUOQlk/MYBuumg==
X-CSE-MsgGUID: BzN2yxWYRh2nL2SQEiBLYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270063"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:54 -0700
X-CSE-ConnectionGUID: +tulBT5+Tk6w6OoTW526Pw==
X-CSE-MsgGUID: Uuq64x39SZW/4w6a/GLxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372291"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:52 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/24] usb: xhci: improve Interrupt Management register macros
Date: Thu, 15 May 2025 16:56:12 +0300
Message-ID: <20250515135621.335595-16-mathias.nyman@linux.intel.com>
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

The Interrupt Management register (IMAN), contains three fields:
 - Bit 0:	Interrupt Pending (IP)
 - Bit 1:	Interrupt Enable (IE)
 - Bits 31:2:	RsvdP (Reserved and Preserved)

Currently, there are multiple macros for both the IP and IE fields.
Consolidates them into single mask macros for better clarity and
maintainability.

Comment "THIS IS BUGGY - FIXME - IP IS WRITE 1 TO CLEAR" refers to the
fact that both macros 'ER_IRQ_ENABLE' and 'ER_IRQ_DISABLE' clear the IP bit
by writing '0' before modifying the IE bit. However, the IP bit is actually
cleared by writing '1'. To prevent any regression, this behavior has not
been altered. Instead, when the IE bit is modified, the IP macro is used
explicitly to highlight this "quirk".

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c |  8 ++++++--
 drivers/usb/host/xhci.h | 14 ++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c3a1a67b6563..472589679af3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -331,7 +331,9 @@ int xhci_enable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	writel(ER_IRQ_ENABLE(iman), &ir->ir_set->irq_pending);
+	iman &= ~IMAN_IP;
+	iman |= IMAN_IE;
+	writel(iman, &ir->ir_set->irq_pending);
 
 	return 0;
 }
@@ -344,7 +346,9 @@ int xhci_disable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	writel(ER_IRQ_DISABLE(iman), &ir->ir_set->irq_pending);
+	iman &= ~IMAN_IP;
+	iman &= ~IMAN_IE;
+	writel(iman, &ir->ir_set->irq_pending);
 
 	return 0;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index b0b16cd7df91..28c4ad7534c1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -152,10 +152,6 @@ struct xhci_op_regs {
 #define XHCI_RESET_LONG_USEC		(10 * 1000 * 1000)
 #define XHCI_RESET_SHORT_USEC		(250 * 1000)
 
-/* IMAN - Interrupt Management Register */
-#define IMAN_IE		(1 << 1)
-#define IMAN_IP		(1 << 0)
-
 /* USBSTS - USB status - status bitmasks */
 /* HC not running - set to 1 when run/stop bit is cleared. */
 #define STS_HALT	XHCI_STS_HALT
@@ -240,12 +236,10 @@ struct xhci_intr_reg {
 };
 
 /* irq_pending bitmasks */
-#define	ER_IRQ_PENDING(p)	((p) & 0x1)
-/* bits 2:31 need to be preserved */
-/* THIS IS BUGGY - FIXME - IP IS WRITE 1 TO CLEAR */
-#define	ER_IRQ_CLEAR(p)		((p) & 0xfffffffe)
-#define	ER_IRQ_ENABLE(p)	((ER_IRQ_CLEAR(p)) | 0x2)
-#define	ER_IRQ_DISABLE(p)	((ER_IRQ_CLEAR(p)) & ~(0x2))
+/* bit 0 - Interrupt Pending (IP), whether there is an interrupt pending. Write-1-to-clear. */
+#define	IMAN_IP			(1 << 0)
+/* bit 1 - Interrupt Enable (IE), whether the interrupter is capable of generating an interrupt */
+#define	IMAN_IE			(1 << 1)
 
 /* irq_control bitmasks */
 /* Minimum interval between interrupts (in 250ns intervals).  The interval
-- 
2.43.0


