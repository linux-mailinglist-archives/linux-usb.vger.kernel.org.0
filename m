Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8575744E0
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 08:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiGNGKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jul 2022 02:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbiGNGKM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jul 2022 02:10:12 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F895111C;
        Wed, 13 Jul 2022 23:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657779010; x=1689315010;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P9AJNp2QXvwNyY5/+365FzUMEht6BcEtqcmTPZGX75E=;
  b=MTwLoL4TwIRGvIJDLUUKkJfkwIgI0qG4vvLHUS8jO7/86z7ZIJX2wK7G
   wWmOdmeQe7k5cc1fEHBqxNoJbG5TFIF9Uf3qH9QoidyYYPiTIgBsz8S93
   hL1LqFYHk31jTz4S0l+booHoe+BatkxnD8yF8QkrzGxVce/qTU6HcOPDJ
   Ex8SdskYOZMh5nO8h5RdXroN3sXuoKeUcJ9diTKYUE/WNCqlwWBaVxhU0
   W6J4YGNBNlwozWdX3yHT3dfwvDpI7PvLiOcg8vU9TEiXC9vdtYaQJcDXD
   NRAtj0HmiDnq86kgwPWl5C2jOPoKJrmX/ZIob7eoB6h6wqeaidQ7DjIxh
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650924000"; 
   d="scan'208";a="25039871"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Jul 2022 08:10:08 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 14 Jul 2022 08:10:08 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 14 Jul 2022 08:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657779008; x=1689315008;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=P9AJNp2QXvwNyY5/+365FzUMEht6BcEtqcmTPZGX75E=;
  b=lROZQmjo8XZOrbYaoHX8nHiq56BD2mcvBLhtOHv4668cXe7akkj3OO6t
   9UNi4qkZr+TRNzZloSH9Po0ejte7cs8nackFOthJfozZG5l80CgmQjPjQ
   QFGlNETMFGVNSdaco/dUAUrvTe1qBGs+gH3/cjBB03EICpgvpvxE0cRCm
   hbjHHuXyORE/u9mGDo6o+ttOqBgbHEeR5gAqKpqs/CX0v+wjmMyEhpQ/9
   i4+vaatJnC/y7FejBz02UCT+X+Y2Ckbd9vJjjl6P8yfTyHz2OSAY/8nPR
   OPlvPSRqOlMzTPuuuKtcH799p68gIsDi1GGLH7iJ1hFgKuaRaqeIO7CES
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650924000"; 
   d="scan'208";a="25039870"
