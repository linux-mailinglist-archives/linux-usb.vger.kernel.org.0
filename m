Return-Path: <linux-usb+bounces-30298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF9C4788C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBAC23A899A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE33426CE39;
	Mon, 10 Nov 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCzgGSVV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B8524C076
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787725; cv=none; b=kfllmCxyE1IS0/nmIOZcFYCVDoKn1GOZQ6pEW2lE9IS1HPwAup2WPQ/tRbl1Ul2DfWHQR1OElF/O/pNGWyYK3Y/xjJ6nfUNuacR+oR08Mt97sfPpg86U4U0FgxOCA2Sr8NnucSitvNxiZCorPNxFsQeiPaVHCKvPRCkBv8ADFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787725; c=relaxed/simple;
	bh=HfiFOwNC467K805R8JIcZ7TnILipFCwBRNRl9gQzeHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8iv7O/TLabeb7n2gGjsB5h6GH9uo5BmOA6GrVsoR7XvuxK8M/AaJbe6AMsl8YLOoLmoYOowHtRjbWN1/hDo1WCaHP+CEhb2oqBW1XqXA9+LRq7TanebqAUIK65qhWBLWS6AWabX7O0raWli/5heRSqOb2XZGjPxmrby/MZxlH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCzgGSVV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787723; x=1794323723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HfiFOwNC467K805R8JIcZ7TnILipFCwBRNRl9gQzeHg=;
  b=RCzgGSVVXz/M4jv0c59kp5TnFIkPMIXdyR8DsRFZnIJa6MpaO3V1pTEp
   Eows6E7yVttA2L8tQIdcYq3JhwFM4xadHNJogr1Iy3PGbiehy65Qg6mSO
   X2AnQ/+bY7/QQzqsRldawBpj9iWIi1z63I/QzWCkJEBWTpKuwnSTSPykm
   tM2hZEaKtoM5gx6M1d6/QiwXPA/7MMoBNF911vY7M+S2nq1ticywFBUDo
   9nC5ZHnEZK+WhFPVKmH5FHKC9lIzj7s8lKJnHWawwl+yO/xKQFaPqRdMn
   eg+ROCSN9QsP/I1UcC8JGcKSOo89jmVGdjIhRxlOF0UOPCG16YQQ0pEk5
   w==;
X-CSE-ConnectionGUID: err1kp7uRzaDByVg/ngtjw==
X-CSE-MsgGUID: DIsdEEdQSAa1/U8Z16Wk2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76185486"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="76185486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:22 -0800
X-CSE-ConnectionGUID: ct/gF74zToSwyXSnCIGJyw==
X-CSE-MsgGUID: ILifdg9ETFim6cAZpG+eBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192954257"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 07:15:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1E09496; Mon, 10 Nov 2025 16:15:21 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 12/13] usb: xhci: standardize multi bit-field macros
Date: Mon, 10 Nov 2025 16:14:49 +0100
Message-ID: <20251110151450.635410-13-niklas.neronin@linux.intel.com>
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

This patch aims to unify the format of register macros and masks within
the xHCI driver. Currently, register macros have inconsistent bit-field
masks, get macros, and set macros, with varying naming conventions and
functionalities.

==================== Proposal ====================
* Introduce a standardized approach by using only mask macros for each bit
  field, leveraging GENMASK() for enhanced clarity.

  #define HCC_MAX_PSA		GENMASK(15, 12)

* Utilize FIELD_GET() and FIELD_PREP() macros directly in the C code for
  getting and setting values, ensuring consistency and readability.

  u32 psa = FIELD_GET(HCC_MAX_PSA, reg);

* Maintain exceptions for macros that perform custom operations.

  #define CTX_SIZE(_hcc)	(_hcc & HCC_64BYTE_CONTEXT ? 64 : 32)

