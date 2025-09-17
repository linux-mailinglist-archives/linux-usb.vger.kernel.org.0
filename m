Return-Path: <linux-usb+bounces-28217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64EDB7F0D2
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEDB54A6D92
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 13:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E42E32E736;
	Wed, 17 Sep 2025 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGdbGMHI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC432E73C
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113947; cv=none; b=YzaC5hlaR5/0YfTgDV5jHTCKtLWDruKSbhTG+hBf8sJM8zrO1qaX59442/bS0ZRwfEjvcMV7hr2VRL2kcev6MKx8o4s8mXLdVgzELSjvF32OoOYFlEjWexD52S+tRAOrhdToY5x+/UlvwqNVQMe1B38mK+c8Kev/iymAR488HVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113947; c=relaxed/simple;
	bh=aec3YRxSf5swrM8ezWrHW4gnz2gva6CoO4N+9MTq9Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVj9hrqhGrjjyzsaDF600a3l1d9E32xEutW6HJO5AHjXxdTKJdo+xhYSGVIrEysvyKjxIs/mpoEBDhd1/9atoqgWyM6eSuMkDa4PDwKWlxdU4w6gt5Bsa3wuQQwcedWyWeIQv4ABMRIOztUcSHoQh1axDksFICfhZULLcMcotFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGdbGMHI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113946; x=1789649946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aec3YRxSf5swrM8ezWrHW4gnz2gva6CoO4N+9MTq9Dk=;
  b=OGdbGMHI2nKejaGkoXV5UPkyuHtcS2vUipH1im68ioIpRzbwkE4g342q
   yEPWKxchUaym4WzatIheJqcVeE4EmEmAWe7FHykcOmc7RLpTU3S7Jx9Vt
   Z2/6IU9Vk26NREAjMqSJeN1IyQwxeFxFrSbD5gOr1g3b5aQEhOnyFZb/S
   tPZGGACpEf1Mx9nIRyvh4Bp6geltsSXBzMUYADZyVMMVq2egFTAUxm3wv
   371tgp4hYQavqhgXZEH1xgmAjolCS4F8xFr3G1jfE0LKt5h68pL5v63rT
   MeaqiayimBeES9xKTsd8H9EX1LsV+QpEEJfaxToaO3QTn/x4Qp1HhZzQv
   g==;
X-CSE-ConnectionGUID: 1oLkaNOcTjyXZAgD0NOo5Q==
X-CSE-MsgGUID: BRa6JxllSZKavpt0hirkyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60484586"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60484586"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:59:05 -0700
X-CSE-ConnectionGUID: Oymii0rfRPu1ZowGVaWl9g==
X-CSE-MsgGUID: xX4VarsHRWSvLVcRoijGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175159043"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2025 05:59:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E33719A; Wed, 17 Sep 2025 14:59:02 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 3/8] usb: xhci: improve xhci_decode_portsc()
Date: Wed, 17 Sep 2025 14:58:44 +0200
Message-ID: <20250917125850.3380560-4-niklas.neronin@linux.intel.com>
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

This patch improves xhci_decode_portsc(), which is used in PORTSC tracing.
The upcoming patch will add tracing to all PORTSC writes.

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
 drivers/usb/host/xhci.h | 52 +++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 85d5b964bf1e..7a245745b289 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2396,37 +2396,22 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
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
@@ -2434,6 +2419,27 @@ static inline const char *xhci_decode_portsc(char *str, u32 portsc)
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


