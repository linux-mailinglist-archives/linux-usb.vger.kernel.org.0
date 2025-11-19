Return-Path: <linux-usb+bounces-30718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29DC6F48B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5037928C3D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE7B36B052;
	Wed, 19 Nov 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcrNYewL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D19036A018
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562305; cv=none; b=MSpLeZcCNT51y0bQkNMO2vi6cU+OLnuf3Q2R3RWQQiciQaeBQVEnk+DzswA8KY9uWKAaCLMMzDbkiaQaYb9XVH15U46C1bEed6lNkFlomvHoGNLtVIS1qaNIGqeZl4MaYBmT1ewkKaxmqGw9p3gXRMz6ne0cskXMXCku4m9OxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562305; c=relaxed/simple;
	bh=X8im4VOYZKsVUNXgnl+vpCsa927FEwofWJKRzEOvF20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DlvcnjMMMMU0wwCb8YRsTMkFddZIYmOsU00VnciGL/chm9kAXotGpKQI7lnqqdyhdlPHoF8P5D7SKc7HsndvllItyOXxrfKIBLCoSd9+IK9GmGJdT7X4GDOByWrTOwLl5HcordjyCEn9smfpugeynntRjKYch8AQEkZFbA/DnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcrNYewL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562302; x=1795098302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X8im4VOYZKsVUNXgnl+vpCsa927FEwofWJKRzEOvF20=;
  b=IcrNYewLtEpOLAEZKEjzN44OQatqVZPvTfUAfgyBl937nSNRfoQmP9IF
   0LaYOBKr9VPtHYbnKBzFeaqGczT74kbXU0XcTdpSOH8h+IBD0MnFIt9I7
   SQWU0PPfcWaisEwTZYzufZggHBqdgXEXvRjB5SUwIw/WlkLHIMHdcSlhy
   5diGgJQMLsBCNf6qjw2i4Xmhbzn0gS275njrCYoxhDbQA+YMgPR7xSnWZ
   Am6lUhze/w+O78uwbhgmUgyqhr9xI96rAPGlzeOO5OdonYHM5wm18TMQy
   W8pAuQP+KFdEXWwUYm3ehZym2swlsYi0gxPEmE65or7tABWV4KxPogcTN
   w==;
X-CSE-ConnectionGUID: AJ0DhwdCQiatmLf5f+eaWw==
X-CSE-MsgGUID: 1X1hOSb8QVWvtZ0nh04Ssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645573"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:02 -0800
X-CSE-ConnectionGUID: oYr2UlM6QrigBSusVt/WVw==
X-CSE-MsgGUID: 4V9loKb9QgyRJcfGUchiQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992138"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:00 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/23] usb: xhci: limit number of interrupts to 128
Date: Wed, 19 Nov 2025 16:24:11 +0200
Message-ID: <20251119142417.2820519-18-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 ++++++-------
 drivers/usb/host/xhci.h |  7 ++++++-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index cb82b15fc203..1e4032bf1223 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -250,7 +250,6 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	struct iommu_domain *domain;
 	int err, i;
 	u64 val;
-	u32 intrs;
 
 	/*
 	 * Some Renesas controllers get into a weird state if they are
@@ -291,9 +290,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 	if (upper_32_bits(val))
 		xhci_write_64(xhci, 0, &xhci->op_regs->cmd_ring);
 
-	intrs = min_t(u32, xhci->max_interrupters, ARRAY_SIZE(xhci->run_regs->ir_set));
-
-	for (i = 0; i < intrs; i++) {
+	for (i = 0; i < xhci->max_interrupters; i++) {
 		struct xhci_intr_reg __iomem *ir;
 
 		ir = &xhci->run_regs->ir_set[i];
@@ -5450,7 +5447,9 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
 	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
-	if ((!xhci->max_interrupters) || xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
+	if (!xhci->max_interrupters)
+		xhci->max_interrupters = min(HCS_MAX_INTRS(hcs_params1), MAX_HC_INTRS);
+	else if (xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
 		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
 
 	xhci->quirks |= quirks;
@@ -5670,8 +5669,8 @@ static int __init xhci_hcd_init(void)
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
index e04bc491a22b..2b0796f6d00e 100644
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
@@ -278,7 +283,7 @@ struct xhci_intr_reg {
 struct xhci_run_regs {
 	__le32			microframe_index;
 	__le32			rsvd[7];
-	struct xhci_intr_reg	ir_set[128];
+	struct xhci_intr_reg	ir_set[1024];
 };
 
 /**
-- 
2.43.0


