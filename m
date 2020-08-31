Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F4325731C
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 06:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgHaEl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 00:41:57 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9170 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgHaEks (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 00:40:48 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4c7f420001>; Sun, 30 Aug 2020 21:40:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 30 Aug 2020 21:40:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 30 Aug 2020 21:40:48 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 04:40:46 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 04:40:46 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.101.4]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4c7f4b0004>; Sun, 30 Aug 2020 21:40:45 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v2 06/12] soc/tegra: pmc: provide usb sleepwalk register map
Date:   Mon, 31 Aug 2020 12:40:37 +0800
Message-ID: <20200831044043.1561074-7-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831044043.1561074-1-jckuo@nvidia.com>
References: <20200831044043.1561074-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598848834; bh=qMIiOpSXddd3JYE2uwQZI8jkkNxTjdLC0hryIYSQ+T0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=j0freA1ef1aspdtU8ec2rNixZmzMfoTQZh4bjdlERcIsLcbK3uTmgG3Xy6yZSgcj+
         peG2/L68dKhzFu/pJVH45WoGBvtcxhtak0ZV5bgUOy/3SBPrAlAIKei8LMQ+pKqmWr
         b90tYmPIffYAuyaY+MtozdVAb4JXHeOm0hizsOjc2H+rsESejosDzA4Ej+7xQb/HlW
         Z77eJDi8xl5rOxsYDQ7cJ1RrGwb3qDZ3MWRWQ0ThDdhHlv99NTx5Y4lFqKLmyKZgZm
         dSmnlBfZAi4q0Qqd7+cUIxU09jcb2MrIhSVVKS7R6c83OL/zTUhEnCllKMQO2Qu2Vl
         Onp8koHU92IXQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit implements a register map which grants USB (UTMI and HSIC)
sleepwalk registers access to USB phy drivers. The USB sleepwalk logic
is in PMC hardware block but USB phy drivers have the best knowledge
of proper programming sequence. This approach prevents using custom
pmc APIs.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 89 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d332e5d9abac..03317978915a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -43,6 +43,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/regmap.h>
=20
 #include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
@@ -102,6 +103,9 @@
=20
 #define PMC_PWR_DET_VALUE		0xe4
=20
+#define PMC_USB_DEBOUNCE_DEL		0xec
+#define PMC_USB_AO			0xf0
+
 #define PMC_SCRATCH41			0x140
=20
 #define PMC_WAKE2_MASK			0x160
@@ -133,6 +137,13 @@
 #define IO_DPD2_STATUS			0x1c4
 #define SEL_DPD_TIM			0x1c8
=20
+#define PMC_UTMIP_UHSIC_TRIGGERS	0x1ec
+#define PMC_UTMIP_UHSIC_SAVED_STATE	0x1f0
+
+#define PMC_UTMIP_TERM_PAD_CFG		0x1f8
+#define PMC_UTMIP_UHSIC_SLEEP_CFG	0x1fc
+#define PMC_UTMIP_UHSIC_FAKE		0x218
+
 #define PMC_SCRATCH54			0x258
 #define  PMC_SCRATCH54_DATA_SHIFT	8
 #define  PMC_SCRATCH54_ADDR_SHIFT	0
@@ -145,8 +156,18 @@
 #define  PMC_SCRATCH55_CHECKSUM_SHIFT	16
 #define  PMC_SCRATCH55_I2CSLV1_SHIFT	0
=20
+#define  PMC_UTMIP_UHSIC_LINE_WAKEUP	0x26c
+
+#define PMC_UTMIP_BIAS_MASTER_CNTRL	0x270
+#define PMC_UTMIP_MASTER_CONFIG		0x274
+#define PMC_UTMIP_UHSIC2_TRIGGERS	0x27c
+#define PMC_UTMIP_MASTER2_CONFIG	0x29c
+
 #define GPU_RG_CNTRL			0x2d4
=20
+#define PMC_UTMIP_PAD_CFG0		0x4c0
+#define PMC_UTMIP_UHSIC_SLEEP_CFG1	0x4d0
+#define PMC_UTMIP_SLEEPWALK_P3		0x4e0
 /* Tegra186 and later */
 #define WAKE_AOWAKE_CNTRL(x) (0x000 + ((x) << 2))
 #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
