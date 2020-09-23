Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37232275EA5
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 19:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIWR3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 13:29:50 -0400
Received: from crapouillou.net ([89.234.176.41]:53918 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWR3u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 13:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600882187; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dVQiPhL2FcMYsiuPwDCJjOg4T8SPwypIFz2qJizOB7E=;
        b=AOO2n7rjCkajhEd99l5aWQ+CdbRd7lICoSw84hkLzw88XLD6Axxh8Fmlawv5Vw3lsOmR7F
        rVpQkKbo6bYaBEhhefko+JMfc7A/PkOpqprBKsDbr6xG1zuPjfiGzT59IPOZJwxGCxJUQz
        jWqMlR02BL8DI01mLWSL24x/shIIBiI=
Date:   Wed, 23 Sep 2020 19:29:34 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 2/2] PHY: Ingenic: Add USB PHY driver using generic PHY
 framework.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     vkoul@kernel.org, kishon@ti.com, gregkh@linuxfoundation.org,
        balbi@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <ALG4HQ.B464DNP6PON2@crapouillou.net>
In-Reply-To: <20200923162600.44105-3-zhouyanjie@wanyeetech.com>
References: <20200923162600.44105-1-zhouyanjie@wanyeetech.com>
        <20200923162600.44105-3-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Zhou,

Le jeu. 24 sept. 2020 =C3=A0 0:26, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie=
)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Used the generic PHY framework API to create the PHY, this driver
> supoorts USB OTG PHY used in JZ4770 SoC, JZ4780 SoC, X1000 SoC,
> and X1830 SoC.
>=20
> Tested-by: =E5=91=A8=E6=AD=A3 (Zhou Zheng) <sernia.zhou@foxmail.com>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Co-developed-by: =E6=BC=86=E9=B9=8F=E6=8C=AF (Qi Pengzhen) <aric.pzqi@ing=
enic.com>
> Signed-off-by: =E6=BC=86=E9=B9=8F=E6=8C=AF (Qi Pengzhen) <aric.pzqi@ingen=
ic.com>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>     v1->v2:
>     Fix bug, ".of_match_table =3D=20
> of_match_ptr(ingenic_usb_phy_of_matches)" is wrong
>     and should be replaced with ".of_match_table =3D=20
> ingenic_usb_phy_of_matches".
>=20
>     v2->v3:
>     1.Change "depends on (MACH_INGENIC && MIPS) || COMPILE_TEST" to
>       "depends on MIPS || COMPILE_TEST".
>     2.Keep the adjustments of "ingenic_usb_phy_init()" and=20
> "ingenic_usb_phu_exit()"
>       positions in v2 to make them consistent with the order in=20
> "ingenic_usb_phy_ops",
>       keep the adjustments to the positions of=20
> "ingenic_usb_phy_of_matches[]" in v2
>       to keep them consistent with the styles of other USB PHY=20
> drivers. And remove
>       some unnecessary changes to reduce the diff size, from the=20
> original 256 lines
>       change to the current 209 lines.
>=20
>     v3->v4:
>     Only add new generic-PHY driver, without removing the old one.=20
> Because the
>     jz4740-musb driver is not ready to use the generic PHY framework.=20
> When the
>     jz4740-musb driver is modified to use the generic PHY framework,=20
> the old
>     jz4770-phy driver can be "retired".
>=20
>     v4->v5:
>     1.Add an extra blank line between "devm_of_phy_provider_register"=20
> and "return".
>     2.Remove unnecessary "phy_set_drvdata".
>     3.Add Paul Cercueil's Reviewed-by.
>=20
>     v5->v6:
>     1.Revert the removal of "phy_set_drvdata" in v5, removing=20
> "phy_set_drvdata" will
>       cause a kernel panic on CI20.
>       Reported-by: H. Nikolaus Schaller <hns@goldelico.com>

My bad, I overlooked the code of phy_set_drvdata(), indeed phy->dev and=20
pdev->dev are different. Sorry about that.

With that said, you should then be able to remove the=20
platform_set_drvdata() call.

