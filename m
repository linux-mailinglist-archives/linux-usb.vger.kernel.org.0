Return-Path: <linux-usb+bounces-23994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F48AB88B2
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98AF01898165
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91271F4CAC;
	Thu, 15 May 2025 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fexOLHT/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D11AF0C7
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317413; cv=none; b=q3ymfwIzSsyUgIp3RTb4WVfIqp93HfEr1VFSl5GIVGmLrfdoOULjXBPNiGlrVBU+HODg73noenUPLqTrYzWqRQhqRbxvGMF5Emei6DzVw4RWgRWES6pATdKs6HiW6iJcmRiJ8xUujIPZXS/qApQ1HI3fI/sy5X5xO51xHVNYyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317413; c=relaxed/simple;
	bh=SB6/qac79QA5rG03Zep6Ww6TysQENB1XznR99XO5N/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwFu5OK4JjONmuqgc96s03Qp2v6aH8RE8Ld9PpqkXUxH9KxWusFahBAW3Yqe/aIJ9xSucEOPWXe9GIBVor1G17Xog7zF+hA4/z3625vh5CJT8CGkdmCwohxcTwcfzn9EK+MwGjsEFZ/j78heKQHrDRybHzmifgR1F7ORHd7xTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fexOLHT/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317412; x=1778853412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SB6/qac79QA5rG03Zep6Ww6TysQENB1XznR99XO5N/U=;
  b=fexOLHT/+wjeTUnVBlxED2Jv/6eHE+2bnDaGwY4ei4Bu/Zsl4vDZIHie
   6/nQ2SWs6wah7lS6eJnoWukoh0cMsregJexiq7qV4C597sAdYxHYSFEeP
   ezGw+bN7tbpT1xbJxeRfTkrvHDxe11Ev2Vk2fgeDuWSzrgbIGYtgLEZfl
   8Zi1OLoOJ5E6LX6SOXcVAOcl/PdKspQR30oPf/FgqUEO5kFBXRVZ/qKQJ
   EhCwz3NJQEN5+xWgXS0DW/dX+V/ld0qd2zPG47v5fM8+Lmm1SQjs9/2WF
   A0EUhX40AHRrih+ZdI54WWhgHR4hP5c+DpqFcvc83o6McnXTcxGlbkj0o
   w==;
X-CSE-ConnectionGUID: 5OxHqr/jQVicmvJwS2c4ew==
X-CSE-MsgGUID: W+O8ibPQTiiItWjXy2/RWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270055"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:52 -0700
X-CSE-ConnectionGUID: WsxHU7cOTCOr95RDPM8a5g==
X-CSE-MsgGUID: lGcspmqDQxigH4glauCQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372277"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:50 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/24] usb: xhci: set requested IMODI to the closest supported value
Date: Thu, 15 May 2025 16:56:11 +0300
Message-ID: <20250515135621.335595-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The function configures the Interrupt Moderation Interval (IMODI) via bits
15:0 in the Interrupt Moderation Register. The IMODI value is specified in
increments of 250 nanoseconds. For instance, an IMODI register value of 16
corresponds to 4000 nanoseconds, resulting in an interrupt every ~1ms.

Currently, the function fails when a requested IMODI value is too large,
only logging a warning message for secondary interrupters. Prevent this by
automatically adjusting the IMODI value to the nearest supported value.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 5 +----
 drivers/usb/host/xhci.c     | 7 +++++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 08513e5d321a..dcfe7774e9ed 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2393,10 +2393,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 		return NULL;
 	}
 
-	err = xhci_set_interrupter_moderation(ir, imod_interval);
-	if (err)
-		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
-			  i, imod_interval);
+	xhci_set_interrupter_moderation(ir, imod_interval);
 
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 ir->intr_num, xhci->max_interrupters);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c6b517401c94..c3a1a67b6563 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -355,12 +355,15 @@ int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 {
 	u32 imod;
 
-	if (!ir || !ir->ir_set || imod_interval > U16_MAX * 250)
+	if (!ir || !ir->ir_set)
 		return -EINVAL;
 
+	/* IMODI value in IMOD register is in 250ns increments */
+	imod_interval = umin(imod_interval / 250, ER_IRQ_INTERVAL_MASK);
+
 	imod = readl(&ir->ir_set->irq_control);
 	imod &= ~ER_IRQ_INTERVAL_MASK;
-	imod |= (imod_interval / 250) & ER_IRQ_INTERVAL_MASK;
+	imod |= imod_interval;
 	writel(imod, &ir->ir_set->irq_control);
 
 	return 0;
-- 
2.43.0


