Return-Path: <linux-usb+bounces-29784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39154C151AC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E429E4FC29C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D033439C;
	Tue, 28 Oct 2025 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhHzW5Fx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45C2FFDC2
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660808; cv=none; b=cBRbnxRFHfd9vr4q9pRHcJPNpVzIuX9VrITcBkzamATzX1EEncNexzXrcDQFXO9iPHsm5w6wVKrBRlMddqfqtbMfEOGdQdnkRujUzXbUhNFDHtvYWctvybkY9s+enKSeniFKbGxeHQPZ52E6hIcMX19VQZwXyITMZ82IkJ/C/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660808; c=relaxed/simple;
	bh=WwGqTL53pWfsGrK53HFpPCgSc1+OO3uIFY3zRc9CcYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGSfWjuIdPjKyG+VNsxhMjwmTB8yEPLV8pEFyb5T8VYuPDu1Avq4FikgNrK9bxi0RIblS8C35Rg46rLfbWLioBhmv+OxC0BUxh6mNHKMTDu2mdG1T9EF3l1ryN4Ffb4HpSumiOzkqWkrsee83jYdcb6XZqd6Nw9w2oVKtYVYweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhHzW5Fx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761660807; x=1793196807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WwGqTL53pWfsGrK53HFpPCgSc1+OO3uIFY3zRc9CcYM=;
  b=mhHzW5FxmbIM3FjpgMqCUDJWI74T4eDk5JLzi25Rnh4oPjsLeTAe4adW
   lDedCZ7QKZhzWxDALPCNbM/AXcL0ZG/2G0ZBUqcb0/NHrPYwfEWpH44RF
   t6C06F07//VrKuybtx3aPoZ/Bvf+2ENqaBjivrFc81RCqhx3nnv2Qp/xs
   4ZxLIRtXg5unJIBMIV/+HG4oCSv9THr5F8LB+crR8+topbVEpt2RcCOua
   HJhP26g4voZmgDs7OP7DwSBMqvde/urXXQFgiqqJCKH2XhNHT15dCQhSY
   gSu5lFZcIOKVBn6zWG+hx0uWfONNZvw4Al/LTk1tDtYBYNaiwCW0eIKcg
   A==;
X-CSE-ConnectionGUID: fy9tIpLRRVWS3vqDD3hDcA==
X-CSE-MsgGUID: 2guJCKknRZO8o0LlHiFhag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63855775"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63855775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:13:27 -0700
X-CSE-ConnectionGUID: DJ8WSP7NShmqYR6RwhyP+w==
X-CSE-MsgGUID: D+SahqZQS7C+Suqqm/PR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184984641"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 07:13:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8353195; Tue, 28 Oct 2025 15:13:24 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v3 4/5] usb: xhci: add USB Port Register Set struct
Date: Tue, 28 Oct 2025 15:12:41 +0100
Message-ID: <20251028141244.2909808-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028141244.2909808-1-niklas.neronin@linux.intel.com>
References: <20251028141244.2909808-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.50.1


