Return-Path: <linux-usb+bounces-14289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90F964D72
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 20:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442D61C22160
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931681B86E6;
	Thu, 29 Aug 2024 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8wStHdi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093551B81D4;
	Thu, 29 Aug 2024 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724954915; cv=none; b=AULSSHoLtqL9yhNKdU1JKfhRiwHiSX8MM2ojhgnHHSpDMOJMthf1i8yUCSeXG1Rs90z/y7SefIUgxsqTqT+XK4WazTjmTBfSZtxKPayfuPCfbuUykiqtbbpNwH8OpIQE79CCQMMCxIhQA5ptTYxWGQ2T8q4mWO9BMQFfTvQWx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724954915; c=relaxed/simple;
	bh=C13xoFhJK6cmxgZuGmS3AlQujpIr+u06c/XDdASbM3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GopR0dap7sZ7tUNVqeuIbFzibqozdsmbA/NRfMjvrQv1yEwqALHPoB65Y17cQmdGTxO6Sa2jF3EhJJyjOp9xFKFflPKHAsPzw/2P7jOBLr0blMhP4clS5Son8E4QMKYtw5OtNY98Se9gLt7H5TY/sxQRovt3qtEK0X57OgwRLRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8wStHdi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B073FC4CEC1;
	Thu, 29 Aug 2024 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724954914;
	bh=C13xoFhJK6cmxgZuGmS3AlQujpIr+u06c/XDdASbM3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8wStHdi3ge6t9sjbk6KPialPcbQPcyFbjlsFzhn/L7sqIQPTLqUT/X9x+vYmqG04
	 nhMqLOAoaKstC5MQY9jGhMI5ENif90I8aGI8P9/tyF6VdWyg9wOTKURrLagXOOEP3B
	 1NhGgDISSUfmfYq757tfPMgHM4q8eqJMv5XJziF5ljSnqUcRMV+tOn9I4+jsEXHc2p
	 +M31Y+EFf8clGukjQsVVMGPf4TWCHEg65uugJxBU9K9rOVf13AFDdb9iq9LqkefDwY
	 rNeZWNB8OOP6XAb7jNtVwPvZWMZ8BcaaUrEZ89UATP2wdvgDWI+9qQ5yMZ/a+XSSaP
	 0+Fbxqx1VMb1g==
Date: Thu, 29 Aug 2024 23:38:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <ZtC5HqOzgDBYc8uW@vaman>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
 <20240826070854.1948347-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826070854.1948347-3-xu.yang_2@nxp.com>

On 26-08-24, 15:08, Xu Yang wrote:
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
> ---
>  drivers/phy/freescale/Kconfig              |   1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
>  2 files changed, 241 insertions(+)
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
> index adc6394626ce..8bd6d91951a2 100644
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
> @@ -64,6 +120,170 @@ struct imx8mq_usb_phy {
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
> +	struct tca_blk *tca;
> +
> +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> +	if (!tca)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tca->base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(tca->base))
> +		return tca->base;
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
> @@ -315,6 +535,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  
>  	imx8m_phy_tune(imx_phy);
>  
> +	if (imx_phy->tca)
> +		tca_blk_init(imx_phy->tca);
> +
>  	return 0;
>  }
>  
> @@ -359,6 +582,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	 .data = &imx8mq_usb_phy_ops,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
>  	 .data = &imx8mp_usb_phy_ops,},
> +	{.compatible = "fsl,imx95-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},

Okay

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -398,6 +623,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(imx_phy->phy, imx_phy);
>  
> +	if (device_is_compatible(dev, "fsl,imx95-usb-phy")) {

so future version will also have this check, so are we going to increase
this..? maybe better idea is to expand imx8mp_usb_phy_ops and add a flag
for tca support and set that for required compatible, or make this a
property?


> +		imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> +		if (IS_ERR(imx_phy->tca))
> +			return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> +						"failed to get tca\n");
> +	}
> +
>  	imx8m_get_phy_tuning_data(imx_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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

