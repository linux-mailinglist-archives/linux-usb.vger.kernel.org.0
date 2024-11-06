Return-Path: <linux-usb+bounces-17197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1D9BE3F0
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38368288E5D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689CA1DE4F4;
	Wed,  6 Nov 2024 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN2T5QBj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439D1DE3D5
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888002; cv=none; b=EVTh4OnMcx13pdrYoWFU6GDcI0yiYmos09aHvuDoR5WvJzOtFLg1CiqZln2U4xiiQImO6SiDmD8HSDUQKewFHl0Jwo7S+K8ma6t+y1KKZ2lEy8IVtYmuOnuaypJvHQkHgftjcjQyb+Tk1z+r9DDqUj7taKvzVWEe9BU8Igk6q7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888002; c=relaxed/simple;
	bh=aZ2KXzdd9Gc95HmwOlL086nrEzEE8sFdxs1AcH6PeGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TNa0Aj/mRgn1+veGiS/wK/yL6xqr+pgd4aFAU8CkUe93n9JJhYxg57/bFEdRTjzxqLqZueNxl8N9wZSrHbl/Pv8CKw0shAwzpWozvmCH+T1rlYW5CfxmJcP6Xak8zR5RxNgoDNVSCxO7PP9NwSNqi2gzyrqUq8iI7JLoa/GpULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN2T5QBj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888000; x=1762424000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZ2KXzdd9Gc95HmwOlL086nrEzEE8sFdxs1AcH6PeGA=;
  b=QN2T5QBjriUBM7DoxV7NbB7S1WSf91Ru71bnn5lRwBqpbl7WVXops45R
   s7/4ggyIfVwr9p6vTUEopmj2rZX7nTglnWGDMNz+5WOtq/sFhTFn+dZJv
   /mQnPBM/04Q0ebfoYbvRLJjh0i0VQLlEVwhGzfYn5nmMDLmj8KhEf22tD
   iD0INOwZbaf4IaXEYlFrAGZ1OkQQdaSLXOf+8lOo/83r9n8cZB2OLbsGD
   wNQD+PUaemTttv/wrDw9M/vXzgPvQWffWE4KXntHrLxhTgEgztwkr73Co
   9/CNWJKwW2G6dkbguGYki/hHVFNtpeIDBJ0JHK1LB2RkFGlactN9JGkMC
   Q==;
X-CSE-ConnectionGUID: XHptCIjaSqWiMC2GBH7fhw==
X-CSE-MsgGUID: 7Tm5XPieTaCB3/Bf73EKig==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059445"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:20 -0800
X-CSE-ConnectionGUID: HLHQYCo5TACe7rCEuceEZQ==
X-CSE-MsgGUID: CR1ne/g+Rs2atc9wnopzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813317"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:19 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 22/33] xhci: pci: Fix indentation in the PCI device ID definitions
Date: Wed,  6 Nov 2024 12:14:48 +0200
Message-Id: <20241106101459.775897-23-mathias.nyman@linux.intel.com>
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Some of the definitions are missing the one TAB, add it to them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 77f9fe7a7dcd..b1f4dd3f9eff 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -28,8 +28,8 @@
 #define SPARSE_CNTL_ENABLE	0xC12C
 
 /* Device for a quirk */
-#define PCI_VENDOR_ID_FRESCO_LOGIC	0x1b73
-#define PCI_DEVICE_ID_FRESCO_LOGIC_PDK	0x1000
+#define PCI_VENDOR_ID_FRESCO_LOGIC		0x1b73
+#define PCI_DEVICE_ID_FRESCO_LOGIC_PDK		0x1000
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1009	0x1009
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1100	0x1100
 #define PCI_DEVICE_ID_FRESCO_LOGIC_FL1400	0x1400
@@ -38,8 +38,8 @@
 #define PCI_DEVICE_ID_ETRON_EJ168		0x7023
 #define PCI_DEVICE_ID_ETRON_EJ188		0x7052
 
-#define PCI_DEVICE_ID_INTEL_LYNXPOINT_XHCI	0x8c31
-#define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
+#define PCI_DEVICE_ID_INTEL_LYNXPOINT_XHCI		0x8c31
+#define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI		0x9c31
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_LP_XHCI	0x9cb1
 #define PCI_DEVICE_ID_INTEL_CHERRYVIEW_XHCI		0x22b5
 #define PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_XHCI		0xa12f
-- 
2.25.1


