Return-Path: <linux-usb+bounces-29781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC7C15207
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067621B22595
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B002EB10;
	Tue, 28 Oct 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPHr7m4i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1002E9EAE
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660807; cv=none; b=pETEE3BD5GA3zJGr4qVrzm/oFF/ICoDqdDFVItrFkwuVPTpz/dOeinNjaLGtHm7aAmr49Zo3FXQXhOg/4XS2Z6/AMTjbl7teXFdtTLYyKrIupTsDJeW3OYgdZgJRTu5P3UJYnWzSBbOs9f5HMm1dDGsf6OsNeMzxOhhfLYA9E2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660807; c=relaxed/simple;
	bh=xGJRbd4xU0BPyYeZSUxIl/vgyqwZJKe5xt6S1tWeRYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCrEmSdf3iXoOZFXuGfnH4bHZ1bn3iubcW98Kk/d9OYe8LhkUbhQsKlJx5vHTwEc+PJTefagfEatRlaEin95eXQR08kvQtDTEYT8TbHX+SJ8hkbBqwSnJRXLz+b0coh9X3z6xEF6cPA32Cs4hGDi8p1aNqZ23/g+SH9lkXvoqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPHr7m4i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761660805; x=1793196805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xGJRbd4xU0BPyYeZSUxIl/vgyqwZJKe5xt6S1tWeRYI=;
  b=KPHr7m4igqLdiie8vCXw1utkYjKFJhcdZ1moKBqPF6gTyzr7ZkLvvksE
   m101s87O9nIG1W2wnWxaYUy05LCRMMARpogWS64R22HIQc731MkvWmJYq
   3QclF5sIXHWQl+Q7+EZ+eCB7jvMu8h21VXOJzSwHuEWDe0cXp0YxM2V82
   E83SrTnxau76SEt+lQaREi6Z/CQtvXAAhI5dPnDhePv/R9JDPaSwXOOj2
   zANlQUwpaeRxE51I4MLXrEhEHldSNhPHeiXK3QXmpLbtY9yjJmfgES1LL
   rlQAj2+fP3+AXEXy1G4IH2dybRbxpUAbKkr1PTtw2k7P0CyJgKGUfHUWT
   A==;
X-CSE-ConnectionGUID: e0VS0Kk0SVe2mNF6wQX4jQ==
X-CSE-MsgGUID: t0rvQC9ZSOKReSOj0/gyew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74435733"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74435733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:13:24 -0700
X-CSE-ConnectionGUID: RmPLWVlPTvCzp7HjHMbpvQ==
X-CSE-MsgGUID: iJK9BxuqRnGAMOmxSyno8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184593926"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2025 07:13:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0EC8195; Tue, 28 Oct 2025 15:13:22 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v3 1/5] usb: xhci: rework xhci_decode_portsc()
Date: Tue, 28 Oct 2025 15:12:38 +0100
Message-ID: <20251028141244.2909808-2-niklas.neronin@linux.intel.com>
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

Rework xhci_decode_portsc(), which is used for PORTSC tracing, to make
the output more compact and general.

The function now first prints the multi-bit fields (port speed and link
state), followed by the abbreviated names of each individual bit as
defined in the xHCI specification. This reduces message length and makes
the output easier to read.

This change prepares for upcoming patches that will trace all PORTSC
writes, requiring the same decoding logic to handle both reads and writes.
This is particularly important for Read-Write-1-to-Clear (RW1C) bits,
where the semantics differ between read and write operations. For
example, when reading the Port Enabled bit, a set bit means the port is
enabled; when writing, a set bit indicates the port is being disabled.

The decoder now also includes the following fields:
 Port Link State Write Strobe (LWS)
 Device Removable (DR)
 Warm Port Reset (WPR)

==== Examples Traces ====

Before:
0x00201201 Powered Connected Disabled Link:U0 PortSpeed:4 Change: PRC Wake:
0x0a0002a0 Powered Not-connected Disabled Link:RxDetect PortSpeed:0 \
 Change: Wake: WCE WOE

After:
0x00201201 Speed=4 Link=U0 CCS PP PRC
0x0a0002a0 Speed=0 Link=RxDetect PP WCE WOE

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v3:
 * Further simplified and generalized xhci_decode_portsc().

 drivers/usb/host/xhci.h | 59 +++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58a51f09cceb..8e1311f90fdb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2399,25 +2399,48 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	if (portsc == ~(u32)0)
 		return str;
 
