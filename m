Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879C9573BA4
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 18:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbiGMQ7t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiGMQ7s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 12:59:48 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE4624BF8
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 09:59:46 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso4600279pjj.5
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F1CzeIKWJ0IMK4EfYtHrzT59PipvD4EsITImnKg8JKs=;
        b=dP6aEMSWBaStQQaHU0xC4ZpXviTXPhkywI6GjNZG58tw+TjEf+lr1f3DbCjWFP0deq
         mrhGoYTX8da+NziUrwofnRFG7sHq4SFMVfT199Or8nLKY2cnWs0pb1dkQrIccTZ7ZnK1
         tuVVN8XK2+Ka/3MbOub914tkqkqZOdxCVJYp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F1CzeIKWJ0IMK4EfYtHrzT59PipvD4EsITImnKg8JKs=;
        b=D0bGZMuQfVSRd2jhJWkWwARItQWd+AEluZH8DnMMHJsxb2M/GCV+hH32NN9fNKBqoQ
         Rt+xohuTBofd115UmSqYzNpBNQltVCQlPbi3q/uygOPwGb43NC7w7W76r/vyR5wZgAlF
         VAjgvBhohFNfAz5peykdq8uLBQ+X6RLnzgTx6ZtO9+7dobupYEoJwKIovLlqR6g8TMC5
         4DSr0Q6LMK286fQe60KvBjx4oHu5vTl3z4r23JkWvUDdgP/OG0rqC0saN4h9XtY15WSN
         dcmTCjTEX87bJLuEXeHpkpYBKckyJSfUD6kIaXrMf8GE7awYBvF6I8P4qneOvBs9brlv
         l7HA==
X-Gm-Message-State: AJIora8uM/cyEbXrJwk5IysGp/zvoGg6GLurABc8b/+JAMvFT1mNBcIZ
        HpTEuTs969WvOzEUjSUes2tySw==
X-Google-Smtp-Source: AGRyM1scsheb9eqnRWWNOgAZyMDwHb21wBXHY5/zCtbVFlU4pMvQzH9u88Xxb7k58ALEdTZG3BFGnQ==
X-Received: by 2002:a17:903:4091:b0:16b:e3d5:b2da with SMTP id z17-20020a170903409100b0016be3d5b2damr3984681plc.58.1657731586355;
        Wed, 13 Jul 2022 09:59:46 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:31cc:631b:4291:60b5])
        by smtp.gmail.com with UTF8SMTPSA id w14-20020a1709027b8e00b0016a4db13435sm9071178pll.191.2022.07.13.09.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 09:59:45 -0700 (PDT)
Date:   Wed, 13 Jul 2022 09:59:44 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <Ys76AHBx/T4kTqnO@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <20220712150627.1444761-2-alexander.stein@ew.tq-group.com>
 <Ys263f5K4WRoSZ45@google.com>
 <1902562.PYKUYFuaPT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1902562.PYKUYFuaPT@steina-w>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,

