Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60342629C2
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 10:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729935AbgIIILw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 04:11:52 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14104 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbgIIILT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 04:11:19 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f588da00001>; Wed, 09 Sep 2020 01:09:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 09 Sep 2020 01:11:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 09 Sep 2020 01:11:19 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 08:11:17 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 9 Sep 2020 08:11:17 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.100.126]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f588e230000>; Wed, 09 Sep 2020 01:11:17 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v3 14/15] usb: host: xhci-tegra: Unlink power domain devices
Date:   Wed, 9 Sep 2020 16:10:40 +0800
Message-ID: <20200909081041.3190157-15-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200909081041.3190157-1-jckuo@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599638944; bh=KeNtw7ps1El5ZpAGSrM1EYkiAfxtpPvpXJs4AKt+XQU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Q0L9x75V2iwIZUXK0/AjcqEm4oX40LU+AAI2hZe6cpwgsLwSMG44/076qkGGROm7K
         mmAHkw6DVI6J2cHZAlImhE37+gqI/Dc60B/zPaEn22QdQKqtrNkf7C5jfU8jnkVt8W
         8bgdnBcCGRsGoUj5GwMKxnPYQ9lLKlRni12wGenCzpwsE+uUqZbJIKnocpjgI6Qi/9
         xe7wSUtgLDnqD4t6KRXYilZiT2OWI245k1+cvttB2uX51Ls9Pb5VdwvRLpOFf7YD+u
         e5d9morcHv8RM3jR08b5SDALnKOuKD90GV7vn4OEIRdPGJ0fTf2ALsB9krbR3/jyou
         m3iJ3UB9j1xTg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit unlinks xhci-tegra platform device with ss/host power
domain devices. Reasons for this change is - at elpg entry, PHY
sleepwalk and wake configuration need to be done before powering
down ss/host partitions, and PHY need be powered off after powering
down ss/host partitions. Sequence looks like roughly below:

  tegra_xusb_enter_elpg() -> xhci_suspend()
                          -> enable PHY sleepwalk and wake if needed
                          -> power down ss/host partitions
                          -> power down PHY

If ss/host power domains are linked to xhci-tegra platform device, we
are not able to perform the sequence like above.

This commit introduces:
  1. tegra_xusb_unpowergate_partitions() to power up ss and host
     partitions together. If ss/host power domain devices are
     available, it invokes pm_runtime_get_sync() to request power
     driver to power up partitions; If power domain devices are not
     available, tegra_powergate_sequence_power_up() will be used to
     power up partitions.

  2. tegra_xusb_powergate_partitions() to power down ss and host
     partitions together. If ss/host power domain devices are
     available, it invokes pm_runtime_put_sync() to request power
     driver to power down partitions; If power domain devices are not
     available, tegra_powergate_power_off() will be used to power down
     partitions.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v3:
   'use_genpd' base on the results of tegra_xusb_powerdomain_init()

 drivers/usb/host/xhci-tegra.c | 199 ++++++++++++++++++----------------
 1 file changed, 108 insertions(+), 91 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 934be1686352..aabff8ee0bb3 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
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
@@ -1019,10 +994,6 @@ static int tegra_xusb_load_firmware(struct tegra_xusb=
 *tegra)
 static void tegra_xusb_powerdomain_remove(struct device *dev,
 					  struct tegra_xusb *tegra)
 {
-	if (tegra->genpd_dl_ss)
-		device_link_del(tegra->genpd_dl_ss);
-	if (tegra->genpd_dl_host)
-		device_link_del(tegra->genpd_dl_host);
 	if (!IS_ERR_OR_NULL(tegra->genpd_dev_ss))
 		dev_pm_domain_detach(tegra->genpd_dev_ss, true);
 	if (!IS_ERR_OR_NULL(tegra->genpd_dev_host))
@@ -1048,20 +1019,84 @@ static int tegra_xusb_powerdomain_init(struct devic=
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
@@ -1425,25 +1460,6 @@ static int tegra_xusb_probe(struct platform_device *=
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
@@ -1518,10 +1534,22 @@ static int tegra_xusb_probe(struct platform_device =
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
@@ -1540,30 +1568,22 @@ static int tegra_xusb_probe(struct platform_device =
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
@@ -1615,24 +1635,21 @@ static int tegra_xusb_probe(struct platform_device =
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
@@ -1657,15 +1674,15 @@ static int tegra_xusb_remove(struct platform_device=
 *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
=20
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-	} else {
+	tegra_xusb_powergate_partitions(tegra);
+
+	if (of_property_read_bool(pdev->dev.of_node, "power-domains")) {
 		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
 	}
=20
 	tegra_xusb_phy_disable(tegra);
-
+	tegra_xusb_clk_disable(tegra);
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 	tegra_xusb_padctl_put(tegra->padctl);
=20
 	return 0;
--=20
2.25.1

