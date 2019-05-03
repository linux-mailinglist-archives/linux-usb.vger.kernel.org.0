Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A749F13000
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 16:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfECOWo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 10:22:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39266 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbfECOWo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 10:22:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id a9so8126090wrp.6;
        Fri, 03 May 2019 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ogKdnEbe/pHEFglrVmOM28+6NpAciAimAJdOSbWYr44=;
        b=i6Y49Fnq89nnXBxogUBSZpAMgz3oDyRYb0FG+mPoWqvfQeYmkWGV6/SN/VmYQX64Rq
         YEXkH6THBZfyApY+3v82hepkyz1dIaZxtmx84poyC5E0Dp+GyZMCQ924lDotXbCT9Xgd
         mikct6ZCNg5s2ziW7dmRigaYlMeUXfmEmq0De2SQR+zFoRPabUYez5/OZEnJmorHT8dN
         x0+lb+wBomHRl2MEcGr2/9IkiPO7INfDqDFEBXNuNCsc7naW/kaLS8Fp2VmgRjbB1Wbt
         D483+CLhQkM8dO3WIr5lY/uA1oOixkr2V6rqE/KApwD2x0TtEk2t6TEuxCcNUxBB6qlM
         km0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ogKdnEbe/pHEFglrVmOM28+6NpAciAimAJdOSbWYr44=;
        b=Vk4UJc/KaYapFuJI9fF1sujBhy6dlSbRaZQo+vHUAjLQLMTgdCLHByaFhNeVOqqQaE
         Mc2yAigTj9DGg8EjswBPLzAbYGPFT1mexVgayzlD/ggHwlJ4Y/0hovWU4HGI0EYiEJ0w
         gUPpIBkZWVBPpMfeAdpnmZIZ17RChc2Dccd5lvxzO6Wv+oxXjO/Il1HgbHlvtX6Xkaof
         tH0GiMHrQtJ0FcQzQINmvOu2vK3PEfU1Y2RhWM+WwRlyKhXX61/1JcsypySJiYBLXvnk
         akUtD2LKHhCMJh2+AFB0Wau2jr9OSE6j5hDIb3WGhnqWfDZhYV7bKjQNz51c2UOWiGBR
         WVJQ==
X-Gm-Message-State: APjAAAUdI/KmPRoJcl9z5bTt7iDqBtwCUkixIW4K5werGLCUWvmKHvRg
        Trrmw9RZXLrlZLL25VDlDZI=
X-Google-Smtp-Source: APXvYqxTkhc5AqEJXUIeP9z8fy01Ql2lWDTkqWSGbbR3va6ZVfaU/zP6v21NkCDx3PNrkpVVSrDMdg==
X-Received: by 2002:a5d:6341:: with SMTP id b1mr7291477wrw.28.1556893361488;
        Fri, 03 May 2019 07:22:41 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id o16sm2806808wro.63.2019.05.03.07.22.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 07:22:40 -0700 (PDT)
Date:   Fri, 3 May 2019 16:22:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190503142238.GA3300@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <1552302716-18554-8-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 04:41:55PM +0530, Nagarjuna Kristam wrote:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.

s/tegra/Tegra/

> XUSB device mode controller support SS, HS and FS modes

s/support/supports/ and terminate the sentence with a full-stop.

>=20
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   10 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3702 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3713 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>=20
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index 0a16cbd..f6f469c 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -439,6 +439,16 @@ config USB_GADGET_XILINX
>  	  dynamically linked module called "udc-xilinx" and force all
>  	  gadget drivers to also be dynamically linked.
> =20
> +config USB_TEGRA_XUDC
> +	tristate "NVIDIA Superspeed USB 3.0 Device Controller"

NVIDIA Tegra? Not sure if this is available anywhere else.

> +	depends on ARCH_TEGRA
> +	help
> +	 Enables TEGRA USB 3.0 device mode controller driver.

NVIDIA Tegra here, too.

