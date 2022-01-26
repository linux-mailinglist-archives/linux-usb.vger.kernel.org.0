Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E2449CA0C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241518AbiAZMtu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:49:50 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:61066 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229551AbiAZMtu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 07:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643201390; x=1674737390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvVbI7f0jV+4jUUOAhw2OcEXOUVffPVfx5+Alcuklh0=;
  b=jnsglDC1ANQUQtxtHlJYNsCpilg1wQ4vKbWdK6bTe7GC0+FnbzsaSwze
   CJ2jYCS2bGFAPU8YE90Ov86W3QCxXIybaK2XUobFmB+nYLeIXKvJyFJPm
   cxtaHfmE4VUAjMcWaSl5y7SqFt/aF3UTGm7htfZoaqE6yS8a8NV/rHy0T
   VWU6OcEoKNAGm7ATXJg9hiWPvwwNq6TqG39J0OzbjkdvbBiJs4p5Lp7AY
   Zn+diTQeKt9eRuF8XiXFNewNFS8rN0VHRTwsNROsHPsUMZL4w+UknPUIh
   QL3XGgG1BVDcJ5jszPFJjxYsO4F7uP8i6bin8wdn4p+ceND0W3FBieaYS
   A==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21723015"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 13:49:49 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 13:49:49 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 13:49:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643201389; x=1674737389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvVbI7f0jV+4jUUOAhw2OcEXOUVffPVfx5+Alcuklh0=;
  b=fIBFkG/SHS9eWdxP6w04q85vzimMqz6KB629Tv1bBIXioYKgF3CLuB30
   z1cE/fMLN9PGA8kMYJuiTL40wgiP4vArroBTIxh+MpX6m21LzOb13qccA
   gMWo1Wh8g/gszvBuVM7j0GQsF8V2CCrMOff8USroPXO36pUCWL14Kdx3V
   mfLWWUKJ0ryeAfglvqnZEBPciayZilMOWYbd9HCBwI5lmmq2fHI2lpOJA
   7KGPnjqG2ou00CccacZGPK0F6c6fonX5NSHlFASuWIcSQBtkS9eugaO98
   kvv4qGOOQoCJ5vEi4qQPS9NzKkW8263Si3O8T4d345HR6i461R6irHy6v
   g==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21723014"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 13:49:48 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BED5C280065;
        Wed, 26 Jan 2022 13:49:48 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: (EXT) RE: [PATCH v3 3/4] usb: dwc3: imx8mp: Add support for setting SOC specific flags