On Wed, Jul 13, 2022 at 08:46:56AM +0200, Alexander Stein wrote:
> Hi Matthias,
> 
> Am Dienstag, 12. Juli 2022, 20:18:05 CEST schrieb Matthias Kaehlcke:
> > On Tue, Jul 12, 2022 at 05:06:26PM +0200, Alexander Stein wrote:
> > > Despite default reset upon probe, release reset line after powering up
> > > the hub and assert reset again before powering down.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > My current DT node on my TQMa8MPxL looks like this
> > > ```
> > > &usb_dwc3_1 {
> > > 
> > > 	dr_mode = "host";
> > > 	#address-cells = <1>;
> > > 	#size-cells = <0>;
> > > 	pinctrl-names = "default";
> > > 	pinctrl-0 = <&pinctrl_usbhub>;
> > > 	status = "okay";
> > > 	
> > > 	hub_2_0: hub@1 {
> > > 	
> > > 		compatible = "usb451,8142";
> > > 		reg = <1>;
> > > 		peer-hub = <&hub_3_0>;
> > > 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > > 	
> > > 	};
> > > 	
> > > 	hub_3_0: hub@2 {
> > > 	
> > > 		compatible = "usb451,8140";
> > > 		reg = <2>;
> > > 		peer-hub = <&hub_2_0>;
> > > 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > > 	
> > > 	};
> > > 
> > > };
> > > ```
> > > which I don't like much for 2 reasons:
> > > * the pinctrl has to be put in a common top-node of USB hub node. The
> > > pinctrl> 
> > >   can not be requested twice.
> > 
> > Agreed, that's not great. The pinctrl doesn't have to be necessarily in the
> > USB controller node, it could also be in the static section of the board,
> > but that isn't really much of an improvement :( Not sure there is much to
> > do given that the USB devices also process the pinctrl info (besides the
> > onboard_hub platform device doing the same).
> 
> I tend to keep the pinctrl property next to the ones actually using them. But 
> in this case it's not possible unfortunately.
> 
> > > * Apparently there is no conflict on the reset-gpio only because just one
> > > device> 
> > >   gets probed here:
> > > > $ ls /sys/bus/platform/drivers/onboard-usb-hub/
> > > > 38200000.usb:hub@1  bind  uevent  unbind
> > 
> > Right, the driver creates a single platform device for each physical hub.
> 
> Thanks for confirmation.
> 
> > > But this seems better than to use a common fixed-regulator referenced by
> > > both hub nodes, which just is controlled by GPIO and does not supply any
> > > voltages.
> > Agreed, if the GPIO controls a reset line it should be implemented as such.
> > 
> > > Note: It might also be necessary to add bindings to specify ramp up times
> > > and/or reset timeouts.
> > 
> > The times are hub specific, not board specific, right? If that's the case
> > then a binding shouldn't be needed, the timing can be derived from the
> > compatible string.
> 
> Well, yes they are hub specific, but board design might influence them as 
> well, as in increased ramp up delay.

Isn't the ramp up delay something that should be configured on the regulator
side with 'regulator-ramp-delay'?

> > >  drivers/usb/misc/onboard_usb_hub.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > > b/drivers/usb/misc/onboard_usb_hub.c index 6b9b949d17d3..348fb5270266
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
> > > @@ -38,6 +39,7 @@ struct usbdev_node {
> > > 
> > >  struct onboard_hub {
> > >  
> > >  	struct regulator *vdd;
> > >  	struct device *dev;
> > > 
> > > +	struct gpio_desc *reset_gpio;
> > > 
> > >  	bool always_powered_in_suspend;
> > >  	bool is_powered_on;
> > >  	bool going_away;
> > > 
> > > @@ -56,6 +58,10 @@ static int onboard_hub_power_on(struct onboard_hub
> > > *hub)
> > > 
> > >  		return err;
> > >  	
> > >  	}
> > > 
> > > +	/* Deassert reset */
> > 
> > The comment isn't really needed, it's clear from the context.
> 
> Ok, removed.
> 
> > > +	usleep_range(3000, 3100);
> > 
> > These shouldn't be hard coded. Instead you could add a model specific struct
> > 'hub_data' (or similar) and associate it with the compatible string through
> > onboard_hub_match.data
> 
> Will do.
> 
> > You could use fsleep() instead of usleep_range(). It does the _range part
> > automatically (with a value of 2x).
> 
> Nice idea.
> 
> > > +	gpiod_set_value_cansleep(hub->reset_gpio, 0);
> > 
> > Since this includes delays maybe put the reset inside an 'if
> > (hub->reset_gpio)' block. Not super important for these short delays, but
> > they might be longer for some hubs.
> 
> gpiod_set_value_cansleep includes delays? Without gpio_desc it returns early 
> on. Or do you mean the usleep_range before?

Yes, I was referring to the usleep_range() before.

> Actually in this case the 3ms is the minimum time from VDD stable to de-
> assertion of GRST. So even in case the GPIO is manged by hardware itself,
> software has to wait here before proceeding, IMHO.

Agreed.
