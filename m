Return-Path: <linux-usb+bounces-16140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950099B657
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 19:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8515282357
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 17:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62884823DE;
	Sat, 12 Oct 2024 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqvg0Fvx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD91EA65;
	Sat, 12 Oct 2024 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728754540; cv=none; b=F1QDKg0lUFFd9gv8Efz+Y0M6fu6z8aDqEAjIx5Dr6CyypN509HOJmWh1iJ8oKFb1zl3DriOOSiKAg94QnAEPt5qClVrjByOLL3rAwu4vgsiYgN2O5K2itXGuCo+ZOkFoSO7YSr6xLVALra09Tz52edqjwNq6hVceoEJn2w7aujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728754540; c=relaxed/simple;
	bh=FUj3m7AxwKhLtalglvHoMqNJU6DbmtxgHK1NyIs6RcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omhw2ELAOO/SMCa8G1+Jl4ELAmlYG0D+Tob9BQUj3ZHSdzbWYUVT5ffYMJ+oIFOkfIhReJ6s/ihM0V/airkdkwpxyIbsmfpwW6VzpUtP4/pOMnOLSEKq18EYblQDlR7kbuMCLyszFKTZLt5QDDsyaSeT+U+9apxFgIPdvMiZLbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqvg0Fvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAF8C4CEC6;
	Sat, 12 Oct 2024 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728754540;
	bh=FUj3m7AxwKhLtalglvHoMqNJU6DbmtxgHK1NyIs6RcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqvg0FvxCGiQuZMNtxbF4TyokIAWf4Hg79BMflKEdfKw7Caj5+5ycLeJMn3QBXXuu
	 fHEAaRDcLutjB4jesWjt2XEmWwoYBmXBhOuvxBbbzFaBqiVE61CXV/W+p9Q4x41EPK
	 A5hCJLF0UwM8AK3KbKIUozTMuOjuRy1kP3422JnPe9w2jd3njjTpK5hD53erQz4AS8
	 tjD1XVYIlSgMMNLIyhvo5oEJkUIcoyWtz/BhSsrFHIfJmlrO8xtu/Ld/AxAgkbnrYa
	 cVH654pGqdpPuMGL2LR9hFQMuw+3A+VvulMumunCHNfsdF1rIXYumtbniMj2WJwXh9
	 2X9AHxlxpThqg==
Date: Sat, 12 Oct 2024 23:05:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v7 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <ZwqzaKH9Ub8poNgX@vaman>
References: <20241010090822.3915064-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010090822.3915064-1-xu.yang_2@nxp.com>

On 10-10-24, 17:08, Xu Yang wrote:
> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>  - switching lane for flip
>  - moving unused lanes into lower power states.
> 
> This info can be get from:
> i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> 
> This will add support for TCA block to achieve lane switching and tca
> lower power functionality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> 
> ---
> Changes in v2:
>  - return the value of imx95_usb_phy_get_tca()
> Changes in v3:
>  - no changes
> Changes in v4:
>  - remove compatible check for imx95
>  - check whether tca register region exist or not, yes means has tca,
>    otherwise skip tca setup
> Changes in v5:
>  - no changes
> Changes in v6:
>  - no changes
> Changes in v7:
>  - fix sparse warnings in imx95_usb_phy_get_tca()
> ---
>  drivers/phy/freescale/Kconfig              |   1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 243 +++++++++++++++++++++
>  2 files changed, 244 insertions(+)
> 
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index dcd9acff6d01..81f53564ee15 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
>  config PHY_FSL_IMX8MQ_USB
>  	tristate "Freescale i.MX8M USB3 PHY"
>  	depends on OF && HAS_IOMEM
> +	depends on TYPEC || TYPEC=n
>  	select GENERIC_PHY
>  	default ARCH_MXC && ARM64
>  
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index adc6394626ce..661191276b27 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -10,6 +10,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/usb/typec_mux.h>
>  
>  #define PHY_CTRL0			0x0
>  #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> @@ -50,11 +51,66 @@
>  
>  #define PHY_TUNE_DEFAULT		0xffffffff
>  
> +#define TCA_CLK_RST			0x00
> +#define TCA_CLK_RST_SW			BIT(9)
> +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> +
> +#define TCA_INTR_EN			0x04
> +#define TCA_INTR_STS			0x08
> +
> +#define TCA_GCFG			0x10
> +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> +#define TCA_GCFG_OP_MODE_SYSMODE	0
> +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> +
> +#define TCA_TCPC			0x14
> +#define TCA_TCPC_VALID			BIT(4)
> +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> +
> +#define TCA_SYSMODE_CFG			0x18
> +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> +
> +#define TCA_CTRLSYNCMODE_CFG0		0x20
> +#define TCA_CTRLSYNCMODE_CFG1           0x20
> +
> +#define TCA_PSTATE			0x30
> +#define TCA_PSTATE_CM_STS		BIT(4)
> +#define TCA_PSTATE_TX_STS		BIT(3)
> +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> +
> +#define TCA_GEN_STATUS			0x34
> +#define TCA_GEN_DEV_POR			BIT(12)
> +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> +
> +#define TCA_VBUS_CTRL			0x40
> +#define TCA_VBUS_STATUS			0x44
> +
> +#define TCA_INFO			0xFC