* Note, while FIELD_*() macros are beneficial, I am not suggesting that
  they should always be used. Instead, use them where they simplify the
  code and eliminate the necessity for custom get/set macros.
  In the example below, additional FIELD_PREP() or FIELD_MODIFY() is not
  beneficial.

  #define HCS_MAX_SCRATCHPAD(p)   (FIELD_GET(HCS_MAX_SP_HI, (p)) << 5 | \
				   FIELD_GET(HCS_MAX_SP_LO, (p)))

==================== Improvements ====================
Simplified Macros:
  By reducing custom macros, the code becomes more straightforward.
  Macros FIELD_GET() and FIELD_PREP() are commonly used, which contributes
  to the code readability and consistency.

  $ git grep -n 'FIELD_GET' | wc -l
  9027
  $ git grep -n 'FIELD_PREP' | wc -l
  15407

Consistent Return Type:
  All bit macros will return unsigned 64-bit values, mitigating potential
  cross-architecture issues.

Unified Bit Range Definition:
  The mask macro will define bit ranges, eliminating separate definitions
  for get/set macros. Because, FIELD_GET() & FIELD_PREP() use mask macro.

Cleaner header file with less macros:
  Fewer macros result in a cleaner and more manageable header file.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h    | 41 ++++++++++++++++++---------------
 drivers/usb/host/xhci-debugfs.c |  3 ++-
 drivers/usb/host/xhci-histb.c   |  2 +-
 drivers/usb/host/xhci-hub.c     |  4 ++--
 drivers/usb/host/xhci-mem.c     |  3 ++-
 drivers/usb/host/xhci-mtk.c     |  4 ++--
 drivers/usb/host/xhci-pci.c     |  4 +++-
 drivers/usb/host/xhci-plat.c    |  2 +-
 drivers/usb/host/xhci-ring.c    |  4 +++-
 drivers/usb/host/xhci-tegra.c   |  5 ++--
 drivers/usb/host/xhci.c         | 21 +++++++++--------
 11 files changed, 52 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 89dd46767885..12445a6c9b51 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -5,22 +5,23 @@
  */
 
 #include <linux/bits.h>
+#include <linux/bitfield.h>
 
 /* hc_capbase - bitmasks */
 /* bits 7:0 - Capability Registers Length */
-#define HC_LENGTH(p)		((p) & 0xff)
+#define HC_LENGTH		GENMASK(7, 0)
 /* bits 15:8 - Rsvd */
 /* bits 31:16 - Host Controller Interface Version Number */
-#define HC_VERSION(p)		(((p) >> 16) & 0xffff)
+#define HC_VERSION		GENMASK(31, 16)
 
 /* HCSPARAMS1 - hcs_params1 - bitmasks */
 /* bits 7:0 - Number of Device Slots */
-#define HCS_MAX_SLOTS(p)	(((p) >> 0) & 0xff)
-#define HCS_SLOTS_MASK		0xff
-/* bits 18:8 - Number of Interrupters, max values is 1024 */
-#define HCS_MAX_INTRS(p)	(((p) >> 8) & 0x7ff)
-/* bits 31:24, Max Ports - max value is 255 */
-#define HCS_MAX_PORTS(p)	(((p) >> 24) & 0xff)
+#define HCS_SLOTS_MASK		GENMASK(7, 0)
+/* bits 18:8 - Number of Interrupters, max values is 1024  */
+#define HCS_MAX_INTRS		GENMASK(18, 8)
+/* bits 23:19 - Rsvd */
+/* bits 31:24 - Max Ports, max values is 255 */
+#define HCS_MAX_PORTS		GENMASK(31, 24)
 
 /* HCSPARAMS2 - hcs_params2 - bitmasks */
 /*
@@ -33,24 +34,25 @@
  * Note: 1 Frame = 8 Microframes
  * xHCI specification section 5.3.4.
  */
-#define HCS_IST_VALUE(p)	((p) & 0x7)
+#define HCS_IST_VALUE		GENMASK(2, 0)
 #define HCS_IST_UNIT		BIT(3)
 /* bits 7:4 - Event Ring Segment Table Max, 2^(n) */
