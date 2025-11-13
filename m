Return-Path: <linux-usb+bounces-30485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D5C5782F
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 456E0352FB4
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86802350D77;
	Thu, 13 Nov 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGfdK/L0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5405C3502B9
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038744; cv=none; b=TGcgSM7af5JN6O//J8XrIgp2Z2dEubKVtnanTqEnBIf5LnVCOLUX6yF4aJGzNgKIJYTLkK/4cHKy1kgPq3pTVNCvktreOk7LXX+qIIqwhH51ppMiqY/LpiN+tJasYcImdZSFEqaQRxzoXHupiIGeuJd3CMCLx/O0lLTrmQgpjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038744; c=relaxed/simple;
	bh=ZkyElzzGgC5P5b5AG1b+Ud3Nk1O4xtWpQxcExJbBnpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaGD2nes8NMhCbhT3NhDj/0RXzIDHlaHAp48o0sQhlEhQxsvTwTYAH3cv69aPjvZPe9qsN9+seGimpUU/ymqFHINmUboLk6O3/XsdKaTB0NU0w3uXVbEw269VgR+o1USiFI+3N3OpN+jCRgoeEMe8pK1YKbqSDMSsHlDHTdH8oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGfdK/L0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038742; x=1794574742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkyElzzGgC5P5b5AG1b+Ud3Nk1O4xtWpQxcExJbBnpc=;
  b=eGfdK/L0ZLZLZdAg5WztSbyjDebVvu2K889p/Al/0J2rNtkQEI+CAnyh
   0GsuzzwrDeA9f2h2rw/z9LcXYoyLPKfXS7L7QYB4mLoslj3CWve+hoSH2
   YiRcDvjxtXt9Q2WweuVbtVHtw+YkHQIc7sHmR26GEiPVI8/xQGOplE1sR
   WO9Vaab8Z3FY3H1Hn9afcELP17PhRGMYhLGgm3DhE/mcAtU+ApcmNSN02
   47Xjf/jaq5oGguBVDU42ZIY0G/aiOseaUpTBddZCxqqytPUpvAE4BIMqz
   Hw5wDsVf1qchp7yuuhVgJL0RnqHTTQVs8VA/be3pJpLxwuA7ZaYuqtq89
   w==;
X-CSE-ConnectionGUID: X7EXOnYwTxmg2aXj6I+Nig==
X-CSE-MsgGUID: v0vxwj4ET1mEDQ+Hr2cqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150401"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150401"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:00 -0800
X-CSE-ConnectionGUID: Ew2cYBYTSGiQTgXnUGheeg==
X-CSE-MsgGUID: oRcOCaxoSc2mJ2XRE0is8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673833"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id B7B339A; Thu, 13 Nov 2025 13:58:57 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 06/13] usb: xhci: limit number of interrupts to 128
Date: Thu, 13 Nov 2025 13:56:33 +0100
Message-ID: <20251113125640.2875608-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xHCI driver defines only 128 interrupter register slots, yet allows up
to 2047 interrupters. According to the xHCI specification, the maximum
valid number of interrupters is 1024. These mismatches can lead to
out-of-range accesses and excessive memory use.

The Number of Interrupters (MaxIntrs) field occupies bits 18:8 of the
HCSPARAMS1 register, which can yield a value up to 2047, although the
specification limits it to 1024. Cap the value using the 'MAX_HC_INTRS'
macro.

Set 'xhci->max_intrs' to the minimum of the value reported by the
HCSPARAMS1 register and 'MAX_HC_INTRS'. The interrupter register slot
array is defined for 1024 entries, serving only as a structural template
and not increasing memory usage.

Although the xHCI specification allows up to 1024 interrupters, raising
'MAX_HC_INTRS' above 128 provides no practical benefit. The driver only
uses the primary interrupter (0), and secondary interrupters (1+) are
rarely, if ever, used in practice. No reports exist of usage beyond 128.
Therefore, I have limited it to 128.

Summary:
 * Interrupter allocations are now limited to 128 from 2047.
 * Interrupter Register template slots are set to 1024 from 128.
 * Macro 'MAX_HC_INTRS' can be modified to set the interrupter limit.

==== Detailed interrupter explanation ====

There are two relevant components:

Interrupter array:
This holds the software interrupter structures and is allocated by the
xhci driver. The number of interrupters allocated is determined by the
HCSPARAMS1 register field, which specifies the supported interrupter
count.

Interrupter register slots:
This is a template struct used to access the hardware's runtime
registers. It is not allocated by the driver, the hardware defines and
owns this memory region, and the driver only maps it for MMIO access.

Each entry in the interrupter array points to its corresponding
interrupter register slot in the hardware region once that interrupter
is enabled.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 ++++++-------
 drivers/usb/host/xhci.h |  7 ++++++-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5eb3ea0d9e15..2015d37f863e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -237,7 +237,6 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	struct iommu_domain *domain;
 	int err, i;
 	u64 val;
-	u32 intrs;
 
 	/*
 	 * Some Renesas controllers get into a weird state if they are
@@ -278,9 +277,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	if (upper_32_bits(val))
 		xhci_write_64(xhci, 0, &xhci->op_regs->cmd_ring);
 
-	intrs = min_t(u32, xhci->max_interrupters, ARRAY_SIZE(xhci->run_regs->ir_set));
-
-	for (i = 0; i < intrs; i++) {
+	for (i = 0; i < xhci->max_interrupters; i++) {
 		struct xhci_intr_reg __iomem *ir;
 
 		ir = &xhci->run_regs->ir_set[i];
@@ -5438,7 +5435,9 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
 	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
-	if ((!xhci->max_interrupters) || xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
+	if (!xhci->max_interrupters)
+		xhci->max_interrupters = min(HCS_MAX_INTRS(hcs_params1), MAX_HC_INTRS);
+	else if (xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
 		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
 
 	xhci->quirks |= quirks;
@@ -5658,8 +5657,8 @@ static int __init xhci_hcd_init(void)
 	BUILD_BUG_ON(sizeof(struct xhci_erst_entry) != 4*32/8);
 	BUILD_BUG_ON(sizeof(struct xhci_cap_regs) != 8*32/8);
 	BUILD_BUG_ON(sizeof(struct xhci_intr_reg) != 8*32/8);
-	/* xhci_run_regs has eight fields and embeds 128 xhci_intr_regs */
-	BUILD_BUG_ON(sizeof(struct xhci_run_regs) != (8+8*128)*32/8);
+	/* xhci_run_regs has eight fields and embeds 1024 xhci_intr_regs */
+	BUILD_BUG_ON(sizeof(struct xhci_run_regs) != (8+8*1024)*32/8);
 
 	if (usb_disabled())
 		return -ENODEV;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index e68bf547f90b..50432241961f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -39,6 +39,11 @@
  * Valid values are in the range of 1 to 255.
  */
 #define MAX_HC_PORTS		127
+/*
+ * Max number of Interrupter Register Sets. xHCI specification section 5.3.3
+ * Valid values are in the range of 1 to 1024.
+ */
+#define MAX_HC_INTRS		128
 
 /*
  * xHCI register interface.
@@ -287,7 +292,7 @@ struct xhci_intr_reg {
 struct xhci_run_regs {
 	__le32			microframe_index;
 	__le32			rsvd[7];
-	struct xhci_intr_reg	ir_set[128];
+	struct xhci_intr_reg	ir_set[1024];
 };
 
 /**
-- 
2.50.1


