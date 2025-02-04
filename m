Return-Path: <linux-usb+bounces-20098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1FA27239
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB6E77A20B3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 12:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F4B211A0D;
	Tue,  4 Feb 2025 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U98BwEgx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE5421148B
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672992; cv=none; b=qeEzecrdx822hw9fVWx6txoOe1aIRGzDdE1lNdskCHgKE7BI9p95sl9nCdkxnv7h5ub63yLnIfhqCntErCKVrO67rywkmoSQ6h0rf3V78TeSRPUodGmMsVah6JKD2cDkWvroAp8RE/wZQICT2yrVWMn4pnSiR4Imcb716FxCcqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672992; c=relaxed/simple;
	bh=CYDaA7d4PwPh098cA/3dKylmEhIZ0wRu7OBUgVG85HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUpQ94EWbRKv/dd2ZTsiWCQtfkg7XarmU7uQp1eJzRSNuCC9+Rv1SRkAfuL457BEp3VlIXDZPz6oDQIPZdwkt/qYSiCpiXbgHhK57Es942lP3RGQI1hA7rj3dlBV+7gxc40DRYJhwwfsLf0UBCTaCkR83HbeB6zrN0upg6CN/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U98BwEgx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738672991; x=1770208991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CYDaA7d4PwPh098cA/3dKylmEhIZ0wRu7OBUgVG85HA=;
  b=U98BwEgxFKwSiu/Y6vVqrnaIHelXedD+1+5ARLqHPcdwP1iiuQPlNPb9
   RwtaWQMcKZB7Ic+WLZqZnWERpdJleKs1f23poWvoBmLZcGFsH19/z802h
   kgin3QUvzbqwWXL/5wQcMYumSwQlmNCwMLHSLl3dRLDBrmBB78Go3kTHy
   eSB5jf2IcVWNX4suh3a+f0f8JFMr9aC+coIK3hLK0uoBpabbZDVISY4PW
   8q0j42DIGpWWcq99pyvpyvdP59a8E/tPbyHQYgN7PkPiPcWg5EHWKXq+J
   zXtrTFw/BJomhVlkiEsO+nJkzszZv4Bxfkso3R128un8mNAdWbD1Czmrd
   Q==;
X-CSE-ConnectionGUID: 9tZ99GK2QpWCGN9USt7XQA==
X-CSE-MsgGUID: pnL6HG3cSrGFxwkAylAB/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42945890"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="42945890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 04:43:11 -0800
X-CSE-ConnectionGUID: vMJMnMtXRnOoru20R9Fblg==
X-CSE-MsgGUID: Vgh7dINtSz+jZbP9RsttDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133827113"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2025 04:43:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id A8D23353; Tue, 04 Feb 2025 14:43:07 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v3 1/2] usb: xhci: correct debug message page size calculation
Date: Tue,  4 Feb 2025 14:41:43 +0200
Message-ID: <20250204124145.3998098-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
References: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ffs() function returns the index of the first set bit, starting from 1.
If no bits are set, it returns zero. This behavior causes an off-by-one
page size in the debug message, as the page size calculation [1]
is zero-based, while ffs() is one-based.

Fix this by subtracting one from the result of ffs(). Note that since
variable 'val' is unsigned, subtracting one from zero will result in the
maximum unsigned integer value. Consequently, the condition 'if (val < 16)'
will still function correctly.

[1], Page size: (2^(n+12)), where 'n' is the set page size bit.

Fixes: 81720ec5320c ("usb: host: xhci: use ffs() in xhci_mem_init()")
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
V3:
 * Repalce variable int 'i' with unsigned int 'val'.

 drivers/usb/host/xhci-mem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..dc5bcd8db4c0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2391,10 +2391,10 @@ int (struct xhci_hcd *xhci, gfp_t flags)
 	page_size = readl(&xhci->op_regs->page_size);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size register = 0x%x", page_size);
-	i = ffs(page_size);
-	if (i < 16)
+	val = ffs(page_size) - 1;
+	if (val < 16)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size of %iK", (1 << (i+12)) / 1024);
+			"Supported page size of %iK", (1 << (val + 12)) / 1024);
 	else
 		xhci_warn(xhci, "WARN: no supported page size\n");
 	/* Use 4K pages, since that's common and the minimum the HC supports */
-- 
2.47.2


