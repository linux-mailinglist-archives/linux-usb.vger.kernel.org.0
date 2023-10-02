Return-Path: <linux-usb+bounces-925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7F7B52D8
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id B96DC282FC8
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 12:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F6D17724;
	Mon,  2 Oct 2023 12:21:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44710A0D;
	Mon,  2 Oct 2023 12:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79BCC433C7;
	Mon,  2 Oct 2023 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696249279;
	bh=j6GCwRHciLgjRT87l8yg8vMEZ+mk/SUuffwOzm0R1xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKYQ8mdZOgKw8zZeEEHwVzD2dedtzq2hQK80iOXudNyaRmZDYwknuXEObVp2rLKa5
	 29voMfvZ84T8EQaRhGSryhRZaeQ6lRUtS/I36rAxAwXjOfeJlp25ZwvRa5zzSehzC+
	 R7235RFh0t5yBQ66nKLx2cyDoNJOGs2NS3UG170A=
Date: Mon, 2 Oct 2023 14:21:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: richard.yu@hpe.com
Cc: verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: gadget: udc: gxp-udc: add HPE GXP USB HUB
 support
Message-ID: <2023100212-hyperlink-prolonged-3e18@gregkh>
References: <20230907210601.25284-1-richard.yu@hpe.com>
 <20230907210601.25284-3-richard.yu@hpe.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907210601.25284-3-richard.yu@hpe.com>

On Thu, Sep 07, 2023 at 04:06:00PM -0500, richard.yu@hpe.com wrote:
> +struct gxp_udc_drvdata {
> +	void __iomem *base;
> +	struct platform_device *pdev;
> +	struct regmap *udcg_map;
> +	struct gxp_udc_ep ep[GXP_UDC_MAX_NUM_EP];
> +
> +	int irq;
> +
> +	/* sysfs enclosure for the gadget gunk */
> +	struct device *port_dev;

A "raw" struct device?  That's not ok.  It's also going to break things,
how was this tested?  What does it look like in sysfs with this device?

> +	/*
> +	 * The UDC core really needs us to have separate and uniquely
> +	 * named "parent" devices for each port so we create a sub device
> +	 * here for that purpose
> +	 */
> +	drvdata->port_dev = kzalloc(sizeof(*drvdata->port_dev), GFP_KERNEL);
> +	if (!drvdata->port_dev) {
> +		rc = -ENOMEM;
> +		goto fail_alloc;
> +	}
> +	device_initialize(drvdata->port_dev);
> +	drvdata->port_dev->release = gxp_udc_dev_release;
> +	drvdata->port_dev->parent = parent;
> +	dev_set_name(drvdata->port_dev, "%s:p%d", dev_name(parent), idx + 1);
> +
> +	/* DMA setting */
> +	drvdata->port_dev->dma_mask = parent->dma_mask;
> +	drvdata->port_dev->coherent_dma_mask = parent->coherent_dma_mask;
> +	drvdata->port_dev->bus_dma_limit = parent->bus_dma_limit;
> +	drvdata->port_dev->dma_range_map = parent->dma_range_map;
> +	drvdata->port_dev->dma_parms = parent->dma_parms;
> +	drvdata->port_dev->dma_pools = parent->dma_pools;
> +
> +	rc = device_add(drvdata->port_dev);

So you createad a "raw" device that does not belong to any bus or type
and add it to sysfs?  Why?  Shouldn't it be a "virtual" device if you
really want/need one?

> +	if (rc)
> +		goto fail_add;
> +
> +	/* Populate gadget */
> +	gxp_udc_init(drvdata);
> +
> +	rc = usb_add_gadget_udc(drvdata->port_dev, &drvdata->gadget);
> +	if (rc != 0) {
> +		dev_err(drvdata->port_dev, "add gadget failed\n");
> +		goto fail_udc;
> +	}
> +	rc = devm_request_irq(drvdata->port_dev,
> +			      drvdata->irq,
> +			      gxp_udc_irq,
> +			      IRQF_SHARED,
> +			      gxp_udc_name[drvdata->vdevnum],
> +			      drvdata);

devm_request_irq() is _very_ tricky, are you _SURE_ you got it right
here?  Why do you need to use it?

> +	if (rc < 0) {
> +		dev_err(drvdata->port_dev, "irq request failed\n");
> +		goto fail_udc;
> +	}
> +
> +	return 0;
> +
> +	/* ran code to simulate these three error exit, no double free */

What does this comment mean?

> +fail_udc:
> +	device_del(drvdata->port_dev);
> +fail_add:
> +	put_device(drvdata->port_dev);
> +fail_alloc:
> +	devm_kfree(parent, drvdata);
> +
> +	return rc;
> +}

Where is the device removed from the system when done?

thanks,

greg k-h

