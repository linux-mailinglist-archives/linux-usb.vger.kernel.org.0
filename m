Return-Path: <linux-usb+bounces-28241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFBDB81E3F
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E6E8174EC6
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B602E1C69;
	Wed, 17 Sep 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TG3bN1dK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709AD2DF13C
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143297; cv=none; b=okRLCxHs3jTIlNlrVj5lUWXgHSwcDocZ3ewC03eQdQeRq/JqOMh55Kiwu2mycpa6WPHpl9PEb9LAhPCi2zpPNr5XsEuvnHFMIK+Oo6bnVeaxR6420T17SrKnVkMISPpTuenC9vW3sBPlq15hx3GaTnP8mZDpecL2Wlyq0MK8ngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143297; c=relaxed/simple;
	bh=bhVFyI3Ozwjh+hnzGUTmltuVXMg6Tfw1qH9DpNvjCr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svMjRAxFaO+gu1iz7LwV/IFE5euFwemenQvT0d2TF6EIVVny6GUh1eUBfcXL1RVki2hmUa6Mck+Sp0i46N745Dnr8ATXpiPdHJLft33JTSFypKOUdm10MI6kvuY7X/w+bGdWL32gCPV0Ld1zbtquER5S93doR+GzVJBNyg9YhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TG3bN1dK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143295; x=1789679295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bhVFyI3Ozwjh+hnzGUTmltuVXMg6Tfw1qH9DpNvjCr8=;
  b=TG3bN1dKQnhQDnBOK8tNgHGyuDtnhxjPlZSo2Uh5tBbYzTs/OqcN0m5d
   /MLW6ojZPHZG4Vnkla9ZKO/jAfZBR9HapQBA47rsVCW4AP2uCa2q0JK5q
   2W5ATK5o90OtTGVW4aqobma+Z8SxUuNIaes24/Cek4iDAQgge/iFjcm9X
   fncOE2xybX+JsJmth/IX7SX00Vn77Ev+Wbw3iLKN2YhTut4LiBKpgwHEk
   +sHy1qasZv2E5UV9z0uAUsKoVPMRi/6XC68tZ1GSLVLB7wnjy0Vhvq3HD
   zAIYQfAcINAtK6vw+wLNBtX3ii5eTRP4MXKOg2Y/QFjtdq+g0A5JwhqbQ
   w==;
X-CSE-ConnectionGUID: Lq42PlCuTwi1FHUAhSkJ3g==
X-CSE-MsgGUID: FtwUUXDORbWVVx0NCr9kMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48038213"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="48038213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:08:15 -0700
X-CSE-ConnectionGUID: 6lvfMaK7RaK8xWLnKERCJQ==
X-CSE-MsgGUID: mxd6caYSRnakzys7Rn4kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175800202"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.42])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 14:08:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Nick Nielsen <nick.kainielsen@free.fr>,
	grm1 <grm1@mailbox.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/6] usb: xhci-pci: add support for hosts with zero USB3 ports
Date: Thu, 18 Sep 2025 00:07:22 +0300
Message-ID: <20250917210726.97100-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Add xhci support for PCI hosts that have zero USB3 ports.
Avoid creating a shared Host Controller Driver (HCD) when there is only
one root hub. Additionally, all references to 'xhci->shared_hcd' are now
checked before use.

Only xhci-pci.c requires modification to accommodate this change, as the
xhci core already supports configurations with zero USB3 ports. This
capability was introduced when xHCI Platform and MediaTek added support
for zero USB3 ports.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220181
Tested-by: Nick Nielsen <nick.kainielsen@free.fr>
Tested-by: grm1 <grm1@mailbox.org>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 42 +++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 00fac8b233d2..5c8ab519f497 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -610,7 +610,7 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int retval;
 	struct xhci_hcd *xhci;
-	struct usb_hcd *hcd;
+	struct usb_hcd *hcd, *usb3_hcd;
 	struct reset_control *reset;
 
 	reset = devm_reset_control_get_optional_exclusive(&dev->dev, NULL);
@@ -636,26 +636,32 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	hcd = dev_get_drvdata(&dev->dev);
 	xhci = hcd_to_xhci(hcd);
 	xhci->reset = reset;
-	xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
-						 pci_name(dev), hcd);
-	if (!xhci->shared_hcd) {
-		retval = -ENOMEM;
-		goto dealloc_usb2_hcd;
-	}
 
-	retval = xhci_ext_cap_init(xhci);
-	if (retval)
-		goto put_usb3_hcd;
+	xhci->allow_single_roothub = 1;
+	if (!xhci_has_one_roothub(xhci)) {
+		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
+							 pci_name(dev), hcd);
+		if (!xhci->shared_hcd) {
+			retval = -ENOMEM;
+			goto dealloc_usb2_hcd;
+		}
 
-	retval = usb_add_hcd(xhci->shared_hcd, dev->irq,
-			IRQF_SHARED);
-	if (retval)
-		goto put_usb3_hcd;
-	/* Roothub already marked as USB 3.0 speed */
+		retval = xhci_ext_cap_init(xhci);
+		if (retval)
+			goto put_usb3_hcd;
+
+		retval = usb_add_hcd(xhci->shared_hcd, dev->irq, IRQF_SHARED);
+		if (retval)
+			goto put_usb3_hcd;
+	} else {
+		retval = xhci_ext_cap_init(xhci);
+		if (retval)
+			goto dealloc_usb2_hcd;
+	}
 
-	if (!(xhci->quirks & XHCI_BROKEN_STREAMS) &&
-			HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	usb3_hcd = xhci_get_usb3_hcd(xhci);
+	if (usb3_hcd && !(xhci->quirks & XHCI_BROKEN_STREAMS) && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+		usb3_hcd->can_do_streams = 1;
 
 	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
 	pm_runtime_put_noidle(&dev->dev);
-- 
2.43.0