Date:   Wed, 26 Jan 2022 13:49:46 +0100
Message-ID: <10829327.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <VI1PR04MB4333E8AA7C261C0B3084D8A489599@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220118131626.926394-1-alexander.stein@ew.tq-group.com> <20220118131626.926394-4-alexander.stein@ew.tq-group.com> <VI1PR04MB4333E8AA7C261C0B3084D8A489599@VI1PR04MB4333.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, 19. Januar 2022, 15:14:05 CET schrieb Jun Li:
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Tuesday, January 18, 2022 9:16 PM
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> > <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; dl-linux-imx
> > <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Jun Li
> > <jun.li@nxp.com>
> > Subject: [PATCH v3 3/4] usb: dwc3: imx8mp: Add support for setting SOC
> > specific flags
> > 
> > The i.MX8MP glue layer has support for the following flags:
> > * over-current polarity
> > * PWR pad polarity
> > * controlling PPC flag in HCCPARAMS register
> > * permanent port attach for usb2 & usb3 port
> > 
> > Allow setting these flags by supporting specific flags in the glue node.
> > In order to get this to work an additional IORESOURCE_MEM and clock is
> > necessary. For backward compatibility this is purely optional.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  drivers/usb/dwc3/dwc3-imx8mp.c | 81 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c
> > b/drivers/usb/dwc3/dwc3-imx8mp.c index 1c8fe657b3a9..3df4313b3740 100644
> > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > @@ -36,17 +36,66 @@
> > 
> >  #define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> > 
> > +/* USB glue registers */
> > +#define USB_CTRL0		0x00
> > +#define USB_CTRL1		0x04
> > +
> > +#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> > +#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> > +#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> > +
> > +#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> > +#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> > +
> > 
> >  struct dwc3_imx8mp {
> >  
> >  	struct device			*dev;
> >  	struct platform_device		*dwc3;
> >  	void __iomem			*hsio_blk_base;
> > 
> > +	void __iomem			*glue_base;
> > 
> >  	struct clk			*hsio_clk;
> >  	struct clk			*suspend_clk;
> > 
> > +	struct clk			*phy_clk;
> > 
> >  	int				irq;
> >  	bool				pm_suspended;
> >  	bool				wakeup_pending;
> >  
> >  };
> > 
> > +static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx) {
> > +	struct device *dev = dwc3_imx->dev;
> > +	u32 value;
> > +
> > +	if ((!dwc3_imx->glue_base) || (!dwc3_imx->phy_clk))
> > +		return;
> > +
> > +	value = readl(dwc3_imx->glue_base + USB_CTRL0);
> > +
> > +	if (device_property_read_bool(dev, "fsl,permanently-attached"))
> > +		value |= (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> > +	else
> > +		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> > +
> > +	if (device_property_read_bool(dev,
> > "fsl,disable-port-power-control"))
> > +		value &= ~(USB_CTRL0_PORTPWR_EN);
> > +	else
> > +		value |= USB_CTRL0_PORTPWR_EN;
> > +
> > +	writel(value, dwc3_imx->glue_base + USB_CTRL0);
> > +
> > +	value = readl(dwc3_imx->glue_base + USB_CTRL1);
> > +	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
> > +		value |= USB_CTRL1_OC_POLARITY;
> > +	else
> > +		value &= ~USB_CTRL1_OC_POLARITY;
> > +
> > +	if (device_property_read_bool(dev, "fsl,power-active-low"))
> > +		value |= USB_CTRL1_PWR_POLARITY;
> > +	else
> > +		value &= ~USB_CTRL1_PWR_POLARITY;
> > +
> > +	writel(value, dwc3_imx->glue_base + USB_CTRL1); }
> > +
> > 
> >  static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)  {
> >  
> >  	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
> > 
> > @@ -100,6 +149,7 @@ static int dwc3_imx8mp_probe(struct platform_device
> > *pdev)
> > 
> >  	struct device		*dev = &pdev->dev;
> >  	struct device_node	*dwc3_np, *node = dev->of_node;
> >  	struct dwc3_imx8mp	*dwc3_imx;
> > 
> > +	struct resource		*res;
> > 
> >  	int			err, irq;
> >  	
> >  	if (!node) {
> > 
> > @@ -119,6 +169,15 @@ static int dwc3_imx8mp_probe(struct platform_device
> > *pdev)
> > 
> >  	if (IS_ERR(dwc3_imx->hsio_blk_base))
> >  	
> >  		return PTR_ERR(dwc3_imx->hsio_blk_base);
> > 
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	if (!res) {
> > +		dev_warn(dev, "Base address for glue layer missing. 
Continuing
> > without, some features are missing though.");
> > +	} else {
> > +		dwc3_imx->glue_base = devm_ioremap_resource(dev, res);
> > +		if (IS_ERR(dwc3_imx->glue_base))
> > +			return PTR_ERR(dwc3_imx->glue_base);
> > +	}
> > +
> > 
> >  	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
> >  	if (IS_ERR(dwc3_imx->hsio_clk)) {
> >  	
> >  		err = PTR_ERR(dwc3_imx->hsio_clk);
> > 
> > @@ -145,6 +204,24 @@ static int dwc3_imx8mp_probe(struct platform_device
> > *pdev)
> > 
> >  		goto disable_hsio_clk;
> >  	
> >  	}
> > 
> > +	dwc3_imx->phy_clk = devm_clk_get(dev, "phy");
> > +	if (PTR_ERR(dwc3_imx->phy_clk) == -ENOENT) {
> > +		dev_warn(dev, "PHY clock missing. Continuing without, 
some features
> > are missing though.");

Hi,

> What feature needs phy clock turned on here, why phy driver turns on
> this clock is not enough for you?

I have to admit that the clock name 'phy' might be misleading. In this case 
the actual clock is IMX8MP_CLK_USB_PHY_ROOT. Apparently this clock (or a 
dependent) is necessary to access the USB3_GLUE block in imx8mp. This block 
contains the USB3_CTRL0/USB3_CTRL1, we want to access in this case, as well as 
the PHY registers, hence the name I guess.
While it is true that phy-fsl-imx8mq-usb enables this clock as well, there is 
no guarantee this lock is enabled when we want to access the GLUE registers.
Depending on the probe order it is actually possible the clock is disabled 
while dwc3-imx8mp being probed, resulting in a system lockup.
This happens especially if there is only one USB host enabled and the drivers 
are built as modules.

Meanwhile I noticed [1] landed last week. So I gave it a try. With that in 
place there is no need to use IMX8MP_CLK_USB_PHY_ROOT in this driver anymore.
As it turns out IMX8MP_CLK_USB_ROOT is the required clock (used by imx8mp-blk-
ctrl for USB power domain).
With that, I'll send a new version based on Lucas' patchset.

Thanks for the feedback
Alexander

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/
20220119134027.2931945-1-l.stach@pengutronix.de/