Subject: Re: Re: [PATCH 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Jul 2022 08:10:07 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9B031280056;
        Thu, 14 Jul 2022 08:10:07 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Date:   Thu, 14 Jul 2022 08:10:05 +0200
Message-ID: <5584585.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Ys76AHBx/T4kTqnO@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com> <1902562.PYKUYFuaPT@steina-w> <Ys76AHBx/T4kTqnO@google.com>
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

Hi Matthias,

Am Mittwoch, 13. Juli 2022, 18:59:44 CEST schrieb Matthias Kaehlcke:
> Hi Alexander,
> 
> On Wed, Jul 13, 2022 at 08:46:56AM +0200, Alexander Stein wrote:
> > Hi Matthias,
> > 
> > Am Dienstag, 12. Juli 2022, 20:18:05 CEST schrieb Matthias Kaehlcke:
> > > On Tue, Jul 12, 2022 at 05:06:26PM +0200, Alexander Stein wrote:
> > > > Despite default reset upon probe, release reset line after powering up
> > > > the hub and assert reset again before powering down.
> > > > 
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > My current DT node on my TQMa8MPxL looks like this
> > > > ```
> > > > &usb_dwc3_1 {
> > > > 
> > > > 	dr_mode = "host";
> > > > 	#address-cells = <1>;
> > > > 	#size-cells = <0>;
> > > > 	pinctrl-names = "default";
> > > > 	pinctrl-0 = <&pinctrl_usbhub>;
> > > > 	status = "okay";
> > > > 	
> > > > 	hub_2_0: hub@1 {
> > > > 	
> > > > 		compatible = "usb451,8142";
> > > > 		reg = <1>;
> > > > 		peer-hub = <&hub_3_0>;
> > > > 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > > > 	
> > > > 	};
> > > > 	
> > > > 	hub_3_0: hub@2 {
> > > > 	
> > > > 		compatible = "usb451,8140";
> > > > 		reg = <2>;
> > > > 		peer-hub = <&hub_2_0>;
> > > > 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > > > 	
> > > > 	};
> > > > 
> > > > };
> > > > ```
> > > > which I don't like much for 2 reasons:
> > > > * the pinctrl has to be put in a common top-node of USB hub node. The
> > > > pinctrl>
> > > > 
> > > >   can not be requested twice.
> > > 
> > > Agreed, that's not great. The pinctrl doesn't have to be necessarily in
> > > the
> > > USB controller node, it could also be in the static section of the
> > > board,
> > > but that isn't really much of an improvement :( Not sure there is much
> > > to
> > > do given that the USB devices also process the pinctrl info (besides the
> > > onboard_hub platform device doing the same).
> > 
> > I tend to keep the pinctrl property next to the ones actually using them.
> > But in this case it's not possible unfortunately.
> > 
> > > > * Apparently there is no conflict on the reset-gpio only because just
> > > > one
> > > > device>
> > > > 
> > > >   gets probed here:
> > > > > $ ls /sys/bus/platform/drivers/onboard-usb-hub/
> > > > > 38200000.usb:hub@1  bind  uevent  unbind
> > > 
> > > Right, the driver creates a single platform device for each physical
> > > hub.
> > 
> > Thanks for confirmation.
> > 
> > > > But this seems better than to use a common fixed-regulator referenced
> > > > by
> > > > both hub nodes, which just is controlled by GPIO and does not supply
> > > > any
> > > > voltages.
> > > 
> > > Agreed, if the GPIO controls a reset line it should be implemented as
> > > such.
> > > 
> > > > Note: It might also be necessary to add bindings to specify ramp up
> > > > times
> > > > and/or reset timeouts.
> > > 
> > > The times are hub specific, not board specific, right? If that's the
> > > case
> > > then a binding shouldn't be needed, the timing can be derived from the
> > > compatible string.
> > 
> > Well, yes they are hub specific, but board design might influence them as
> > well, as in increased ramp up delay.
> 
> Isn't the ramp up delay something that should be configured on the regulator
> side with 'regulator-ramp-delay'?

Sure, if you have a regulators you can do that. But even for the reset GPIO 
lines an RC circuit can stretch the ramp up. AFAIK there is no way to handle 
this despite inserting a waiting time in driver code itself.
For now this is good, but it might be necessary to accompany for that at some 
point.

Regards,
Alexander

> > > >  drivers/usb/misc/onboard_usb_hub.c | 18 ++++++++++++++++++
> > > >  1 file changed, 18 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > > > b/drivers/usb/misc/onboard_usb_hub.c index 6b9b949d17d3..348fb5270266
> > > > 100644
> > > > --- a/drivers/usb/misc/onboard_usb_hub.c
> > > > +++ b/drivers/usb/misc/onboard_usb_hub.c
> > > > @@ -7,6 +7,7 @@
> > > > 
> > > >  #include <linux/device.h>
> > > >  #include <linux/export.h>
> > > > 
> > > > +#include <linux/gpio/consumer.h>
> > > > 
> > > >  #include <linux/init.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/list.h>
> > > > 
> > > > @@ -38,6 +39,7 @@ struct usbdev_node {
> > > > 
> > > >  struct onboard_hub {
> > > >  
> > > >  	struct regulator *vdd;
> > > >  	struct device *dev;
> > > > 
> > > > +	struct gpio_desc *reset_gpio;
> > > > 
> > > >  	bool always_powered_in_suspend;
> > > >  	bool is_powered_on;
> > > >  	bool going_away;
> > > > 
> > > > @@ -56,6 +58,10 @@ static int onboard_hub_power_on(struct onboard_hub
> > > > *hub)
> > > > 
> > > >  		return err;
> > > >  	
> > > >  	}
> > > > 
> > > > +	/* Deassert reset */
> > > 
> > > The comment isn't really needed, it's clear from the context.
> > 
> > Ok, removed.
> > 
> > > > +	usleep_range(3000, 3100);
> > > 
> > > These shouldn't be hard coded. Instead you could add a model specific
> > > struct 'hub_data' (or similar) and associate it with the compatible
> > > string through onboard_hub_match.data
> > 
> > Will do.
> > 
> > > You could use fsleep() instead of usleep_range(). It does the _range
> > > part
> > > automatically (with a value of 2x).
> > 
> > Nice idea.
> > 
> > > > +	gpiod_set_value_cansleep(hub->reset_gpio, 0);
> > > 
> > > Since this includes delays maybe put the reset inside an 'if
> > > (hub->reset_gpio)' block. Not super important for these short delays,
> > > but
> > > they might be longer for some hubs.
> > 
> > gpiod_set_value_cansleep includes delays? Without gpio_desc it returns
> > early on. Or do you mean the usleep_range before?
> 
> Yes, I was referring to the usleep_range() before.
> 
> > Actually in this case the 3ms is the minimum time from VDD stable to de-
> > assertion of GRST. So even in case the GPIO is manged by hardware itself,
> > software has to wait here before proceeding, IMHO.
> 
> Agreed.