> +
> +	 Say "y" to link the driver statically, or "m" to build a
> +	 dynamically linked module called "tegra_xudc" and force all
> +	 gadget drivers to also be dynamically linked.
> +
>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
> =20
>  #
> diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Mak=
efile
> index 897f648..1c55c96 100644
> --- a/drivers/usb/gadget/udc/Makefile
> +++ b/drivers/usb/gadget/udc/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_USB_BCM63XX_UDC)	+=3D bcm63xx_udc.o
>  obj-$(CONFIG_USB_FSL_USB2)	+=3D fsl_usb2_udc.o
>  fsl_usb2_udc-y			:=3D fsl_udc_core.o
>  fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+=3D fsl_mxc_udc.o
> +obj-$(CONFIG_USB_TEGRA_XUDC)	+=3D tegra_xudc.o
>  obj-$(CONFIG_USB_M66592)	+=3D m66592-udc.o
>  obj-$(CONFIG_USB_R8A66597)	+=3D r8a66597-udc.o
>  obj-$(CONFIG_USB_RENESAS_USB3)	+=3D renesas_usb3.o
> diff --git a/drivers/usb/gadget/udc/tegra_xudc.c b/drivers/usb/gadget/udc=
/tegra_xudc.c
> new file mode 100644
> index 0000000..70beda0
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/tegra_xudc.c
> @@ -0,0 +1,3702 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * NVIDIA XUSB device mode controller

Again, perhaps mention that this is for Tegra.

I didn't find anything that stood out in most of the driver. Below are a
couple of things towards the end that I think you should look at.

Generally I thought it was fairly difficult to read. You may want to see
if you can improve readability by adding a bit of whitespace where
appropriate. For example, try to leave a blank line above and below
block elements, such as conditionals or loops. I find that that helps a
lot in making the code easier to read.

See below for an example.

[...]
> +static int tegra_xudc_probe(struct platform_device *pdev)
> +{
> +	struct tegra_xudc *xudc;
> +	struct resource *res;
> +	unsigned int i;
> +	int err;
> +
> +	xudc =3D devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_ATOMIC);
> +	if (!xudc)
> +		return -ENOMEM;
> +	xudc->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, xudc);

This, for example, would be easier to read as:

	xudc =3D devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_ATOMIC);
	if (!xudc)
		return -ENOMEM;

	platform_set_drvdata(pdev, xudc);
	xudc->dev =3D &pdev->dev;

> +
> +	xudc->soc =3D of_device_get_match_data(&pdev->dev);
> +	if (!xudc->soc)
> +		return -ENODEV;

This situation can never happen. The driver is only ever instantiated
=66rom device tree, in which case xudc->soc will be a valid pointer to the
correct SoC data structure.

> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	xudc->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(xudc->base))
> +		return PTR_ERR(xudc->base);
> +	xudc->phys_base =3D res->start;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	xudc->fpci =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(xudc->fpci))
> +		return PTR_ERR(xudc->fpci);
> +
> +	if (xudc->soc->has_ipfs) {
> +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +		xudc->ipfs =3D devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(xudc->ipfs))
> +			return PTR_ERR(xudc->ipfs);
> +	}
> +
> +	xudc->irq =3D platform_get_irq(pdev, 0);
> +	if (xudc->irq < 0) {
> +		dev_err(xudc->dev, "failed to get IRQ: %d\n",
> +				xudc->irq);
> +		return xudc->irq;
> +	}
> +	err =3D devm_request_irq(&pdev->dev, xudc->irq, tegra_xudc_irq, 0,
> +			       dev_name(&pdev->dev), xudc);
> +	if (err < 0) {
> +		dev_err(xudc->dev, "failed to claim IRQ#%u: %d\n", xudc->irq,
> +			err);
> +		return err;
> +	}
> +
> +	xudc->clks =3D devm_kcalloc(&pdev->dev, xudc->soc->num_clks,
> +				      sizeof(*xudc->clks), GFP_KERNEL);
> +	if (!xudc->clks)
> +		return -ENOMEM;
> +	for (i =3D 0; i < xudc->soc->num_clks; i++)
> +		xudc->clks[i].id =3D xudc->soc->clock_names[i];
> +	err =3D devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks,
> +				      xudc->clks);
> +	if (err) {
> +		dev_err(xudc->dev, "failed to request clks %d\n", err);
> +		return err;
> +	}
> +
> +	xudc->supplies =3D devm_kcalloc(&pdev->dev, xudc->soc->num_supplies,
> +				      sizeof(*xudc->supplies), GFP_KERNEL);
> +	if (!xudc->supplies)
> +		return -ENOMEM;
> +	for (i =3D 0; i < xudc->soc->num_supplies; i++)
> +		xudc->supplies[i].supply =3D xudc->soc->supply_names[i];
> +	err =3D devm_regulator_bulk_get(&pdev->dev, xudc->soc->num_supplies,
> +				      xudc->supplies);
> +	if (err) {
> +		dev_err(xudc->dev, "failed to request regulators %d\n", err);
> +		return err;
> +	}
> +
> +	xudc->padctl =3D tegra_xusb_padctl_get(&pdev->dev);
> +	if (IS_ERR(xudc->padctl))
> +		return PTR_ERR(xudc->padctl);
> +
> +	err =3D regulator_bulk_enable(xudc->soc->num_supplies, xudc->supplies);
> +	if (err) {
> +		dev_err(xudc->dev, "failed to enable regulators %d\n", err);
> +		goto put_padctl;
> +	}
> +
> +	xudc->usb3_phy =3D devm_phy_optional_get(&pdev->dev, "usb3");
> +	if (IS_ERR(xudc->usb3_phy)) {
> +		err =3D PTR_ERR(xudc->usb3_phy);
> +		dev_err(xudc->dev, "failed to get usb3 phy: %d\n", err);
> +		goto disable_regulator;
> +	}
> +	xudc->utmi_phy =3D devm_phy_optional_get(&pdev->dev, "usb2");
> +	if (IS_ERR(xudc->utmi_phy)) {
> +		err =3D PTR_ERR(xudc->utmi_phy);
> +		dev_err(xudc->dev, "failed to get usb2 phy: %d\n", err);
> +		goto disable_regulator;
> +	}
> +
> +	xudc->data_role_extcon =3D extcon_get_edev_by_phandle(&pdev->dev, 0);
> +	if (IS_ERR(xudc->data_role_extcon)) {
> +		err =3D PTR_ERR(xudc->data_role_extcon);
> +		dev_err(xudc->dev, "extcon_get_edev_by_phandle failed %d\n",
> +				err);
> +		goto disable_regulator;
> +	}
> +
> +	err =3D tegra_xudc_powerdomain_init(xudc);
> +	if (err)
> +		goto put_powerdomains;
> +
> +	err =3D tegra_xudc_phy_init(xudc);
> +	if (err)
> +		goto put_powerdomains;
> +
> +	err =3D tegra_xudc_alloc_event_ring(xudc);
> +	if (err)
> +		goto disable_phy;
> +
> +	err =3D tegra_xudc_alloc_eps(xudc);
> +	if (err)
> +		goto free_event_ring;
> +
> +	spin_lock_init(&xudc->lock);
> +	init_completion(&xudc->disconnect_complete);
> +
> +	INIT_WORK(&xudc->data_role_work, tegra_xudc_data_role_work);
> +	xudc->data_role_nb.notifier_call =3D tegra_xudc_data_role_notifier;
> +	extcon_register_notifier(xudc->data_role_extcon, EXTCON_USB,
> +				 &xudc->data_role_nb);
> +
> +	INIT_DELAYED_WORK(&xudc->plc_reset_work, tegra_xudc_plc_reset_work);
> +
> +	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
> +				tegra_xudc_port_reset_war_work);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	xudc->gadget.ops =3D &tegra_xudc_gadget_ops;
> +	xudc->gadget.ep0 =3D &xudc->ep[0].usb_ep;
> +	xudc->gadget.name =3D "tegra-xudc";
> +	xudc->gadget.max_speed =3D USB_SPEED_SUPER;
> +
> +	err =3D usb_add_gadget_udc(&pdev->dev, &xudc->gadget);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to add USB gadget: %d\n", err);
> +		goto free_eps;
> +	}
> +
> +	tegra_xudc_update_data_role(xudc);
> +
> +	return 0;
> +
> +free_eps:
> +	tegra_xudc_free_eps(xudc);
> +free_event_ring:
> +	tegra_xudc_free_event_ring(xudc);
> +disable_phy:
> +	tegra_xudc_phy_exit(xudc);
> +put_powerdomains:
> +	tegra_xudc_powerdomain_remove(xudc);
> +disable_regulator:
> +	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
> +put_padctl:
> +	tegra_xusb_padctl_put(xudc->padctl);
> +
> +	return err;
> +}
> +
> +static int tegra_xudc_remove(struct platform_device *pdev)
> +{
> +	struct tegra_xudc *xudc =3D platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(xudc->dev);
> +
> +	cancel_delayed_work(&xudc->plc_reset_work);
> +	if (xudc->data_role_extcon) {
> +		extcon_unregister_notifier(xudc->data_role_extcon, EXTCON_USB,
> +				&xudc->data_role_nb);
> +		cancel_work_sync(&xudc->data_role_work);
> +	}
> +	usb_del_gadget_udc(&xudc->gadget);
> +	tegra_xudc_free_eps(xudc);
> +	tegra_xudc_free_event_ring(xudc);
> +	tegra_xudc_powerdomain_remove(xudc);
> +
> +	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
> +
> +	phy_power_off(xudc->utmi_phy);
> +	phy_power_off(xudc->usb3_phy);
> +	tegra_xudc_phy_exit(xudc);
> +	pm_runtime_disable(xudc->dev);
> +	pm_runtime_put(xudc->dev);
> +
> +	tegra_xusb_padctl_put(xudc->padctl);
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_PM_SLEEP) || IS_ENABLED(CONFIG_PM)

