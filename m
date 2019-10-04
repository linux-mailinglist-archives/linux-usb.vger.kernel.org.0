Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB403CB5EA
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 10:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388543AbfJDIT7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 04:19:59 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9860 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388028AbfJDIT6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 04:19:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9700ac0000>; Fri, 04 Oct 2019 01:19:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 04 Oct 2019 01:19:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 04 Oct 2019 01:19:56 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Oct
 2019 08:19:55 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 4 Oct 2019 08:19:55 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.105]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d9700aa0001>; Fri, 04 Oct 2019 01:19:55 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, <skomatineni@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v2 4/7] phy: tegra: xusb: Add Tegra194 support
Date:   Fri, 4 Oct 2019 16:19:38 +0800
Message-ID: <20191004081941.4831-5-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004081941.4831-1-jckuo@nvidia.com>
References: <20191004081941.4831-1-jckuo@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570177196; bh=7gTbqRf8iYfLuE06S14n7kk68dA6AWmF2PNQaOznWbY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=FJj4tLa5VuVl+4A+gDKI7Z9XcVmBep+G+tDk74DaAzDGDDLROsVIj6/68dq7dDTHE
         wgd4CcNnzS+2wigTM6WYwoso3RkCtLFiK7I42vR22VJeFFAuvZnGQjFof40Tt3Dx4u
         +6I5Wvidfk41zZ0+53uQGj1TawIG1w8ir84+L/fEBiPqmRIKTgXzhfijTzQUrEuoeN
         hszY4TJ/rR6mcrcwv3D8UereNc0Y9ACMDX3p/V4JhzHs3ANt1z6i71UKDT2nbriBi/
         I/jkxzPHBC1FktTGoRTKtFKUVjG5ZLdEpzSlSNLXhPEW0Hr/rjEgsiKwFxKRyLqaBZ
         kVo7nPKicqDtA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the XUSB pad controller found on Tegra194 SoCs. It is
mostly similar to the same IP found on Tegra186, but the number of
pads exposed differs, as do the programming sequences. Because most of
the Tegra194 XUSB PADCTL registers definition and programming sequence
are the same as Tegra186, Tegra194 XUSB PADCTL can share the same
driver, xusb-tegra186.c, with Tegra186 XUSB PADCTL.

Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
is possible for some platforms have long signal trace that could not
provide sufficient electrical environment for Gen 2 speed. This patch
introduce a new device node property "nvidia,disable-gen2" that can
be used to specifically disable Gen 2 speed for a particular USB 3.0
port so that the port can be limited to Gen 1 speed and avoid the
instability.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
Changes in v2:
- removed unnecessary #if/#endif pairs
- introduce new soc->supports_gen2 flag which indicate whether or not
  a soc supports USB 3.1 Gen 2 speed

 drivers/phy/tegra/Makefile        |  1 +
 drivers/phy/tegra/xusb-tegra186.c | 74 +++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.c          |  7 +++
 drivers/phy/tegra/xusb.h          |  6 +++
 4 files changed, 88 insertions(+)

diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index 320dd389f34d..89b84067cb4c 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -6,4 +6,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
+phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 3b60270f2009..74baa1dbca6c 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -64,6 +64,11 @@
 #define  SSPX_ELPG_CLAMP_EN_EARLY(x)		BIT(1 + (x) * 3)
 #define  SSPX_ELPG_VCORE_DOWN(x)		BIT(2 + (x) * 3)
 
+#define XUSB_PADCTL_SS_PORT_CFG			0x2c
+#define   PORTX_SPEED_SUPPORT_SHIFT(x)		((x) * 4)
+#define   PORTX_SPEED_SUPPORT_MASK		(0x3)
+#define     PORT_SPEED_SUPPORT_GEN1		(0x0)
+
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
 #define  HS_CURR_LEVEL(x)			((x) & 0x3f)
 #define  TERM_SEL				BIT(25)
@@ -622,6 +627,15 @@ static int tegra186_usb3_phy_power_on(struct phy *phy)
 
 	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_CAP);
 
+	if (padctl->soc->supports_gen2 && port->disable_gen2) {
+		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_CFG);
+		value &= ~(PORTX_SPEED_SUPPORT_MASK <<
+			PORTX_SPEED_SUPPORT_SHIFT(index));
+		value |= (PORT_SPEED_SUPPORT_GEN1 <<
+			PORTX_SPEED_SUPPORT_SHIFT(index));
+		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_CFG);
+	}
+
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_1);
 	value &= ~SSPX_ELPG_VCORE_DOWN(index);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_1);
@@ -896,6 +910,66 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+static const char * const tegra194_xusb_padctl_supply_names[] = {
+	"avdd-usb",
+	"vclamp-usb",
+};
+
+static const struct tegra_xusb_lane_soc tegra194_usb2_lanes[] = {
+	TEGRA186_LANE("usb2-0", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-1", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-2", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-3", 0,  0, 0, usb2),
+};
+
+static const struct tegra_xusb_pad_soc tegra194_usb2_pad = {
+	.name = "usb2",
+	.num_lanes = ARRAY_SIZE(tegra194_usb2_lanes),
+	.lanes = tegra194_usb2_lanes,
+	.ops = &tegra186_usb2_pad_ops,
+};
+
+static const struct tegra_xusb_lane_soc tegra194_usb3_lanes[] = {
+	TEGRA186_LANE("usb3-0", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-1", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-2", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-3", 0,  0, 0, usb3),
+};
+
+static const struct tegra_xusb_pad_soc tegra194_usb3_pad = {
+	.name = "usb3",
+	.num_lanes = ARRAY_SIZE(tegra194_usb3_lanes),
+	.lanes = tegra194_usb3_lanes,
+	.ops = &tegra186_usb3_pad_ops,
+};
+
+static const struct tegra_xusb_pad_soc * const tegra194_pads[] = {
+	&tegra194_usb2_pad,
+	&tegra194_usb3_pad,
+};
+
+const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra194_pads),
+	.pads = tegra194_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 4,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 4,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+};
+EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
+#endif
+
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB Pad Controller driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 2ea8497af82a..e359a75d9543 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -65,6 +65,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.compatible = "nvidia,tegra186-xusb-padctl",
 		.data = &tegra186_xusb_padctl_soc,
 	},
+#endif
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
+	{
+		.compatible = "nvidia,tegra194-xusb-padctl",
+		.data = &tegra194_xusb_padctl_soc,
+	},
 #endif
 	{ }
 };
@@ -738,6 +744,7 @@ static int tegra_xusb_usb3_port_parse_dt(struct tegra_xusb_usb3_port *usb3)
 	usb3->port = value;
 
 	usb3->internal = of_property_read_bool(np, "nvidia,internal");
+	usb3->disable_gen2 = of_property_read_bool(np, "nvidia,disable-gen2");
 
 	usb3->supply = devm_regulator_get(&port->dev, "vbus");
 	return PTR_ERR_OR_ZERO(usb3->supply);
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 093076ca27fd..8312129caf96 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -332,6 +332,7 @@ struct tegra_xusb_usb3_port {
 	bool context_saved;
 	unsigned int port;
 	bool internal;
+	bool disable_gen2;
 
 	u32 tap1;
 	u32 amp;
@@ -389,6 +390,8 @@ struct tegra_xusb_padctl_soc {
 
 	const char * const *supply_names;
 	unsigned int num_supplies;
+
+	bool supports_gen2;
 };
 
 struct tegra_xusb_padctl {
@@ -444,5 +447,8 @@ extern const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
 extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
+extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
+#endif
 
 #endif /* __PHY_TEGRA_XUSB_H */
-- 
2.17.1

