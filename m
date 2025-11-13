Return-Path: <linux-usb+bounces-30487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA966C57816
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 844BB4E1544
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0E6351FA9;
	Thu, 13 Nov 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZDhW4JR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DAC350A07
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038744; cv=none; b=NdfHw4LNr7T7X6TuRo5cEFfQeBvOFCs/I0uxaSLPeJYmIPk3i2nrYKk2cl/5ZULcfgee+HNelUKrn6X5XNoIaWSry01PY6qQ6pKATkPZ392YZyMgeTRK3C7dZPIXAFKKc0IUnirWsA5LhHgi/su5YcRI7TVk86IfFOnK7x2k3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038744; c=relaxed/simple;
	bh=ZkaqNfVGZizwDzbVydd+dCuq7f/FN6PCNI/Dvf8zqhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqM5Tv1+/6n9+o9ePCL0LXGvBKQk8DScyp1TyjBfyKdDOrNXajCPM30AsHjZ4r6jYQwR/kGJImngNSSN82qm0YmcVCBZjl9CxzAYNkdKwxUsvyoMM+bOqXOZIUWId3/Gd3gIScbBI06FvhaCbnR2rouFjYsgqVfV3GQF0hymBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZDhW4JR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038742; x=1794574742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkaqNfVGZizwDzbVydd+dCuq7f/FN6PCNI/Dvf8zqhI=;
  b=BZDhW4JRcrueOw2WoQNXHedYqVicpoS6dlVDTJGAnqOCq3nXQTERY5pV
   BSXUILrm7AN5Q3dDY+I/RfkV+0EI1AFjdKAHDJ3BIZIiqTrlSNhr7xrNz
   wiOFXtheDDKpstrm/3AAqF03JL55yQFFgH5O7A0adAFZw4QazzZxHoj0h
   n45Lt0OJT07t58BhYq+fzbFwVg1er0Fx3wbMfgGLDnw8r845G8FOAahoJ
   Djt17pTOLicJmYoe5qAQZBFGn/L0+1whkr3WXpqLHWP9KZla53FAhXW6u
   hlucp7Jw4aaUGjmbBUncFfDbcv21oPULMnLNi+dKBVnZusZkZJVp36WC8
   g==;
X-CSE-ConnectionGUID: DBjhAiqBSEe4gvgatpIILQ==
X-CSE-MsgGUID: UuJfPmuhT/KmTTS/8MTfyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150403"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:00 -0800
X-CSE-ConnectionGUID: kC1j7XsfTHOSTvzasuR5qw==
X-CSE-MsgGUID: /e3GmIXeS32DA/Q0HRjJ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673835"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 2B3869B; Thu, 13 Nov 2025 13:58:58 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 07/13] usb: xhci: improve xhci-caps.h comments
Date: Thu, 13 Nov 2025 13:56:34 +0100
Message-ID: <20251113125640.2875608-8-niklas.neronin@linux.intel.com>
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

No functional changes.

This patch updates comments in xhci-caps.h for better readability and
consistency. Each Capability Register bit field now includes a brief
description of its name and valid range, following a uniform comment
format across the file.

These updates are based on the xHCI specification, revision 1.2.

Bit field comment format:
/* <bit range> - <Field name>,<noteworthy information if any> */

Why print the bit range?
 The bit range aids in identifying missing macros and reserved bit ranges.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 100 ++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index 8390c969389e..8a435786f950 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -1,93 +1,107 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xHCI Host Controller Capability Registers.
+ * xHCI Specification Section 5.3, Revision 1.2.
+ */
 
-/* hc_capbase bitmasks */
-/* bits 7:0 - how long is the Capabilities register */
+/* hc_capbase - bitmasks */
+/* bits 7:0 - Capability Registers Length */
 #define HC_LENGTH(p)		XHCI_HC_LENGTH(p)
-/* bits 31:16	*/
+/* bits 15:8 - Rsvd */
+/* bits 31:16 - Host Controller Interface Version Number */
 #define HC_VERSION(p)		(((p) >> 16) & 0xffff)
 
 /* HCSPARAMS1 - hcs_params1 - bitmasks */
