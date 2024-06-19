Return-Path: <linux-usb+bounces-11439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF8090EBEA
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 15:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39B912839B3
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8ECE14B96E;
	Wed, 19 Jun 2024 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zs1TLHf5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E638315098D
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802081; cv=none; b=m7m8xAn4flR/5b4c1cH8P7b6CK0IecvXQuPL9Ckm+DD0lqumQVXGbfGWD46tdQHXoHD3IoGWZNEdkSM+fMoUz9ADsHXCYCh0NZHl0voMT3FebC+/wueMZqHr317y0Sppn/ifrgCrnYayrAJEKdzYrLSdIykVDWye9icAb5IW43M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802081; c=relaxed/simple;
	bh=ETz0h53BYwLAJiwuFSFgaqF56R5KnO4eNd47Q3C+Wt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pbHQIx1z/lGdm9ZUaDrXOhwcDNDmXyA8yMoDYAoDpQte7Fon80lj8AKB75CtaL9cJROXog4eyB5BttFz/eTz0XX9uvhREHGu9DA25R8Sdvh6lVWxj4eIZlKnP/2WycW2wHIzJTuZtomiOI8Fvbw9wcKtSxSCSSSRjqAZNgmlqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zs1TLHf5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718802081; x=1750338081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ETz0h53BYwLAJiwuFSFgaqF56R5KnO4eNd47Q3C+Wt8=;
  b=Zs1TLHf5vA34XPZ3dtNBz8/cdRz6uZKGSH3CpxF9ehzICxpt2qEPvrA/
   0CejnIA4562XXdi7D+pAQTyOquiYLYVuFkdGEbfQW7ftNIc7RHeDn4STH
   hpHOGFfXC4l6fXGHg7MGLpMgueVNh4oAh8RLo9lGuciTdkn2qWT90H/Wy
   Ep39ftKdyGWh3455Tay7CGovBtUhrcDHEne/jTf5FyR3vCL5LPzGEPxdZ
   IkTXDjz6DJ8KkBjEdNMQzydzdrOAqOpcwcajfKbVUAjOUcDH62+7R2RWY
   kSjIuFdzb/+Zrhrv6zSUXPpt2BlR8fuYp3YYqmAJ781Yvgh8plOaCYpEk
   g==;
X-CSE-ConnectionGUID: Utz5WnQ8Qr2+O+DK82xp4w==
X-CSE-MsgGUID: hhR20SY1TkOenUiMLrCtpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15868311"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15868311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:01:20 -0700
X-CSE-ConnectionGUID: T2XUgqX/S36QtffRnmehfA==
X-CSE-MsgGUID: 6FOrCKOxQzqfwUBPNdDF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="47040555"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 06:01:18 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Cc: mika.westerberg@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH 4/4] thunderbolt: Don't create device link from USB4 Host Interface to USB3 xHC host
Date: Wed, 19 Jun 2024 16:03:05 +0300
Message-Id: <20240619130305.2617784-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
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


