Return-Path: <linux-usb+bounces-21120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AAA4737F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 04:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 093B1174322
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 03:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD3F19C552;
	Thu, 27 Feb 2025 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg0lylCl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C6156230;
	Thu, 27 Feb 2025 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740626150; cv=none; b=AlkEYCap1OKMEkU6093Q1zeOH2XwV16fR12rLsuYxTYOeXf0NfPGmMcrfb7tbWx5uV1ip7YsW3Uk0QWXbfTOduikUzfXF+o9kk9roKboslITdeRVo8DKUf7XA1BNGT6gIbSq4sT3zE9s5MlB7nYUv0cj8czOWv9jDcBOleVMwzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740626150; c=relaxed/simple;
	bh=VwhZW4t3p32C8Wicn9OWtSuDcinzzKKoyi9jS28rMt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSfdZmh4A5viLv9qsVJl7WF7w4nT7rXO5bonmi8YplDA79uR9DoybCNzVJ5MuJpvpSHuuMQE/nUaKG48iHKuKcRlGeTf3G46m/58uzFeBLY2SMZMenkv9fjTQ8WVKAaRJvbL1r6nIID45/uK86Vy343suV1H5Man3y3yh9BbPcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg0lylCl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7546EC4CEEB;
	Thu, 27 Feb 2025 03:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740626149;
	bh=VwhZW4t3p32C8Wicn9OWtSuDcinzzKKoyi9jS28rMt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg0lylClrBIpgIOSTlqvcuRyEuBM7JOJNUKgV7F7DtLZuxeMcNzhEvsD+CrtLjwot
	 mYccG1nVWuCedToT3/GFdrzoobNck9/bGV6ZwW3EdQnIcGk1d+6KQwnawrnGCHzzQS
	 bTneFrTyOwcInVglcUpnpyIhybTmrkTLgoRrmMxTWOQuSoCzDEb09eu3fbwY/eNWma
	 VTtfXxwO1c/ctpnTl+JCfqD87PGQCOyDYs9dIx6jMHhouMc90xnxbX3HS2m3DJhIUF
	 wDuPqtIz6vV1WZ783Y8r+QiPjO5G55suEC6hOQez/Nld5OzXSonsQlVqhfVUIgYopX
	 K9EX68Cs98XUA==
Date: Thu, 27 Feb 2025 11:15:40 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 3/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <Z7_Y3KIsyKBOqx3K@nchen-desktop>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225053955.3781831-4-xu.yang_2@nxp.com>

On 25-02-25 13:39:52, Xu Yang wrote:
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
> 
> ---
> Changes in v2:
>  - add Rb tag
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 107 +++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 1394881fde5f..f933fc70be66 100644
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
> @@ -1016,6 +1033,76 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
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
> +static int usbmisc_imx95_init(struct imx_usbmisc_data *data)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	if (data->index >= 1)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	reg = readl(usbmisc->base);
> +
> +	if (data->disable_oc) {
> +		reg |= MX6_BM_OVER_CUR_DIS;
> +	} else {
> +		reg &= ~MX6_BM_OVER_CUR_DIS;
> +
> +		if (data->oc_pol_configured && data->oc_pol_active_low)
> +			reg |= MX6_BM_OVER_CUR_POLARITY;
> +		else if (data->oc_pol_configured)
> +			reg &= ~MX6_BM_OVER_CUR_POLARITY;
> +	}
> +
> +	if (data->pwr_pol == 1)
> +		reg |= MX6_BM_PWR_POLARITY;
> +
> +	writel(reg, usbmisc->base);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	/* use HSIO blkctl wakeup as source, disable usbmisc setting*/
> +	usbmisc_imx7d_set_wakeup(data, false);
> +
> +	return 0;
> +}

Above code has duplicated with some imx7d and imx7ulp init code,
Is it possible abstract some common code for all these three platforms?

Peter
> +
>  static const struct usbmisc_ops imx25_usbmisc_ops = {
>  	.init = usbmisc_imx25_init,
>  	.post = usbmisc_imx25_post,
> @@ -1068,6 +1155,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
>  };
>  
> +static const struct usbmisc_ops imx95_usbmisc_ops = {
> +	.init = usbmisc_imx95_init,
> +	.set_wakeup = usbmisc_imx95_set_wakeup,
> +	.charger_detection = imx7d_charger_detection,
> +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1289,6 +1384,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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
> @@ -1296,6 +1395,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
>  static int usbmisc_imx_probe(struct platform_device *pdev)
>  {
>  	struct imx_usbmisc *data;
> +	struct resource *res;
>  
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -1307,6 +1407,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->base))
>  		return PTR_ERR(data->base);
>  
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (res) {
> +		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(data->blkctl))
> +			return PTR_ERR(data->blkctl);
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