-/* bits 0:7, Max Device Slots */
+/* bits 7:0 - Number of Device Slots */
 #define HCS_MAX_SLOTS(p)	(((p) >> 0) & 0xff)
 #define HCS_SLOTS_MASK		0xff
-/* bits 8:18, Max Interrupters */
+/* bits 18:8 - Number of Interrupters, max values is 1024 */
 #define HCS_MAX_INTRS(p)	(((p) >> 8) & 0x7ff)
 /* bits 31:24, Max Ports - max value is 255 */
 #define HCS_MAX_PORTS(p)	(((p) >> 24) & 0xff)
 
 /* HCSPARAMS2 - hcs_params2 - bitmasks */
-/* bits 0:3, frames or uframes that SW needs to queue transactions
- * ahead of the HW to meet periodic deadlines */
+/*
+ * bits 3:0 - Isochronous Scheduling Threshold, frames or uframes that SW
+ * needs to queue transactions ahead of the HW to meet periodic deadlines.
+ */
 #define HCS_IST(p)		(((p) >> 0) & 0xf)
-/* bits 4:7, max number of Event Ring segments */
+/* bits 7:4 - Event Ring Segment Table Max, 2^(n) */
 #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
-/* bits 21:25 Hi 5 bits of Scratchpad buffers SW must allocate for the HW */
-/* bit 26 Scratchpad restore - for save/restore HW state - not used yet */
-/* bits 27:31 Lo 5 bits of Scratchpad buffers SW must allocate for the HW */
+/* bits 20:8 - Rsvd */
+/* bits 25:21 - Max Scratchpad Buffers (Hi), 5 Most significant bits */
+/* bit 26 - Scratchpad restore, for save/restore HW state */
+/* bits 31:27 - Max Scratchpad Buffers (Lo), 5 Least significant bits */
 #define HCS_MAX_SCRATCHPAD(p)   ((((p) >> 16) & 0x3e0) | (((p) >> 27) & 0x1f))
 
 /* HCSPARAMS3 - hcs_params3 - bitmasks */
-/* bits 0:7, Max U1 to U0 latency for the roothub ports */
+/* bits 7:0 - U1 Device Exit Latency, Max U1 to U0 latency for the roothub ports */
 #define HCS_U1_LATENCY(p)	(((p) >> 0) & 0xff)
-/* bits 16:31, Max U2 to U0 latency for the roothub ports */
+/* bits 15:8 - Rsvd */
+/* bits 31:16 - U2 Device Exit Latency, Max U2 to U0 latency for the roothub ports */
 #define HCS_U2_LATENCY(p)	(((p) >> 16) & 0xffff)
 
-/* HCCPARAMS - hcc_params - bitmasks */
-/* true: HC can use 64-bit address pointers */
+/* HCCPARAMS1 - hcc_params - bitmasks */
+/* bit 0 - 64-bit Addressing Capability */
 #define HCC_64BIT_ADDR(p)	((p) & (1 << 0))
-/* true: HC can do bandwidth negotiation */
+/* bit 1 - BW Negotiation Capability */
 #define HCC_BANDWIDTH_NEG(p)	((p) & (1 << 1))
-/* true: HC uses 64-byte Device Context structures
- * FIXME 64-byte context structures aren't supported yet.
- */
+/* bit 2 - Context Size */
 #define HCC_64BYTE_CONTEXT(p)	((p) & (1 << 2))
-/* true: HC has port power switches */
+#define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
+/* bit 3 - Port Power Control */
 #define HCC_PPC(p)		((p) & (1 << 3))
-/* true: HC has port indicators */
+/* bit 4 - Port Indicators */
 #define HCS_INDICATOR(p)	((p) & (1 << 4))
-/* true: HC has Light HC Reset Capability */
+/* bit 5 - Light HC Reset Capability */
 #define HCC_LIGHT_RESET(p)	((p) & (1 << 5))
-/* true: HC supports latency tolerance messaging */
+/* bit 6 - Latency Tolerance Messaging Capability */
 #define HCC_LTC(p)		((p) & (1 << 6))
