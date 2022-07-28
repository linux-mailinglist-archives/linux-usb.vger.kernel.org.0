Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FE25838B3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 08:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbiG1GUY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 02:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiG1GUX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 02:20:23 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1442230F57;
        Wed, 27 Jul 2022 23:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658989219; x=1690525219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=77z4OSLcpLQHGmEKgErSafXR9441+COqyJNi8XBEHhg=;
  b=gHiC2poa9t1Ye/oPhqkAIMry7cGakKFqzl1yK60FCC1rhRCfBf2oa+RY
   8lun/EMXwY4Q5A67qTAXK/uey6MCtC8SrELBmQQnnh5HYwuFAwZ064Pue
   dafXNUw5GmE+jXBJInF+e/zV0xKHL/sFdH4Jjyw7Yu1T7EOLnVUTkUdLC
   Glcs/fwCr1fLz1NgFly6kpxsiJ049dxJsCqqI1AZ3oFvz3ysT+Mc5NpF5
   oj0r00d7Fsg/SeCr7HBMvob+ZUMUBnjP/ZnmS9E0LiPQZTTKGCoJahiko
   dGLm8RS1ojG8FV1aI9BFKkeZfFLX3TNUP9hhnNUI2xVrHiOZy4l3ThM1u
   g==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654552800"; 
   d="scan'208";a="25307345"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 08:20:16 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 08:20:16 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 08:20:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658989216; x=1690525216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=77z4OSLcpLQHGmEKgErSafXR9441+COqyJNi8XBEHhg=;
  b=EwzegZZg+IkjEKkBUpjaBmlRMuXVmS1CQik1b53Ny6DxXW6Qkz+kmuLM
   SWy1EDyqqADLI7iSg/quj9zVMBWWDzCL3HnZ7rLVWsVTj2pukRArJQO9b
   bqdIleEwyXoKHRnw0AGvfGoPlYZsMTqJQcG3OZXX9b/diYOyVUrYgAQBp
   Bpo0loqzI7dgaO2uhAaF9Jacoi5sLTDp+sIA6P/EOG8sg/zXqpCvJsWpI
   DPoHlPtvBbjGg3JTPxLrP7/BztQ1WH0bdNDc6tNwsgQDJDp6jfvTreBI+
   L4U0RrDrRpetnIILblNILnwDY3rJvGWWj+Mb3ZY7pPLkEE5h26oAzDYcB
   A==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654552800"; 
   d="scan'208";a="25307344"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 08:20:16 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 35837280056;
        Thu, 28 Jul 2022 08:20:16 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: misc: onboard_usb_hub: Add reset-gpio support
Date:   Thu, 28 Jul 2022 08:20:13 +0200
Message-ID: <2191669.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YuFykRtbvxGssSVs@google.com>
References: <20220727141117.909361-1-alexander.stein@ew.tq-group.com> <YuFykRtbvxGssSVs@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Matthias,

