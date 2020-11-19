Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FDF2B8E3A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 09:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgKSIyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 03:54:24 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13005 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgKSIyY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 03:54:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632ca0001>; Thu, 19 Nov 2020 00:54:34 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:22 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:20 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v5 06/16] phy: tegra: xusb: Add Tegra210 lane_iddq operation
Date:   Thu, 19 Nov 2020 16:53:55 +0800
Message-ID: <20201119085405.556138-7-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776074; bh=HRG5X96zYW42k1j4aGBhVZ8T8Dp0UEbr+8e1bPNybhI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=ZZg1QWpu6hq+lCXPuZz/Ovdt8/ilb+7dnARBzdwWTOm7hT4tgQ7+r5+G9fWQlmikN
         ms/Ld2mp3cOyqecouMBTip3yamEN6EseqARCDs3358BCc0kkznnrdxoG4TmQcfDWeg
         3uLXqEJDi8Wwx+aGPGUSmjkMZ4v8ApYzOJve3s93lX7JtRGghewTL0MXCpIIgIWOvT
         IB+B3e7Ru2nwNgnaBbWov8ylPMWg6W4hQ1wXpQScs7TjQMi3QgaI4q3Iqs23pcLqGB
         YJL3mseKDPm9uQSd8+oBCDL3+3SKKho2SsAg7mAaIgZb93FcDMlHyP2lHHgsVg8Zwv
         /+uEufOgNuvAA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As per Tegra210 TRM, before changing lane assignments, driver should
keep lanes in IDDQ and sleep state; after changing lane assignments,
driver should bring lanes out of IDDQ.
This commit implements the required operations.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v5:
   no change
v4:
   no change
v3:
   add 'misc_ctl2' data member to UPHY lane for carrying MISC_PAD_PX_CTL2 o=
ffset
   tegra210_uphy_lane_iddq_[enable/disable]() to access 'misc_ctl2' data me=
mber

 drivers/phy/tegra/xusb-tegra210.c | 82 ++++++++++++++++++++++++++++---
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          |  6 +++
 3 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index faacb866cd1f..b038d032fea1 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -198,6 +198,18 @@
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_TERM_EN BIT(18)
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_MODE_OVRD BIT(13)
=20
+#define XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(x) (0x464 + (x) * 0x40)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ BIT(0)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD BIT(1)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD BIT(24)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ BIT(8)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD BIT(9)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD BIT(25)
+
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL1 0x860
=20
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL2 0x864
@@ -209,6 +221,7 @@
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL8 0x87c
=20
 #define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL1 0x960
+#define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL2 0x964
=20
 #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(x) (0xa60 + (x) * 0x40)
 #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT 16
@@ -1640,6 +1653,55 @@ static const struct tegra_xusb_pad_soc tegra210_hsic=
_pad =3D {
 	.ops =3D &tegra210_hsic_ops,
 };
