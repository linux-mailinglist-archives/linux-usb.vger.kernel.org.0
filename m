Return-Path: <linux-usb+bounces-22743-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7ABA804B6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E7A880D70
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189FF267F57;
	Tue,  8 Apr 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgxy3KKs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E2826A0CF
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113589; cv=none; b=LMKbBfL/n/wkY+jB+9Ew0uWO4iXqPQDN7VlueG1spn3oEWzeUPz8001Rjk+yoEc9OxX0ovKWEaRb5xVHGKX6aqHmej6rFCrQTitj/lg0G6vAdUaxBm5K4Vr/IiwiqMsIGd+683keWdY2ivkA85D8C87qXTqYL8tirlsirbFDmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113589; c=relaxed/simple;
	bh=gARHaLdBsnhmLwM62XcgKp002R4voMzzcIMrmePGlOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doSGDqAuG9j+xY3mKSyZXCchVFzILFMP9ISAWS6y0An9ELksAP7UcWgvCUWSh6Oz0M57x01oYlGlJB7oztvnGVPE8Z3CL3mLz1tKgtMsjra8TQHTqkrWk7fjKe/VwoEexF1U6fTiAuw8WDlw99AqKFuKoZ9PG8xbaspz1VYAWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgxy3KKs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113588; x=1775649588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gARHaLdBsnhmLwM62XcgKp002R4voMzzcIMrmePGlOs=;
  b=dgxy3KKswJy/geS8sWPKv6K9oJvNmF+M1MV3wOib6EjAvwL/A3TwWAqw
   wtDDEmY0pSCIFNK8oN79h5Cm0WCucVPF7aeJUen2JNrHopQ2Zk1SNW0+Q
   nrRMIZjFzjyyaY/7KHyTtYy5zItef5qWpPvJn2NyGrtJrS4M+jQi2o779
   fP7EDt2tC96xMuJb0hjY9/v+kw/vhkJEWciUVBeF10RKPMn6gGWTAGrjP
   j5+2X7l20lW+Zn7sbIdcuZPfqY/QTQo+VJtJyZO98Jz5uH1OTjzyLtlyT
   8am8vF7CH9VkVDEyPek/V+zhagkdHJLQ1XR19LDfeNz9A2ZK8S4gZ7plR
   g==;
X-CSE-ConnectionGUID: PMOC2rahRMOo1NnWRsR87g==
X-CSE-MsgGUID: /DYDGrHLRW2o+V8NYTMNig==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676459"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:46 -0700
X-CSE-ConnectionGUID: N6+QI5JKT82+IbAyn+zfwA==
X-CSE-MsgGUID: h93noSdTS3ygoAacNgMwwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428038"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 264BC484; Tue, 08 Apr 2025 14:59:44 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/9] usb: xhci: improve Interrupt Management register macros
Date: Tue,  8 Apr 2025 14:57:45 +0300
Message-ID: <20250408115752.1344901-3-niklas.neronin@linux.intel.com>
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
---
 drivers/usb/host/xhci.c |  8 ++++++--
 drivers/usb/host/xhci.h | 14 ++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 7a8c545b78b7..5cf9908188cf 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -330,7 +330,9 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	writel(ER_IRQ_ENABLE(iman), &ir->ir_set->irq_pending);
+	iman &= ~IMAN_IP;
+	iman |= IMAN_IE;
+	writel(iman, &ir->ir_set->irq_pending);
 
 	return 0;
 }
@@ -343,7 +345,9 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 		return -EINVAL;
 
 	iman = readl(&ir->ir_set->irq_pending);
-	writel(ER_IRQ_DISABLE(iman), &ir->ir_set->irq_pending);
+	iman &= ~IMAN_IP;
+	iman &= ~IMAN_IE;
+	writel(iman, &ir->ir_set->irq_pending);
 
 	return 0;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 37860f1e3aba..20e5b6ebbab1 100644
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
@@ -241,12 +237,10 @@ struct xhci_intr_reg {
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
2.47.2