-	ret += sprintf(str + ret, "%s %s %s Link:%s PortSpeed:%d ",
-		      portsc & PORT_POWER	? "Powered" : "Powered-off",
-		      portsc & PORT_CONNECT	? "Connected" : "Not-connected",
-		      portsc & PORT_PE		? "Enabled" : "Disabled",
-		      xhci_portsc_link_state_string(portsc),
-		      DEV_PORT_SPEED(portsc));
+	ret += sprintf(str + ret, "Speed=%d ", DEV_PORT_SPEED(portsc));
+	ret += sprintf(str + ret, "Link=%s ", xhci_portsc_link_state_string(portsc));
 
+	/* RO/ROS: Read-only */
+	if (portsc & PORT_CONNECT)
+		ret += sprintf(str + ret, "CCS ");
 	if (portsc & PORT_OC)
-		ret += sprintf(str + ret, "OverCurrent ");
-	if (portsc & PORT_RESET)
-		ret += sprintf(str + ret, "In-Reset ");
+		ret += sprintf(str + ret, "OCA "); /* No set for USB2 ports */
+	if (portsc & PORT_CAS)
+		ret += sprintf(str + ret, "CAS ");
+	if (portsc & PORT_DEV_REMOVE)
+		ret += sprintf(str + ret, "DR ");
 
-	ret += sprintf(str + ret, "Change: ");
+	/* RWS; writing 1 sets the bit, writing 0 clears the bit. */
+	if (portsc & PORT_POWER)
+		ret += sprintf(str + ret, "PP ");
+	if (portsc & PORT_WKCONN_E)
+		ret += sprintf(str + ret, "WCE ");
+	if (portsc & PORT_WKDISC_E)
+		ret += sprintf(str + ret, "WDE ");
+	if (portsc & PORT_WKOC_E)
+		ret += sprintf(str + ret, "WOE ");
+
+	/* RW; writing 1 sets the bit, writing 0 clears the bit */
+	if (portsc & PORT_LINK_STROBE)
+		ret += sprintf(str + ret, "LWS "); /* LWS 0 write is ignored */
+
+	/* RW1S; writing 1 sets the bit, writing 0 has no effect */
+	if (portsc & PORT_RESET)
+		ret += sprintf(str + ret, "PR ");
+	if (portsc & PORT_WR)
+		ret += sprintf(str + ret, "WPR "); /* RsvdZ for USB2 ports */
+
+	/* RW1CS; writing 1 clears the bit, writing 0 has no effect. */
+	if (portsc & PORT_PE)
+		ret += sprintf(str + ret, "PED ");
 	if (portsc & PORT_CSC)
 		ret += sprintf(str + ret, "CSC ");
 	if (portsc & PORT_PEC)
-		ret += sprintf(str + ret, "PEC ");
+		ret += sprintf(str + ret, "PEC "); /* No set for USB3 ports */
 	if (portsc & PORT_WRC)
-		ret += sprintf(str + ret, "WRC ");
+		ret += sprintf(str + ret, "WRC "); /* RsvdZ for USB2 ports */
 	if (portsc & PORT_OCC)
 		ret += sprintf(str + ret, "OCC ");
 	if (portsc & PORT_RC)
@@ -2425,17 +2448,7 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	if (portsc & PORT_PLC)
 		ret += sprintf(str + ret, "PLC ");
 	if (portsc & PORT_CEC)
-		ret += sprintf(str + ret, "CEC ");
-	if (portsc & PORT_CAS)
-		ret += sprintf(str + ret, "CAS ");
-
-	ret += sprintf(str + ret, "Wake: ");
-	if (portsc & PORT_WKCONN_E)
-		ret += sprintf(str + ret, "WCE ");
-	if (portsc & PORT_WKDISC_E)
-		ret += sprintf(str + ret, "WDE ");
-	if (portsc & PORT_WKOC_E)
-		ret += sprintf(str + ret, "WOE ");
+		ret += sprintf(str + ret, "CEC "); /* RsvdZ for USB2 ports */
 
 	return str;
 }
-- 
2.50.1