lowercase please

> +
> +struct tca_blk {
> +	struct typec_switch_dev *sw;
> +	void __iomem *base;
> +	struct mutex mutex;
> +	enum typec_orientation orientation;
> +};
> +
>  struct imx8mq_usb_phy {
>  	struct phy *phy;
>  	struct clk *clk;
>  	void __iomem *base;
>  	struct regulator *vbus;
> +	struct tca_blk *tca;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -64,6 +120,175 @@ struct imx8mq_usb_phy {
>  	u32 comp_dis_tune;
>  };
>  
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation);
> +
> +#ifdef CONFIG_TYPEC
> +
> +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> +				enum typec_orientation orientation)
> +{
> +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> +	struct tca_blk *tca = imx_phy->tca;
> +	int ret;
> +
> +	if (tca->orientation == orientation)
> +		return 0;
> +
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	tca_blk_orientation_set(tca, orientation);
> +	clk_disable_unprepare(imx_phy->clk);
> +
> +	return 0;
> +}
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +					struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct typec_switch_dev *sw;
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = imx_phy;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = tca_blk_typec_switch_set;
> +	sw_desc.name = NULL;
> +
> +	sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(sw)) {
> +		dev_err(dev, "Error register tca orientation switch: %ld",
> +				PTR_ERR(sw));
> +		return NULL;
> +	}
> +
> +	return sw;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +{
> +	typec_switch_unregister(sw);
> +}

Why to put a wrapper over an API, call this instead?

> +
> +#else
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +			struct imx8mq_usb_phy *imx_phy)
> +{
> +	return NULL;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> +
> +#endif /* CONFIG_TYPEC */
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation)
> +{
> +	u32 val;
> +
> +	mutex_lock(&tca->mutex);
> +
> +	if (orientation == TYPEC_ORIENTATION_NONE) {
> +		/*
> +		 * use Controller Synced Mode for TCA low power enable and
> +		 * put PHY to USB safe state.
> +		 */
> +		val = readl(tca->base + TCA_GCFG);
> +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> +		writel(val, tca->base + TCA_GCFG);
> +
> +		val = readl(tca->base + TCA_TCPC);
> +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> +		writel(val, tca->base + TCA_TCPC);
> +
> +		goto out;
> +	}
> +
> +	/* use System Configuration Mode for TCA mux control. */
> +	val = readl(tca->base + TCA_GCFG);
> +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> +	writel(val, tca->base + TCA_GCFG);
> +
> +	/* Disable TCA module */
> +	val = readl(tca->base + TCA_SYSMODE_CFG);
> +	val |= TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> +		val |= TCA_SYSMODE_TCPC_FLIP;
> +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> +
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	/* Enable TCA module */
> +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +out:
> +	tca->orientation = orientation;
> +	mutex_unlock(&tca->mutex);
> +}
> +
> +static void tca_blk_init(struct tca_blk *tca)
> +{
> +	u32 val;
> +
> +	/* reset XBar block */
> +	val = readl(tca->base + TCA_CLK_RST);
> +	val &= ~TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	udelay(100);
> +
> +	/* clear reset */
> +	val |= TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	tca_blk_orientation_set(tca, tca->orientation);
> +}
> +
> +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> +				struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct tca_blk *tca;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res)
> +		return NULL;
> +
> +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> +	if (!tca)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tca->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(tca->base))
> +		return ERR_CAST(tca->base);
> +
> +	mutex_init(&tca->mutex);
> +
> +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> +
> +	return tca;
> +}
> +
> +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct tca_blk *tca = imx_phy->tca;
> +
> +	if (!tca)
> +		return;
> +
> +	tca_blk_put_typec_switch(tca->sw);
> +}
> +
>  static u32 phy_tx_vref_tune_from_property(u32 percent)
>  {
>  	percent = clamp(percent, 94U, 124U);
> @@ -315,6 +540,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  
>  	imx8m_phy_tune(imx_phy);
>  
> +	if (imx_phy->tca)
> +		tca_blk_init(imx_phy->tca);
> +
>  	return 0;
>  }
>  
> @@ -359,6 +587,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	 .data = &imx8mq_usb_phy_ops,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
>  	 .data = &imx8mp_usb_phy_ops,},
> +	{.compatible = "fsl,imx95-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -398,6 +628,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(imx_phy->phy, imx_phy);
>  
> +	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> +	if (IS_ERR(imx_phy->tca))
> +		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> +					"failed to get tca\n");
> +
>  	imx8m_get_phy_tuning_data(imx_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +640,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> +
> +	imx95_usb_phy_put_tca(imx_phy);
> +}
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> +	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> -- 
> 2.34.1

-- 
~Vinod

