Return-Path: <linux-usb+bounces-30705-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D6407C6F47B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A2C4729F4E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28197369205;
	Wed, 19 Nov 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uva8GhfY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7994368273
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562283; cv=none; b=m93puqwpUMuqOSYgBpZeXdKKz822QQEDK8l+LiGMk8XpDYctmKWWMxOJd1RrtKNPb40s8QysF62aGXkIapAJFKzipBLi4SUn+GsUpTJ1yE+2+13Kjsib3Ffq8B/ONRj3lEx4Omis9ErXmmZE067hcCeMK7/xT/GWc7mtbqBHhvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562283; c=relaxed/simple;
	bh=c84ksklaJjQN2B3OoIK5XlsMkww6Q6r/sM/80/ULIUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7Demx3y7uXpURNktni6rbJbX42RDigHWFrVxg8/keS9N2kexdLueLZtu+MB28XdmslvQCxy7cAlMAKIuR0yKG8+Og4CDOggtgCfUdWb4agRwmTD/66e3akU2vPEXlFGyO5Kc0osSemqBQmb2fgocGchGJVrgHTieqVDmeFpn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uva8GhfY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562282; x=1795098282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c84ksklaJjQN2B3OoIK5XlsMkww6Q6r/sM/80/ULIUg=;
  b=Uva8GhfYqP4Zh79hgGQvx1FUvqXvb0j7VBUydEF3WklAXry93LA/dP+M
   ey/Bx6qVzFkGrNcMrDnKeqVFh0IG6fZyOLd7vV2Or/Rjhn6CVQnEhb0uv
   pgzYAXfc9yhVaDZpD5e60kDIwkWesh+f/W5OwO01F2OTHuqx2KglIEC1V
   qtSgIzyeKJh8lRupl5gn8ighvImn0EU9+Ex8UaPUTyapnYVsR5OXKCd/f
   nRs//2QbdrN+BP39zKc47jS+cuMrjJGvezxUPq2Nz71RB9v44LaQcWhPW
   xiqjQeeYVvvOfd+Eph32h5l/bGPqkxDaO6Pe4T6ope34CTH4spqzxbMuB
   Q==;
X-CSE-ConnectionGUID: Z+CM1d9BR2+p71hFlQkRkw==
X-CSE-MsgGUID: aHZnO8PZQUe5EteTr2TFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645506"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:42 -0800
X-CSE-ConnectionGUID: Zy+mVGEnQZSjh3g+BsrDJw==
X-CSE-MsgGUID: 2YbUBhseTMSTt8HW8ZqybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221991996"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:40 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/23] usb: xhci: rework xhci_decode_portsc()
Date: Wed, 19 Nov 2025 16:23:58 +0200
Message-ID: <20251119142417.2820519-5-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 57 +++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 22 deletions(-)

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
+		ret += sprintf(str + ret, "OCA "); /* No set for USB2 ports */
+	if (portsc & PORT_CAS)
+		ret += sprintf(str + ret, "CAS ");
+	if (portsc & PORT_DEV_REMOVE)
+		ret += sprintf(str + ret, "DR ");
+
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
 	if (portsc & PORT_RESET)
-		ret += sprintf(str + ret, "In-Reset ");
+		ret += sprintf(str + ret, "PR ");
+	if (portsc & PORT_WR)
+		ret += sprintf(str + ret, "WPR "); /* RsvdZ for USB2 ports */
 
-	ret += sprintf(str + ret, "Change: ");
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
2.43.0


