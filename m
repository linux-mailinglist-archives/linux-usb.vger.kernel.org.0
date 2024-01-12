Return-Path: <linux-usb+bounces-4963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4DF82C1CF
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 15:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A6F1F209B4
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 14:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43846DCF6;
	Fri, 12 Jan 2024 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPt1xeb0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9276DCE7
	for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705069682; x=1736605682;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eGdTeQJ8LSbSqhUizUePA0IdZ2HyhrZzicm4TFQDNRw=;
  b=dPt1xeb0A2Z6PAJNhu1GQiqce79y+I4LOkE4xGOr3MjNViixaA943ew9
   xWqF0H87kJFAa6XmrZfbxCPgOnY0VdMUPGeGSjPOZg0t/5hJorPlvnNH5
   eqw5uBrFOtOogFNvAHa5gXw2t434n58rai3j0vclG05jn8UYzP+EpocmH
   FLh6ZOhAM5EvGBAmP5sMhksyUroLnUG5HO1uBNAu4Goz5mhJmxwwXJIS6
   s6qnH/MZcjUcVzrfMZOVDt/PNc2xW1WpgVy1kNR5JaYvFcqvgZ2q1tvDb
   nAqK0h9nWRXJ0tWaivBBPRlv9lGMCJKraNLBCPEhOOrDoI1/ey0+tnelw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="485359913"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="485359913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 06:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="926409726"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="926409726"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2024 06:27:59 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Arrow Lake-H
Date: Fri, 12 Jan 2024 16:27:58 +0200
Message-ID: <20240112142758.3823690-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the necessary PCI ID for Intel Arrow Lake-H
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 6604845c397c..39564e17f3b0 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -51,6 +51,8 @@
 #define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
 #define PCI_DEVICE_ID_INTEL_MTLS		0x7f6f
 #define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
+#define PCI_DEVICE_ID_INTEL_ARLH		0x7ec1
+#define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 #define PCI_DEVICE_ID_AMD_MR			0x163a
 
@@ -421,6 +423,8 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, MTLP, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTL, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLS, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, ARLH, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGL, &dwc3_pci_intel_swnode) },
 
 	{ PCI_DEVICE_DATA(AMD, NL_USB, &dwc3_pci_amd_swnode) },
-- 
2.43.0


