Return-Path: <linux-usb+bounces-16370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017B9A2304
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0789B21460
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD3C1DDA2E;
	Thu, 17 Oct 2024 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjfziLSf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0791DDC02
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170449; cv=none; b=BE/jGHN59Rz4g2ObX+ukpHTuKJDOQdhSTNdPsWUWShGb+SQO+Ksn05NRLJMWFeSKnu7Nut4Zis9RCtkWfZBvi9mAf5o0Fgvj7dX0cg5/NG//B0a4vgPk+aUmo0+fUgwAarOOyvJ3nCMXXjX1kmxOVdmivtlsq+Lgmq4xhOnD8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170449; c=relaxed/simple;
	bh=E1u77zsKj3wLAgWtxG/RaFxPoA1UvazYJzRnBY/vJso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4073XvA+Y52RkN2BJUYPrRrvMT1P45yNO2wi0/nHqCrHB1R8i4K0euTjKgwhQNLVTwcaiO5X4nOdtz5yJqTrxte8Lo8QcAeG5XTInGr8ywwxcznXKqarmbD26dWdnpF+O40Z3HX1pd11H5seyjSPtg53hwwmjD0mL8N76UvkUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjfziLSf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170445; x=1760706445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1u77zsKj3wLAgWtxG/RaFxPoA1UvazYJzRnBY/vJso=;
  b=gjfziLSfuOxzfxu6+dMZvpSO2m80vEeDM2HhOYVNtX/RrjvDPvcVDblZ
   trgty19xjXqlMf9QnCP6OsCkLHXpFjTjY2C1gKPVjJvMowYFMLypLx9ON
   rAht0YvIvvdOp2xnh7uiBtb4HYdFBBR8JepE55jHDkZp9rTuSVlf9poYR
   W3wtnMW0WBA0oUe3OxFf1MN3ajkTmEWsEkFj4NV/PX2En7c7q+PBML91c
   MN1jlbWkwekbWNbxhOEBj1H+/8MCLnwq4yitHuFQzF2N91nY83XD/gIRo
   JgMlkh4Km3mAXPttvLGrnBwE0EnvKXW+jOR8i/S73WQX6CCbxDZp6mmqh
   Q==;
X-CSE-ConnectionGUID: qkPnKZYzSneab4maKHG4Pg==
X-CSE-MsgGUID: vtvT4qG5Qd2JUKbQgyPCFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39290394"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="39290394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:25 -0700
X-CSE-ConnectionGUID: yN1yel9aQCyt2BpaAZQcIQ==
X-CSE-MsgGUID: CDU3QkHlSUGlPGpt+FY9Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78882324"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2024 06:07:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 9052536B; Thu, 17 Oct 2024 16:07:23 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 8/8] usb: xhci: remove irrelevant comment
Date: Thu, 17 Oct 2024 16:05:08 +0300
Message-ID: <20241017130508.1293021-9-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code which it is referencing does not exist in the same function,
or the file for that matter. Since it was added [1], the Interrupter
Moderation Interval can be changed within xhci addon, e.g. PCI
xhci_pci_setup().

[1], commit 0ebbab374223 ("USB: xhci: Ring allocation and initialization.")

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4295e9a4de50..15db90c54a45 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2512,11 +2512,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	ir->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
-	/*
-	 * XXX: Might need to set the Interrupter Moderation Register to
-	 * something other than the default (~1ms minimum between interrupts).
-	 * See section 5.5.1.2.
-	 */
 	for (i = 0; i < MAX_HC_SLOTS; i++)
 		xhci->devs[i] = NULL;
 
-- 
2.45.2