Am Mittwoch, 27. Juli 2022, 19:14:57 CEST schrieb Matthias Kaehlcke:
> Hi Alexander,
> 
> (copying my comments from v3 to keep the discussion on the latest version)
> 
> On Wed, Jul 27, 2022 at 04:11:16PM +0200, Alexander Stein wrote:
> > Despite default reset upon probe, release reset line after powering up
> > the hub and assert reset again before powering down.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > * Patch 1 dropped as it already applied
> > 
> > Changes in v4:
> > * Rebased to [1] commit e0c6b1f3d757 ("USB: usbsevseg: convert sysfs
> > snprintf to sysfs_emit") * Added platform data for usb424
> > 
> >   Reset pulse length taken from [2], Table 3-2 Symbol RESET_N
> >   Completely untested
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git Branch
> > usb-testing [2]
> > http://ww1.microchip.com/downloads/en/devicedoc/00001692c.pdf
> > 
> >  drivers/usb/misc/onboard_usb_hub.c | 28 ++++++++++++++++++++++++++++
> >  drivers/usb/misc/onboard_usb_hub.h | 22 +++++++++++++++++-----
> >  2 files changed, 45 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > b/drivers/usb/misc/onboard_usb_hub.c index de3627af3c84..0c81417dd9a7
> > 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.c
> > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > @@ -7,6 +7,7 @@
> > 
> >  #include <linux/device.h>
> >  #include <linux/export.h>
> > 
> > +#include <linux/gpio/consumer.h>
> > 
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > 
> > @@ -38,6 +39,8 @@ struct usbdev_node {
> > 
> >  struct onboard_hub {
> >  
> >  	struct regulator *vdd;
> >  	struct device *dev;
> > 
> > +	const struct onboard_hub_pdata *pdata;
> > +	struct gpio_desc *reset_gpio;
> > 
> >  	bool always_powered_in_suspend;
> >  	bool is_powered_on;
> >  	bool going_away;
> > 
> > @@ -56,6 +59,9 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
> > 
> >  		return err;
> >  	
> >  	}
> > 
> > +	fsleep(hub->pdata->reset_us);
> > +	gpiod_set_value_cansleep(hub->reset_gpio, 0);
> > +
> > 
> >  	hub->is_powered_on = true;
> >  	
> >  	return 0;
> > 
> > @@ -65,6 +71,11 @@ static int onboard_hub_power_off(struct onboard_hub
> > *hub)> 
> >  {
> >  
> >  	int err;
> > 
> > +	if (hub->reset_gpio) {
> > +		gpiod_set_value_cansleep(hub->reset_gpio, 1);
> > +		fsleep(hub->pdata->reset_us);
> 
> Is this delay here actually needed? There is a delay in
> onboard_hub_power_on(), before de-asserting the reset, isn't that enough?

If you see both delays together you are right, but I tend to think in that way 
it is to ensure whenever we apply a reset it is long enough.
As said before the powering on delay is to ensure the pulse length delay even 
if there is no reset GPIO but it is controlled by hardware.

> > +	}
> > +
> > 
> >  	err = regulator_disable(hub->vdd);
> >  	if (err) {
> >  	
> >  		dev_err(hub->dev, "failed to disable regulator: %d\n", 
err);
> > 
> > @@ -219,6 +230,7 @@ static void onboard_hub_attach_usb_driver(struct
> > work_struct *work)> 
> >  static int onboard_hub_probe(struct platform_device *pdev)
> >  {
> > 
> > +	const struct of_device_id *of_id;
> > 
> >  	struct device *dev = &pdev->dev;
> >  	struct onboard_hub *hub;
> >  	int err;
> > 
> > @@ -227,10 +239,26 @@ static int onboard_hub_probe(struct platform_device
> > *pdev)> 
> >  	if (!hub)
> >  	
> >  		return -ENOMEM;
> > 
> > +	of_id = of_match_device(onboard_hub_match, &pdev->dev);
> > +	if (!of_id)
> > +		return -ENODEV;
> > +
> > +	hub->pdata = of_id->data;
> > +	if (!hub->pdata)
> > +		return -EINVAL;
> > +
> > 
> >  	hub->vdd = devm_regulator_get(dev, "vdd");
> >  	if (IS_ERR(hub->vdd))
> >  	
> >  		return PTR_ERR(hub->vdd);
> > 
> > +	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						  
GPIOD_OUT_HIGH);
> > +	if (IS_ERR(hub->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), 
"failed to get
> > reset GPIO\n"); +
> > +	if (hub->reset_gpio)
> > +		fsleep(hub->pdata->reset_us);
> 
> Same question here: onboard_hub_power_on() is called a few lines below and
> has a delay before de-asserting the reset. Is the delay here really needed?

This actually looks like the delay is duplicated here. I agree with removing 
this.
How shall we proceed now that the whole series (incl. the bindings patch 1/3 
from v3) has landed in usb-testing? I can create a patch on top of this if 
this is the way to go.

Best regards,
Alexander



