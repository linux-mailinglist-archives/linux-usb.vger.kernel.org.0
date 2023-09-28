Return-Path: <linux-usb+bounces-687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F47B17F0
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 11:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 18893281D77
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 09:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12050347C5;
	Thu, 28 Sep 2023 09:55:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC52E65C;
	Thu, 28 Sep 2023 09:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21997C433C8;
	Thu, 28 Sep 2023 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695894956;
	bh=+DSkHuvZmTOScbwhjWVKRNlUFglCaEELGK+8EY7Tp/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NMXSWKElxk6xfVfY06vGjZCgODlqRzzee6ia03JW8afHrGDE771oQpZ3dPJehOEpH
	 OQejT+hMGdVDQRswZqSOuzET/BZgEYVLIPBjPveFZh1PxSwsS5rt8eEOsduy/vQONM
	 x5zAIKHBA6PpMj7zieC72VqN9I8Bmdlc0rEozi6tW9BN7iXDtmwU5I4xim7dAptRbX
	 OTbtbLZMwG0yy6Qx80iiHFfeobSHARVHw3MEEiC0aKYLJKwPBOdQkYY/ZUtRZK864h
	 HdJLTbIDJ9fg1yG3+e5b/vaZmxKHEnvdfnWwk0AxdKJeB6Xq41dIay69zk6PUw3M/w
	 hqTmjwuJcMDow==
Date: Thu, 28 Sep 2023 17:55:44 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, xu.yang_2@nxp.com,
	peng.fan@nxp.com, avifishman70@gmail.com, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, j.neuschaefer@gmx.net,
	openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: chipidea: Add support for NPCM
Message-ID: <20230928095544.GB2081690@nchen-desktop>
References: <20230927095509.267029-1-tmaimon77@gmail.com>
 <20230927095509.267029-4-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927095509.267029-4-tmaimon77@gmail.com>

On 23-09-27 12:55:09, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC SoCs support to USB ChipIdea driver.
> NPCM SoC include ChipIdea IP block that used for USB device controller
> mode.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/Kconfig        |   4 +
>  drivers/usb/chipidea/Makefile       |   1 +
>  drivers/usb/chipidea/ci_hdrc_npcm.c | 117 ++++++++++++++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 drivers/usb/chipidea/ci_hdrc_npcm.c
> 
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index c815824a0b2d..bab45bc62361 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -43,6 +43,10 @@ config USB_CHIPIDEA_MSM
>  	tristate "Enable MSM hsusb glue driver" if EXPERT
>  	default USB_CHIPIDEA
>  
> +config USB_CHIPIDEA_NPCM
> +	tristate "Enable NPCM hsusb glue driver" if EXPERT
> +	default USB_CHIPIDEA
> +
>  config USB_CHIPIDEA_IMX
>  	tristate "Enable i.MX USB glue driver" if EXPERT
>  	depends on OF
> diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
> index 71afeab97e83..718cb24603dd 100644
> --- a/drivers/usb/chipidea/Makefile
> +++ b/drivers/usb/chipidea/Makefile
> @@ -13,6 +13,7 @@ ci_hdrc-$(CONFIG_USB_OTG_FSM)		+= otg_fsm.o
>  
>  obj-$(CONFIG_USB_CHIPIDEA_GENERIC)	+= ci_hdrc_usb2.o
>  obj-$(CONFIG_USB_CHIPIDEA_MSM)		+= ci_hdrc_msm.o
> +obj-$(CONFIG_USB_CHIPIDEA_NPCM)		+= ci_hdrc_npcm.o
>  obj-$(CONFIG_USB_CHIPIDEA_PCI)		+= ci_hdrc_pci.o
>  obj-$(CONFIG_USB_CHIPIDEA_IMX)		+= usbmisc_imx.o ci_hdrc_imx.o
>  obj-$(CONFIG_USB_CHIPIDEA_TEGRA)	+= ci_hdrc_tegra.o
> diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
> new file mode 100644
> index 000000000000..4169855e7940
> --- /dev/null
> +++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 Nuvoton Technology corporation.
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/usb/chipidea.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/reset-controller.h>
> +#include <linux/of.h>
> +
> +#include "ci.h"
> +
> +struct npcm_udc_data {
> +	struct platform_device	*ci;
> +	struct clk		*core_clk;
> +	struct ci_hdrc_platform_data pdata;
> +};
> +
> +static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned event)
> +{
> +	struct device *dev = ci->dev->parent;
> +
> +	switch (event) {
> +	case CI_HDRC_CONTROLLER_RESET_EVENT:
> +		/* clear all mode bits */
> +		hw_write(ci, OP_USBMODE, 0xffffffff, 0x0);
> +		break;
> +	default:
> +		dev_dbg(dev, "unknown ci_hdrc event\n");
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int npcm_udc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct npcm_udc_data *ci;
> +	struct platform_device *plat_ci;
> +	struct device *dev = &pdev->dev;
> +
> +	ci = devm_kzalloc(&pdev->dev, sizeof(*ci), GFP_KERNEL);
> +	if (!ci)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, ci);
> +
> +	ci->core_clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(ci->core_clk))
> +		return PTR_ERR(ci->core_clk);
> +
> +	ret = clk_prepare_enable(ci->core_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable the clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ci->pdata.name = dev_name(dev);
> +	ci->pdata.capoffset = DEF_CAPOFFSET;
> +	ci->pdata.flags	= CI_HDRC_REQUIRES_ALIGNED_DMA |
> +		CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS;
> +	ci->pdata.phy_mode = USBPHY_INTERFACE_MODE_UTMI;
> +	ci->pdata.notify_event = npcm_udc_notify_event;
> +
> +	plat_ci = ci_hdrc_add_device(dev, pdev->resource, pdev->num_resources,
> +				     &ci->pdata);
> +	if (IS_ERR(plat_ci)) {
> +		ret = PTR_ERR(plat_ci);
> +		dev_err(dev, "failed to register HDRC NPCM device: %d\n", ret);
> +		goto clk_err;
> +	}
> +
> +	pm_runtime_no_callbacks(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +clk_err:
> +	clk_disable_unprepare(ci->core_clk);
> +	return ret;
> +}
> +
> +static int npcm_udc_remove(struct platform_device *pdev)
> +{
> +	struct npcm_udc_data *ci = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	ci_hdrc_remove_device(ci->ci);
> +	clk_disable_unprepare(ci->core_clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id npcm_udc_dt_match[] = {
> +	{ .compatible = "nuvoton,npcm750-udc", },
> +	{ .compatible = "nuvoton,npcm845-udc", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, npcm_udc_dt_match);
> +
> +static struct platform_driver npcm_udc_driver = {
> +	.probe = npcm_udc_probe,
> +	.remove = npcm_udc_remove,
> +	.driver = {
> +		.name = "npcm_udc",
> +		.of_match_table = npcm_udc_dt_match,
> +	},
> +};
> +
> +module_platform_driver(npcm_udc_driver);
> +
> +MODULE_DESCRIPTION("NPCM USB device controller driver");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_ALIAS("platform:npcm-udc");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.0
> 

-- 

Thanks,
Peter Chen

