Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC482183374
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 15:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgCLOnG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 10:43:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:50332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727770AbgCLOnG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 10:43:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 07:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; 
   d="scan'208";a="443955841"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:43:04 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, JC Kuo <jckuo@nvidia.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/9] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Date:   Thu, 12 Mar 2020 16:45:13 +0200
Message-Id: <20200312144517.1593-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
References: <20200312144517.1593-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 8163aefc6c6b..a6e36b3c968f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -203,6 +203,7 @@ struct tegra_xusb_soc {
 
 	bool scale_ss_clock;
 	bool has_ipfs;
+	bool lpm_support;
 };
 
 struct tegra_xusb_context {
@@ -1779,6 +1780,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
 		.data_out = 0xec,
 		.owner = 0xf0,
 	},
+	.lpm_support = true,
 };
 
 static const char * const tegra194_supply_names[] = {
@@ -1808,6 +1810,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 		.data_out = 0x70,
 		.owner = 0x74,
 	},
+	.lpm_support = true,
 };
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
 
@@ -1832,7 +1835,11 @@ static struct platform_driver tegra_xusb_driver = {
 
 static void tegra_xhci_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+
 	xhci->quirks |= XHCI_PLAT;
+	if (tegra && tegra->soc->lpm_support)
+		xhci->quirks |= XHCI_LPM_SUPPORT;
 }
 
 static int tegra_xhci_setup(struct usb_hcd *hcd)
-- 
2.17.1

