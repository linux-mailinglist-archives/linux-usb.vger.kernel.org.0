Return-Path: <linux-usb+bounces-31866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067ACECF55
	for <lists+linux-usb@lfdr.de>; Thu, 01 Jan 2026 11:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC2F63006449
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jan 2026 10:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0935C2C0F7D;
	Thu,  1 Jan 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f65EGWF2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09A27FD54;
	Thu,  1 Jan 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767264487; cv=none; b=tQejqeJ0nPTtRJUQU3NSdISJ17banDIWttdWdfuL91CLwejJUbuKg7hmenWXmhpzBurlWcVBRkBiZYqxOg4Utpjh8vY2R86c7vaEo0qJzjaV8nlRmmZ/tAP4kP9qdmqWqslW5k/Ti0mONuF8OzKlvujRg+j2FjAYPNLCPVbx6EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767264487; c=relaxed/simple;
	bh=R0DOglverepptSmEjV6vsOv1lb25BtPMXmjL3NRM0Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVY6QU4YHF+TbzlrbfdJUfAnRG6NkJxPJKTZRp5+chdJgoBPZFpUsbL/Vv2veP/9TwQbVC1lSB+GaFdxVYda22ihX9LfwVKOdEaVheDsI1mlfLnOIakvK20/95ZKHnTaku28O6g9pEbQ91VkejwubabAaqBk8hQsVKWSCqtqqBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f65EGWF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A5CC4CEF7;
	Thu,  1 Jan 2026 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767264484;
	bh=R0DOglverepptSmEjV6vsOv1lb25BtPMXmjL3NRM0Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f65EGWF21o5v2DTtbG1ujgxxdDrGwkgzF0Vcg3wmXGaHeIEGquQV5L2zMHHoLVxxH
	 DS8cdr5Km3j7i6cQC5YxKnOcsyBOUKiX3DMmNN0n7+WsCGw9uNRgKWB7WnYgMepifn
	 2albIziaBgRchlR/NTxAm0plcNO7PNyPNCr10fnR9ZOOexAi/jLpFo3vlneNB+aQgi
	 Cy/tGvZHndLd2DRKrcsfzjBarNMqDVHBWxel+5042uFqCPlH9hfREnx+L6E4naaZW2
	 t34v30AME7TVWeEUmpF9BzIdj0h21xZemWK+b5ZHnHJEq9il0L2KhVRo8heOWmCZGp
	 P4RM95qVoK8cw==
Date: Thu, 1 Jan 2026 16:18:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, gregkh@linuxfoundation.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aVZQ4YVXGryHz0ds@vaman>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-5-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230023725.15966-5-jiayu.riscv@isrc.iscas.ac.cn>

On 30-12-25, 10:37, Jiayu Du wrote:
> Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
> initialization, power management and USB mode switching.
> 
> Add Kconfig/Makefile under drivers/phy/canaan/.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  drivers/phy/Kconfig               |   1 +
>  drivers/phy/Makefile              |   1 +
>  drivers/phy/canaan/Kconfig        |  14 ++
>  drivers/phy/canaan/Makefile       |   2 +
>  drivers/phy/canaan/phy-k230-usb.c | 272 ++++++++++++++++++++++++++++++
>  5 files changed, 290 insertions(+)
>  create mode 100644 drivers/phy/canaan/Kconfig
>  create mode 100644 drivers/phy/canaan/Makefile
>  create mode 100644 drivers/phy/canaan/phy-k230-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0a..95e630749350 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -105,6 +105,7 @@ source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
> +source "drivers/phy/canaan/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
>  source "drivers/phy/ingenic/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494..f07c68f2e283 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -17,6 +17,7 @@ obj-y					+= allwinner/	\
>  					   amlogic/	\
>  					   broadcom/	\
>  					   cadence/	\
> +					   canaan/	\
>  					   freescale/	\
>  					   hisilicon/	\
>  					   ingenic/	\
> diff --git a/drivers/phy/canaan/Kconfig b/drivers/phy/canaan/Kconfig
> new file mode 100644
> index 000000000000..1ff8831846d5
> --- /dev/null
> +++ b/drivers/phy/canaan/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Canaan platforms
> +#
> +config PHY_CANAAN_USB
> +	tristate "Canaan USB2 PHY Driver"
> +	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
> +	select GENERIC_PHY
> +	help
> +	Enable this driver to support the USB 2.0 PHY controller
> +	on Canaan K230 RISC-V SoCs. This PHY controller
> +	provides physical layer functionality for USB 2.0 devices.
> +	If you have a Canaan K230 board and need USB 2.0 support,
> +	say Y or M here.
> diff --git a/drivers/phy/canaan/Makefile b/drivers/phy/canaan/Makefile
> new file mode 100644
> index 000000000000..d73857ba284e
> --- /dev/null
> +++ b/drivers/phy/canaan/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_CANAAN_USB)		+= phy-k230-usb.o
> diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
> new file mode 100644
> index 000000000000..668618fb2188
> --- /dev/null
> +++ b/drivers/phy/canaan/phy-k230-usb.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Canaan usb PHY driver
> + *
> + * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define TEST_CTL3_OFFSET	0x0C

