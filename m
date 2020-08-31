Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5B125730E
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 06:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgHaEkw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 00:40:52 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1167 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgHaEks (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 00:40:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4c7ed20000>; Sun, 30 Aug 2020 21:38:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 30 Aug 2020 21:40:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 30 Aug 2020 21:40:48 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 04:40:44 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 04:40:43 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.101.4]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4c7f490002>; Sun, 30 Aug 2020 21:40:43 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v2 05/12] phy: tegra: xusb: add sleepwalk and suspend/resume
Date:   Mon, 31 Aug 2020 12:40:36 +0800
Message-ID: <20200831044043.1561074-6-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831044043.1561074-1-jckuo@nvidia.com>
References: <20200831044043.1561074-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598848722; bh=kX0RwgveLiINhWbSkybtsDBLi2N6bZpxn7iuTnuZPAY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=njRTzs8jxy6HADsDyN6JKCqQSQW+44PXFOgOxxvcwtQdwrgN1K8bvs21bdQjyAx1H
         dDQ1SobW5bTxbQAwJ9+O2v23BUZFVaZrDqrEC4bxkC2bZFjBrpG3TUo7sGJy+twZmq
         JFlbUd+ct0a98++d82cnITwBZqXiq3EGkkY7KpErzsJ6oLCLcgU82q2w8e8mvsKGgW
         +G4jUsVerFY3aoKX5OL8M4uLR9dz+crC6hDyTMgqbu0KEpIy9X2i6orIv0Q5LTsv8f
         BvheWlPIPVqxawPXryV8H6IeW/IH5uxGGksw6e70rnxaX4u6iAEedV4nxjUhAR3x0U
         qk6ZD8+AVzsHQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds sleepwalk/wake and suspend/resume interfaces
to Tegra XUSB PHY driver.

Tegra XUSB host controller driver makes use of sleepwalk functions
to enable/disable sleepwalk circuit which is in always-on partition
can respond to USB resume signals when controller is not powered.
Sleepwalk can be enabled/disabled for any USB phy individually.

  - tegra_xusb_padctl_enable_phy_sleepwalk()
  - tegra_xusb_padctl_disable_phy_sleepwalk()

Tegra XUSB host controller driver makes use of wake functions to
enable/disable/query wake circuit which is in always-on partition
can wake system up when USB resume happens.
Wake circuit can be enabled/disabled for any USB phy individually.

  - tegra_xusb_padctl_enable_phy_wake()
  - tegra_xusb_padctl_disable_phy_wake()
  - tegra_xusb_padctl_remote_wake_detected()

This commit also adds two system suspend stubs that can be used to
save and restore XUSB PADCTL context during system suspend and
resume.
  - tegra_xusb_padctl_suspend_noirq()
  - tegra_xusb_padctl_resume_noirq()

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/phy/tegra/xusb.c       | 78 ++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h       | 13 ++++++
 include/linux/phy/tegra/xusb.h | 13 ++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 74abd67e3a31..3a1551c42c29 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1274,10 +1274,36 @@ static int tegra_xusb_padctl_remove(struct platform=
_device *pdev)
 	return err;
 }
