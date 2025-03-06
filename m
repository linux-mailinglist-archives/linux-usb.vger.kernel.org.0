Return-Path: <linux-usb+bounces-21415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8604FA5456B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 09:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1B967A3CCD
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D422080C4;
	Thu,  6 Mar 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxdVf8ha"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5B919D880;
	Thu,  6 Mar 2025 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251194; cv=none; b=DxtFGERFXgV3FWLecVGfGoEpyYmknNS75FwfNsNKWVXnt1Kep2CbsSIh86+e2lrqVaYzIczc4VefOEA2VwpucFJfIFsYXPEuIOYUB6iMBqe5mvxCUaafRnVfcHOqBYnR7TdXAJIr2+d1Bn0ZxcAA1+JQh9UCq1MVEyExHJgAZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251194; c=relaxed/simple;
	bh=EEomdBKt+X/5n5ZchX8hINjV+Sy90VhkmeD4NnK1f8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8tIyXBekz7CxyfOjLm09nK+LYQ9CdP99KL0+1apGBtqMXaUnRgjbP2zxFqfAyMuJ7lTaWhMAan4CshFU1+ScqD/Bt80nb9Wn61r+6HAhVjeTfUCXhHbYVUf7DDSWIjvPkCWxfcStQcaslSs+qmwHTZYL+sdqBZbp9Fg/BY4slw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxdVf8ha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FE8C4CEE0;
	Thu,  6 Mar 2025 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741251193;
	bh=EEomdBKt+X/5n5ZchX8hINjV+Sy90VhkmeD4NnK1f8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxdVf8ha9HeBX99xcCS7N7otPMXkxCLLLIapHLItazmsbZJ/wQDu9Ydp4fzi24RVE
	 AwbQaMdxYbszJ0gXz243pvuk3xlZGSBU4Y1mgk9ewLVtVrb8YvhGRwqmHh+tu+yX6E
	 QMV3aVp2WYZRsmJRXWHSHnuYxIt7OSms0ZA+ra4gyW5D2lEvgH5zI/mS9injn9hAb2
	 c7E7KHxHmZGz1zjbR+oCGD7B/UyNc2HC/XWLNvN8NPTrNnSd8VBAkOdVPW6iGCs6FF
	 K4UwS7+3LBQSRKva458uhxr5RKV7ICSAMwIZBAzfC3X+nzTw168OizlL/w78FcOAUP
	 vtljFxTBIZQiQ==
Date: Thu, 6 Mar 2025 16:53:05 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 4/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <Z8licaX8M_Nz6Dmz@nchen-desktop>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-5-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303033344.1251076-5-xu.yang_2@nxp.com>

On 25-03-03 11:33:42, Xu Yang wrote:
> On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> Control:
> 
> HSIO Block Control Overview:
> - The HSIO block control include configuration and status registers that
>   provide miscellaneous top-level controls for clocking, beat limiter
>   enables, wakeup signal enables and interrupt status for the PCIe and USB
>   interfaces.
> 
> The wakeup function of HSIO blkctl is basically same as non-core, except
> improvements about power lost cases. This will add the wakeup setting for
> HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
> wakeup setting as needs.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> 
> ---
> Changes in v4:
>  - add blkctl NULL checking
>  - warning if no blkctl reg provided for imx95
> Changes in v3:
>  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> Changes in v2:
>  - add Rb tag
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 77 ++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 1394881fde5f..3b35efd95cdb 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -139,6 +139,22 @@
>  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
>  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
>  
> +/*
> + * HSIO Block Control Register
> + */
> +
> +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> +
> +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -159,6 +175,7 @@ struct usbmisc_ops {
>  
>  struct imx_usbmisc {
>  	void __iomem *base;
> +	void __iomem *blkctl;
>  	spinlock_t lock;
>  	const struct usbmisc_ops *ops;
>  };
> @@ -1016,6 +1033,44 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
>  		return 0;
>  }
>  
> +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> +{
> +	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> +
> +	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
> +		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
> +
> +	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
> +		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> +
> +	/* Select session valid as VBUS wakeup source */
> +	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
> +
> +	return wakeup_setting;
> +}
> +
> +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (!usbmisc->blkctl)
> +		return 0;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> +	val &= ~BLKCTL_WAKEUP_SOURCE;
> +
> +	if (enabled)
> +		val |= usbmisc_blkctl_wakeup_setting(data);
> +
> +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	return 0;
> +}
> +
>  static const struct usbmisc_ops imx25_usbmisc_ops = {
>  	.init = usbmisc_imx25_init,
>  	.post = usbmisc_imx25_post,
> @@ -1068,6 +1123,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
>  };
>  
> +static const struct usbmisc_ops imx95_usbmisc_ops = {
> +	.init = usbmisc_imx7d_init,
> +	.set_wakeup = usbmisc_imx95_set_wakeup,
> +	.charger_detection = imx7d_charger_detection,
> +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1289,6 +1352,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "fsl,imx8ulp-usbmisc",
>  		.data = &imx7ulp_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "fsl,imx95-usbmisc",
> +		.data = &imx95_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> @@ -1296,6 +1363,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
>  static int usbmisc_imx_probe(struct platform_device *pdev)
>  {
>  	struct imx_usbmisc *data;
> +	struct resource *res;
>  
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -1307,6 +1375,15 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->base))
>  		return PTR_ERR(data->base);
>  
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (res) {
> +		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(data->blkctl))
> +			return PTR_ERR(data->blkctl);
> +	} else if (device_is_compatible(&pdev->dev, "fsl,imx95-usbmisc")) {
> +		dev_warn(&pdev->dev, "wakeup setting is missing");
> +	}
> +
>  	data->ops = of_device_get_match_data(&pdev->dev);
>  	platform_set_drvdata(pdev, data);
>  
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