-#define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
+#define HCS_ERST_MAX		GENMASK(7, 4)
 /* bits 20:8 - Rsvd */
 /* bits 25:21 - Max Scratchpad Buffers (Hi), 5 Most significant bits */
-#define HCS_MAX_SP_HI(p)	(((p) >> 21) & 0x1f)
+#define HCS_MAX_SP_HI		GENMASK(25, 21)
 /* bit 26 - Scratchpad restore, for save/restore HW state */
 /* bits 31:27 - Max Scratchpad Buffers (Lo), 5 Least significant bits */
-#define HCS_MAX_SP_LO(p)	(((p) >> 27) & 0x1f)
-#define HCS_MAX_SCRATCHPAD(p)	(HCS_MAX_SP_HI(p) << 5 | HCS_MAX_SP_LO(p))
+#define HCS_MAX_SP_LO		GENMASK(31, 27)
+#define HCS_MAX_SCRATCHPAD(p)	(FIELD_GET(HCS_MAX_SP_HI, (p)) << 5 | \
+				 FIELD_GET(HCS_MAX_SP_LO, (p)))
 
 /* HCSPARAMS3 - hcs_params3 - bitmasks */
 /* bits 7:0 - U1 Device Exit Latency, Max U1 to U0 latency for the roothub ports */
-#define HCS_U1_LATENCY(p)	(((p) >> 0) & 0xff)
+#define HCS_U1_LATENCY		GENMASK(7, 0)
 /* bits 15:8 - Rsvd */
 /* bits 31:16 - U2 Device Exit Latency, Max U2 to U0 latency for the roothub ports */
-#define HCS_U2_LATENCY(p)	(((p) >> 16) & 0xffff)
+#define HCS_U2_LATENCY		GENMASK(31, 16)
 
 /* HCCPARAMS1 - hcc_params - bitmasks */
 /* bit 0 - 64-bit Addressing Capability */
@@ -77,19 +79,20 @@
 /* bit 11 - Contiguous Frame ID Capability */
 #define HCC_CFC			BIT(11)
 /* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
-#define HCC_MAX_PSA(p)		BIT(((((p) >> 12) & 0xf) + 1))
+#define HCC_MAX_PSA		GENMASK(15, 12)
+#define GET_MAX_PSA_SIZE(p)	BIT(FIELD_GET(HCC_MAX_PSA, (p)) + 1)
 /* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
-#define HCC_EXT_CAPS(p)		(((p) >> 16) & 0xffff)
+#define HCC_EXT_CAPS		GENMASK(31, 16)
 
 /* DBOFF - db_off - bitmasks */
 /* bits 1:0 - Rsvd */
 /* bits 31:2 - Doorbell Array Offset */
-#define	DBOFF_MASK	(0xfffffffc)
+#define	DBOFF_MASK		GENMASK(31, 2)
 
 /* RTSOFF - run_regs_off - bitmasks */
 /* bits 4:0 - Rsvd */
 /* bits 31:5 - Runtime Register Space Offse */
-#define	RTSOFF_MASK	(~0x1f)
+#define	RTSOFF_MASK		GENMASK(31, 5)
 
 /* HCCPARAMS2 - hcc_params2 - bitmasks */
 /* bit 0 - U3 Entry Capability */
diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index e45545fa3c66..fe3982815d5c 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -9,6 +9,7 @@
 
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/bitfield.h>
 
 #include "xhci.h"
 #include "xhci-debugfs.h"
@@ -745,7 +746,7 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 			    xhci->debugfs_root, "reg-cap");
 
 	xhci_debugfs_regset(xhci,
-			    HC_LENGTH(readl(&xhci->cap_regs->hc_capbase)),
+			    FIELD_GET(HC_LENGTH, readl(&xhci->cap_regs->hc_capbase)),
 			    xhci_op_regs, ARRAY_SIZE(xhci_op_regs),
 			    xhci->debugfs_root, "reg-op");
 
diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index 02396c8721dc..fddb43bf6323 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -276,7 +276,7 @@ static int xhci_histb_probe(struct platform_device *pdev)
 	if (ret)
 		goto put_usb3_hcd;
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
+	if (GET_MAX_PSA_SIZE(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 422028ebce49..356ddd4f3292 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -115,8 +115,8 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
 
 	if ((xhci->quirks & XHCI_LPM_SUPPORT)) {
 		reg = readl(&xhci->cap_regs->hcs_params3);
-		ss_cap->bU1devExitLat = HCS_U1_LATENCY(reg);
-		ss_cap->bU2DevExitLat = cpu_to_le16(HCS_U2_LATENCY(reg));
+		ss_cap->bU1devExitLat = FIELD_GET(HCS_U1_LATENCY, reg);
+		ss_cap->bU2DevExitLat = cpu_to_le16(FIELD_GET(HCS_U2_LATENCY, reg));
 	}
 
 	if (wLength < le16_to_cpu(bos->wTotalLength))
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 06ff712c9cbe..04f5722e1343 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/dmapool.h>
 #include <linux/dma-mapping.h>
+#include <linux/bitfield.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -2293,7 +2294,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!segs)
 		segs = ERST_DEFAULT_SEGS;
 
-	max_segs = BIT(HCS_ERST_MAX(xhci->hcs_params2));
+	max_segs = FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2) << 2;
 	segs = min(segs, max_segs);
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 208558cf822d..0529c4162f4b 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -468,7 +468,7 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	 * MTK xHCI 0.96: PSA is 1 by default even if doesn't support stream,
 	 * and it's 3 when support it.
 	 */
-	if (xhci->hci_version < 0x100 && HCC_MAX_PSA(xhci->hcc_params) == 4)
+	if (xhci->hci_version < 0x100 && GET_MAX_PSA_SIZE(xhci->hcc_params) == 4)
 		xhci->quirks |= XHCI_BROKEN_STREAMS;
 }
 
@@ -650,7 +650,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	}
 
 	usb3_hcd = xhci_get_usb3_hcd(xhci);
