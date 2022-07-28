Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93A45838E6
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 08:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233830AbiG1Glg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 02:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbiG1GlI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 02:41:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B38B50728;
        Wed, 27 Jul 2022 23:41:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 924AF61AC1;
        Thu, 28 Jul 2022 06:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761DCC433C1;
        Thu, 28 Jul 2022 06:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658990465;
        bh=W0XxXdLLkEgMd9X3IxL9GRsb5r2xRaRkUt/W5UWZraI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bMbtyxn/epbzK5OyRgqr6XtEubLOX+vvDaYhynhx2CPPZ8y4hLP5NsdWTfU+wI07y
         Ote1DNBBLHv8KwGdKMAAxUJ9ySxZVf39Pfm4FocJuZssv73Jitrrzix/ivg3/fVcEO
         9sdIgAv0+COLwSxWCJcevTomkiZYVqGOJ5QUpSSE=
Date:   Thu, 28 Jul 2022 08:41:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <YuIvfahpGgMc7CJh@kroah.com>
References: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
 <YuFykRtbvxGssSVs@google.com>
 <2191669.iZASKD2KPV@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2191669.iZASKD2KPV@steina-w>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 28, 2022 at 08:20:13AM +0200, Alexander Stein wrote:
> Hello Matthias,
> 
> Am Mittwoch, 27. Juli 2022, 19:14:57 CEST schrieb Matthias Kaehlcke:
> > Hi Alexander,
> > 
> > (copying my comments from v3 to keep the discussion on the latest version)
> > 
> > On Wed, Jul 27, 2022 at 04:11:16PM +0200, Alexander Stein wrote:
> > > Despite default reset upon probe, release reset line after powering up
> > > the hub and assert reset again before powering down.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > * Patch 1 dropped as it already applied
> > > 
> > > Changes in v4:
> > > * Rebased to [1] commit e0c6b1f3d757 ("USB: usbsevseg: convert sysfs
> > > snprintf to sysfs_emit") * Added platform data for usb424
> > > 
> > >   Reset pulse length taken from [2], Table 3-2 Symbol RESET_N
> > >   Completely untested
> > > 
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git Branch
> > > usb-testing [2]
> > > http://ww1.microchip.com/downloads/en/devicedoc/00001692c.pdf
> > > 
> > >  drivers/usb/misc/onboard_usb_hub.c | 28 ++++++++++++++++++++++++++++
> > >  drivers/usb/misc/onboard_usb_hub.h | 22 +++++++++++++++++-----
> > >  2 files changed, 45 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > > b/drivers/usb/misc/onboard_usb_hub.c index de3627af3c84..0c81417dd9a7
> > > 100644
> > > --- a/drivers/usb/misc/onboard_usb_hub.c
> > > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > > @@ -7,6 +7,7 @@
> > > 
> > >  #include <linux/device.h>
> > >  #include <linux/export.h>
> > > 
> > > +#include <linux/gpio/consumer.h>
> > > 
> > >  #include <linux/init.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/list.h>
> > > 
> > > @@ -38,6 +39,8 @@ struct usbdev_node {
> > > 
> > >  struct onboard_hub {
> > >  
> > >  	struct regulator *vdd;
> > >  	struct device *dev;
> > > 
> > > +	const struct onboard_hub_pdata *pdata;
> > > +	struct gpio_desc *reset_gpio;
> > > 
> > >  	bool always_powered_in_suspend;
> > >  	bool is_powered_on;
> > >  	bool going_away;
> > > 
> > > @@ -56,6 +59,9 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
> > > 
> > >  		return err;
> > >  	
> > >  	}
> > > 
> > > +	fsleep(hub->pdata->reset_us);
> > > +	gpiod_set_value_cansleep(hub->reset_gpio, 0);
> > > +
> > > 
> > >  	hub->is_powered_on = true;
> > >  	
> > >  	return 0;
> > > 
> > > @@ -65,6 +71,11 @@ static int onboard_hub_power_off(struct onboard_hub
> > > *hub)> 
> > >  {
> > >  
> > >  	int err;
> > > 
> > > +	if (hub->reset_gpio) {
> > > +		gpiod_set_value_cansleep(hub->reset_gpio, 1);
> > > +		fsleep(hub->pdata->reset_us);
> > 
> > Is this delay here actually needed? There is a delay in
> > onboard_hub_power_on(), before de-asserting the reset, isn't that enough?
> 
> If you see both delays together you are right, but I tend to think in that way 
> it is to ensure whenever we apply a reset it is long enough.
> As said before the powering on delay is to ensure the pulse length delay even 
> if there is no reset GPIO but it is controlled by hardware.
> 
> > > +	}
> > > +
> > > 
> > >  	err = regulator_disable(hub->vdd);
> > >  	if (err) {
> > >  	
> > >  		dev_err(hub->dev, "failed to disable regulator: %d\n", 
> err);
> > > 
> > > @@ -219,6 +230,7 @@ static void onboard_hub_attach_usb_driver(struct
> > > work_struct *work)> 
> > >  static int onboard_hub_probe(struct platform_device *pdev)
> > >  {
> > > 
> > > +	const struct of_device_id *of_id;
> > > 
> > >  	struct device *dev = &pdev->dev;
> > >  	struct onboard_hub *hub;
> > >  	int err;
> > > 
> > > @@ -227,10 +239,26 @@ static int onboard_hub_probe(struct platform_device
> > > *pdev)> 
> > >  	if (!hub)
> > >  	
> > >  		return -ENOMEM;
> > > 
> > > +	of_id = of_match_device(onboard_hub_match, &pdev->dev);
> > > +	if (!of_id)
> > > +		return -ENODEV;
> > > +
> > > +	hub->pdata = of_id->data;
> > > +	if (!hub->pdata)
> > > +		return -EINVAL;
> > > +
> > > 
> > >  	hub->vdd = devm_regulator_get(dev, "vdd");
> > >  	if (IS_ERR(hub->vdd))
> > >  	
> > >  		return PTR_ERR(hub->vdd);
> > > 
> > > +	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > +						  
> GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(hub->reset_gpio))
> > > +		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), 
> "failed to get
> > > reset GPIO\n"); +
> > > +	if (hub->reset_gpio)
> > > +		fsleep(hub->pdata->reset_us);
> > 
> > Same question here: onboard_hub_power_on() is called a few lines below and
> > has a delay before de-asserting the reset. Is the delay here really needed?
> 
> This actually looks like the delay is duplicated here. I agree with removing 
> this.
> How shall we proceed now that the whole series (incl. the bindings patch 1/3 
> from v3) has landed in usb-testing? I can create a patch on top of this if 
> this is the way to go.

Please do.