>     2.Rewrite the macro definitions, replace the original code with=20
> "FIELD_PREP()"
>       and "u32p_replace_bits()" according to Vinod Koul's suggestion.
>=20
>  drivers/phy/Kconfig                   |   1 +
>  drivers/phy/Makefile                  |   1 +
>  drivers/phy/ingenic/Kconfig           |  12 ++
>  drivers/phy/ingenic/Makefile          |   2 +
>  drivers/phy/ingenic/phy-ingenic-usb.c | 378=20
> ++++++++++++++++++++++++++++++++++
>  5 files changed, 394 insertions(+)
>  create mode 100644 drivers/phy/ingenic/Kconfig
>  create mode 100644 drivers/phy/ingenic/Makefile
>  create mode 100644 drivers/phy/ingenic/phy-ingenic-usb.c
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index de9362c25c07..0534b0fdd057 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -55,6 +55,7 @@ source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
> +source "drivers/phy/ingenic/Kconfig"
>  source "drivers/phy/lantiq/Kconfig"
>  source "drivers/phy/marvell/Kconfig"
>  source "drivers/phy/mediatek/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c27408e4daae..ab24f0d20763 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -14,6 +14,7 @@ obj-y					+=3D allwinner/	\
>  					   cadence/	\
>  					   freescale/	\
>  					   hisilicon/	\
> +					   ingenic/	\
>  					   intel/	\
>  					   lantiq/	\
>  					   marvell/	\
> diff --git a/drivers/phy/ingenic/Kconfig b/drivers/phy/ingenic/Kconfig
> new file mode 100644
> index 000000000000..912b14e512cb
> --- /dev/null
> +++ b/drivers/phy/ingenic/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Phy drivers for Ingenic platforms
> +#
> +config PHY_INGENIC_USB
> +	tristate "Ingenic SoCs USB PHY Driver"
> +	depends on MIPS || COMPILE_TEST
> +	depends on USB_SUPPORT
> +	select GENERIC_PHY
> +	help
> +	  This driver provides USB PHY support for the USB controller found
> +	  on the JZ-series and X-series SoCs from Ingenic.
> diff --git a/drivers/phy/ingenic/Makefile=20
> b/drivers/phy/ingenic/Makefile
> new file mode 100644
> index 000000000000..65d5ea00fc9d
> --- /dev/null
> +++ b/drivers/phy/ingenic/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-y		+=3D phy-ingenic-usb.o
> diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c=20
> b/drivers/phy/ingenic/phy-ingenic-usb.c
> new file mode 100644
> index 000000000000..55da6ca8faf7
> --- /dev/null
> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Ingenic SoCs USB PHY driver
> + * Copyright (c) Paul Cercueil <paul@crapouillou.net>
> + * Copyright (c) =E6=BC=86=E9=B9=8F=E6=8C=AF (Qi Pengzhen) <aric.pzqi@in=
genic.com>
> + * Copyright (c) =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@w=
anyeetech.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +/* OTGPHY register offsets */
> +#define REG_USBPCR_OFFSET			0x00
> +#define REG_USBRDT_OFFSET			0x04
> +#define REG_USBVBFIL_OFFSET			0x08
> +#define REG_USBPCR1_OFFSET			0x0c
> +
> +/* bits within the USBPCR register */
> +#define USBPCR_USB_MODE				BIT(31)
> +#define USBPCR_AVLD_REG				BIT(30)
> +#define USBPCR_COMMONONN			BIT(25)
> +#define USBPCR_VBUSVLDEXT			BIT(24)
> +#define USBPCR_VBUSVLDEXTSEL		BIT(23)
> +#define USBPCR_POR					BIT(22)
> +#define USBPCR_SIDDQ				BIT(21)
> +#define USBPCR_OTG_DISABLE			BIT(20)
> +#define USBPCR_TXPREEMPHTUNE		BIT(6)
> +
> +#define USBPCR_IDPULLUP_MASK		GENMASK(29, 28)
> +#define USBPCR_IDPULLUP_ALWAYS		0x2
> +#define USBPCR_IDPULLUP_SUSPEND		0x1
> +#define USBPCR_IDPULLUP_OTG			0x0
> +
> +#define USBPCR_COMPDISTUNE_MASK		GENMASK(19, 17)
> +#define USBPCR_COMPDISTUNE_DFT		0x4
> +
> +#define USBPCR_OTGTUNE_MASK			GENMASK(16, 14)
> +#define USBPCR_OTGTUNE_DFT			0x4
> +
> +#define USBPCR_SQRXTUNE_MASK		GENMASK(13, 11)
> +#define USBPCR_SQRXTUNE_DCR_20PCT	0x7
> +#define USBPCR_SQRXTUNE_DFT			0x3
> +
> +#define USBPCR_TXFSLSTUNE_MASK		GENMASK(10, 7)
> +#define USBPCR_TXFSLSTUNE_DCR_50PPT	0xf
> +#define USBPCR_TXFSLSTUNE_DCR_25PPT	0x7
> +#define USBPCR_TXFSLSTUNE_DFT		0x3
> +#define USBPCR_TXFSLSTUNE_INC_25PPT	0x1
> +#define USBPCR_TXFSLSTUNE_INC_50PPT	0x0
> +
> +#define USBPCR_TXHSXVTUNE_MASK		GENMASK(5, 4)
> +#define USBPCR_TXHSXVTUNE_DFT		0x3
> +#define USBPCR_TXHSXVTUNE_DCR_15MV	0x1
> +
> +#define USBPCR_TXRISETUNE_MASK		GENMASK(5, 4)
> +#define USBPCR_TXRISETUNE_DFT		0x3
> +
> +#define USBPCR_TXVREFTUNE_MASK		GENMASK(3, 0)
> +#define USBPCR_TXVREFTUNE_INC_25PPT	0x7
> +#define USBPCR_TXVREFTUNE_DFT		0x5
> +
> +/* bits within the USBRDTR register */
> +#define USBRDT_UTMI_RST				BIT(27)
> +#define USBRDT_HB_MASK				BIT(26)
> +#define USBRDT_VBFIL_LD_EN			BIT(25)
> +#define USBRDT_IDDIG_EN				BIT(24)
> +#define USBRDT_IDDIG_REG			BIT(23)
> +#define USBRDT_VBFIL_EN				BIT(2)
> +
> +/* bits within the USBPCR1 register */
> +#define USBPCR1_BVLD_REG			BIT(31)
> +#define USBPCR1_DPPD				BIT(29)
> +#define USBPCR1_DMPD				BIT(28)
> +#define USBPCR1_USB_SEL				BIT(28)
> +#define USBPCR1_WORD_IF_16BIT		BIT(19)
> +
> +enum ingenic_usb_phy_version {
> +	ID_JZ4770,
> +	ID_JZ4780,
> +	ID_X1000,
> +	ID_X1830,
> +};
> +
> +struct ingenic_soc_info {
> +	enum ingenic_usb_phy_version version;
> +
> +	void (*usb_phy_init)(struct phy *phy);
> +};
> +
> +struct ingenic_usb_phy {
> +	const struct ingenic_soc_info *soc_info;
> +
> +	struct phy *phy;
> +	struct device *dev;
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct regulator *vcc_supply;
> +};
> +
> +static int ingenic_usb_phy_init(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	int err;
> +	u32 reg;
> +
> +	err =3D clk_prepare_enable(priv->clk);
> +	if (err) {
> +		dev_err(priv->dev, "Unable to start clock: %d\n", err);
> +		return err;
> +	}
> +
> +	priv->soc_info->usb_phy_init(phy);
> +
> +	/* Wait for PHY to reset */
> +	usleep_range(30, 300);
> +	reg =3D readl(priv->base + REG_USBPCR_OFFSET);
> +	writel(reg & ~USBPCR_POR, priv->base + REG_USBPCR_OFFSET);
> +	usleep_range(300, 1000);
> +
> +	return 0;
> +}
> +
> +static int ingenic_usb_phy_exit(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(priv->clk);
> +	regulator_disable(priv->vcc_supply);
> +
> +	return 0;
> +}
> +
> +static int ingenic_usb_phy_power_on(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	int err;
> +
> +	err =3D regulator_enable(priv->vcc_supply);
> +	if (err) {
> +		dev_err(priv->dev, "Unable to enable VCC: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ingenic_usb_phy_power_off(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +
> +	regulator_disable(priv->vcc_supply);
> +
> +	return 0;
> +}
> +
> +static int ingenic_usb_phy_set_mode(struct phy *phy,
> +				  enum phy_mode mode, int submode)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	u32 reg;
> +
> +	switch (mode) {
> +	case PHY_MODE_USB_HOST:
> +		reg =3D readl(priv->base + REG_USBPCR_OFFSET);
> +		u32p_replace_bits(&reg, 1, USBPCR_USB_MODE);
> +		u32p_replace_bits(&reg, 0, USBPCR_VBUSVLDEXT);
> +		u32p_replace_bits(&reg, 0, USBPCR_VBUSVLDEXTSEL);
> +		u32p_replace_bits(&reg, 0, USBPCR_OTG_DISABLE);
> +		writel(reg, priv->base + REG_USBPCR_OFFSET);
> +
> +		break;
> +	case PHY_MODE_USB_DEVICE:
> +		if (priv->soc_info->version >=3D ID_X1000) {
> +			reg =3D readl(priv->base + REG_USBPCR1_OFFSET);
> +			u32p_replace_bits(&reg, 1, USBPCR1_BVLD_REG);
> +			writel(reg, priv->base + REG_USBPCR1_OFFSET);
> +		}
> +
> +		reg =3D readl(priv->base + REG_USBPCR_OFFSET);
> +		u32p_replace_bits(&reg, 0, USBPCR_USB_MODE);
> +		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXT);
> +		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXTSEL);
> +		u32p_replace_bits(&reg, 1, USBPCR_OTG_DISABLE);
> +		writel(reg, priv->base + REG_USBPCR_OFFSET);
> +
> +		break;
> +	case PHY_MODE_USB_OTG:
> +		reg =3D readl(priv->base + REG_USBPCR_OFFSET);
> +		u32p_replace_bits(&reg, 1, USBPCR_USB_MODE);
> +		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXT);
> +		u32p_replace_bits(&reg, 1, USBPCR_VBUSVLDEXTSEL);
> +		u32p_replace_bits(&reg, 0, USBPCR_OTG_DISABLE);
> +		writel(reg, priv->base + REG_USBPCR_OFFSET);
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops ingenic_usb_phy_ops =3D {
> +	.init		=3D ingenic_usb_phy_init,
> +	.exit		=3D ingenic_usb_phy_exit,
> +	.power_on	=3D ingenic_usb_phy_power_on,
> +	.power_off	=3D ingenic_usb_phy_power_off,
> +	.set_mode	=3D ingenic_usb_phy_set_mode,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static void jz4770_usb_phy_init(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	u32 reg;
> +
> +	reg =3D USBPCR_AVLD_REG | USBPCR_COMMONONN | USBPCR_POR |
> +		FIELD_PREP(USBPCR_IDPULLUP_MASK, USBPCR_IDPULLUP_ALWAYS) |
> +		FIELD_PREP(USBPCR_COMPDISTUNE_MASK, USBPCR_COMPDISTUNE_DFT) |
> +		FIELD_PREP(USBPCR_OTGTUNE_MASK, USBPCR_OTGTUNE_DFT) |
> +		FIELD_PREP(USBPCR_SQRXTUNE_MASK, USBPCR_SQRXTUNE_DFT) |
> +		FIELD_PREP(USBPCR_TXFSLSTUNE_MASK, USBPCR_TXFSLSTUNE_DFT) |
> +		FIELD_PREP(USBPCR_TXRISETUNE_MASK, USBPCR_TXRISETUNE_DFT) |
> +		FIELD_PREP(USBPCR_TXVREFTUNE_MASK, USBPCR_TXVREFTUNE_DFT);
> +	writel(reg, priv->base + REG_USBPCR_OFFSET);
> +}
> +
> +static void jz4780_usb_phy_init(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	u32 reg;
> +
> +	reg =3D readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_USB_SEL |
> +		USBPCR1_WORD_IF_16BIT;
> +	writel(reg, priv->base + REG_USBPCR1_OFFSET);
> +
> +	reg =3D USBPCR_TXPREEMPHTUNE | USBPCR_COMMONONN | USBPCR_POR;
> +	writel(reg, priv->base + REG_USBPCR_OFFSET);
> +}
> +
> +static void x1000_usb_phy_init(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	u32 reg;
> +
> +	reg =3D readl(priv->base + REG_USBPCR1_OFFSET) |=20
> USBPCR1_WORD_IF_16BIT;
> +	writel(reg, priv->base + REG_USBPCR1_OFFSET);
> +
> +	reg =3D USBPCR_TXPREEMPHTUNE | USBPCR_COMMONONN | USBPCR_POR |
> +		FIELD_PREP(USBPCR_SQRXTUNE_MASK, USBPCR_SQRXTUNE_DCR_20PCT) |
> +		FIELD_PREP(USBPCR_TXHSXVTUNE_MASK, USBPCR_TXHSXVTUNE_DCR_15MV) |
> +		FIELD_PREP(USBPCR_TXVREFTUNE_MASK, USBPCR_TXVREFTUNE_INC_25PPT);
> +	writel(reg, priv->base + REG_USBPCR_OFFSET);
> +}
> +
> +static void x1830_usb_phy_init(struct phy *phy)
> +{
> +	struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
> +	u32 reg;
> +
> +	/* rdt */
> +	writel(USBRDT_VBFIL_EN | USBRDT_UTMI_RST, priv->base +=20
> REG_USBRDT_OFFSET);
> +
> +	reg =3D readl(priv->base + REG_USBPCR1_OFFSET) |=20
> USBPCR1_WORD_IF_16BIT |
> +		USBPCR1_DMPD | USBPCR1_DPPD;
> +	writel(reg, priv->base + REG_USBPCR1_OFFSET);
> +
> +	reg =3D USBPCR_VBUSVLDEXT |	USBPCR_TXPREEMPHTUNE | USBPCR_COMMONONN |=20
> USBPCR_POR |

There's a stray tab character here.

> +		FIELD_PREP(USBPCR_IDPULLUP_MASK, USBPCR_IDPULLUP_OTG);
> +	writel(reg, priv->base + REG_USBPCR_OFFSET);
> +}
> +
> +static const struct ingenic_soc_info jz4770_soc_info =3D {
> +	.version =3D ID_JZ4770,
> +
> +	.usb_phy_init =3D jz4770_usb_phy_init,
> +};
> +
> +static const struct ingenic_soc_info jz4780_soc_info =3D {
> +	.version =3D ID_JZ4780,
> +
> +	.usb_phy_init =3D jz4780_usb_phy_init,
> +};
> +
> +static const struct ingenic_soc_info x1000_soc_info =3D {
> +	.version =3D ID_X1000,
> +
> +	.usb_phy_init =3D x1000_usb_phy_init,
> +};
> +
> +static const struct ingenic_soc_info x1830_soc_info =3D {
> +	.version =3D ID_X1830,
> +
> +	.usb_phy_init =3D x1830_usb_phy_init,
> +};
> +
> +static int ingenic_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct ingenic_usb_phy *priv;
> +	struct phy_provider *provider;
> +	struct device *dev =3D &pdev->dev;
> +	int err;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->soc_info =3D device_get_match_data(dev);
> +	if (!priv->soc_info) {
> +		dev_err(dev, "Error: No device match found\n");
> +		return -ENODEV;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);

You should be able to remove the platform_set_drvdata() here. Not the=20
phy_set_drvdata() ;)