=20
+static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl =3D dev_get_drvdata(dev);
+
+	if (padctl->soc && padctl->soc->ops && padctl->soc->ops->suspend_noirq)
+		return padctl->soc->ops->suspend_noirq(padctl);
+
+	return 0;
+}
+
+static int tegra_xusb_padctl_resume_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl =3D dev_get_drvdata(dev);
+
+	if (padctl->soc && padctl->soc->ops && padctl->soc->ops->resume_noirq)
+		return padctl->soc->ops->resume_noirq(padctl);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_xusb_padctl_pm_ops =3D {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_xusb_padctl_suspend_noirq,
+				      tegra_xusb_padctl_resume_noirq)
+};
+
 static struct platform_driver tegra_xusb_padctl_driver =3D {
 	.driver =3D {
 		.name =3D "tegra-xusb-padctl",
 		.of_match_table =3D tegra_xusb_padctl_of_match,
+		.pm =3D &tegra_xusb_padctl_pm_ops,
 	},
 	.probe =3D tegra_xusb_padctl_probe,
 	.remove =3D tegra_xusb_padctl_remove,
@@ -1344,6 +1370,58 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xus=
b_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
=20
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padct=
l,
+					   struct phy *phy,
+					   enum usb_device_speed speed)
+{
+	if (padctl->soc->ops->enable_phy_sleepwalk)
+		return padctl->soc->ops->enable_phy_sleepwalk(padctl, phy,
+							      speed);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_sleepwalk);
+
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padc=
tl,
+					    struct phy *phy)
+{
+	if (padctl->soc->ops->disable_phy_sleepwalk)
+		return padctl->soc->ops->disable_phy_sleepwalk(padctl, phy);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_sleepwalk);
+
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl,
+				      struct phy *phy)
+{
+	if (padctl->soc->ops->enable_phy_wake)
+		return padctl->soc->ops->enable_phy_wake(padctl, phy);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_wake);
+
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl,
+				       struct phy *phy)
+{
+	if (padctl->soc->ops->disable_phy_wake)
+		return padctl->soc->ops->disable_phy_wake(padctl, phy);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_wake);
+
+int tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padct=
l,
+					   struct phy *phy)
+{
+	if (padctl->soc->ops->remote_wake_detected)
+		return padctl->soc->ops->remote_wake_detected(phy);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_remote_wake_detected);
+
 int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padct=
l,
 					   unsigned int port, bool enable)
 {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 485b692a3b15..c1c4ea3ce050 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
=20
+#include <linux/usb/ch9.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/role.h>
=20
@@ -392,6 +393,8 @@ struct tegra_xusb_padctl_ops {
 			 const struct tegra_xusb_padctl_soc *soc);
 	void (*remove)(struct tegra_xusb_padctl *padctl);
=20
+	int (*suspend_noirq)(struct tegra_xusb_padctl *padctl);
+	int (*resume_noirq)(struct tegra_xusb_padctl *padctl);
 	int (*usb3_save_context)(struct tegra_xusb_padctl *padctl,
 				 unsigned int index);
 	int (*hsic_set_idle)(struct tegra_xusb_padctl *padctl,
@@ -400,6 +403,16 @@ struct tegra_xusb_padctl_ops {
 				    unsigned int index, bool enable);
 	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
 	int (*utmi_port_reset)(struct phy *phy);
+	int (*enable_phy_sleepwalk)(struct tegra_xusb_padctl *padctl,
+				    struct phy *phy,
+				    enum usb_device_speed speed);
+	int (*disable_phy_sleepwalk)(struct tegra_xusb_padctl *padctl,
+				     struct phy *phy);
+	int (*enable_phy_wake)(struct tegra_xusb_padctl *padctl,
+			       struct phy *phy);
+	int (*disable_phy_wake)(struct tegra_xusb_padctl *padctl,
+				struct phy *phy);
+	int (*remote_wake_detected)(struct phy *phy);
 };
=20
 struct tegra_xusb_padctl_soc {
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.=
h
index 71d956935405..9621e69067e1 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -8,6 +8,7 @@
=20
 struct tegra_xusb_padctl;
 struct device;
+enum usb_device_speed;
=20
 struct tegra_xusb_padctl *tegra_xusb_padctl_get(struct device *dev);
 void tegra_xusb_padctl_put(struct tegra_xusb_padctl *padctl);
@@ -23,4 +24,16 @@ int tegra_xusb_padctl_set_vbus_override(struct tegra_xus=
b_padctl *padctl,
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
 int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
 					 unsigned int port);
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padct=
l,
+					   struct phy *phy,
+					   enum usb_device_speed speed);
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padc=
tl,
+					   struct phy *phy);
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl,
+				      struct phy *phy);
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl,
+				       struct phy *phy);
+int tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padct=
l,
+					struct phy *phy);
+
 #endif /* PHY_TEGRA_XUSB_H */
--=20
2.25.1

