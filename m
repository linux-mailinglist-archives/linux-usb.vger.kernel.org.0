Return-Path: <linux-usb+bounces-27553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31441B440D2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14D0A42C4F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028A7285CBD;
	Thu,  4 Sep 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTPoYT7K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79D281352
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000624; cv=none; b=oCHjBucRWONHRxFHlzyDZp0UgJxot+tHFbErwJXiF8dE9Fciii/IuyAF+Asvye8AuEuq+pIOvz8XY0Oc6Q/d2LrP4sxrIaVtAaY3Zq11+EiOKut6mQh6RuPZvmPrX4NbrxR/5EGl/UkFT9tgdrdB7DwbF0d+PQyYamw0xgJEoU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000624; c=relaxed/simple;
	bh=h7uf1vyTWSbUWYb1b0scHiqabb28ELuXSQsNe1YHPOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbMDaOxobDdrOZra+hQYrvO3zP8k29FsdFm748qHvcK7VsEFb6wkgSeIDMAQpGvD2FHPXB8pc87vG1dcJOgHBAjlLswS0+w/x9PS3O7IRkB9TAVf7hvP3aRJGJiUIByvUde8aQzT7YLzeW2rvEM6Hs8qcNU/x86/o667xdt076Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTPoYT7K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757000623; x=1788536623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h7uf1vyTWSbUWYb1b0scHiqabb28ELuXSQsNe1YHPOw=;
  b=HTPoYT7K3/gZgegJ6kWIkFTnJs84d1ah5Dl31BiYJQYnRIO2WLCNX+AA
   01/OH71oHo/nLrBHF5XQDxKSXieAGX3CnYoYdjaSDJu0ucr98B1euJTxI
   20V6ErBJumzmOEXHZRhQfFzHfLNXwBDoOoozmdk9sgBpRcObGsFedXKg6
   mwHFrr8B9OiU8LcxKNArs/KCQTEAbNhASDin/JTPMHaLptDsn8Fxol+Q4
   a9rGF4OQb3rASLtQyRBRzle098QOFWdZcojKmu1mAqteTFnJiDYXd3L/d
   SbLMdmh+9uT3IGX42QRfyzG5uPixBIrxFZao9+VZHcJy/OILT0/zdk/aD
   g==;
X-CSE-ConnectionGUID: 0lHnkSq/SOu2og+VDedfFw==
X-CSE-MsgGUID: bmeOvagLRW6811LylV++Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59492528"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="59492528"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:43:41 -0700
X-CSE-ConnectionGUID: CmKM4CFZSRCv3gndg0p1aA==
X-CSE-MsgGUID: G0GFv6ZTSUKmytT8QGxgEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="172288306"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2025 08:43:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0B3CD96; Thu, 04 Sep 2025 17:43:39 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/7] usb: xhci: improve xhci_decode_portsc()
Date: Thu,  4 Sep 2025 17:42:16 +0200
Message-ID: <20250904154221.2314596-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch improves xhci_decode_portsc(), which is used in PORTCS tracing.
The upcoming patch will add tracing to all PORTCS writes.

Read-Write 1 to Clear (RW1C) bits are now grouped together and prefixed
with "RW1C: " if needed. This is because the meaning of a set RW1C bit
differs between reading and writing. For instance, when reading 'PORT_PE',
a value of '1' indicates the port is enabled, while '0' means it is
disabled. Conversely, writing a '1' to 'PORT_PE' signifies that the port
is being disabled.

Add Port Link State Write Strobe (LWS) to the decoder.

Simplify and reduce the length of the message.

==== Examples ====

Before:
0x00201203 Powered Connected Enabled Link:U0 PortSpeed:4 Change: PRC Wake:
0x0a0002a0 Powered Not-connected Disabled Link:RxDetect PortSpeed:0 \
 Change: Wake: WCE WOE

