Return-Path: <linux-usb+bounces-30290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EDC47837
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76D2A3BEFD9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3D123A58B;
	Mon, 10 Nov 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/XLgjPl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B2831BC90
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787718; cv=none; b=BAY9r+vJEyeh32/p/JH48zQT6GRdDMMsd2M5CCa9dRRKZh1uIs64XV6wKsr6QtIdakhuNSKZRn2x5C8lglbcHXWvlgI1Qwvx1v6sSa3DpPR2lyEbqiXGgqOVEMszLFKcl7iSiR9Nk2S/O8+dMb9JLi6s9Ys9b5dc4UZjLR33Mu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787718; c=relaxed/simple;
	bh=N12cmv/mOsCV9Hff6gdQCo6RzosiUwxBU/0VmpKCrmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4E7bgjeK8tKZeojVbL4OZRQeGc24pMvzsjQ8klpaHz8V4oIKq9JhbZfLQSyZ3CuAGHldlWHnfsXcuo/CQpzHuBKRqGAc4zXVCrjSG3Uw9bGTiLYYcCZuXH+mazORQqsdBvLc7rednftoz1wAmnhz402GCfw735/5kw4CFWKhew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/XLgjPl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787716; x=1794323716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N12cmv/mOsCV9Hff6gdQCo6RzosiUwxBU/0VmpKCrmA=;
  b=T/XLgjPlmWmkCUFYZ9UkLD2mfJTwDAdx3d2GkOQqnatb1MIgVo2HdUBb
   7J26uuAyP19mLCADZkMtvVSD2YAUxUtI+crT6QB9LCyEXp+TryC8k55jt
   VwP8Lk2RtIJthwFHVj2fRMFMGbe4xYrImXfFkVJMZO+G3BJJx2fM6jNfF
   9mPGdNfbLohRr23CSuB50dh7n+g+8iU13j1PSTYUiVWU74w6aKyT+QSAw
   vHOxYDrkWm0/Dpmin2y90AEqj5ametj7X7cXSEja0JG2ENXwIAf8X7fbj
   2kRF60HdBcIQrYRxfyHPYcZO7zSNKeRfG3z6MR8xkeToVWIuWi4oqiPXn
   w==;
X-CSE-ConnectionGUID: ElzLclbyTWCsU525g+GfWQ==
X-CSE-MsgGUID: 8SxEUlmmRg+mL9ccybihhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64767775"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64767775"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:16 -0800
X-CSE-ConnectionGUID: JJend55aQv+hVgWVLcenbA==
X-CSE-MsgGUID: qVt/1UetSUmEd9wzTx5CnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219353899"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 07:15:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 6A7C095; Mon, 10 Nov 2025 16:15:14 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 05/13] usb: xhci: limit number of ports to 127
Date: Mon, 10 Nov 2025 16:14:42 +0100
Message-ID: <20251110151450.635410-6-niklas.neronin@linux.intel.com>
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

The xHCI driver allocates various port-related structures based on the
maximum number of ports reported by the controller. The Number of Ports
(MaxPorts) field occupies bits 31:24 of the HCSPARAMS1 register and can
represent values up to 255. However, the 'HCS_MAX_PORTS()' macro currently
reads bits 30:24, effectively limiting the maximum to 127.

Fixing the macro increases the reported port limit to 255, which in turn
increases memory usage regardless of how many ports are actually used.

To maintain compatibility and control memory consumption, set
'xhci->max_ports' to the minimum of the value read from 'HCS_MAX_PORTS()'
and 127 (MAX_HC_PORTS). This preserves the existing limit while making
the restriction explicit and easier to adjust in the future.

Summary:
 * Port allocations are now limited to 127.
 * HC max ports macro now correctly reads the MaxPorts value.
 * Macro 'MAX_HC_PORTS' can be modified to set the port limit.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 ++--
 drivers/usb/host/xhci.c      | 2 +-
 drivers/usb/host/xhci.h      | 5 ++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 89bc83e4f1eb..8390c969389e 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -12,8 +12,8 @@
 #define HCS_SLOTS_MASK		0xff
 /* bits 8:18, Max Interrupters */
 #define HCS_MAX_INTRS(p)	(((p) >> 8) & 0x7ff)
-/* bits 24:31, Max Ports - max value is 0x7F = 127 ports */
-#define HCS_MAX_PORTS(p)	(((p) >> 24) & 0x7f)
+/* bits 31:24, Max Ports - max value is 255 */
+#define HCS_MAX_PORTS(p)	(((p) >> 24) & 0xff)
 
 /* HCSPARAMS2 - hcs_params2 - bitmasks */
 /* bits 0:3, frames or uframes that SW needs to queue transactions
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d74f47a75c68..5eb3ea0d9e15 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5436,7 +5436,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
 	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
-	xhci->max_ports = HCS_MAX_PORTS(hcs_params1);
+	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
 	if ((!xhci->max_interrupters) || xhci->max_interrupters > HCS_MAX_INTRS(hcs_params1))
 		xhci->max_interrupters = HCS_MAX_INTRS(hcs_params1);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index acf52112ab4c..e68bf547f90b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -34,7 +34,10 @@
 
 /* Max number of USB devices for any host controller - limit in section 6.1 */
 #define MAX_HC_SLOTS		256
-/* Section 5.3.3 - MaxPorts */
+/*
+ * Max Number of Ports. xHCI specification section 5.3.3
+ * Valid values are in the range of 1 to 255.
+ */
 #define MAX_HC_PORTS		127
 
 /*
-- 
2.50.1


