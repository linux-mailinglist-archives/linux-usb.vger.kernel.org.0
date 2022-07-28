Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4070758406C
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 15:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiG1NzB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 09:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiG1NzA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 09:55:00 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56160481E9
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 06:54:59 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id f7so2176027pjp.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 06:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2QpL6F67Dj9n4HvxJ6DUvAzljQJMSEXWFh1FGsAup9I=;
        b=RRQ9m9zoiklQKOgiAzIjkaB/c2eHV5Q3PlxtnZOAxIp0AzmskzDRseeE9z/+na05VX
         IhBBoUZX4lHreueG0dczIz62rFQkKJ5vtp6kPQNaMdOOBMoAlwfscRYZnuk2sEfmYdy1
         VNUNn2UMR5g96d0z/U2n1ftZFndNufcac1ny0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2QpL6F67Dj9n4HvxJ6DUvAzljQJMSEXWFh1FGsAup9I=;
        b=pb1olz1ZPNtOvJAuyW5trP0BGqvEpdjQo3pOrPpG7gNOKXyWUebQZyZvx+14SsB5vs
         JcOZa1F92xs53k0edYRf5+biLVDACW4cdTv1yvwehj5ZHK16JogERDRHuiPmpmVM5q8J
         mDwuISYuWuY/n5bjwSpXLVPYmtsL69SfM7BtAA1ynJ3N0tLNY3OsoHIKWOw98GIJlPqS
         v/MumjFWJfXzZioei1UvTsxg6+GIF2RhwYjkwYHE6sUXlvpAWsA2aUHBmJtJzWiRlGp7
         895S5CUUOXHLoTi9huBYr0dNrSQ0/BNmGFFJkuTwOMtmon/tEZHSTD8ykimm6g5nOiUH
         5TAA==
X-Gm-Message-State: AJIora+OJOfq2aAt1LWlyRB7jIqcPJlXgQ84nsJlvJM+yTa8xZPh4xtv
        83TYb+LjZAwmuIMCvSHCvUVUBA==
X-Google-Smtp-Source: AGRyM1uQWS3OqsoSSDSIde2I89hITT1C0ACYuANC8KFxzJseXZ4Ru+ESRjxrECVtejJLvqvtX0c5qQ==
X-Received: by 2002:a17:902:db03:b0:16c:3eff:b503 with SMTP id m3-20020a170902db0300b0016c3effb503mr26669657plx.151.1659016498661;
        Thu, 28 Jul 2022 06:54:58 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:bb10:e729:7f59:7cbc])
        by smtp.gmail.com with UTF8SMTPSA id z4-20020a170902ccc400b0016db441edd7sm1340906ple.40.2022.07.28.06.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 06:54:58 -0700 (PDT)
Date:   Thu, 28 Jul 2022 06:54:56 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <YuKVMAhe7b2LDfiS@google.com>
References: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
 <YuFykRtbvxGssSVs@google.com>
 <2191669.iZASKD2KPV@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2191669.iZASKD2KPV@steina-w>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

In _power_off() the delay is currently only applied when the reset line is
*not* controlled by the hardware. In that case the delay in _power_on()
already ensures that the reset is applied long enough. Am I missing
something?

As per my reply on v2 [1] the datasheet does not suggest that there are two
different delays:

> In both cases the datasheet talks about the reset duration of 3 ms in
> relation with the power supplies:
>
>   7.6 Timing Requirements, Power-Up
>
>   td2: VDD and VDD33 stable before de-assertion of GRSTz
>
>
>   8.3.7 Power-Up and Reset
>
>   A minimum reset duration of 3 ms is required. This is defined as the time when
>   the power supplies are in the recommended operating range to the de-assertion
>   of GRSTz.

If there is evidence that a reset delay and a separate power stable delay are
needed I'm very open to add a second delay, but as of now my interpretation of
the datasheet is that the reset should be applied for at least 3ms after the
regulators are turned on (and power is stable, which should be ensured by
the regulator config).

[1] https://lore.kernel.org/all/Ytm5RrXYaKtwEg23@google.com/

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
> 
> Best regards,
> Alexander
> 
> 
> 