@@ -334,6 +355,7 @@ struct tegra_pmc_soc {
 	const struct pmc_clk_init_data *pmc_clks_data;
 	unsigned int num_pmc_clks;
 	bool has_blink_output;
+	bool has_usb_sleepwalk;
 };
=20
 static const char * const tegra186_reset_sources[] =3D {
@@ -2495,6 +2517,67 @@ static void tegra_pmc_clock_register(struct tegra_pm=
c *pmc,
 			 err);
 }
=20
+#define regmap_reg(x) regmap_reg_range(x, x)
+static const struct regmap_range pmc_usb_sleepwalk_ranges[] =3D {
+	regmap_reg_range(PMC_USB_DEBOUNCE_DEL, PMC_USB_AO),
+	regmap_reg_range(PMC_UTMIP_UHSIC_TRIGGERS, PMC_UTMIP_UHSIC_SAVED_STATE),
+	regmap_reg_range(PMC_UTMIP_TERM_PAD_CFG, PMC_UTMIP_UHSIC_FAKE),
+	regmap_reg(PMC_UTMIP_UHSIC_LINE_WAKEUP),
+	regmap_reg_range(PMC_UTMIP_BIAS_MASTER_CNTRL, PMC_UTMIP_MASTER_CONFIG),
+	regmap_reg_range(PMC_UTMIP_UHSIC2_TRIGGERS, PMC_UTMIP_MASTER2_CONFIG),
+	regmap_reg_range(PMC_UTMIP_PAD_CFG0, PMC_UTMIP_UHSIC_SLEEP_CFG1),
+	regmap_reg(PMC_UTMIP_SLEEPWALK_P3),
+};
+
+static const struct regmap_access_table pmc_usb_sleepwalk_table =3D {
+	.yes_ranges =3D pmc_usb_sleepwalk_ranges,
+	.n_yes_ranges =3D ARRAY_SIZE(pmc_usb_sleepwalk_ranges),
+};
+
+static int tegra_pmc_regmap_readl(void *context, unsigned int reg, unsigne=
d int *val)
+{
+	struct tegra_pmc *pmc =3D context;
+
+	*val =3D tegra_pmc_readl(pmc, reg);
+	return 0;
+}
+
+static int tegra_pmc_regmap_writel(void *context, unsigned int reg, unsign=
ed int val)
+{
+	struct tegra_pmc *pmc =3D context;
+
+	tegra_pmc_writel(pmc, val, reg);
+	return 0;
+}
+
+static const struct regmap_config usb_sleepwalk_regmap_config =3D {
+	.name =3D "usb_sleepwalk",
+	.reg_bits =3D 32,
+	.val_bits =3D 32,
+	.reg_stride =3D 4,
+	.fast_io =3D true,
+	.rd_table =3D &pmc_usb_sleepwalk_table,
+	.wr_table =3D &pmc_usb_sleepwalk_table,
+	.reg_read =3D tegra_pmc_regmap_readl,
+	.reg_write =3D tegra_pmc_regmap_writel,
+};
+
+static int tegra_pmc_regmap_init(struct tegra_pmc *pmc)
+{
+	struct regmap *regmap;
+
+	if (pmc->soc->has_usb_sleepwalk) {
+		regmap =3D devm_regmap_init(pmc->dev, NULL, (__force void *)pmc,
+					  &usb_sleepwalk_regmap_config);
+		if (IS_ERR(regmap)) {
+			dev_err(pmc->dev, "failed to allocate register map\n");
+			return PTR_ERR(regmap);
+		}
+	}
+
+	return 0;
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -2613,6 +2696,10 @@ static int tegra_pmc_probe(struct platform_device *p=
dev)
 	pmc->base =3D base;
 	mutex_unlock(&pmc->powergates_lock);
=20
+	err =3D tegra_pmc_regmap_init(pmc);
+	if (err < 0)
+		goto cleanup_powergates;
+
 	tegra_pmc_clock_register(pmc, pdev->dev.of_node);
 	platform_set_drvdata(pdev, pmc);
=20
@@ -2976,6 +3063,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc =
=3D {
 	.pmc_clks_data =3D tegra_pmc_clks_data,
 	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D true,
 };
=20
 static const char * const tegra210_powergates[] =3D {
@@ -3094,6 +3182,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc =
=3D {
 	.pmc_clks_data =3D tegra_pmc_clks_data,
 	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D true,
 };
=20
 #define TEGRA186_IO_PAD_TABLE(_pad)                                       =
   \
--=20
2.25.1

