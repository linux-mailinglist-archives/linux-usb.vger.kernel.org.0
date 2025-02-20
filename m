Return-Path: <linux-usb+bounces-20876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847BA3DD40
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 15:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4C73BCF5F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 14:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187D41D5AD4;
	Thu, 20 Feb 2025 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBCQ+2iC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F521FAC5E
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740062513; cv=none; b=pyNAI0S7iQuDVc3JBMwhs89E2FHuM530nevHJ6znTD1UKjJmyo21RF5huA9PzXZAU4CqAMqCcGLK97JsfDGjv5MzfoFxYPVLqvCZZXlXN1bAWt+cxIUyB+h5/zy1I/DTj0s9V/XEgg0LZjZP5GwoY1mtJaWNk93HziwlpwEywQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740062513; c=relaxed/simple;
	bh=VXf8S+uZOPbfI7bx6gqqBklD9cBv/5l0wdRbuwtShsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXyt8INQ4oCxImMsTleNaFDXoH84eubYvMASR00z+lbz/sMvp8NFUSHW13DfrsnqpBBWyi9xM4912wbyVecpwXoXTB9zZN1Ef+n/Mw9Rb5XUbmfkZJG8IiVqbGFRJhh4i9b97cumnub17+GXsdfjTDnR6gctM+bviEcTxJbgU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBCQ+2iC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740062512; x=1771598512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VXf8S+uZOPbfI7bx6gqqBklD9cBv/5l0wdRbuwtShsc=;
  b=DBCQ+2iCnXm5m+eKsZcQYzpwzMjrxNSRePHKxFmHnxYtzxQpkK1hsZvu
   bgDvGzxdcrmPkhEajNp0tIH907QhWY98Ure6TBSU+u4fAz0uV8EqJhH/W
   0e175c/O41EuKLKx0WxpQlCS5haIBsrp7ppIHr+2DpX7EhnCWSxOXsin4
   42zAevrzzGpjpfX2JNNVYY/7iTFQ5KyCijG/jKHtK79xBSg5uZqzcg1LQ
   /7JZLincYUX8iVwPc+oCJpLMV8u2DnthP7vI40uvTbH95A8uj/5cSC+EC
   1Ec1Cx4AZZAdsudCkmf3M7H5mdtiQvVJQTCklZZclB8wrq7/Rs5EPI/jf
   w==;
X-CSE-ConnectionGUID: dT6AoSkMRQ6tXLyCH2TzOA==
X-CSE-MsgGUID: DjZj0ia4RrqLZ3+5pgECug==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51058369"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51058369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:41:51 -0800
X-CSE-ConnectionGUID: R3mAVQ+zSSGKmmEVLK4Gaw==
X-CSE-MsgGUID: bSFXc7MoSTmjjrP505i82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115547358"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2025 06:41:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id E79E92D0; Thu, 20 Feb 2025 16:41:48 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v4 1/2] usb: xhci: correct debug message page size calculation
Date: Thu, 20 Feb 2025 16:40:36 +0200
Message-ID: <20250220144037.2723533-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250220144037.2723533-1-niklas.neronin@linux.intel.com>
References: <20250220144037.2723533-1-niklas.neronin@linux.intel.com>
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
 drivers/usb/host/xhci-mem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..dc5bcd8db4c0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2391,10 +2391,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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