After:
0x00201203 Power:1 Connect:1 Link:U0 Speed:4 RW1C: PED PRC
0x0a0002a0 Power:1 Connect:0 Link:RxDetect Speed:0 WCE WOE

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
I am aware that the 'XHCI_PORT_RW1CS' macro could replace
'(PORT_PE | PORT_CHANGE_MASK)'. However, it is not located in xhci-port.h,
does not utilize established port macros, and is inaccessible in xhci.h.
To avoid complicating this patch set further, I've decided to defer this
change to part 2. Otherwise, this patch set will grow forever :D
Part 2 will tackle xhci-port.h and all associated macros.

 drivers/usb/host/xhci.h | 52 +++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a20f4e7cd43a..f37965e64fd5 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2395,37 +2395,22 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	if (portsc == ~(u32)0)
 		return str;
 
-	ret += sprintf(str + ret, "%s %s %s Link:%s PortSpeed:%d ",
-		      portsc & PORT_POWER	? "Powered" : "Powered-off",
-		      portsc & PORT_CONNECT	? "Connected" : "Not-connected",
-		      portsc & PORT_PE		? "Enabled" : "Disabled",
+	ret += sprintf(str + ret, "Power:%d Connect:%d Link:%s Speed:%d ",
+		      !!(portsc & PORT_POWER),
+		      !!(portsc & PORT_CONNECT),
 		      xhci_portsc_link_state_string(portsc),
 		      DEV_PORT_SPEED(portsc));
 
-	if (portsc & PORT_OC)
-		ret += sprintf(str + ret, "OverCurrent ");
+	/* Read-Write 1 to Set */
 	if (portsc & PORT_RESET)
 		ret += sprintf(str + ret, "In-Reset ");
 
-	ret += sprintf(str + ret, "Change: ");
-	if (portsc & PORT_CSC)
-		ret += sprintf(str + ret, "CSC ");
-	if (portsc & PORT_PEC)
-		ret += sprintf(str + ret, "PEC ");
-	if (portsc & PORT_WRC)
-		ret += sprintf(str + ret, "WRC ");
-	if (portsc & PORT_OCC)
-		ret += sprintf(str + ret, "OCC ");
-	if (portsc & PORT_RC)
-		ret += sprintf(str + ret, "PRC ");
-	if (portsc & PORT_PLC)
-		ret += sprintf(str + ret, "PLC ");
-	if (portsc & PORT_CEC)
-		ret += sprintf(str + ret, "CEC ");
+	if (portsc & PORT_OC)
+		ret += sprintf(str + ret, "OCA ");
+	if (portsc & PORT_LINK_STROBE)
+		ret += sprintf(str + ret, "LWS ");
 	if (portsc & PORT_CAS)
 		ret += sprintf(str + ret, "CAS ");
-
-	ret += sprintf(str + ret, "Wake: ");
 	if (portsc & PORT_WKCONN_E)
 		ret += sprintf(str + ret, "WCE ");
 	if (portsc & PORT_WKDISC_E)
@@ -2433,6 +2418,27 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
 	if (portsc & PORT_WKOC_E)
 		ret += sprintf(str + ret, "WOE ");
 
+	/* Read-Write 1 to Clear */
+	if (portsc & (PORT_PE | PORT_CHANGE_MASK)) {
+		ret += sprintf(str + ret, "RW1C: ");
+		if (portsc & PORT_PE)
+			ret += sprintf(str + ret, "PED ");
+		if (portsc & PORT_CSC)
+			ret += sprintf(str + ret, "CSC ");
+		if (portsc & PORT_PEC)
+			ret += sprintf(str + ret, "PEC ");
+		if (portsc & PORT_WRC)
+			ret += sprintf(str + ret, "WRC ");
+		if (portsc & PORT_OCC)
+			ret += sprintf(str + ret, "OCC ");
+		if (portsc & PORT_RC)
+			ret += sprintf(str + ret, "PRC ");
+		if (portsc & PORT_PLC)
+			ret += sprintf(str + ret, "PLC ");
+		if (portsc & PORT_CEC)
+			ret += sprintf(str + ret, "CEC ");
+	}
+
 	return str;
 }
 
-- 
2.50.1


