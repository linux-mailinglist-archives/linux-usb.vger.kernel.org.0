Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F20EDBA3
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 10:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfKDJYm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 04:24:42 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6362 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKDJYm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 04:24:42 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dbfee600000>; Mon, 04 Nov 2019 01:24:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 04 Nov 2019 01:24:41 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 04 Nov 2019 01:24:41 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 09:24:41 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 4 Nov 2019 09:24:41 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.64.167]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dbfee570004>; Mon, 04 Nov 2019 01:24:40 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Jui Chang Kuo <jckuo@nvidia.com>
Subject: [PATCH] usb: host: xhci-tegra: Correct phy enable sequence
Date:   Mon, 4 Nov 2019 14:54:30 +0530
Message-ID: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1572859488; bh=RFXs93kDgmlahI7lrTRPD8rfdmpUWrhoKk+mN99g/nU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=ZcUpLjkwA88nAd6XFZnyyqWhqDafQcElCDPQNedMCFCT4AVM3wvd9CPdWYpbHwbFs
         3o3i3bZUE5L3yakooBT41gZBHDIwGYWogwKBHBnTNYmOpYRmkBu5ul9hzhmGBqMnuP
         8UqpfvZ/Cz4ke38VmpoJCNfOMkkcqKsQFTEVKxa4dkYMuyFNvp2vTpQ08JB2yF8qKQ
         QUphWVSUy2u6waBN6q739VufYWwqGCbq5/KGLCP44QXCcm7MzHKHGwEOScjR6mk4Ic
         gGX1G2+D7vVmH4AWc8a7f8g/sUaaCu2G1kPjJ2njVfT/xZOKz6q0jjSuX2z6UgzAH1
         VRoL419CiQAEQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

XUSB phy needs to be enabled before un-powergating the power partitions.
However in the current sequence, it happens opposite. Correct the phy
enable and powergating partition sequence to avoid any boot hangs.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Signed-off-by: Jui Chang Kuo <jckuo@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 540b47a..bf90654 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -763,7 +763,6 @@ static int tegra_xusb_runtime_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 
-	tegra_xusb_phy_disable(tegra);
 	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 	tegra_xusb_clk_disable(tegra);
 
@@ -787,16 +786,8 @@ static int tegra_xusb_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}
 
-	err = tegra_xusb_phy_enable(tegra);
-	if (err < 0) {
-		dev_err(dev, "failed to enable PHYs: %d\n", err);
-		goto disable_regulator;
-	}
-
 	return 0;
 
-disable_regulator:
-	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 disable_clk:
 	tegra_xusb_clk_disable(tegra);
 	return err;
@@ -1188,6 +1179,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	 */
 	platform_set_drvdata(pdev, tegra);
 
+	err = tegra_xusb_phy_enable(tegra);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
+		goto put_hcd;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	if (pm_runtime_enabled(&pdev->dev))
 		err = pm_runtime_get_sync(&pdev->dev);
@@ -1196,7 +1193,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
-		goto disable_rpm;
+		goto disable_phy;
 	}
 
 	tegra_xusb_config(tegra, regs);
@@ -1282,9 +1279,11 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 put_rpm:
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra_xusb_runtime_suspend(&pdev->dev);
-disable_rpm:
-	pm_runtime_disable(&pdev->dev);
+put_hcd:
 	usb_put_hcd(tegra->hcd);
+disable_phy:
+	tegra_xusb_phy_disable(tegra);
+	pm_runtime_disable(&pdev->dev);
 put_powerdomains:
 	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
 		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
@@ -1321,6 +1320,8 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
 	}
 
+	tegra_xusb_phy_disable(tegra);
+
 	tegra_xusb_padctl_put(tegra->padctl);
 
 	return 0;
-- 
2.7.4

