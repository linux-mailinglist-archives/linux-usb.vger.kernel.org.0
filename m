Return-Path: <linux-usb+bounces-27296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B528B359C1
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 12:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 472F93B183C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3AA318146;
	Tue, 26 Aug 2025 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJt2tb0X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3888279DAC
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202674; cv=none; b=pjBa2DoLxyI+TMW832e6Esj7lQeLJhWkiKdHfA9M/+w3XRAK0M/WgTlx3e69iMTstzMibPUj80/TYDZdGS3T+r+lIyx56h7N1g2tFkWVrKWfHSXOLRHD88xQM5cb1vgqv4Alqi7SfIw29f6ZqLf0kuv/rs4HKqckdWSkrj7SUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202674; c=relaxed/simple;
	bh=6Ums10L9rYkjfyjcnwLUeDHsXTsrT+NTbOC5F1pqVIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ANc4bguKixlb0LcMYbXllX6gDWulg0l/KbtnIsvtxUxx+/ybO35Xra9xgJ2gMeXGuz2UKKZAa7G+bQ4K1C5WRxpUdxthaeMjbW3kryY+9hzHm1uTc75AUIJdsaAZP9Hv7GJ78wYEXCk1jovBzVhTz5taeF0T5XQqT6NxEJXjUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJt2tb0X; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756202673; x=1787738673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6Ums10L9rYkjfyjcnwLUeDHsXTsrT+NTbOC5F1pqVIA=;
  b=UJt2tb0XEc4xZJSC3ejyK51jIhQ7i4AVDY6Jmk7ZLVETi8i0mMnZDjm2
   afl1KmHgTrkUHQT245SyMPGQ/Yid20zNBeHWUqMhb/rjIr7z3Zd46sswx
   NB5d6/MPIFPqrI1lTCY+rr6Fr8GFljJGe358NIeyPibTMJ3jV+GFzlMry
   YEBO9ZfKZYhIddKnq5q49oWoHZQgSlgpFhulRjx+LsyJGJX9YKPwis3qZ
   edRvVzXEtYyw2WiXUaNcSuvQ9A8QQUs1A4POXnh7EDR/oFKTsoEKU0hJ4
   /tYiWHyUJGZN1dvJS+4MbzNinkobVrbWIp6/G3sLmFYjTVQ/WQj8JHJOU
   A==;
X-CSE-ConnectionGUID: D1dqeWjOSYi4pd7UD3x93A==
X-CSE-MsgGUID: 5xshefTwQRqOaDqe7gGgFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69530914"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69530914"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 03:04:31 -0700
X-CSE-ConnectionGUID: wp2co67RSpm22NaqAk3Y9A==
X-CSE-MsgGUID: HMJrGs4HScO06Ln/jsXDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169444665"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 26 Aug 2025 03:04:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 09B2295; Tue, 26 Aug 2025 12:04:28 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Nick Nielsen <nick.kainielsen@free.fr>,
	grm1 <grm1@mailbox.org>
Subject: [PATCH] usb: xhci-pci: add support for hosts with zero USB3 ports
Date: Tue, 26 Aug 2025 12:04:16 +0200
Message-ID: <20250826100416.207129-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/usb/host/xhci-pci.c | 44 +++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 19 deletions(-)

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
+
+	xhci->allow_single_roothub = 1;
+	if (!xhci_has_one_roothub(xhci)) {
+		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
+							 pci_name(dev), hcd);
+		if (!xhci->shared_hcd) {
+			retval = -ENOMEM;
+			goto dealloc_usb2_hcd;
+		}
+
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
 	}
 
-	retval = xhci_ext_cap_init(xhci);
-	if (retval)
-		goto put_usb3_hcd;
-
-	retval = usb_add_hcd(xhci->shared_hcd, dev->irq,
-			IRQF_SHARED);
-	if (retval)
-		goto put_usb3_hcd;
-	/* Roothub already marked as USB 3.0 speed */
-
-	if (!(xhci->quirks & XHCI_BROKEN_STREAMS) &&
-			HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	usb3_hcd = xhci_get_usb3_hcd(xhci);
+	if (usb3_hcd && !(xhci->quirks & XHCI_BROKEN_STREAMS) && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+		usb3_hcd->can_do_streams = 1;
 
 	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
 	pm_runtime_put_noidle(&dev->dev);
-- 
2.50.1


