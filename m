Return-Path: <linux-usb+bounces-14401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2196654D
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 17:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F0A1F25223
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09761B5ED0;
	Fri, 30 Aug 2024 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANos+/Ru"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F41B5818
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725031482; cv=none; b=L8CaQ9ndZgsu92hnyz2+nZJV2TnJUoinJPjWu2B1X9K75BwZjrsrbBhtFbHJSmMJFCiCqkJ/UJxdu0NfxoTtk6rl+TBLp7rITzxYzcEzHfwE4z8JgiVhcIEcBFPNlSF2FotsKw3whw/jVkCj0d1l5MAjuLXqQdV2xZBX+kb2hpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725031482; c=relaxed/simple;
	bh=1a4BEl/a3n4EvTDjun1yx6BvmqO2xegJ6/FvOKAhuK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Trq2pHbM7Zozwn2Q2YEukMYxfXAAlLcAW5pN4TlOhvhJKrJOmPcifnSog2K33h/VcwvpEvx9OVEa46eeULA4tRNj1Sah9zDd6W3rii62SBnEQGbqwwwiTah/kpEbX+vfAbrU6tfiiLJkpEuYFu9VNQMz0MHtwstXJY4ghA97i9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANos+/Ru; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725031481; x=1756567481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1a4BEl/a3n4EvTDjun1yx6BvmqO2xegJ6/FvOKAhuK4=;
  b=ANos+/Ru0VDLfdYKFyKk9U7650jejw8Wlsx807sEB1oVYfTdsl/aaM5+
   m0ikBgCWLGHFOvB2IwVPg3EnffpYxPEuOPw0bALknHoD8oGoZ3zPAuJDY
   gCQZq4pnQMuqMZ0HYQihZkwQtDgrVNYvKoI1CHp6sn2BEBF44YSQK6EH3
   7lyLHcfmMkQ1MGSHTWo92rpe37M28+XhiyktVGppl4J1MZfVs4c0Ptgh2
   a5k3jEkFRdpMp4kdfh9jxjfq8rd6OIDvz2J49p9UgqGQXc8i9NUSaHp1P
   nSqH0+8OwGnDk0ffF0F87uyMreodd3Hr9iXsWdiZp7EHT/q2E+nzzR+eY
   w==;
X-CSE-ConnectionGUID: EelKEML2R4Ss6Dtbf7W/3A==
X-CSE-MsgGUID: tKygKLxoT52pxBGeb69Skg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23861963"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23861963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 08:24:40 -0700
X-CSE-ConnectionGUID: sBzy5m+3SZqGs5Bik6+GOQ==
X-CSE-MsgGUID: KYqLVH3YRRO82D+kCxPh9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63981655"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2024 08:24:38 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com,
	mario.limonciello@amd.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH v2 4/4] thunderbolt: Don't create device link from USB4 Host Interface to USB3 xHC host
Date: Fri, 30 Aug 2024 18:26:30 +0300
Message-Id: <20240830152630.3943215-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB core will create device links between tunneled USB3 devices and
USB4 Host Interface during USB device creation.

Those device links are removed with the tunneled USB3 devices, allowing
USB4 Host Interface to runtime suspend if USB3 tunnels are not used.

So remove device link creation between USB4 Host Interface and USB3 xHC
during NHI probe

Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Reported-by: Saranya Gopal <saranya.gopal@intel.com>
Tested-by: Saranya Gopal <saranya.gopal@intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
v2:
 no change

 drivers/thunderbolt/acpi.c | 40 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index c9b6bb46111c..d2a0054217da 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -32,40 +32,20 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 		goto out_put;
 
 	/*
-	 * Try to find physical device walking upwards to the hierarcy.
-	 * We need to do this because the xHCI driver might not yet be
-	 * bound so the USB3 SuperSpeed ports are not yet created.
+	 * Ignore USB3 ports here as USB core will set up device links between
+	 * tunneled USB3 devices and NHI host during USB device creation.
+	 * USB3 ports might not even have a physical device yet if xHCI driver
+	 * isn't bound yet.
 	 */
-	do {
-		dev = acpi_get_first_physical_node(adev);
-		if (dev)
-			break;
-
-		adev = acpi_dev_parent(adev);
-	} while (adev);
-
-	/*
-	 * Check that the device is PCIe. This is because USB3
-	 * SuperSpeed ports have this property and they are not power
-	 * managed with the xHCI and the SuperSpeed hub so we create the
-	 * link from xHCI instead.
-	 */
-	while (dev && !dev_is_pci(dev))
-		dev = dev->parent;
-
-	if (!dev)
+	dev = acpi_get_first_physical_node(adev);
+	if (!dev || !dev_is_pci(dev))
 		goto out_put;
 
-	/*
-	 * Check that this actually matches the type of device we
-	 * expect. It should either be xHCI or PCIe root/downstream
-	 * port.
-	 */
+	/* Check that this matches a PCIe root/downstream port. */
 	pdev = to_pci_dev(dev);
-	if (pdev->class == PCI_CLASS_SERIAL_USB_XHCI ||
-	    (pci_is_pcie(pdev) &&
-		(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ||
-		 pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM))) {
+	if (pci_is_pcie(pdev) &&
+	    (pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ||
+	     pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM)) {
 		const struct device_link *link;
 
 		/*
-- 
2.25.1