=20
+static void tegra210_uphy_lane_iddq_enable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	u32 value;
+
+	value =3D padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+static void tegra210_uphy_lane_iddq_disable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	u32 value;
+
+	value =3D padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+#define TEGRA210_UPHY_LANE(_name, _offset, _shift, _mask, _type, _misc)	\
+	{								\
+		.name =3D _name,						\
+		.offset =3D _offset,					\
+		.shift =3D _shift,					\
+		.mask =3D _mask,						\
+		.num_funcs =3D ARRAY_SIZE(tegra210_##_type##_functions),	\
+		.funcs =3D tegra210_##_type##_functions,			\
+		.regs.misc_ctl2 =3D _misc,				\
+	}
+
 static const char *tegra210_pcie_functions[] =3D {
 	"pcie-x1",
 	"usb3-ss",
@@ -1648,13 +1710,13 @@ static const char *tegra210_pcie_functions[] =3D {
 };
=20
 static const struct tegra_xusb_lane_soc tegra210_pcie_lanes[] =3D {
-	TEGRA210_LANE("pcie-0", 0x028, 12, 0x3, pcie),
-	TEGRA210_LANE("pcie-1", 0x028, 14, 0x3, pcie),
-	TEGRA210_LANE("pcie-2", 0x028, 16, 0x3, pcie),
-	TEGRA210_LANE("pcie-3", 0x028, 18, 0x3, pcie),
-	TEGRA210_LANE("pcie-4", 0x028, 20, 0x3, pcie),
-	TEGRA210_LANE("pcie-5", 0x028, 22, 0x3, pcie),
-	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
+	TEGRA210_UPHY_LANE("pcie-0", 0x028, 12, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(0)),
+	TEGRA210_UPHY_LANE("pcie-1", 0x028, 14, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(1)),
+	TEGRA210_UPHY_LANE("pcie-2", 0x028, 16, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(2)),
+	TEGRA210_UPHY_LANE("pcie-3", 0x028, 18, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(3)),
+	TEGRA210_UPHY_LANE("pcie-4", 0x028, 20, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(4)),
+	TEGRA210_UPHY_LANE("pcie-5", 0x028, 22, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(5)),
+	TEGRA210_UPHY_LANE("pcie-6", 0x028, 24, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(6)),
 };
=20
 static struct tegra_xusb_usb3_port *
@@ -1815,6 +1877,8 @@ static void tegra210_pcie_lane_remove(struct tegra_xu=
sb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_pcie_lane_ops =3D {
 	.probe =3D tegra210_pcie_lane_probe,
 	.remove =3D tegra210_pcie_lane_remove,
+	.iddq_enable =3D tegra210_uphy_lane_iddq_enable,
+	.iddq_disable =3D tegra210_uphy_lane_iddq_disable,
 };
=20
 static int tegra210_pcie_phy_init(struct phy *phy)
@@ -1939,7 +2003,7 @@ static const struct tegra_xusb_pad_soc tegra210_pcie_=
pad =3D {
 };
=20
 static const struct tegra_xusb_lane_soc tegra210_sata_lanes[] =3D {
-	TEGRA210_LANE("sata-0", 0x028, 30, 0x3, pcie),
+	TEGRA210_UPHY_LANE("sata-0", 0x028, 30, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_S0_CTL2),
 };
=20
 static struct tegra_xusb_lane *
@@ -1978,6 +2042,8 @@ static void tegra210_sata_lane_remove(struct tegra_xu=
sb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_sata_lane_ops =3D {
 	.probe =3D tegra210_sata_lane_probe,
 	.remove =3D tegra210_sata_lane_remove,
+	.iddq_enable =3D tegra210_uphy_lane_iddq_enable,
+	.iddq_disable =3D tegra210_uphy_lane_iddq_disable,
 };
=20
 static int tegra210_sata_phy_init(struct phy *phy)
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 4af2aea76afc..e81ac7a088e9 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -321,11 +321,17 @@ static void tegra_xusb_lane_program(struct tegra_xusb=
_lane *lane)
 	if (soc->num_funcs < 2)
 		return;
=20
+	if (lane->pad->ops->iddq_enable)
+		lane->pad->ops->iddq_enable(lane);
+
 	/* choose function */
 	value =3D padctl_readl(padctl, soc->offset);
 	value &=3D ~(soc->mask << soc->shift);
 	value |=3D lane->function << soc->shift;
 	padctl_writel(padctl, value, soc->offset);
+
+	if (lane->pad->ops->iddq_disable)
+		lane->pad->ops->iddq_disable(lane);
 }
=20
 static void tegra_xusb_pad_program(struct tegra_xusb_pad *pad)
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ccb5dc9b1220..e789d5ff4eb8 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -35,6 +35,10 @@ struct tegra_xusb_lane_soc {
=20
 	const char * const *funcs;
 	unsigned int num_funcs;
+
+	struct {
+		unsigned int misc_ctl2;
+	} regs;
 };
=20
 struct tegra_xusb_lane {
@@ -126,6 +130,8 @@ struct tegra_xusb_lane_ops {
 					 struct device_node *np,
 					 unsigned int index);
 	void (*remove)(struct tegra_xusb_lane *lane);
+	void (*iddq_enable)(struct tegra_xusb_lane *lane);
+	void (*iddq_disable)(struct tegra_xusb_lane *lane);
 };
=20
 bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *funct=
ion);
--=20
2.25.1

