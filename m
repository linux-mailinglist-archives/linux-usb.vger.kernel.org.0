Return-Path: <linux-usb+bounces-30292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897DC47813
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 16:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A9AC4F4E55
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3B72459C9;
	Mon, 10 Nov 2025 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJIWo9VQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A1150997
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787719; cv=none; b=HJw+cxVfOHjISvWTKJRkGaEyxHfia9G8cVlhanHw7nwBDKqRdZHqWZpC/KDC834n0PyBVWOySBqKqgUcWy9pjNe/BgLAH8E+o/hbkBwbXCDibN/WjdDZJKXrjA1pzAjFD/jHXEYXjeER8QSZ9BZux+weqd0o9aoISsdZx+HYBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787719; c=relaxed/simple;
	bh=ZkaqNfVGZizwDzbVydd+dCuq7f/FN6PCNI/Dvf8zqhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEXecvdeulZaedBBsj1TYFr+sOp11ia1YiscArauvKW5S63ym5qLJw3/zq+k6L29ld1FKJ6skUBXgoie0Hlr4WYtmyXwh53L9glPVvt1gKW9azFCJ2P+qpx7wRULl+tfq/GcsSGR8BraA4wy2JCRVQBjUyHBxf3Gh6gFhkBStfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJIWo9VQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787718; x=1794323718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZkaqNfVGZizwDzbVydd+dCuq7f/FN6PCNI/Dvf8zqhI=;
  b=HJIWo9VQt8EPDITcCAw1QC0a+qAgETVsBRxnOEd5PDiyXk+ocuDxoPO7
   faT93kA+4pwAABQtQv/bQfiBWnj/ZDWHtQqniYu9UPE90rn35++BXV+CU
   CXb4wCU656pNrxOgeEfmO//l/hAeS1mT/XjtJqDrZ/eLjhGEUcJqLJWg1
   lx1Vdqh0RcvdX6nWFK2IHYH8NtGpEakZpPi0PJkMx7p3T+qRTdnngGq4+
   cgswehJwCUAGcG3p6ehqpWg6GMdoGoppXEi2Isdi4NoHMHTPi3BqKKQUG
   4Xs9fSbbVivbvuEFq0HyGBJil7iitPj8VFHAQnY7hu7POHSSC9g71zW43
   g==;
X-CSE-ConnectionGUID: olTE1GW+TYeELyQdwF9tHA==
X-CSE-MsgGUID: 5nrPE7/NSRyUkTrVICu+KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64767780"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64767780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:15:18 -0800
X-CSE-ConnectionGUID: sHcavDHfSU2kkgzcf5jHwQ==
X-CSE-MsgGUID: rhhQgm4xSnKkiN9ijC+Hqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219353903"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 07:15:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 21A8095; Mon, 10 Nov 2025 16:15:16 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 07/13] usb: xhci: improve xhci-caps.h comments
Date: Mon, 10 Nov 2025 16:14:44 +0100
Message-ID: <20251110151450.635410-8-niklas.neronin@linux.intel.com>
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


