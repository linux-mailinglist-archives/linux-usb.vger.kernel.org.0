Return-Path: <linux-usb+bounces-30489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A9C57820
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1F134E0FED
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6028F351FCC;
	Thu, 13 Nov 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtLZJYhS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E19350D52
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038745; cv=none; b=d1byRSgviTChUhqlhBY0MufvsH3Tq29R2nBoFSFBtqhU8OrKa1/PG2LtKDdxV+eyxohphpGV4pRBIJRPzE5WdQeYek+AOht4y9ZaQRa+WjlHe1W59vaFbonYpHnsKd9KSZ1/cCV0oaqb83KRKNceXEKItEIbyOFJfjus/fUWrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038745; c=relaxed/simple;
	bh=lGZDL1ak6CfMuUkIRigZ2Kf4fkK1ILaUT8Z/XVh+VQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okUVdRwAWCxrrZ7CLyWfqMlmz0VUbqxFr5txNNzbxx9ummMmg7oK67G5msU3utTEs7Z43fd8UGrJWNmXgUe10NBX4Vg3HogNYlg/ZJkcSRu1D+yEZYZWNZ0lFHjD7g/hAwaIDTcCRAhcTLv71ZuICbGUSj18K4LSK+ZSbwRB8bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtLZJYhS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038744; x=1794574744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lGZDL1ak6CfMuUkIRigZ2Kf4fkK1ILaUT8Z/XVh+VQ8=;
  b=PtLZJYhSLMZ2VYTvYIUM8lWIhS6qepp88jDP+6R4qZcwkXIRP+2ZrSgi
   NJ+ObiM4UR0zByHSS1dQQBi57KTO4sDJhdXVdcWMlv9Y/3ACMkUGLA8SQ
   p4hADub4IVeWLyhjsLjCKkL+0YA7nm60+M8WardGkaFvhWKl0BR6/kiKZ
   2jC0ifZARqFISZ811ae2ZKU7sJAqTZdQBQ4SKkNWcARRs7aw+2gzc5Mbv
   +Wh2yl28wSiT4NtiB1bKbxRXMBn067dxT0VgFseVKwQJ+66QLgvCCu6T0
   YVrgL5u3//iCJAJGsqrr2kA/KfzxC0JAtweVRJK8tl2xJZEeoal5jBAmi
   A==;
X-CSE-ConnectionGUID: xjTrzZOMQeO2Xx9PVEO0eQ==
X-CSE-MsgGUID: 4jP7hUxNSNG7pAhjgVlApg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150413"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150413"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:04 -0800
X-CSE-ConnectionGUID: vYWP2rQaTk2OEEQxcRLNcw==
X-CSE-MsgGUID: CtCkC2UhSHWHdHjz7tQE0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673863"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:59:03 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id D3D0996; Thu, 13 Nov 2025 13:59:01 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 10/13] usb: xhci: drop xhci-caps.h dependence on xhci-ext-caps.h
Date: Thu, 13 Nov 2025 13:56:37 +0100
Message-ID: <20251113125640.2875608-11-niklas.neronin@linux.intel.com>
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

Drop the dependency of xhci-caps.h on xhci-ext-caps.h by eliminating 2
instances where macros in xhci-caps.h were redefined from xhci-ext-caps.h.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index af47aebc5ba8..99557df89f88 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -6,7 +6,7 @@
 
 /* hc_capbase - bitmasks */
 /* bits 7:0 - Capability Registers Length */
-#define HC_LENGTH(p)		XHCI_HC_LENGTH(p)
+#define HC_LENGTH(p)		((p) & 0xff)
 /* bits 15:8 - Rsvd */
 /* bits 31:16 - Host Controller Interface Version Number */
 #define HC_VERSION(p)		(((p) >> 16) & 0xffff)
@@ -77,7 +77,7 @@
 /* bits 15:12 - Max size for Primary Stream Arrays, 2^(n+1) */
 #define HCC_MAX_PSA(p)		(1 << ((((p) >> 12) & 0xf) + 1))
 /* bits 31:16 - xHCI Extended Capabilities Pointer, from PCI base: 2^(n) */
-#define HCC_EXT_CAPS(p)		XHCI_HCC_EXT_CAPS(p)
+#define HCC_EXT_CAPS(p)		(((p) >> 16) & 0xffff)
 
 /* DBOFF - db_off - bitmasks */
 /* bits 1:0 - Rsvd */
-- 
2.50.1


