Return-Path: <linux-usb+bounces-7883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0D87934D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 12:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4081F236AC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 11:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E17879B9D;
	Tue, 12 Mar 2024 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL8a7gdf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5038678662
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244212; cv=none; b=LIFB94GOrfcinSG3hnDUJMjSsjc6QfGH7PyYaa8VzXTBEFVJExksRxNFvX4Jign8gmdEHcJzkidMVegYki7J6cmdIJqxvOEr7q6CtW74gVsRHhY1zHaO2BbiYBw9mlmmfBpLJn8nKrOis7+i9p+3RqR/O9vjWjd/BvvJpl5DYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244212; c=relaxed/simple;
	bh=2vDoUBYGYIR/fEDdQMSo3uypJjG5zznCTGXoNZPlQSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPYRDRCFRBUbzxM7iaX0XA0q+GQ/ux0p2R1FtzwKZJs74Xt/CSumGtBYtUSvofpWRHh3LAXJeYfDI7iYgkhSj3QbBx6L5hnWf2Bj4pkT96oUmzTwpThZX19MyOv3ciedXkK1m2zEVMhgOSj1s6jPWCCX+ePeaQJaOJZyzTBVZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL8a7gdf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710244211; x=1741780211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2vDoUBYGYIR/fEDdQMSo3uypJjG5zznCTGXoNZPlQSU=;
  b=nL8a7gdfTd9Tay+9C8XbxbnJD2+XXN9h4hw8F2/iE43S5sp/+ZrtF6nx
   o6MbyslSvCWUd+zvYEbtZA8CN/ZuNC6vZjLTc6zdrEMH57UTr5qxscMd+
   Ew45+W/B9Zh0xzip38rL1XeQxnR026CutHFjzIJnwVvHoZ7vEYkLl7uQc
   ZWVsRZFg76JZ+o1C4WYZgp6Gdv0gaqAhjgpSuUNhMxEC0m3UzVxgBj0FN
   EUvBeuM3okCl2Z6NmbRELH3Avzw3cOwIyjoOtrWwQamq2bmpUvXd/wYTW
   WimovbLgvLBmpnDKONq8qf/EAXNe2MOzOSBrskEAbUStnTYxefeuAor56
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5134834"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5134834"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 04:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="937051710"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="937051710"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2024 04:50:09 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: dwc3: pci: Drop duplicate ID
Date: Tue, 12 Mar 2024 13:50:08 +0200
Message-ID: <20240312115008.1748637-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Arrow Lake CPU uses the Meteor Lake ID with this
controller (the controller that's part of the Intel Arrow
Lake chipset (PCH) does still have unique PCI ID).

Fixes: de4b5b28c87c ("usb: dwc3: pci: add support for the Intel Arrow Lake-H")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 39564e17f3b0..497deed38c0c 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -51,7 +51,6 @@
 #define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
 #define PCI_DEVICE_ID_INTEL_MTLS		0x7f6f
 #define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
-#define PCI_DEVICE_ID_INTEL_ARLH		0x7ec1
 #define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 #define PCI_DEVICE_ID_AMD_MR			0x163a
@@ -423,7 +422,6 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, MTLP, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTL, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLS, &dwc3_pci_intel_swnode) },
-	{ PCI_DEVICE_DATA(INTEL, ARLH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGL, &dwc3_pci_intel_swnode) },
 
-- 
2.43.0


