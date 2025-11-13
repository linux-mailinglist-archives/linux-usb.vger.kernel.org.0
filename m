Return-Path: <linux-usb+bounces-30491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD6C5783C
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 14:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36007353AEF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F90352927;
	Thu, 13 Nov 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpzQDZFz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BB351FB9
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038748; cv=none; b=QzJwSu6UBVVEOu48ZQ+01TDgqVmcOvRL5TgyCtlbUTJAMgJxiedCp5MqLbwqU8Uzw4KMk+0XSNfk3kLeyMeWOZJ3l4cD+8GcrwylqZKihgiD6GP6JchXlvpxSIxxdTBpGYjtP0hQM73GCHpZfsmwY3TPm3mQ9lHl7023j0u95TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038748; c=relaxed/simple;
	bh=t9BXzZzEcxzb5RNLdnb6n8UYpSED3sf0d6FuIW17ej4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyF6MabdnTj8nroyxDchd15fDFl1qDKHW+3Ds0wHKSktljio77D4xtju1mHu+aBAKHFm0owith3rNETLF6WESRSX9I++Xy5Yf68tIqgy9zOMx3VaPt768S5fv/MDCA4qSIHBCDqZQxb4GZ9/fIbeNf7w1XKUDJWmkg+wW1NpExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpzQDZFz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038746; x=1794574746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t9BXzZzEcxzb5RNLdnb6n8UYpSED3sf0d6FuIW17ej4=;
  b=NpzQDZFzjf+JyCdFeKFB17yKmtcCFU1GWjWbDM3p+RNSRg7jX8NliGUk
   2kl3ujpzEF8UIXCZFfgtOIlo4jRwhS2n4g6/Gkxyua6jsgy2fCxhj/DjE
   5zpJbhOLFrwrtA9yLE2lXFJL3XXg3NYKlQzuNFL1ljPjCWf82njbk5Yaz
   N++0DE2w4z0uqyfSTMpVnFMOHRKUemG9pnAeWFEC6HcC+uaWjKfVj52bG
   lTg3cXV++JXw6PgSCiOA4isGX7foee26JvcP2Y28suQOPmvYfMBewcM6D
   zPkbL23EQ2X7RcMSCtEukcexTAbSnVu9lp2a1sahP6fdqi1o6ghq1MjBG
   A==;
X-CSE-ConnectionGUID: upldURhcSb6yoguHIuOMJw==
X-CSE-MsgGUID: gCh0T5qcQ3+zr4d47ToTYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150417"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:06 -0800
X-CSE-ConnectionGUID: WjtZc+agQUq+KpJsztscDw==
X-CSE-MsgGUID: uRyLHV+RRzaxJ2785k45tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673894"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:59:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8B40698; Thu, 13 Nov 2025 13:59:03 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 12/13] usb: xhci: standardize multi bit-field macros
Date: Thu, 13 Nov 2025 13:56:39 +0100
Message-ID: <20251113125640.2875608-13-niklas.neronin@linux.intel.com>
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
v2:
 * Added macro changes to DWC3 driver.

 drivers/usb/dwc3/host.c         |  5 ++--
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
 12 files changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 1c513bf8002e..f4bb5317c2f3 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/bitfield.h>
 
 #include "../host/xhci-port.h"
 #include "../host/xhci-ext-caps.h"
@@ -43,9 +44,9 @@ static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
 			return;
 		}
 
-		op_regs_base = HC_LENGTH(readl(xhci_regs));
+		op_regs_base = FIELD_GET(HC_LENGTH, readl(xhci_regs));
 		reg = readl(xhci_regs + XHCI_HCSPARAMS1);
-		port_num = HCS_MAX_PORTS(reg);
+		port_num = FIELD_GET(HCS_MAX_PORTS, reg);
 
 		for (i = 1; i <= port_num; i++) {
 			offset = op_regs_base + XHCI_PORTSC_BASE + 0x10 * (i - 1);
diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 52153c4a43a8..802a631e271e 100644
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
-#define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
+#define HCC_MAX_PSA		GENMASK(15, 12)
+#define GET_MAX_PSA_SIZE(p)	(1 << (FIELD_GET(HCC_MAX_PSA, (p)) + 1))
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
index 8161fc563200..f75a038c7d8b 100644
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
 static int xhci_ist_microframes(struct xhci_hcd *xhci)
 {
-	int ist = HCS_IST_VALUE(xhci->hcs_params2);
+	int ist = FIELD_GET(HCS_IST_VALUE, xhci->hcs_params2);
 
 	if (xhci->hcs_params2 & HCS_IST_UNIT)
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


