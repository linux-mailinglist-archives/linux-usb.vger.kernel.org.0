Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC6C57D4C3
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jul 2022 22:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbiGUUZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jul 2022 16:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiGUUZo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jul 2022 16:25:44 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85C988F22
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 13:25:42 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id h132so2655427pgc.10
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZRsmDW5YJGlx28xHhwmp3cHg6otmQzb2gBaROJiExEc=;
        b=ItjJFWNdPkTlsLhuPv9hyk19dMwhdbI+Dj4gJzZka7YEErgKFdU1YkvyB68PSfIKgj
         dMXNqBEiIoQI528ZoELr2lwX0lUDB6+KuZ5Wndo48DSuuwpPMUZM3eh+XKVmjVaIJk+s
         L2do6xnhCbAA2Kh41YfkJAmpdrYOso1cTRyow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZRsmDW5YJGlx28xHhwmp3cHg6otmQzb2gBaROJiExEc=;
        b=iToBMmpsePqJakNTfOGH+cMCiqwXzMMAL0d3IRfdfnbkk10UaK1HdZOBm7r9UowEzh
         UK4Ua3F2Pq4FqKZl9NLl8UhEtB2x8qmbPd75FTWU2wb8tqmrpwogenjMkEHH0VyR8KCk
         iEpi5E3TpBOi4N6x8i3wevmpNmC9dFC4420h/mRsCxZ3l8AXO3nrrqkukTs/M4tvPZ+o
         Z3wxH/gJeLr54Q8mN1fYTyqGsTI/vj9feSJd4xM2sFR2/WddQ5JE2t4XniNVbND5r4E1
         ndrZIWTzNUiHHc6B7/FDt0nDpcr026pnK8k8h4Tjz4MSK4BYgQ43QVia1lISnXc7HBQU
         11sw==
X-Gm-Message-State: AJIora/EzGpmEAeni1/aLr/x7eiihgy7+v9MIc0T68XwgmUu9TG0vduE
        RxmhYA3rRGseObBJLrcJPxcsZg==
X-Google-Smtp-Source: AGRyM1vEcuaNC2i1/ChfRa3DTbn9BZk2+FA8OxMRRs6Mj2d/y9GjG/3xvvC+LAjcjvLLkqX9JGvGGQ==
X-Received: by 2002:a63:5a1b:0:b0:41a:64d4:9643 with SMTP id o27-20020a635a1b000000b0041a64d49643mr124611pgb.126.1658435142076;
        Thu, 21 Jul 2022 13:25:42 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e11e:767b:e6fb:8f36])
        by smtp.gmail.com with UTF8SMTPSA id g2-20020a655942000000b00419fc2c27d8sm1908544pgu.43.2022.07.21.13.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 13:25:41 -0700 (PDT)
Date:   Thu, 21 Jul 2022 13:25:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <Ytm2Q1gqbRggpqDK@google.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
 <20220715073300.868087-2-alexander.stein@ew.tq-group.com>
 <YtHDjF8HPUGdMWlE@google.com>
 <2543198.Lt9SDvczpP@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2543198.Lt9SDvczpP@steina-w>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 20, 2022 at 09:15:12AM +0200, Alexander Stein wrote:
> Hi Matthias,
> 
> Am Freitag, 15. Juli 2022, 21:44:12 CEST schrieb Matthias Kaehlcke:
> > On Fri, Jul 15, 2022 at 09:32:59AM +0200, Alexander Stein wrote:
> > > Despite default reset upon probe, release reset line after powering up
> > > the hub and assert reset again before powering down.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > Changes in v2:
> > > * Use device specific sleep times, if present
> > > * Use fsleep instead of usleep_range
> > > 
> > >  drivers/usb/misc/onboard_usb_hub.c | 29 +++++++++++++++++++++++++++++
> > >  drivers/usb/misc/onboard_usb_hub.h |  5 +++++
> > >  2 files changed, 34 insertions(+)
> > > 
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > > b/drivers/usb/misc/onboard_usb_hub.c index 6b9b949d17d3..1dd7f4767def
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
> > > +	const struct onboard_hub_devtype_data *devtype_data;
> > 
> > This kind of device specific data is often call platform data, let's
> > call the struct 'onboard_hub_pdata' and the field 'pdata'?
> 
> I took flexcan as a reference, but I do not mind using other names if that is 
> preferred.
> 
> > > +	struct gpio_desc *reset_gpio;
> > > 
> > >  	bool always_powered_in_suspend;
> > >  	bool is_powered_on;
> > >  	bool going_away;
> > > 
> > > @@ -56,6 +59,11 @@ static int onboard_hub_power_on(struct onboard_hub
> > > *hub)
> > > 
> > >  		return err;
> > >  	
> > >  	}
> > > 
> > > +	if (hub->devtype_data)
> > 
> > Instead of these checks let's make sure all hubs have pdata. Actually your
> > onboard_hub_probe() already esnures that the field is assigned.
> 
> For Realtek hubs (no platform data yet), of_id->data therefore hub-
> >devtype_data is NULL.
> But I agree that providing platformdata for all hubs seems reasonable to get 
> rid of these checks.
> 
> > > +		fsleep(hub->devtype_data->power_stable_time);
> > > +	if (hub->reset_gpio)
> > > +		gpiod_set_value_cansleep(hub->reset_gpio, 0);
> > 
> > I would have expected:
> > 
> >   	if (hub->reset_gpio) {
> > 		fsleep(hub->devtype_data->power_stable_time);
> > 		gpiod_set_value_cansleep(hub->reset_gpio, 0);
> > 	}
> > 
> > For the TUSB8041 the 'power_stable_time' (td2 in the datasheet) is "VDD and
> > VDD33 stable before de-assertion of GRSTz", so no delay without reset.
> 
> Your suggestion only works if you control the reset line (GRSTz) by GPIO. If 
> this line is controlled by hardware using RC circuits this waiting time still 
> has to be respected when power is supplied.
> I prefer that the USB hub is properly reset once this function exits. Without 
> waiting time the hardware controlled GRSTz might not yet be at a proper level.

Ok, in that case let's omit the check for 'hub->reset_gpio' and just do:

	fsleep(hub->devtype_data->power_stable_time);
	gpiod_set_value_cansleep(hub->reset_gpio, 0);

The point of adding the check was to skip the delay when no reset GPIO is
specified, but apparently that's not what we actually want.
