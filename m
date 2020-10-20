Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6452905F5
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 15:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408210AbgJPNJY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 09:09:24 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2802 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406661AbgJPNId (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 09:08:33 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899b250002>; Fri, 16 Oct 2020 06:07:49 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:28 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:26 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 15/16] usb: host: xhci-tegra: Unlink power domain devices
Date:   Fri, 16 Oct 2020 21:07:25 +0800
Message-ID: <20201016130726.1378666-16-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853669; bh=jbs+cGF6q2ld6GEaq/fgbB3HQYFPMDYWVfWupBAdFBM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Cyum1jMzboH9d70w1vYad8s4Wqh+xqYzPKowgkxROraAuwMb7w0jlCncYmKekJqeJ
         HbgZan4/pf2gUvGKXajCC6Mq7xtf8VTrpUy55qdQlETsqcUQu7Th8eGi6E+/HQFD4j
         0btzoahTMh/UmwFs3T9nUgBxJtjtzdSW6HghO6sMFw6xKRx79ub5c1frUil8t5CFN5
         TEDJIrkCHVU9ejTn8XTOVkpv5VXl0rrKJXWhQZe3N4ezZ1rlXOhoGHVLc0jl4lyM6b
         SfFpJe/1xmlZDHrJsoC7HchShTXlTsg0s6f1ZlcYKFr4VUe0WwY27U2HazQxoc3IAA
         KqFZD7db5c0NA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit unlinks xhci-tegra platform device with SS/host power
domain devices. Reasons for this change is - at ELPG entry, PHY
sleepwalk and wake configuration need to be done before powering
down SS/host partitions, and PHY need be powered off after powering
down SS/host partitions. Sequence looks like roughly below:

  tegra_xusb_enter_elpg() -> xhci_suspend()
                          -> enable PHY sleepwalk and wake if needed
                          -> power down SS/host partitions
                          -> power down PHY

If SS/host power domains are linked to xhci-tegra platform device, we
are not able to perform the sequence like above.

This commit introduces:
  1. tegra_xusb_unpowergate_partitions() to power up SS and host
     partitions together. If SS/host power domain devices are
     available, it invokes pm_runtime_get_sync() to request power
     driver to power up partitions; If power domain devices are not
     available, tegra_powergate_sequence_power_up() will be used to
     power up partitions.

  2. tegra_xusb_powergate_partitions() to power down SS and host
     partitions together. If SS/host power domain devices are
     available, it invokes pm_runtime_put_sync() to request power
     driver to power down partitions; If power domain devices are not
     available, tegra_powergate_power_off() will be used to power down
     partitions.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v4:
   commit message improvement
   update copyright string
v3:
   use 'unsigned int' for PHY index
   remove unnecessary 'else'
   drop IRQF_TRIGGER_HIGH when invokes devm_request_threaded_irq()

 drivers/usb/host/xhci-tegra.c | 206 ++++++++++++++++++----------------
 1 file changed, 112 insertions(+), 94 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 934be1686352..375aaf4d22dc 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2,7 +2,7 @@
 /*
  * NVIDIA Tegra xHCI host controller driver
  *
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION. All rights reserved.
  * Copyright (C) 2014 Google, Inc.
  */
=20
@@ -249,8 +249,7 @@ struct tegra_xusb {
=20
 	struct device *genpd_dev_host;
 	struct device *genpd_dev_ss;
-	struct device_link *genpd_dl_host;
-	struct device_link *genpd_dl_ss;
+	bool use_genpd;
=20
 	struct phy **phys;
 	unsigned int num_phys;
@@ -814,36 +813,12 @@ static void tegra_xusb_phy_disable(struct tegra_xusb =
*tegra)
=20
 static int tegra_xusb_runtime_suspend(struct device *dev)
 {
-	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
-
-	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
-	tegra_xusb_clk_disable(tegra);
-
 	return 0;
 }
=20
 static int tegra_xusb_runtime_resume(struct device *dev)
 {
-	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
-	int err;
-
-	err =3D tegra_xusb_clk_enable(tegra);
-	if (err) {
-		dev_err(dev, "failed to enable clocks: %d\n", err);
-		return err;
-	}
-
-	err =3D regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
-	if (err) {
-		dev_err(dev, "failed to enable regulators: %d\n", err);
-		goto disable_clk;
-	}
-
 	return 0;
-
-disable_clk:
-	tegra_xusb_clk_disable(tegra);
-	return err;
 }
=20
 #ifdef CONFIG_PM_SLEEP
@@ -1019,10 +994,9 @@ static int tegra_xusb_load_firmware(struct tegra_xusb=
 *tegra)
 static void tegra_xusb_powerdomain_remove(struct device *dev,
 					  struct tegra_xusb *tegra)
 {
-	if (tegra->genpd_dl_ss)
-		device_link_del(tegra->genpd_dl_ss);
-	if (tegra->genpd_dl_host)
-		device_link_del(tegra->genpd_dl_host);
+	if (!tegra->use_genpd)
+		return;
+
 	if (!IS_ERR_OR_NULL(tegra->genpd_dev_ss))
 		dev_pm_domain_detach(tegra->genpd_dev_ss, true);
 	if (!IS_ERR_OR_NULL(tegra->genpd_dev_host))
@@ -1048,20 +1022,84 @@ static int tegra_xusb_powerdomain_init(struct devic=
e *dev,
 		return err;
 	}
=20
-	tegra->genpd_dl_host =3D device_link_add(dev, tegra->genpd_dev_host,
-					       DL_FLAG_PM_RUNTIME |
-					       DL_FLAG_STATELESS);
-	if (!tegra->genpd_dl_host) {
-		dev_err(dev, "adding host device link failed!\n");
-		return -ENODEV;
+	tegra->use_genpd =3D true;
+
+	return 0;
+}
+
+static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
+{
+	struct device *dev =3D tegra->dev;
+	int rc;
+
+	if (tegra->use_genpd) {
+		rc =3D pm_runtime_get_sync(tegra->genpd_dev_ss);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB SS partition\n");
+			return rc;
+		}
+
+		rc =3D pm_runtime_get_sync(tegra->genpd_dev_host);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB Host partition\n");
+			pm_runtime_put_sync(tegra->genpd_dev_ss);
+			return rc;
+		}
+	} else {
+		rc =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
+							tegra->ss_clk,
+							tegra->ss_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB SS partition\n");
+			return rc;
+		}
+
+		rc =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							tegra->host_clk,
+							tegra->host_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB Host partition\n");
+			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+			return rc;
+		}
 	}
