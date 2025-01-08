Return-Path: <linux-usb+bounces-19144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F01A05E90
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 15:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5DB1886D65
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 14:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A2D1FA8F7;
	Wed,  8 Jan 2025 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVaZSAD8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2D1514F8
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346565; cv=none; b=KwjiFpUEp14tTehl6ZNjx/9NRj42kbFUyCUn9irBfZCzCtoxt5UmQ92UYKgZgYki1m+0p4SKU6S3h56FjB/uCVGCAl4UOu87tUExlem5E/aHEyE96svy8agbEQ9axOAc1yk0LfmEKWdGyVUrHbXcZutIaW6VNUt28lsGmNH8KRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346565; c=relaxed/simple;
	bh=unxYMcic/mlfgbSYHnbEOsywxW/MECaf4+XNFT+EEwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVJ4WQMdKKB1ctiHcfrndlasi+JQJS8Rk647oJKhp2kf+ZjzenwijM+00aVWpMtWmvq4eue9KqyXfuIJFyDV8WngQkzSsQVPjqVm1oK2cc5J1pCcbiWtwROT1vcUuqb2BIJ60nebGkF/vTvPgSrSf8+d2gLGeMGdjCoaYbUPsXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVaZSAD8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736346563; x=1767882563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=unxYMcic/mlfgbSYHnbEOsywxW/MECaf4+XNFT+EEwQ=;
  b=lVaZSAD8ekdkB7yPM4cj//rj8tYpbNxUKIQqD1v3cCfVgax0aoVOgf6x
   sqstB2bxaIS0pLFq/40cGsOY63i/1W3zVD4xop5i2d4Eper8I/pLEs/6d
   MQKTgDdjqgeupiljG88mfXxjWhNl68QFy6+rg+hicvg5rfYJBRRZR+/p9
   Ywo4wOuQHCsqjGe9x+UCZfI5svJ2Punqse1N+0iwBYE8YGMhQ1Ink/kFw
   4SBYVBROXdMCTcdvL3p6EKENir7vUmtrTudMxl0pEmFYVVvWDHoL878Qp
   yEFib4z0ojpf3oaAF+zWihDGZKN8vO6LbYXBQOuG7gWgIdTNDhybq15Ad
   A==;
X-CSE-ConnectionGUID: 5lV+xNHuSHCM18MZnmZg6A==
X-CSE-MsgGUID: OMTSZIG1RzKVJVGO30Pusw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36735027"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36735027"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 06:29:22 -0800
X-CSE-ConnectionGUID: cpstPT2NTu+uflTa75R0LQ==
X-CSE-MsgGUID: FlKV+fN6Re+BUkYl45NhFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107730632"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2025 06:29:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 476CC3C3; Wed, 08 Jan 2025 16:29:20 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/2] usb: xhci: correct debug message page size calculation
Date: Wed,  8 Jan 2025 16:28:21 +0200
Message-ID: <20250108142822.649862-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
References: <20250108142822.649862-1-niklas.neronin@linux.intel.com>
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
variable 'i' is unsigned, subtracting one from zero will result in the
maximum unsigned integer value. Consequently, the condition 'if (i < 16)'
will still function correctly.

[1], Page size: (2^(n+12)), where 'n' is the set page size bit.

Fixes: 81720ec5320c ("usb: host: xhci: use ffs() in xhci_mem_init()")
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..66584aafc513 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2391,7 +2391,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	page_size = readl(&xhci->op_regs->page_size);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size register = 0x%x", page_size);
-	i = ffs(page_size);
+	i = ffs(page_size) - 1;
 	if (i < 16)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size of %iK", (1 << (i+12)) / 1024);
-- 
2.45.2