-	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
+	if (usb3_hcd && GET_MAX_PSA_SIZE(xhci->hcc_params) >= 4 &&
 	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
 		usb3_hcd->can_do_streams = 1;
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 6a25cbbbc4a4..e0a063166db5 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/reset.h>
 #include <linux/suspend.h>
+#include <linux/bitfield.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -661,7 +662,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	usb3_hcd = xhci_get_usb3_hcd(xhci);
-	if (usb3_hcd && !(xhci->quirks & XHCI_BROKEN_STREAMS) && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+	if (usb3_hcd && !(xhci->quirks & XHCI_BROKEN_STREAMS) &&
+	    GET_MAX_PSA_SIZE(xhci->hcc_params) >= 4)
 		usb3_hcd->can_do_streams = 1;
 
 	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..6fd595f81a30 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -340,7 +340,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 	}
 
 	usb3_hcd = xhci_get_usb3_hcd(xhci);
-	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
+	if (usb3_hcd && GET_MAX_PSA_SIZE(xhci->hcc_params) >= 4 &&
 	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
 		usb3_hcd->can_do_streams = 1;
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8d69f82a997c..fabf9438241c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -57,6 +57,8 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
+#include <linux/bitfield.h>
+
 #include "xhci.h"
 #include "xhci-trace.h"
 
@@ -3986,7 +3988,7 @@ static unsigned int xhci_get_last_burst_packet_count(struct xhci_hcd *xhci,
 /* Returns the Isochronous Scheduling Threshold in Microframes. 1 Frame is 8 Microframes. */
 static int xhci_ist_in_microseconds(u32 hcs_params2)
 {
-	int ist = HCS_IST_VALUE(hcs_params2);
+	int ist = FIELD_GET(HCS_IST_VALUE, hcs_params2);
 
 	if (hcs_params2 & HCS_IST_UNIT)
 		ist *= 8;
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5255b1002893..35ad372b9602 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014 Google, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -991,7 +992,7 @@ static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
 	u32 value;
 
 	cap_regs = tegra->regs;
-	op_regs = tegra->regs + HC_LENGTH(readl(&cap_regs->hc_capbase));
+	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase)),
 
 	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
 
@@ -1895,7 +1896,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto remove_usb2;
 	}
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
+	if (GET_MAX_PSA_SIZE(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
 	err = usb_add_hcd(xhci->shared_hcd, tegra->xhci_irq, IRQF_SHARED);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c7a377b34661..79e707686c1a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -21,6 +21,7 @@
 #include <linux/dmi.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb/xhci-sideband.h>
+#include <linux/bitfield.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -3482,7 +3483,7 @@ static void xhci_calculate_streams_entries(struct xhci_hcd *xhci,
 	 * level page entries), but that's an optional feature for xHCI host
 	 * controllers. xHCs must support at least 4 stream IDs.
 	 */
-	max_streams = HCC_MAX_PSA(xhci->hcc_params);
+	max_streams = GET_MAX_PSA_SIZE(xhci->hcc_params);
 	if (*num_stream_ctxs > max_streams) {
 		xhci_dbg(xhci, "xHCI HW only supports %u stream ctx entries.\n",
 				max_streams);
@@ -3612,7 +3613,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 
 	/* MaxPSASize value 0 (2 streams) means streams are not supported */
 	if ((xhci->quirks & XHCI_BROKEN_STREAMS) ||
-			HCC_MAX_PSA(xhci->hcc_params) < 4) {
+			GET_MAX_PSA_SIZE(xhci->hcc_params) < 4) {
 		xhci_dbg(xhci, "xHCI controller does not support streams.\n");
 		return -ENOSYS;
 	}
@@ -4572,7 +4573,7 @@ static int xhci_calculate_hird_besl(struct xhci_hcd *xhci,
 	int besl_device = 0;
 	u32 field;
 
-	u2del = HCS_U2_LATENCY(xhci->hcs_params3);
+	u2del = FIELD_GET(HCS_U2_LATENCY, xhci->hcs_params3);
 	field = le32_to_cpu(udev->bos->ext_cap->bmAttributes);
 
 	if (field & USB_BESL_SUPPORT) {
@@ -5420,25 +5421,25 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci->main_hcd = hcd;
 	xhci->cap_regs = hcd->regs;
 	xhci->op_regs = hcd->regs +
-		HC_LENGTH(readl(&xhci->cap_regs->hc_capbase));
+		FIELD_GET(HC_LENGTH, readl(&xhci->cap_regs->hc_capbase));
 	xhci->run_regs = hcd->regs +
 		(readl(&xhci->cap_regs->run_regs_off) & RTSOFF_MASK);
 	/* Cache read-only capability registers */
 	hcs_params1 = readl(&xhci->cap_regs->hcs_params1);
 	xhci->hcs_params2 = readl(&xhci->cap_regs->hcs_params2);
 	xhci->hcs_params3 = readl(&xhci->cap_regs->hcs_params3);
-	xhci->hci_version = HC_VERSION(readl(&xhci->cap_regs->hc_capbase));
+	xhci->hci_version = FIELD_GET(HC_VERSION, readl(&xhci->cap_regs->hc_capbase));
 	xhci->hcc_params = readl(&xhci->cap_regs->hcc_params);
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
-	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
-	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
+	xhci->max_slots = FIELD_GET(HCS_SLOTS_MASK, hcs_params1);
+	xhci->max_ports = min(FIELD_GET(HCS_MAX_PORTS, hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
 	if (!xhci->max_interrupters)
-		xhci->max_interrupters = min(HCS_MAX_INTRS(hcs_params1), MAX_HC_INTRS);
-	else if (xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
-		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
+		xhci->max_interrupters = min(FIELD_GET(HCS_MAX_INTRS, hcs_params1), MAX_HC_INTRS);
+	else if (xhci->max_interrupters > FIELD_GET(HCS_MAX_INTRS, hcs_params1))
+		xhci->max_interrupters = FIELD_GET(HCS_MAX_INTRS, hcs_params1);
 
 	xhci->quirks |= quirks;
 
-- 
2.50.1


