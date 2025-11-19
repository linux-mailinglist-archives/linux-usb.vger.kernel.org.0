Return-Path: <linux-usb+bounces-30708-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7DC6F47E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A6FDB2E413
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A657369224;
	Wed, 19 Nov 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neflvCIY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DDF364021
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562288; cv=none; b=ICxoJNaKXs5+LegwmWfWsvVhPE6Sqx04JjVmfrfK5Ky8UDbLvwWkgokusklsfpcTJhIl+n+DPI18uQxCufQqmLclMdm64JEwVJDARp8fPIQRTgFyeHqB3eV8jOqHtpzda7uyj2kyNMWQBWJI3kt+636epa3giz92EzP4ZFD4mWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562288; c=relaxed/simple;
	bh=jdD3i0GWM15QYAHxSSAAsDOf0wD9EqWb1lhD6eClfUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyRpf+tp91oyguT9fHxM/of5R/a0IZohov9tOuycBvqQNpWiNKkRtpHcDxLwrOa8w4HZE1/NAGmQq7ndEM5Uv7d33gf8ToGlTts4V7bJF3zaZ+DgSZXyQwzWVcNzAhQ8BKCTWF+GEfcQ8T0ElV3R52n2tRgddufi22YaeSYrxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neflvCIY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562287; x=1795098287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jdD3i0GWM15QYAHxSSAAsDOf0wD9EqWb1lhD6eClfUA=;
  b=neflvCIYnwJu2zRzLGmysdpg6gvEnhRqKQzGRm6bMZQspeWzYXhu9cov
   qh+iUM/JFsBRMgXd7DTvArCWS40Q0mnjnpwCNGPGyLFg80jqy4bO/aJvM
   XfEqLxtN7wpPOFD4Ne1YUV3URE8fTjKfQLsFVlZgw0xJq2Kmf2Tik1CZa
   eMA2H8izSroD/71n26H/pE348eXgFZHiGFph4FJpLW5550TJDIrICK1wX
   l/W6w8aBIr7gTOeO04nrqrRlevc8JjPPNE94gypzhAmn01DEzSnzBePci
   mC5+/QgANOuu/MOLliJrY0fJ28g1EtBpyrUMI3hroAtFMZuU4Dcl6ggwf
   w==;
X-CSE-ConnectionGUID: Z72pHCfBTLWFAY8W5KMJ0g==
X-CSE-MsgGUID: VG3GYXdXR3iH9MNv+4bpog==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645521"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:47 -0800
X-CSE-ConnectionGUID: YbKmMGhPRuy4paW12ddGfQ==
X-CSE-MsgGUID: U9UCZd0jRASAs4Zg+FNNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992026"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:45 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/23] usb: xhci: add USB Port Register Set struct
Date: Wed, 19 Nov 2025 16:24:01 +0200
Message-ID: <20251119142417.2820519-8-mathias.nyman@linux.intel.com>
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

Introduce a new struct for the Host Controller USB Port Register Set to
enhance readability and maintainability.

The Host Controller Operational Registers (struct 'xhci_op_regs') span from
offset 0x0 to 0x3FF and consist of fixed fields. Following these fixed
fields are the Host Controller USB Port Register Sets, which are dynamic
and repeat from 1 to MaxPorts, as defined by HCSPARAMS1.

Currently, the struct 'xhci_op_regs' includes:
 __le32 port_status_base;		The first PORTSC
 __le32 port_power_base;		The first PORTPMSC
 __le32 port_link_base;			The first PORTLI
 __le32 reserved5;			The first PORTHLPMC, not reserved
 __le32 reserved6[NUM_PORT_REGS*254];	Port registers 2 to MaxPorts

Replace this with the simpler:
 struct xhci_port_regs port_regs[];	Port registers 1 to MaxPorts

Host Controller USB Port Register Set:
| Offset	| Mnemonic	| Register Name
--------------------------------------------------------------------------
| 0x0		| PORTSC	| Port Status and Control
| 0x4		| PORTPMSC	| Port Power Management Status and Control
| 0x8		| PORTLI	| Port Link Info
| 0xC		| PORTHLPMC	| Port Hardware LPM Control

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  3 +--
 drivers/usb/host/xhci.h     | 36 ++++++++++++++++--------------------
 2 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 6e5b6057de79..ea3cfc229cd0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2201,8 +2201,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		return -ENOMEM;
 
 	for (i = 0; i < num_ports; i++) {
-		xhci->hw_ports[i].addr = &xhci->op_regs->port_status_base +
-			NUM_PORT_REGS * i;
+		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i].portsc;
 		xhci->hw_ports[i].hw_portnum = i;
 
 		init_completion(&xhci->hw_ports[i].rexit_done);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index bddf9c15d813..d3ba50462589 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -66,14 +66,25 @@ struct xhci_cap_regs {
 	/* Reserved up to (CAPLENGTH - 0x1C) */
 };
 
-/* Number of registers per port */
-#define	NUM_PORT_REGS	4
-
 #define PORTSC		0
 #define PORTPMSC	1
 #define PORTLI		2
 #define PORTHLPMC	3
 
+/*
+ * struct xhci_port_regs - Host Controller USB Port Register Set. xHCI spec 5.4.8
+ * @portsc:	Port Status and Control
+ * @portpmsc:	Port Power Management Status and Control
+ * @portli:	Port Link Info
+ * @porthlmpc:	Port Hardware LPM Control
+ */
+struct xhci_port_regs {
+	__le32	portsc;
+	__le32	portpmsc;
+	__le32	portli;
+	__le32	porthlmpc;
+};
+
 /**
  * struct xhci_op_regs - xHCI Host Controller Operational Registers.
  * @command:		USBCMD - xHC command register
@@ -85,16 +96,7 @@ struct xhci_cap_regs {
  * @cmd_ring:		CRP - 64-bit Command Ring Pointer
  * @dcbaa_ptr:		DCBAAP - 64-bit Device Context Base Address Array Pointer
  * @config_reg:		CONFIG - Configure Register
- * @port_status_base:	PORTSCn - base address for Port Status and Control
- * 			Each port has a Port Status and Control register,
- * 			followed by a Port Power Management Status and Control
- * 			register, a Port Link Info register, and a reserved
- * 			register.
- * @port_power_base:	PORTPMSCn - base address for
- * 			Port Power Management Status and Control
- * @port_link_base:	PORTLIn - base address for Port Link Info (current
- * 			Link PM state and control) for USB 2.1 and USB 3.0
- * 			devices.
+ * @port_regs:		Port Register Sets, from 1 to MaxPorts (defined by HCSPARAMS1).
  */
 struct xhci_op_regs {
 	__le32	command;
@@ -110,13 +112,7 @@ struct xhci_op_regs {
 	__le32	config_reg;
 	/* rsvd: offset 0x3C-3FF */
 	__le32	reserved4[241];
-	/* port 1 registers, which serve as a base address for other ports */
-	__le32	port_status_base;
-	__le32	port_power_base;
-	__le32	port_link_base;
-	__le32	reserved5;
-	/* registers for ports 2-255 */
-	__le32	reserved6[NUM_PORT_REGS*254];
+	struct xhci_port_regs port_regs[];
 };
 
 /* USBCMD - USB command - command bitmasks */
-- 
2.43.0


