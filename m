Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B904169E53
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 07:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgBXGVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 01:21:50 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1715 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgBXGVu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 01:21:50 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e536b5a0000>; Sun, 23 Feb 2020 22:21:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 23 Feb 2020 22:21:49 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 23 Feb 2020 22:21:49 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Feb
 2020 06:21:49 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Feb 2020 06:21:49 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.125]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e536b7b0000>; Sun, 23 Feb 2020 22:21:49 -0800
From:   JC Kuo <jckuo@nvidia.com>
To:     <mathias.nyman@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Date:   Mon, 24 Feb 2020 14:21:45 +0800
Message-ID: <20200224062145.25785-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582525275; bh=qzfaECbdr4ykASrTm8dC9mRKYUL+OV7uzjoJlDqFq0w=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=kd/zD6viGyQiXU1XeTN/j3IFCHoW8RhKMk+9CtHDAGg63DeV+Sy4lke/vD5rm17aZ
         XDTE3BNBM26iczA8HbHgmAKCtAFZQGkYGPtTkIXi6rrficwxwkmu6/lPvmzYwDZzOQ
         z5QYI/igjmJYA7E1eF0kqKE7Q/+oACZbb9zTPrWFxma+1ubC3KquK9cWUIfPKmV8wG
         j8blfBXJQdKKKWMZ6+w/QKaigscDFi5Fy0rwd6Wmnr2HjocKGGQECKsXcHhIpPl+oC
         S2nn8OQoGe21Ew6DHH/pJrtQuNL6WkiSITKty/KOft4MoPwZKZBE8SnKiYJXoRxfma
         CutVIpq16LN4A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
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

