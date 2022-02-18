Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8636E4BB57A
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 10:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbiBRJY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 04:24:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbiBRJY7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 04:24:59 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8735B29834;
        Fri, 18 Feb 2022 01:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645176281; x=1676712281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eC8XXNUO9xGCAs/xTg2IiJ26P+4JTZlkt63ND81hFdQ=;
  b=ew39SMO3nYWeUq2T2ry+Q4BEqEORSjSpHYFNicQyqvN0Y86UhrwiV3xG
   mi50ZKVeRmR5YBqHWQi4R1aLe9pLZiv439sZcwsMDZbINGRfkvrU8j+sq
   H75/uDV8V2K/dRZXl5CzCT5p0WPU4zoRszBO9xz8EvY90bro02LsKAhvE
   4EZc1n3kgB5LLRfyphcM3gVutBB56BdF0gUjiQ49C4FLeaCdEVUnKW4wO
   KJAjmbNeBO9BkERdyZ7519RoOQl4b4/SMzPxCQw1p4gRkMbbotcdFhHLP
   FBopgDCuuFkQlpjjj7kK9go8ueVsR347I/rmTnlTw4jcy/OEPqCiPLoax
   w==;
X-IronPort-AV: E=Sophos;i="5.88,378,1635199200"; 
   d="scan'208";a="22171597"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Feb 2022 10:24:39 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 18 Feb 2022 10:24:39 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 18 Feb 2022 10:24:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1645176279; x=1676712279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eC8XXNUO9xGCAs/xTg2IiJ26P+4JTZlkt63ND81hFdQ=;
  b=AT6v7jydo7VpxwgOW2K+wtELSztNTTavUXFMpRmNr5ku/1QcFMrVSMlO
   gie+54oBj+WSJR1LF0VyHsSHuqq4IDHK1Ia37V+x3bmS9SdiQail429W/
   MEc9nI0XS9yFUgZQXI6KAJ1w+EnapeFcn7stHxRGKYclHeyvzwxfpiqcR
   9RP8pEM8SfGoS3aIJwdgtyTXuWm6MbPZu4FtTbMxSbZ84dsIHr7IostLJ
   50TvZbj7WKLUxrZ8F4vFK6fgei31PJfiTFoDZclLckgsx1sN9i5HZBrCx
   GXCn4CsU2kMVgYH2HispDit9qy6Prw8fM1U7taOIGxeECjexFF4KpU9B1
   w==;
X-IronPort-AV: E=Sophos;i="5.88,378,1635199200"; 
   d="scan'208";a="22171596"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Feb 2022 10:24:39 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DF72F280065;
        Fri, 18 Feb 2022 10:24:38 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: (EXT) RE: [PATCH v4 3/4] usb: dwc3: imx8mp: Add support for setting SOC specific flags
Date:   Fri, 18 Feb 2022 10:24:36 +0100
Message-ID: <1810731.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <VI1PR04MB4333E4CB42DF67C8703F42AC89379@VI1PR04MB4333.eurprd04.prod.outlook.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com> <20220126141340.234125-4-alexander.stein@ew.tq-group.com> <VI1PR04MB4333E4CB42DF67C8703F42AC89379@VI1PR04MB4333.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Li Jun,

thanks for your feedback.

Am Freitag, 18. Februar 2022, 07:57:33 CET schrieb Jun Li:
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Wednesday, January 26, 2022 10:14 PM
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob Herring
> > <robh+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>
> > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; dl-linux-imx
> > <linux-imx@nxp.com>; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Jun Li
> > <jun.li@nxp.com>
> > Subject: [PATCH v4 3/4] usb: dwc3: imx8mp: Add support for setting SOC
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
> >  drivers/usb/dwc3/dwc3-imx8mp.c | 62 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c
> > b/drivers/usb/dwc3/dwc3-imx8mp.c
> > index 1c8fe657b3a9..5a96b66bf237 100644
> > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > @@ -36,10 +36,22 @@
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
> >  	int				irq;
> > 
> > @@ -47,6 +59,42 @@ struct dwc3_imx8mp {
> > 
> >  	bool				wakeup_pending;
> >  
> >  };
> > 
> > +static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
> > +{
> > +	struct device *dev = dwc3_imx->dev;
> > +	u32 value;
> > +
> > +	if (!dwc3_imx->glue_base)
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
> 
> I think you don't need a value update&write if property is not present.

I get what you intend here, but this assumes some (sane) default which might 
be true in every case. But I prefer configuring this without any assumption 
about previous settings.

> > +
> > +	writel(value, dwc3_imx->glue_base + USB_CTRL1);
> > +}
> > +
> > 
> >  static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
> >  {
> >  
> >  	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
> > 
> > @@ -100,6 +148,7 @@ static int dwc3_imx8mp_probe(struct platform_device
> > *pdev)
> > 
> >  	struct device		*dev = &pdev->dev;
> >  	struct device_node	*dwc3_np, *node = dev->of_node;
> >  	struct dwc3_imx8mp	*dwc3_imx;
> > 
> > +	struct resource		*res;
> 
> Looks like this is not used anywhere, remove it.

It actually is, please refer to the next hunk. Both is inside 
dwc3_imx8mp_probe(). Probably the context of the diff is a bit misleading.

> >  	int			err, irq;
> >  	
> >  	if (!node) {
> > 
> > @@ -119,6 +168,15 @@ static int dwc3_imx8mp_probe(struct platform_device
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
> > @@ -152,6 +210,8 @@ static int dwc3_imx8mp_probe(struct platform_device
> > *pdev)
> > 
> >  	}
> >  	dwc3_imx->irq = irq;
> > 
> > +	imx8mp_configure_glue(dwc3_imx);
> > +
> > 
> >  	pm_runtime_set_active(dev);
> >  	pm_runtime_enable(dev);
> >  	err = pm_runtime_get_sync(dev);
> > 
> > @@ -252,6 +312,8 @@ static int __maybe_unused dwc3_imx8mp_resume(struct
> > dwc3_imx8mp *dwc3_imx,
> > 
> >  	dwc3_imx8mp_wakeup_disable(dwc3_imx);
> >  	dwc3_imx->pm_suspended = false;
> > 
> > +	imx8mp_configure_glue(dwc3_imx);
> > +
> 
> I guess this is to restore the settings if we experienced a power lost,
> Please add some comments.

You are right, makes sense. I'll add a comment.

Regards,
Alexander

> >  	if (dwc3_imx->wakeup_pending) {
> >  	
> >  		dwc3_imx->wakeup_pending = false;
> >  		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
> > 
> > --
> > 2.25.1




