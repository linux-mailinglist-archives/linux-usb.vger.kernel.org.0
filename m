Return-Path: <linux-usb+bounces-20156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD59A287C7
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 11:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50A8F3A1437
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 10:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750FF22AE4E;
	Wed,  5 Feb 2025 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWGA1PNt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D503C215778;
	Wed,  5 Feb 2025 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750766; cv=none; b=FACWPcuvrenZXIjqu5NrazmZm0zk1u/0smRVmiv5lsfye4JybVGQ7XZrI/1WOweKpptXJJmIYeW0MZxjQfiC2oHTeXRfhwgpZjgN3nomtmwN+7lmFrSokqO5ltYQNa8xZ9Vkxml1ltRv8fkGdPJ8esiXU784iSQqi3A/2RLGSrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750766; c=relaxed/simple;
	bh=lKVpCO4wwejQG6MIxb23h7PL2zSZCNmtg+toBoBMo40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BApJkyq8cjHSLHwdd9EU6R6fWsTqzVzeACQkRQ1FMxqTLHbbyKAeF/rK7rzIQtfj6gXqesVmz9dMVls/z47rxda2T/6ck2zd/wRjdmmk20zr/bAb5mNrR01SJgZEUrgDbl8onAp+MWI3yyx8Dfc05GGUNqZt3D356fz+ebxKTSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWGA1PNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9113CC4CEE3;
	Wed,  5 Feb 2025 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738750766;
	bh=lKVpCO4wwejQG6MIxb23h7PL2zSZCNmtg+toBoBMo40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWGA1PNtqJsHh3h1qtzD+ilYvqlURDOeDqhlHkLspZOCWJ7hO4SFU/JpErh00YXpU
	 20M7QmOZBQKyTUNsN564rJso+gDn+Pp346kjKPP65CbSe+AIysQWRi724b6WM/kuGU
	 ctRFKukgfC6nUY2WIvDipYF/IPVEoqQRt++7tlQfs9f1s56mpT0iRu3kc7dqE0IEpQ
	 eMs3vB5x6//EDvmXzGtelDvqFex7ap+/hJL/06OVomxeUcPkkSiTpdHZAtUe56/obm
	 Z7Vre5Bghq1kmYXMhzWIB1xgMnx7pDymDxgN9A1ynPBazRwKCO2oiwWfJRab3o2C2a
	 5F+9/URhbekHQ==
Date: Wed, 5 Feb 2025 18:19:16 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/5] USB: phy: convert usb_phy_generic logic to use a
 faux device
Message-ID: <20250205101916.GA4083@nchen-desktop>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-overstock-scheming-6a30@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020424-overstock-scheming-6a30@gregkh>

On 25-02-04 12:09:15, Greg Kroah-Hartman wrote:
> The usb_phy_generic code was creating a "fake" platform device to pass
> around in different places.  Instead of doing that, use the faux bus
> instead as that is what is really wanted here.

Hi Greg,

As far as I know, there are some platforms use the device-tree to get
the system resource (eg, clock, reset, regular) for this driver.
We may not use fake bus for this driver.

