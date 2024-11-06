Return-Path: <linux-usb+bounces-17200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0F9BE3F3
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 528C61F24C07
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB941DE8A2;
	Wed,  6 Nov 2024 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIhROk7O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593191DE889
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888006; cv=none; b=Q/YU8GwVGNpPUh9TKK4EQWW7qrH7Q2y2HyMCdef/3Nq5AdDRNCYb85M7BQOY0tAe1pWVTskZzqv8Fmd4e6HqvmkoYdiiKxVUs4W2CYuoHAl5e0Ksxsm3lerq4K6fPeTTf1a8WIOUvexUa+yqzR12pd5+uPx912Ra2caN3SI+yzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888006; c=relaxed/simple;
	bh=rNjVof70rreHdzjKu0X5PBB0SfsBcqUjXht8B1JT1EQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J/7W4XgmgWahowDCUEt1kg7TfnYjyzhCMm875C/RVYfRFn6N1tueyXLOV359Ls8l+v+p1NZv9OKgmA7+WXsFoKPHHmOmfnyhln/+wbFRbPqAZzdLvFSulJQ4kUvYEcV5qVp8f5N1eNnpRCGazYWIW5L2nMhuFc3CR9wPtNQpR7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIhROk7O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888005; x=1762424005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rNjVof70rreHdzjKu0X5PBB0SfsBcqUjXht8B1JT1EQ=;
  b=NIhROk7OldeVE6QcYME77PHtBtknyi4lfxiWkRatIZLyWJ1uVlvmdRcY
   PrRsiFA2gdZw4pEYdHyRDYW5j6zszFV8VtfQkKrGRM45p2Cefb1eg/wG9
   9AE93ZVcVBNSATuIwOXBLrURQu/C3txa4SSdnVEdvl57dI9vpxzHeNGb4
   kFxZ+8SkEfNyghjzAnqpaufHbiI9aqdxa0yyYpdnJSjjNQ3E4h/ID2QN9
   mIPwya9wTb7jCh4Sg8TBcNz0JN3/skOiipM0v+v/wt8sLvRBwq2zGPuxS
   tREKIO4BjA+Y2fgUbvBW1xmtFMeNjsUr42G974NO3EZ/8gsSnMYAEy+JD
   g==;
X-CSE-ConnectionGUID: D5C+i/KySoaicaczCMUBTQ==
X-CSE-MsgGUID: Y/hGy0EERBWz1qsDXdeGmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059459"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:25 -0800
X-CSE-ConnectionGUID: uEYEhz4ZS2aobLX4GTzdIQ==
X-CSE-MsgGUID: bCTmTM19QOGBTDbHWvB6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813354"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:24 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 25/33] usb: xhci: request MSI/-X according to requested amount
Date: Wed,  6 Nov 2024 12:14:51 +0200
Message-Id: <20241106101459.775897-26-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Variable 'max_interrupters' contains the maximum supported interrupters
or the maximum interrupters the user has requested. Thus, it should be
used instead of HCS_MAX_INTRS().

User set 'max_interrupters' value is validated in xhci_gen_setup(),
otherwise 'max_interrupters' value is 'HCS_MAX_INTRS(xhci->hcs_params1)'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b1f4dd3f9eff..47c4f70793e4 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -149,14 +149,11 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	hcd->irq = 0;
 
 	/*
-	 * calculate number of MSI-X vectors supported.
-	 * - HCS_MAX_INTRS: the max number of interrupts the host can handle,
-	 *   with max number of interrupters based on the xhci HCSPARAMS1.
-	 * - num_online_cpus: maximum MSI-X vectors per CPUs core.
-	 *   Add additional 1 vector to ensure always available interrupt.
+	 * Calculate number of MSI/MSI-X vectors supported.
+	 * - max_interrupters: the max number of interrupts requested, capped to xhci HCSPARAMS1.
+	 * - num_online_cpus: one vector per CPUs core, with at least one overall.
 	 */
-	xhci->nvecs = min(num_online_cpus() + 1,
-			  HCS_MAX_INTRS(xhci->hcs_params1));
+	xhci->nvecs = min(num_online_cpus() + 1, xhci->max_interrupters);
 
 	/* TODO: Check with MSI Soc for sysdev */
 	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
-- 
2.25.1


