Return-Path: <linux-usb+bounces-30291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964CC47807
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7114B4F4DF2
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF02241665;
	Mon, 10 Nov 2025 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cULKbQKY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51731C59B
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787718; cv=none; b=Au5b+ySEgT+hHg1q3YknZMMsXGC488a5FivTLwzdCvKKSCX6D6BYZM7HFa+k6evnv87CKph19y9bWe2T4q4l2fcM+zhVocefe6O5GcUmVesHfcPuoHx5OiOO9bxGFr2xQhALP9hbxptaOdOx7UEpUoxGTeUbE0xq0GsfgAQNgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787718; c=relaxed/simple;
	bh=ZkyElzzGgC5P5b5AG1b+Ud3Nk1O4xtWpQxcExJbBnpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMGBpBb9XV89EucnDw/hz7jFKCdHow2B0byfzhVV7cnvtlgJatBSomlKZBIa/qIOK+KMtbgnAVkdhJqS5ENtcDUzBFKDzZ1pc76KEftzJH4pc1OkxatlcuCBx+/uWVzIrQoOdDEp4UJ6WnQYFg8HxvCoThnbDtzoZ/FHO+anclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cULKbQKY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787717; x=1794323717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkyElzzGgC5P5b5AG1b+Ud3Nk1O4xtWpQxcExJbBnpc=;
  b=cULKbQKY1iL2MSHXjYPZbYiXN4PubGzQmDZsDDz/Ffy/lBnhwNyLFBat
   JmIHJWuaBK3LaGTHCWyO0OmhiyYWmzsgqjnhavbkNjfxV1X9+bfYectNU
   uP6uVY8irkrfw74bKB0ehHfL330msVT5u4r6/am43bzwK3/omQ4yBoVhh
   tEG8DANsNrgnTCTJNDHi9fA2TXr6lV7+5xkK3iSgYnd7OWFyPPl5DIj6I
   odBlfO/3u804lTvCp2gQ4H4xWnkOFATJbvLQMCpGiCjhy40khYw6d17TA
   QpDD17SBTw+LHyH5ca3TPf6nY/XMC1T9+O4yLO01sGiIj1dXGcDcMVmQI
   A==;
X-CSE-ConnectionGUID: fmlP10SsTP6XxpzdmuylcQ==
X-CSE-MsgGUID: 40scTX8FQEOnpi02D1Di6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76185477"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76185477"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:16 -0800
X-CSE-ConnectionGUID: YaWVig5uS7+j5z8Z/FbRTQ==
X-CSE-MsgGUID: WYAYe9NMSNuEKkO/Jo9Hyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192954229"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 07:15:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 449A496; Mon, 10 Nov 2025 16:15:15 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 06/13] usb: xhci: limit number of interrupts to 128
Date: Mon, 10 Nov 2025 16:14:43 +0100
Message-ID: <20251110151450.635410-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
References: <20251110151450.635410-1-niklas.neronin@linux.intel.com>
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