I'd drop these and instead annotate with __maybe_unused. We no longer
support building Tegra without PM, so this is mostly academic anyway.

> +static int tegra_xudc_powergate(struct tegra_xudc *xudc)
> +{
> +	unsigned long flags;
> +
> +	dev_info(xudc->dev, "entering ELPG\n");

There's a couple of dev_info() calls throughout the driver that I think
are too noisy. I think most of those should be dev_dbg() so that users
aren't bothered with them. In cases where you really want to highlight
an error or something, make them dev_err() or dev_warn().

> +	spin_lock_irqsave(&xudc->lock, flags);
> +	xudc->powergated =3D true;
> +	xudc->saved_regs.ctrl =3D xudc_readl(xudc, CTRL);
> +	xudc->saved_regs.portpm =3D xudc_readl(xudc, PORTPM);
> +	xudc_writel(xudc, 0, CTRL);
> +	spin_unlock_irqrestore(&xudc->lock, flags);
> +
> +	clk_bulk_disable_unprepare(xudc->soc->num_clks, xudc->clks);
> +	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
> +
> +	dev_info(xudc->dev, "entering ELPG done\n");
> +	return 0;
> +}
> +
> +static int tegra_xudc_unpowergate(struct tegra_xudc *xudc)
> +{
> +	unsigned long flags;
> +	int err;
> +
> +	dev_info(xudc->dev, "exiting ELPG\n");
> +
> +	err =3D regulator_bulk_enable(xudc->soc->num_supplies,
> +			xudc->supplies);
> +	if (err < 0)
> +		return err;
> +
> +

Gratuituous blank line.

> +	err =3D clk_bulk_prepare_enable(xudc->soc->num_clks, xudc->clks);
> +	if (err < 0)
> +		return err;
> +
> +	tegra_xudc_fpci_ipfs_init(xudc);
> +	tegra_xudc_device_params_init(xudc);
> +
> +	tegra_xudc_init_event_ring(xudc);
> +	tegra_xudc_init_eps(xudc);
> +
> +	xudc_writel(xudc, xudc->saved_regs.portpm, PORTPM);
> +	xudc_writel(xudc, xudc->saved_regs.ctrl, CTRL);
> +
> +	spin_lock_irqsave(&xudc->lock, flags);
> +	xudc->powergated =3D false;
> +	spin_unlock_irqrestore(&xudc->lock, flags);
> +
> +	dev_info(xudc->dev, "exiting ELPG done\n");
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_xudc_suspend(struct device *dev)
> +{
> +	struct tegra_xudc *xudc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xudc->lock, flags);
> +	xudc->suspended =3D true;
> +	spin_unlock_irqrestore(&xudc->lock, flags);
> +
> +	if (xudc->data_role_extcon)
> +		flush_work(&xudc->data_role_work);
> +
> +	/* Forcibly disconnect before powergating. */
> +	tegra_xudc_device_mode_off(xudc);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		tegra_xudc_powergate(xudc);
> +
> +	pm_runtime_disable(dev);
> +
> +	return 0;
> +}
> +
> +static int tegra_xudc_resume(struct device *dev)
> +{
> +	struct tegra_xudc *xudc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	int err;
> +
> +	err =3D tegra_xudc_unpowergate(xudc);
> +	if (err < 0)
> +		return err;
> +
> +	spin_lock_irqsave(&xudc->lock, flags);
> +	xudc->suspended =3D false;
> +	spin_unlock_irqrestore(&xudc->lock, flags);
> +
> +	tegra_xudc_update_data_role(xudc);
> +
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int tegra_xudc_runtime_suspend(struct device *dev)
> +{
> +	struct tegra_xudc *xudc =3D dev_get_drvdata(dev);
> +
> +	return tegra_xudc_powergate(xudc);
> +}
> +
> +static int tegra_xudc_runtime_resume(struct device *dev)
> +{
> +	struct tegra_xudc *xudc =3D dev_get_drvdata(dev);
> +
> +	return tegra_xudc_unpowergate(xudc);
> +}
> +#endif

__maybe_unused for these as well.

Thierry

> +
> +static const struct dev_pm_ops tegra_xudc_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_xudc_suspend, tegra_xudc_resume)
> +	SET_RUNTIME_PM_OPS(tegra_xudc_runtime_suspend,
> +			   tegra_xudc_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver tegra_xudc_driver =3D {
> +	.probe =3D tegra_xudc_probe,
> +	.remove =3D tegra_xudc_remove,
> +	.driver =3D {
> +		.name =3D "tegra-xudc",
> +		.pm =3D &tegra_xudc_pm_ops,
> +		.of_match_table =3D tegra_xudc_of_match,
> +	},
> +};
> +module_platform_driver(tegra_xudc_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra XUSB Device Controller");
> +MODULE_AUTHOR("Andrew Bresticker <abrestic@chromium.org>");
> +MODULE_AUTHOR("Hui Fu");
> +MODULE_LICENSE("GPL v2");
> --=20
> 2.7.4
>=20

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMTqsACgkQ3SOs138+
s6FLTxAAmZTAyHmU3BK8Hr2P5Iu8+hKx2TEH1GK8Iz0HX0ET4EZHWN0dcSKFhJyM
c3N+u/tdwo8tQ7RbYOvfPipL9fOipKjkju9q4pZspoFbepi1o8kzFfnManolvFly
mhtPz7jVCat48bBPrI64g2ec3DmG27ohpcfCuS9TP3evdQ7p2XMPwDXqxlXyQLm0
2PbFI9olRgoxaulJa7Yu0kgXwHrm0rfc8VSVQikUTa9kKJHdKn9Yi/UPr69J+6L5
Vfo4AQqiHvps2DrCGmkXjHfCvjPU8hvyUI/jw62DFJhEGe5KiEGGnMe7BMaNwlGX
0R8TbbsKO/eIuHs92JR0aV4VkvwQIcmM4ZjGoNZf95lDLUQZH+UvT6iYstT3paAx
F3HuzPpEqWUFnRrtVU4HH/iBQP5PoAAJaVIxnO+cIlhEDeA5PdbxXclovMd6MPmO
Ky24zL5xKrjd0PXQkEH0QDhndXwXfEgikT3cgAwY0/Lzmtzqd9NNsPmM1WmHV0cF
YqhKvYj7lpIV+88C4LE9oQfWuNSZ9eRgM2z2qW0qtneOWR2Pvf4D7eKYzyP0htYl
MzqtLT8HQwsOXN0MdS4Yft5+7552bkYnhg2ROu5I6HJdZ73RDJdLENjZUaLODVu+
WiibrEXljjzaWXaxBPj2ATrnVcLVoQti3kUKSg2YVpZz9TiZ9xo=
=BciV
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