=20
-	tegra->genpd_dl_ss =3D device_link_add(dev, tegra->genpd_dev_ss,
-					     DL_FLAG_PM_RUNTIME |
-					     DL_FLAG_STATELESS);
-	if (!tegra->genpd_dl_ss) {
-		dev_err(dev, "adding superspeed device link failed!\n");
-		return -ENODEV;
+	return 0;
+}
+
+static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
+{
+	struct device *dev =3D tegra->dev;
+	int rc;
+
+	if (tegra->use_genpd) {
+		rc =3D pm_runtime_put_sync(tegra->genpd_dev_host);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB Host partition\n");
+			return rc;
+		}
+
+		rc =3D pm_runtime_put_sync(tegra->genpd_dev_ss);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB SS partition\n");
+			pm_runtime_get_sync(tegra->genpd_dev_host);
+			return rc;
+		}
+	} else {
+		rc =3D tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB Host partition\n");
+			return rc;
+		}
+
+		rc =3D tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB SS partition\n");
+			tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							  tegra->host_clk,
+							  tegra->host_rst);
+			return rc;
+		}
 	}
=20
 	return 0;
@@ -1425,25 +1463,6 @@ static int tegra_xusb_probe(struct platform_device *=
pdev)
 				err);
 			goto put_padctl;
 		}
-
-		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
-							tegra->ss_clk,
-							tegra->ss_rst);
-		if (err) {
-			dev_err(&pdev->dev,
-				"failed to enable XUSBA domain: %d\n", err);
-			goto put_padctl;
-		}
-
-		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							tegra->host_clk,
-							tegra->host_rst);
-		if (err) {
-			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-			dev_err(&pdev->dev,
-				"failed to enable XUSBC domain: %d\n", err);
-			goto put_padctl;
-		}
 	} else {
 		err =3D tegra_xusb_powerdomain_init(&pdev->dev, tegra);
 		if (err)
@@ -1518,10 +1537,22 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
 	 */
 	platform_set_drvdata(pdev, tegra);
=20
+	err =3D tegra_xusb_clk_enable(tegra);
+	if (err) {
+		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
+		goto put_hcd;
+	}
+
+	err =3D regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
+	if (err) {
+		dev_err(tegra->dev, "failed to enable regulators: %d\n", err);
+		goto disable_clk;
+	}
+
 	err =3D tegra_xusb_phy_enable(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
-		goto put_hcd;
+		goto disable_regulator;
 	}
=20
 	/*
@@ -1540,30 +1571,22 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
 		goto disable_phy;
 	}
=20
-	pm_runtime_enable(&pdev->dev);
-
-	if (!pm_runtime_enabled(&pdev->dev))
-		err =3D tegra_xusb_runtime_resume(&pdev->dev);
-	else
-		err =3D pm_runtime_get_sync(&pdev->dev);
-
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
+	err =3D tegra_xusb_unpowergate_partitions(tegra);
+	if (err)
 		goto free_firmware;
-	}
=20
 	tegra_xusb_config(tegra);
=20
 	err =3D tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
-		goto put_rpm;
+		goto powergate;
 	}
=20
 	err =3D usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto put_rpm;
+		goto powergate;
 	}
=20
 	device_wakeup_enable(tegra->hcd->self.controller);
@@ -1615,24 +1638,21 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
 	usb_put_hcd(xhci->shared_hcd);
 remove_usb2:
 	usb_remove_hcd(tegra->hcd);
-put_rpm:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_xusb_runtime_suspend(&pdev->dev);
-put_hcd:
-	usb_put_hcd(tegra->hcd);
+powergate:
+	tegra_xusb_powergate_partitions(tegra);
 free_firmware:
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
 disable_phy:
 	tegra_xusb_phy_disable(tegra);
-	pm_runtime_disable(&pdev->dev);
+disable_regulator:
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
+disable_clk:
+	tegra_xusb_clk_disable(tegra);
+put_hcd:
+	usb_put_hcd(tegra->hcd);
 put_powerdomains:
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-	} else {
-		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
-	}
+	tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
 	return err;
@@ -1657,15 +1677,13 @@ static int tegra_xusb_remove(struct platform_device=
 *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
=20
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-	} else {
-		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
-	}
+	tegra_xusb_powergate_partitions(tegra);
=20
-	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
=20
+	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_clk_disable(tegra);
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 	tegra_xusb_padctl_put(tegra->padctl);
=20
 	return 0;
--=20
2.25.1