$grep -rn "usb-nop-xceiv" arch/arm64/boot/dts/*

arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:649:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/freescale/imx8mm.dtsi:275:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/freescale/imx8mm.dtsi:285:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/freescale/imx93.dtsi:238:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/freescale/imx93.dtsi:245:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/freescale/imx8mn.dtsi:1321:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:149:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:133:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9132-db.dtsi:30:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9132-db.dtsi:44:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9131-db.dtsi:33:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/armada-3720-db.dts:43:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:49:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:53:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9130-db.dtsi:52:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/cn9130-db.dtsi:66:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/armada-8040-db.dts:53:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/armada-8040-db.dts:67:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts:36:		compatible = "usb-nop-xceiv";
arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts:39:		compatible = "usb-nop-xceiv";

Peter

> 
> Site note, this fixes a bug in the mpfs driver where the incorrect
> pointer was being passed to usb_phy_generic_unregister(), odd that no
> one ever hit this in the past.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  v2: no change
> 
>  drivers/usb/chipidea/ci_hdrc_pci.c  | 2 +-
>  drivers/usb/dwc2/pci.c              | 4 ++--
>  drivers/usb/musb/mediatek.c         | 4 ++--
>  drivers/usb/musb/mpfs.c             | 4 ++--
>  drivers/usb/musb/tusb6010.c         | 2 +-
>  drivers/usb/phy/phy-generic.c       | 9 ++++-----
>  include/linux/usb/usb_phy_generic.h | 9 +++++----
>  7 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_pci.c b/drivers/usb/chipidea/ci_hdrc_pci.c
> index d63479e1ad10..63511ea30d6e 100644
> --- a/drivers/usb/chipidea/ci_hdrc_pci.c
> +++ b/drivers/usb/chipidea/ci_hdrc_pci.c
> @@ -20,7 +20,7 @@
>  
>  struct ci_hdrc_pci {
>  	struct platform_device	*ci;
> -	struct platform_device	*phy;
> +	struct faux_device	*phy;
>  };
>  
>  /******************************************************************************
> diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
> index f3a1e4232a31..8cb50620aa55 100644
> --- a/drivers/usb/dwc2/pci.c
> +++ b/drivers/usb/dwc2/pci.c
> @@ -30,7 +30,7 @@ static const char dwc2_driver_name[] = "dwc2-pci";
>  
>  struct dwc2_pci_glue {
>  	struct platform_device *dwc2;
> -	struct platform_device *phy;
> +	struct faux_device *phy;
>  };
>  
>  /**
> @@ -53,7 +53,7 @@ static int dwc2_pci_probe(struct pci_dev *pci,
>  {
>  	struct resource		res[2];
>  	struct platform_device	*dwc2;
> -	struct platform_device	*phy;
> +	struct faux_device	*phy;
>  	int			ret;
>  	struct device		*dev = &pci->dev;
>  	struct dwc2_pci_glue	*glue;
> diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> index aa988d74b58d..995bab88506a 100644
> --- a/drivers/usb/musb/mediatek.c
> +++ b/drivers/usb/musb/mediatek.c
> @@ -43,7 +43,7 @@ struct mtk_glue {
>  	struct device *dev;
>  	struct musb *musb;
>  	struct platform_device *musb_pdev;
> -	struct platform_device *usb_phy;
> +	struct faux_device *usb_phy;
>  	struct phy *phy;
>  	struct usb_phy *xceiv;
>  	enum phy_mode phy_mode;
> @@ -507,7 +507,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
>  static void mtk_musb_remove(struct platform_device *pdev)
>  {
>  	struct mtk_glue *glue = platform_get_drvdata(pdev);
> -	struct platform_device *usb_phy = glue->usb_phy;
> +	struct faux_device *usb_phy = glue->usb_phy;
>  
>  	platform_device_unregister(glue->musb_pdev);
>  	usb_phy_generic_unregister(usb_phy);
> diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
> index 7edc8429b274..ef20794aee12 100644
> --- a/drivers/usb/musb/mpfs.c
> +++ b/drivers/usb/musb/mpfs.c
> @@ -25,7 +25,7 @@
>  struct mpfs_glue {
>  	struct device *dev;
>  	struct platform_device *musb;
> -	struct platform_device *phy;
> +	struct faux_device *phy;
>  	struct clk *clk;
>  };
>  
> @@ -356,7 +356,7 @@ static void mpfs_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(glue->clk);
>  	platform_device_unregister(glue->musb);
> -	usb_phy_generic_unregister(pdev);
> +	usb_phy_generic_unregister(glue->phy);
>  }
>  
>  #ifdef CONFIG_OF
> diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
> index 90b760a95e4e..92609f9d20ff 100644
> --- a/drivers/usb/musb/tusb6010.c
> +++ b/drivers/usb/musb/tusb6010.c
> @@ -32,7 +32,7 @@
>  struct tusb6010_glue {
>  	struct device		*dev;
>  	struct platform_device	*musb;
> -	struct platform_device	*phy;
> +	struct faux_device	*phy;
>  	struct gpio_desc	*enable;
>  	struct gpio_desc	*intpin;
>  };
> diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
> index 6c3ececf9137..a6cece75d0f8 100644
> --- a/drivers/usb/phy/phy-generic.c
> +++ b/drivers/usb/phy/phy-generic.c
> @@ -30,16 +30,15 @@
>  	(IRQF_SHARED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | \
>  		IRQF_ONESHOT)
>  
> -struct platform_device *usb_phy_generic_register(void)
> +struct faux_device *usb_phy_generic_register(void)
>  {
> -	return platform_device_register_simple("usb_phy_generic",
> -			PLATFORM_DEVID_AUTO, NULL, 0);
> +	return faux_device_create("usb_phy_generic", NULL);
>  }
>  EXPORT_SYMBOL_GPL(usb_phy_generic_register);
>  
> -void usb_phy_generic_unregister(struct platform_device *pdev)
> +void usb_phy_generic_unregister(struct faux_device *fdev)
>  {
> -	platform_device_unregister(pdev);
> +	faux_device_destroy(fdev);
>  }
>  EXPORT_SYMBOL_GPL(usb_phy_generic_unregister);
>  
> diff --git a/include/linux/usb/usb_phy_generic.h b/include/linux/usb/usb_phy_generic.h
> index cd9e70a552a0..856db2bacc07 100644
> --- a/include/linux/usb/usb_phy_generic.h
> +++ b/include/linux/usb/usb_phy_generic.h
> @@ -3,18 +3,19 @@
>  #define __LINUX_USB_NOP_XCEIV_H
>  
>  #include <linux/usb/otg.h>
> +#include <linux/device/faux.h>
>  
>  #if IS_ENABLED(CONFIG_NOP_USB_XCEIV)
>  /* sometimes transceivers are accessed only through e.g. ULPI */
> -extern struct platform_device *usb_phy_generic_register(void);
> -extern void usb_phy_generic_unregister(struct platform_device *);
> +struct faux_device *usb_phy_generic_register(void);
> +void usb_phy_generic_unregister(struct faux_device *);
>  #else
> -static inline struct platform_device *usb_phy_generic_register(void)
> +static inline struct faux_device *usb_phy_generic_register(void)
>  {
>  	return NULL;
>  }
>  
> -static inline void usb_phy_generic_unregister(struct platform_device *pdev)
> +static inline void usb_phy_generic_unregister(struct faux_device *fdev)
>  {
>  }
>  #endif
> -- 
> 2.48.1
> 
> 

