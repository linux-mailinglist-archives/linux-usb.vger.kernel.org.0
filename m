Return-Path: <linux-usb+bounces-17179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A864C9BE3D6
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB281C23A98
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B661DD0C0;
	Wed,  6 Nov 2024 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsImwQUe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285F1DD531
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887973; cv=none; b=bHn16d7cKzJpraTOclG8H6Rqc1RsQrJ5rZJlPLTcMc6+RXu8EES8F4PGka1kmqYtCzmPdm01m139Z2xS7Tj1kIbBudlyE2m0gcUCeMI1JaXgVsIYgl72+oW4acxZEb+KxPpsZdEPFw3rblRCmkez2BhlIDIXPGw8/5Pd+iYVkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887973; c=relaxed/simple;
	bh=ugcV9trVXr0xSoK4Y+Bo2jHXVMHPVs76YmT75mcQFmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aJdlxPozm71KXsGJ55f1vpguODKpKnR9SUokwlMMlhdsttA4bqokvR5TlS9Rel/OzsFWjzwNyfeRkYaCcrrzOSVLXTzlEuDFgcnPTC9L/aityZoyggeLGsE+YfP43Mi6zyvARCMw7UlcI0ddKrLC4UxvQS/QDsn0LxM3My5QDR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsImwQUe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887972; x=1762423972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ugcV9trVXr0xSoK4Y+Bo2jHXVMHPVs76YmT75mcQFmQ=;
  b=RsImwQUeccZJOqy22jB2/+ciKLNJL4JAnkPrE4l/cHwUj3e1bb4lVWBu
   oG7B0FVylhTYoDd7tfwBdwd+hZhEjvUshIxdoTo1NPk8FvdHOnfTbgLhr
   XUV4ZFAJZusSVOOssKbOMtDUoUOTExGBnydeFF3fpET/g7EVnvgfcSgCQ
   3vHGXAKhTRAnQZiHM9C4LVxKDeJKPnshz6k4nFWjbaM3P0vb6rmfh3+qK
   0ilWHUYBUWULR2AHO1xmyRGrG0pf1WAspnSgE0k+4XbPu329bsA2/8d2K
   5jE6bby2yQyT1jIshF1ztpXhjkzkiMgzO0cOCJe+rqfXg8Lp1oVCVydyx
   w==;
X-CSE-ConnectionGUID: 2EsLOmM6T7edIo8G9x4OFQ==
X-CSE-MsgGUID: jmD2WuVbR5SA0HvxIaNeVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059380"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:52 -0800
X-CSE-ConnectionGUID: HnxxGNZRQNOx4FTC0xTFEw==
X-CSE-MsgGUID: zfIkgSd5SQir2s3XfdwQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812946"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:51 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 04/33] xhci: Cleanup Candence controller PCI device and vendor ID usage
Date: Wed,  6 Nov 2024 12:14:30 +0200
Message-Id: <20241106101459.775897-5-mathias.nyman@linux.intel.com>
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

Use predefined PCI vendor ID constant for Cadence controller in pci_ids.h
Rename the Candence device ID to match the pattern other PCI vendor and
device IDs use

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/linux-usb/ZuMOfHp9j_6_3-WC@surfacebook.localdomain
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 8c4f3e7507ba..7803ff1f1c9f 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -82,8 +82,7 @@
 #define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
 
-#define PCI_DEVICE_ID_CADENCE				0x17CD
-#define PCI_DEVICE_ID_CADENCE_SSP			0x0200
+#define PCI_DEVICE_ID_CDNS_SSP				0x0200
 
 static const char hcd_name[] = "xhci_hcd";
 
@@ -481,9 +480,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		if (pdev->device == 0x9203)
 			xhci->quirks |= XHCI_ZHAOXIN_TRB_FETCH;
 	}
-
-	if (pdev->vendor == PCI_DEVICE_ID_CADENCE &&
-	    pdev->device == PCI_DEVICE_ID_CADENCE_SSP)
+	if (pdev->vendor == PCI_VENDOR_ID_CDNS &&
+	    pdev->device == PCI_DEVICE_ID_CDNS_SSP)
 		xhci->quirks |= XHCI_CDNS_SCTX_QUIRK;
 
 	/* xHC spec requires PCI devices to support D3hot and D3cold */
-- 
2.25.1