> +	priv->dev =3D dev;

You may also remove the "dev" field in your priv structure, and use=20
&phy->dev instead, from what I can see it's only used in your dev_err()=20
calls. Not a deal-breaker though, I'm fine with both.

> +
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base)) {
> +		dev_err(dev, "Failed to map registers\n");
> +		return PTR_ERR(priv->base);
> +	}
> +
> +	priv->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		err =3D PTR_ERR(priv->clk);
> +		if (err !=3D -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get clock\n");
> +		return err;

You can do:

if (IS_ERR(priv->clk))
    return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get=20
clock\n");

if Vinod is okay with that (I know some maintainers don't like it).

> +	}
> +
> +	priv->vcc_supply =3D devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(priv->vcc_supply)) {
> +		err =3D PTR_ERR(priv->vcc_supply);
> +		if (err !=3D -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get regulator\n");
> +		return err;

Same here.

These are nitpicks though and I'm happy with the V6 being merged.

Cheers,
-Paul

> +	}
> +
> +	priv->phy =3D devm_phy_create(dev, NULL, &ingenic_usb_phy_ops);
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	phy_set_drvdata(priv->phy, priv);
> +
> +	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(provider);
> +}
> +
> +static const struct of_device_id ingenic_usb_phy_of_matches[] =3D {
> +	{ .compatible =3D "ingenic,jz4770-phy", .data =3D &jz4770_soc_info },
> +	{ .compatible =3D "ingenic,jz4780-phy", .data =3D &jz4780_soc_info },
> +	{ .compatible =3D "ingenic,x1000-phy", .data =3D &x1000_soc_info },
> +	{ .compatible =3D "ingenic,x1830-phy", .data =3D &x1830_soc_info },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ingenic_usb_phy_of_matches);
> +
> +static struct platform_driver ingenic_usb_phy_driver =3D {
> +	.probe		=3D ingenic_usb_phy_probe,
> +	.driver		=3D {
> +		.name	=3D "ingenic-usb-phy",
> +		.of_match_table =3D ingenic_usb_phy_of_matches,
> +	},
> +};
> +module_platform_driver(ingenic_usb_phy_driver);
> +
> +MODULE_AUTHOR("=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wan=
yeetech.com>");
> +MODULE_AUTHOR("=E6=BC=86=E9=B9=8F=E6=8C=AF (Qi Pengzhen) <aric.pzqi@inge=
nic.com>");
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_DESCRIPTION("Ingenic SoCs USB PHY driver");
> +MODULE_LICENSE("GPL");
> --
> 2.11.0
>=20


