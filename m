Return-Path: <linux-usb+bounces-19258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B70A0B988
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 15:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB3E77A2228
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC43B2451D6;
	Mon, 13 Jan 2025 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRtIF0+m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFBB347B4
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778653; cv=none; b=m/O0W0vPF8CZ2mMYbly7bCt2MpNwRL3FyV8KO4bKpjoIcd4DBZYuQ3L0QhOfmHbDKrgGuoKjDqb3pZ1DnSB0pu7nsA2PpOsx3VL1fiLZpN/nAF4v7gkeBi2nJwwB/1N7nj6a9HlSpFsqxNB03k8zhDWbsjVeFITljhRM+EscbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778653; c=relaxed/simple;
	bh=unxYMcic/mlfgbSYHnbEOsywxW/MECaf4+XNFT+EEwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYrS9nfDt/mpl4LiMlMg719uT1aRz4mTbvG1x9WTaRkqum9Z4eJqwkWxP7h0sk0Y/Umvd43z49e03G3mzAih8CYw70xfzl5xIzoMem7aFQzM4EK429+o55hI2/prXzPrLmlw7W05GCqeStkhL4bc86BqYJEdQ5NR8QQT27BwuWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRtIF0+m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736778652; x=1768314652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=unxYMcic/mlfgbSYHnbEOsywxW/MECaf4+XNFT+EEwQ=;
  b=eRtIF0+mnEYMzNZMIuJ+KSIgGl8YrGtGYoHaPSXLWoRgVxDutyIjqmVD
   FD3qaSWYncPjYncB7NPe/diIjNIxR0r8nb9cjvzRJe5yzKn5DuSrStTjg
   e6KMJH+8YKFbktw41V49sT2HK3eXDQIKPrtyHDnseEqtFf9nqpfIArKQW
   pvUVwlS/zl9Xgy1uQRMl1gfIS50s1O+DbmkajfBJQSFWdpC5FgUP47LiS
   7x7L2+1m61VSPzJG0bgJQOFY2NrjJuArGgkfek0cGhIHyTY1lCjqgO+ca
   vB9eHTtFJrC+YWNgl01tH1cfWtV5jvCrxak4adLsdt+xBcpkqly1CDXZP
   w==;
X-CSE-ConnectionGUID: UyVaC0raQWaH0etyQCiH4g==
X-CSE-MsgGUID: pSn2+/AAQkGlIdmwJkoL5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48458171"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48458171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 06:30:50 -0800
X-CSE-ConnectionGUID: Ok1MaEa0Q8a+POhNPHYedA==
X-CSE-MsgGUID: OaxiLrRASrijGHZjG35LvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141774295"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 06:30:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 98CA840B; Mon, 13 Jan 2025 16:30:47 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 1/2] usb: xhci: correct debug message page size calculation
Date: Mon, 13 Jan 2025 16:30:36 +0200
Message-ID: <20250113143037.2131346-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113143037.2131346-1-niklas.neronin@linux.intel.com>
References: <20250113143037.2131346-1-niklas.neronin@linux.intel.com>
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


