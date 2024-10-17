Return-Path: <linux-usb+bounces-16368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA819A22FF
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FBE72842B3
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2A91DDC30;
	Thu, 17 Oct 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rnp6Iw1B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C071DCB0F
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170446; cv=none; b=kttvbWosndyMLPnXzstIKhczgmHyHJE/on026faLZabkKqRgxGxH+mJdSrH/4GCQ0Zslijmlw7svS+OUFElnhWlPXA+uxbRSYikbTPaIFhwfHEHJn+/+d0MIvWbdsdI9p4kLfcCJabZssQkZjPQa6Aqp3C4IdASEbIRFEDdFwm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170446; c=relaxed/simple;
	bh=z2n1FeYVq8UyncIcSDhkjFb0zHQYpdJ6y2NEf4GoqMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mw0+cNV77iClaWqYRWRepO5aiUAjsDhRehFxUa73gSQyfxXn++4J/2TqZF76d5CQrwLSAvgBIid+EvekZ5n8XnNFj/bD48CXtm+oc4OOTyQqrosf+GpncFRltSwQmbvCHESAURrBppUiEk55So6h5HMniERStP5lBoXLJ0ip64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rnp6Iw1B; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170443; x=1760706443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z2n1FeYVq8UyncIcSDhkjFb0zHQYpdJ6y2NEf4GoqMU=;
  b=Rnp6Iw1BT69+Oi8GYon3qu2PqV6SKBDgIEyOEHHvf+17pR9dpIGcB24R
   qKWPucFAPgZciRYqeZ/qq5LuwJS1B2bKztqnjrSBzt7gFyeCxC3Gk+EI9
   V2DorY9yoydrCFIaEG1iJ2mL9TxEAqhurCGFCmdMd4e/FWq2HvszTXeIO
   pSCSVLkFt20AQh3XQztCVBKlNVd/3m3OH5zIQt/3gpWOyU6SR3Zc8dA5i
   Pu5l78du8urxjCdO4qt+6xxmpxLOdOjEKBZPU6B0kSarZOSNQBeRvVyt8
   BlHKF3PA7PsSL1V6ls/h+XIJO+tkjB3iKpJ40BLLd6o3ECpP8OIWSpVsr
   g==;
X-CSE-ConnectionGUID: X6dJ0cncTSeNc35dajT+rw==
X-CSE-MsgGUID: kthupZBKTCqr3Vz8UQK1dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32452108"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="32452108"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:22 -0700
X-CSE-ConnectionGUID: pJKfFqgBS66d9/pu4+RmUQ==
X-CSE-MsgGUID: rH8tv2OQQz+5uw/7d39jXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109354605"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 06:07:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 3B21E256; Thu, 17 Oct 2024 16:07:20 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/8] usb: xhci: request MSI/-X according to requested amount
Date: Thu, 17 Oct 2024 16:05:03 +0300
Message-ID: <20241017130508.1293021-4-niklas.neronin@linux.intel.com>
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

Variable 'max_interrupts' contains the maximum supported interrupters
or the maximum interrupters the user has requested. Thus, it should be
used instead of HCS_MAX_INTRS().

User set 'max_interrupts' value is validated in xhci_gen_setup(),
otherwise 'max_interrupts' value is 'HCS_MAX_INTRS(xhci->hcs_params1)'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 295d3297ca3d..96bfd0897835 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -148,14 +148,11 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
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
2.45.2