-/* true: no secondary Stream ID Support */
+/* bit 7 - No Secondary Stream ID Support */
 #define HCC_NSS(p)		((p) & (1 << 7))
-/* true: HC supports Stopped - Short Packet */
+/* bit 8 - Parse All Event Data */
+/* bit 9 - Short Packet Capability */
 #define HCC_SPC(p)		((p) & (1 << 9))
-/* true: HC has Contiguous Frame ID Capability */
+/* bit 10 - Stopped EDTLA Capability */
+/* bit 11 - Contiguous Frame ID Capability */
 #define HCC_CFC(p)		((p) & (1 << 11))
-/* Max size for Primary Stream Arrays - 2^(n+1), where n is bits 12:15 */
+/* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
 #define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
-/* Extended Capabilities pointer from PCI base - section 5.3.6 */
+/* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
 #define HCC_EXT_CAPS(p)		XHCI_HCC_EXT_CAPS(p)
 
-#define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
-
-/* db_off bitmask - bits 31:2 Doorbell Array Offset */
+/* DBOFF - db_off - bitmasks */
+/* bits 1:0 - Rsvd */
+/* bits 31:2 - Doorbell Array Offset */
 #define	DBOFF_MASK	(0xfffffffc)
 
-/* run_regs_off bitmask - bits 0:4 reserved */
+/* RTSOFF - run_regs_off - bitmasks */
+/* bits 4:0 - Rsvd */
+/* bits 31:5 - Runtime Register Space Offse */
 #define	RTSOFF_MASK	(~0x1f)
 
 /* HCCPARAMS2 - hcc_params2 - bitmasks */
-/* true: HC supports U3 entry Capability */
+/* bit 0 - U3 Entry Capability */
 #define	HCC2_U3C(p)		((p) & (1 << 0))
-/* true: HC supports Configure endpoint command Max exit latency too large */
+/* bit 1 - Configure Endpoint Command Max Exit Latency Too Large Capability */
 #define	HCC2_CMC(p)		((p) & (1 << 1))
-/* true: HC supports Force Save context Capability */
+/* bit 2 - Force Save Context Capabilitu */
 #define	HCC2_FSC(p)		((p) & (1 << 2))
-/* true: HC supports Compliance Transition Capability */
+/* bit 3 - Compliance Transition Capability, false: compliance is enabled by default */
 #define	HCC2_CTC(p)		((p) & (1 << 3))
-/* true: HC support Large ESIT payload Capability > 48k */
+/* bit 4 - Large ESIT Payload Capability, true: HC support ESIT payload > 48k */
 #define	HCC2_LEC(p)		((p) & (1 << 4))
-/* true: HC support Configuration Information Capability */
+/* bit 5 - Configuration Information Capability */
 #define	HCC2_CIC(p)		((p) & (1 << 5))
-/* true: HC support Extended TBC Capability, Isoc burst count > 65535 */
+/* bit 6 - Extended TBC Capability, true: Isoc burst count > 65535 */
 #define	HCC2_ETC(p)		((p) & (1 << 6))
-/* true: HC support Extended TBC TRB Status Capability */
+/* bit 7 - Extended TBC TRB Status Capability */
 #define HCC2_ETC_TSC(p)         ((p) & (1 << 7))
-/* true: HC support Get/Set Extended Property Capability */
+/* bit 8 - Get/Set Extended Property Capability */
 #define HCC2_GSC(p)             ((p) & (1 << 8))
-/* true: HC support Virtualization Based Trusted I/O Capability */
+/* bit 9 - Virtualization Based Trusted I/O Capability */
 #define HCC2_VTC(p)             ((p) & (1 << 9))
-/* true: HC support Double BW on a eUSB2 HS ISOC EP */
+/* bit 10 - Rsvd */
+/* bit 11 - HC support Double BW on a eUSB2 HS ISOC EP */
 #define HCC2_EUSB2_DIC(p)       ((p) & (1 << 11))
+/* bits 31:12 - Rsvd */
-- 
2.50.1


