Return-Path: <linux-usb+bounces-17196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084C9BE3EF
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 763171C23A04
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0481DE2A8;
	Wed,  6 Nov 2024 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcYCUCxJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B71DE2A6
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888000; cv=none; b=Vw8LDi2ode309oZ0Z7DRTzkvJQjGrlxko5goCHr/tQGFClv21WX4EEy/eKxlq/fM19DRBfZtm8XS3BNhLXxN8WHKKtfQ2dJJDh/GZ0utCErQh54D9waRoL/3+FtGfbIqhHQ/1VyTVNyfOM45Su/mamQBiYf/bFcc+5sdRytfmso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888000; c=relaxed/simple;
	bh=pygn/q4V3e2cG8IeM9yyEYRr7LoxDHOYGo6K0xzJAfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpkxYX/0a4yo9/PxTp8Nn4Gcj37OzgEFgvOQlh3EzIYYbnJCH6URGjyBTu9SGM99qKo9bSYbeKOoXCucbvsm0L09dpcclhkUtlqq97e7yJlW8lnFxvgkVlx0ItRmqApYOSc/+5BzhE6WtSLicsyqkcu//YBus21DMI6T1EuYFh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcYCUCxJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887999; x=1762423999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pygn/q4V3e2cG8IeM9yyEYRr7LoxDHOYGo6K0xzJAfw=;
  b=GcYCUCxJcV2tBtx143DrkJE3ASuViUZws9nk+YxtfsqXDSMnyefgaPQa
   Angogp9rzTL/MaceBdslx1Mh98Ob6QQiSAEueZX82+9aj7tM9AL980wgF
   aNwWNhaocQALuhOsDKgUnVKtU4U2/vQWcqKF3q7emU91I93MfvpIIgG0E
   UDEfGKzV8XKmSYFye0yYZm75Lmn1YRYL7t3zLXqBjI89Pk/cuNJtRk4us
   KDlg87CkiO79POG+iWOG3kLTVRYO1pWB+/3uqiOQeWSPCLMe0TK1WcMHT
   lqpznLuUF+WgvBpgOnK5qcADS1bUbqzrOfXONkpBKKWhX3H0pJd2ST6Y6
   g==;
X-CSE-ConnectionGUID: AJ0z4E/pTXWPZfdoF0QYOA==
X-CSE-MsgGUID: zQTkypOlQ9KKdYKuER/SPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059439"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:19 -0800
X-CSE-ConnectionGUID: NrjU9XdDRZuzz05o6X4s1Q==
X-CSE-MsgGUID: 0BXSviNdQi2jYb7bcsug/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813303"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:18 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 21/33] xhci: pci: Use standard pattern for device IDs
Date: Wed,  6 Nov 2024 12:14:47 +0200
Message-Id: <20241106101459.775897-22-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The definitions of vendor IDs follow the pattern PCI_VENDOR_ID_#vendor,
while device IDs — PCI_DEVICE_ID_#vendor_#device.

Update the ETRON device IDs to follow the above mentioned pattern.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 0d49d9c390c1..77f9fe7a7dcd 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -34,9 +34,9 @@
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1100	0x1100
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1400	0x1400
 
-#define PCI_VENDOR_ID_ETRON		0x1b6f
-#define PCI_DEVICE_ID_EJ168		0x7023
-#define PCI_DEVICE_ID_EJ188		0x7052
+#define PCI_VENDOR_ID_ETRON			0x1b6f
+#define PCI_DEVICE_ID_ETRON_EJ168		0x7023
+#define PCI_DEVICE_ID_ETRON_EJ188		0x7052
 
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_XHCI	0x8c31
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
@@ -394,8 +394,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-	    (pdev->device == PCI_DEVICE_ID_EJ168 ||
-	     pdev->device == PCI_DEVICE_ID_EJ188)) {
+	    (pdev->device == PCI_DEVICE_ID_ETRON_EJ168 ||
+	     pdev->device == PCI_DEVICE_ID_ETRON_EJ188)) {
 		xhci->quirks |= XHCI_ETRON_HOST;
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
 		xhci->quirks |= XHCI_BROKEN_STREAMS;
-- 
2.25.1


