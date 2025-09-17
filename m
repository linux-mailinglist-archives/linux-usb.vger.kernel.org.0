Return-Path: <linux-usb+bounces-28218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D0B7EFFD
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69CF83AFCE5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E19E328998;
	Wed, 17 Sep 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxpIaxsx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDB32E73E
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113947; cv=none; b=uhUN6Y/L/AcHHH4tYnsmlgd/wFR+b5sUX6CP6hcrnqoZlgUiehn0Qp6/f/JvHi8HHSFCoZlGC55lRckl2Bz01mWqE8//tvxLFxOIzP6lSioy58I9b2n39aS6601tlzFnzNrAau9V+KAHVeej9J/0T8adrlVQwWS4pmD5BBi9JAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113947; c=relaxed/simple;
	bh=k0QFXOY0c/+HQ5ppiIuAZGot0IIBcZafdYta+QP7wno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iW0vJQCUs3Wzcqy3aEPevxOUJy2/ffq0ll2kyHWSSns9JjmQdOXxpBz2LawmCjkwwC/DMtlVHPjQJ7Yq+C0Gf44qu++EeJFSpTU/4rOTAVu8lSQ/nt9P6fpKkmva58wZa0LasoftIUYbAisviGQBC37kn7xkGAstUarKFglFfLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxpIaxsx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113946; x=1789649946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k0QFXOY0c/+HQ5ppiIuAZGot0IIBcZafdYta+QP7wno=;
  b=kxpIaxsx8FZF/8TReMJw32m//7hGwFsKs5IuAazfdU8uiltlPJ6Kne+L
   kVL4BjYvBaOC4cTVh+Pk/dZCmnqh0ce2qSRbPTIDjm69XXzN93rkkEhYQ
   0kwIAGAsP67769jUitINm1xv88gR4FjqiGubpoZKnk9i3ZuIq6mRPRR48
   5Kvx9leILoO1T6yyBavhdxxMhHoWeG+8aBAczH2slmL1DmbgBS2XwcUgd
   rM0qS07TYDG1A0lRvsEm4YjpDxxYonNYo2WFDFTexMhCPSq1fcmMaQEzV
   K5/NmRyrm9TqRDetX1nostNec30lTvEetLkZBOaCYTM8Z2etCciVGFaIm
   g==;
X-CSE-ConnectionGUID: 42q/CTm7QKKL3kVHtJMelA==
X-CSE-MsgGUID: NlSU0pDCTwaZFkPW+tuHdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60527418"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60527418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:06 -0700
X-CSE-ConnectionGUID: lIiMRckuSKWI58khSWUVxQ==
X-CSE-MsgGUID: mKkCpGjSRAyd/ajXi7iMmA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 05:59:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 42E2297; Wed, 17 Sep 2025 14:59:04 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 6/8] usb: xhci: add USB Port Register Set struct
Date: Wed, 17 Sep 2025 14:58:47 +0200
Message-ID: <20250917125850.3380560-7-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
References: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
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
index c4a6544aa107..5d5b7ae978c0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2204,8 +2204,7 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		return -ENOMEM;
 
 	for (i = 0; i < num_ports; i++) {
-		xhci->hw_ports[i].addr = &xhci->op_regs->port_status_base +
-			NUM_PORT_REGS * i;
+		xhci->hw_ports[i].addr = &xhci->op_regs->port_regs[i].portsc;
 		xhci->hw_ports[i].hw_portnum = i;
 
 		init_completion(&xhci->hw_ports[i].rexit_done);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5d9551887c29..67ea03b20bee 100644
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