Lowercase hex values please.. do you need a test register :-)

> +#define CTL0_OFFSET		0x00
> +#define CTL1_OFFSET		0x04
> +#define USB_IDPULLUP0		BIT(4)
> +#define USB_DMPULLDOWN0		BIT(8)
> +#define USB_DPPULLDOWN0		BIT(9)
> +
> +/* USB control register 0 in HiSysConfig system controller */
> +/* PLL Integral Path Tune */
> +#define USB_CTL0_PLLITUNE_MASK		GENMASK(23, 22)
> +
> +/* PLL Proportional Path Tune */
> +#define USB_CTL0_PLLPTUNE_MASK		GENMASK(21, 18)
> +
> +/* PLL Bandwidth Adjustment */
> +#define USB_CTL0_PLLBTUNE_MASK		GENMASK(17, 17)
> +
> +/* VReg18 Bypass Control */
> +#define USB_CTL0_VREGBYPASS_MASK	GENMASK(16, 16)
> +
> +/* Retention Mode Enable */
> +#define USB_CTL0_RETENABLEN_MASK	GENMASK(15, 15)
> +
> +/* Reserved Request Input */
> +#define USB_CTL0_RESREQIN_MASK		GENMASK(14, 14)
> +
> +/* External VBUS Valid Select */
> +#define USB_CTL0_VBUSVLDEXTSEL0_MASK	GENMASK(13, 13)
> +
> +/* OTG Block Disable Control */
> +#define USB_CTL0_OTGDISABLE0_MASK	GENMASK(12, 12)
> +
> +/* Drive VBUS Enable */
> +#define USB_CTL0_DRVVBUS0_MASK		GENMASK(11, 11)
> +
> +/* Autoresume Mode Enable */
> +#define USB_CTL0_AUTORSMENB0_MASK	GENMASK(10, 10)
> +
> +/* HS Transceiver Asynchronous Control */
> +#define USB_CTL0_HSXCVREXTCTL0_MASK	GENMASK(9, 9)
> +
> +/* USB 1.1 Transmit Data */
> +#define USB_CTL0_FSDATAEXT0_MASK	GENMASK(8, 8)
> +
> +/* USB 1.1 SE0 Generation */
> +#define USB_CTL0_FSSE0EXT0_MASK		GENMASK(7, 7)
> +
> +/* USB 1.1 Data Enable */
> +#define USB_CTL0_TXENABLEN0_MASK	GENMASK(6, 6)
> +
> +/* Disconnect Threshold */
> +#define USB_CTL0_COMPDISTUNE0_MASK	GENMASK(5, 3)
> +
> +/* Squelch Threshold */
> +#define USB_CTL0_SQRXTUNE0_MASK		GENMASK(2, 0)
> +
> +/* USB control register 1 in HiSysConfig system controller */
> +/* Data Detect Voltage */
> +#define USB_CTL1_VDATREFTUNE0_MASK	GENMASK(23, 22)
> +
> +/* VBUS Valid Threshold */
> +#define USB_CTL1_OTGTUNE0_MASK		GENMASK(21, 19)
> +
> +/* Transmitter High-Speed Crossover */
> +#define USB_CTL1_TXHSXVTUNE0_MASK	GENMASK(18, 17)
> +
> +/* FS/LS Source Impedance */
> +#define USB_CTL1_TXFSLSTUNE0_MASK	GENMASK(16, 13)
> +
> +/* HS DC Voltage Level */
> +#define USB_CTL1_TXVREFTUNE0_MASK	GENMASK(12, 9)
> +
> +/* HS Transmitter Rise/Fall Time */
> +#define USB_CTL1_TXRISETUNE0_MASK	GENMASK(8, 7)
> +
> +/* USB Source Impedance */
> +#define USB_CTL1_TXRESTUNE0_MASK	GENMASK(6, 5)
> +
> +/* HS Transmitter Pre-Emphasis Current Control */
> +#define USB_CTL1_TXPREEMPAMPTUNE0_MASK	GENMASK(4, 3)
> +
> +/* HS Transmitter Pre-Emphasis Duration Control */
> +#define USB_CTL1_TXPREEMPPULSETUNE0_MASK	GENMASK(2, 2)
> +
> +/* charging detection */
> +#define USB_CTL1_CHRGSRCPUENB0_MASK	GENMASK(1, 0)
> +
> +#define K230_PHY_CTL0_VAL \
> +( \
> +	FIELD_PREP(USB_CTL0_PLLITUNE_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xC) | \

lower hex here and rest

> +	FIELD_PREP(USB_CTL0_PLLBTUNE_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_VREGBYPASS_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_RETENABLEN_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_RESREQIN_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_VBUSVLDEXTSEL0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_OTGDISABLE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_DRVVBUS0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL0_AUTORSMENB0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_HSXCVREXTCTL0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_FSDATAEXT0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_FSSE0EXT0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_TXENABLEN0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL0_COMPDISTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL0_SQRXTUNE0_MASK, 0x3) \
> +)
> +
> +#define K230_PHY_CTL1_VAL \
> +( \
> +	FIELD_PREP(USB_CTL1_VDATREFTUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_OTGTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXHSXVTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXFSLSTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXVREFTUNE0_MASK, 0x3) | \
> +	FIELD_PREP(USB_CTL1_TXRISETUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_TXRESTUNE0_MASK, 0x1) | \
> +	FIELD_PREP(USB_CTL1_TXPREEMPAMPTUNE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL1_TXPREEMPPULSETUNE0_MASK, 0x0) | \
> +	FIELD_PREP(USB_CTL1_CHRGSRCPUENB0_MASK, 0x0) \
> +)
> +
> +struct k230_usb_phy {
> +	struct regmap *regmap;
> +	u32 reg_ctl_offset;
> +	u32 reg_test_offset;
> +	struct clk *clk;
> +};
> +
> +static int k230_usb_phy_power_on(struct phy *_phy)
> +{
> +	struct k230_usb_phy *phy = phy_get_drvdata(_phy);
> +	int ret;
> +	u32 val;
> +
> +	ret = clk_prepare_enable(phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(phy->regmap, phy->reg_ctl_offset + CTL0_OFFSET,
> +			   K230_PHY_CTL0_VAL);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	ret = regmap_write(phy->regmap, phy->reg_ctl_offset + CTL1_OFFSET,
> +			   K230_PHY_CTL1_VAL);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	val |= USB_IDPULLUP0 | USB_DMPULLDOWN0 | USB_DPPULLDOWN0;
> +
> +	ret = regmap_update_bits(phy->regmap, phy->reg_test_offset +
> +				 TEST_CTL3_OFFSET, val, val);

so we are writing to a test register..?

> +	if (ret)
> +		goto err_disable_clk;
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(phy->clk);
> +	return ret;
> +}
> +
> +static int k230_usb_phy_power_off(struct phy *_phy)
> +{
> +	struct k230_usb_phy *phy = phy_get_drvdata(_phy);
> +	int ret;
> +	u32 val;
> +
> +	val = USB_DMPULLDOWN0 | USB_DPPULLDOWN0;
> +
> +	ret = regmap_update_bits(phy->regmap, phy->reg_test_offset +
> +				 TEST_CTL3_OFFSET, val, 0);
> +	if (ret)
> +		return ret;
> +
> +	clk_disable_unprepare(phy->clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops k230_usb_phy_ops = {
> +	.power_on = k230_usb_phy_power_on,
> +	.power_off = k230_usb_phy_power_off,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int k230_usb_phy_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	u32 offset;
> +	struct regmap *regmap;
> +	struct phy *generic_phy;
> +	struct k230_usb_phy *phy;
> +	struct phy_provider *provider;
> +	struct device *dev = &pdev->dev;

reverse christmas  tree order would look better...

> +	regmap = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to get syscon regmap\n");
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	phy->regmap = regmap;
> +
> +

why two lines...?

> +	ret = of_property_read_u32_index(dev->of_node, "reg", 0, &offset);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing first reg offset\n");
> +	phy->reg_test_offset = offset;
> +
> +	ret = of_property_read_u32_index(dev->of_node, "reg", 2, &offset);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing second reg offset\n");
> +	phy->reg_ctl_offset = offset;
> +
> +	phy->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy->clk))
> +		return dev_err_probe(dev, PTR_ERR(phy->clk),
> +				     "failed to get clock\n");
> +
> +	generic_phy = devm_phy_create(dev, dev->of_node, &k230_usb_phy_ops);
> +
> +	if (IS_ERR(generic_phy))
> +		return dev_err_probe(dev, PTR_ERR(generic_phy),
> +				     "failed to create PHY\n");
> +
> +	phy_set_drvdata(generic_phy, phy);
> +
> +	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider))
> +		return dev_err_probe(dev, PTR_ERR(provider),
> +				     "failed to register phy provider\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id k230_usb_phy_of_match[] = {
> +	{ .compatible = "canaan,k230-usb-phy" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, k230_usb_phy_of_match);
> +
> +static struct platform_driver k230_usb_phy_driver = {
> +	.probe = k230_usb_phy_probe,
> +	.driver = {
> +		.name = "k230-usb-phy",
> +		.of_match_table = k230_usb_phy_of_match,
> +	},
> +};
> +module_platform_driver(k230_usb_phy_driver);
> +
> +MODULE_DESCRIPTION("Canaan Kendryte K230 USB 2.0 PHY driver");
> +MODULE_AUTHOR("Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.52.0

-- 
~Vinod

