Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572A7572E61
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 08:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234210AbiGMGrQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 02:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbiGMGrM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 02:47:12 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AEADF612;
        Tue, 12 Jul 2022 23:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657694830; x=1689230830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFlYWvFCkyJizptxG0AsrXEYU06KJo/BgPWMRmnxIF0=;
  b=G+shTsEd/ULX9TFEQq8iK1RdmFrIA1qa8xcPD9/z+RVyqhGUPAwDALTL
   qZVBplh+jW3lOYE2FkwVGC+S43nuCL2DnBK9iER9zJK7WxH7ta+aHTJcn
   6+6CRCJg+4LhJVIg15SShMIY64xeMRktLlK5U/E+NNHZ22xXZheRdQn0E
   SCcHBB9w1CmPxjQbZjLwmsFpDOdrULurUUc8xI/bBSs1zbP/teZ/4KL9J
   YJLT7N5VWCzsKFElfDZTHqDGLMHXILZchKSLeZi0OEDo6YFdRDecRUkcB
   dp0pGbl7Z7XJJZ1mCykwIK6jYt6ooxlGdAGecHKfwTCczMqa67u/jQWXR
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650924000"; 
   d="scan'208";a="25016104"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Jul 2022 08:47:08 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 13 Jul 2022 08:47:08 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 13 Jul 2022 08:47:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657694828; x=1689230828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFlYWvFCkyJizptxG0AsrXEYU06KJo/BgPWMRmnxIF0=;
  b=Y0STHqi/m8sQ7M8zVbulxO+zP+LKA3IlF2OOTvuTAq55+e2VzTxJaEMp
   n2JGOfYKX2gkq3mVspQMWd1NpLj1oYlYxUwKVEC4V7FaNjGq9VxxlW+Lo
   gX90T56jQGFUVdG2ALaMJp3bGREyXINoykuUhYTH9JIIOuV58mWy0EnRM
   6MRtLA6YPw2JMyKdWl2UqMAAqHmpbtSUaJsjbgvl7NGAbjuVGNGqzHjHA
   iJiUU+PBPo2ta5VTXwWc1769RWnW/yoya+El1s4umUbsbdeZ+ZI4twY+3
   kb4npQo5XlSilycFG/3q5sczcq9e68LXmfBG63TZyRR4kkNc6LoiVC1Sn
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650924000"; 
   d="scan'208";a="25016102"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Jul 2022 08:47:02 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A0541280056;
        Wed, 13 Jul 2022 08:46:58 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Date:   Wed, 13 Jul 2022 08:46:56 +0200
Message-ID: <1902562.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Ys263f5K4WRoSZ45@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com> <20220712150627.1444761-2-alexander.stein@ew.tq-group.com> <Ys263f5K4WRoSZ45@google.com>
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

Am Dienstag, 12. Juli 2022, 20:18:05 CEST schrieb Matthias Kaehlcke:
> On Tue, Jul 12, 2022 at 05:06:26PM +0200, Alexander Stein wrote:
> > Despite default reset upon probe, release reset line after powering up
> > the hub and assert reset again before powering down.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > My current DT node on my TQMa8MPxL looks like this
> > ```
> > &usb_dwc3_1 {
> > 
> > 	dr_mode = "host";
> > 	#address-cells = <1>;
> > 	#size-cells = <0>;
> > 	pinctrl-names = "default";
> > 	pinctrl-0 = <&pinctrl_usbhub>;
> > 	status = "okay";
> > 	
> > 	hub_2_0: hub@1 {
> > 	
> > 		compatible = "usb451,8142";
> > 		reg = <1>;
> > 		peer-hub = <&hub_3_0>;
> > 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > 	
> > 	};
> > 	
> > 	hub_3_0: hub@2 {
> > 	
> > 		compatible = "usb451,8140";
> > 		reg = <2>;
> > 		peer-hub = <&hub_2_0>;
> > 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> > 	
> > 	};
> > 
> > };
> > ```
> > which I don't like much for 2 reasons:
> > * the pinctrl has to be put in a common top-node of USB hub node. The
> > pinctrl> 
> >   can not be requested twice.
> 
> Agreed, that's not great. The pinctrl doesn't have to be necessarily in the
> USB controller node, it could also be in the static section of the board,
> but that isn't really much of an improvement :( Not sure there is much to
> do given that the USB devices also process the pinctrl info (besides the
> onboard_hub platform device doing the same).

I tend to keep the pinctrl property next to the ones actually using them. But 
in this case it's not possible unfortunately.

> > * Apparently there is no conflict on the reset-gpio only because just one
> > device> 
> >   gets probed here:
> > > $ ls /sys/bus/platform/drivers/onboard-usb-hub/
> > > 38200000.usb:hub@1  bind  uevent  unbind
> 
> Right, the driver creates a single platform device for each physical hub.

Thanks for confirmation.

> > But this seems better than to use a common fixed-regulator referenced by
> > both hub nodes, which just is controlled by GPIO and does not supply any
> > voltages.
> Agreed, if the GPIO controls a reset line it should be implemented as such.
> 
> > Note: It might also be necessary to add bindings to specify ramp up times
> > and/or reset timeouts.
> 
> The times are hub specific, not board specific, right? If that's the case
> then a binding shouldn't be needed, the timing can be derived from the
> compatible string.

Well, yes they are hub specific, but board design might influence them as 
well, as in increased ramp up delay.

> >  drivers/usb/misc/onboard_usb_hub.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > b/drivers/usb/misc/onboard_usb_hub.c index 6b9b949d17d3..348fb5270266
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
> > @@ -38,6 +39,7 @@ struct usbdev_node {
> > 
> >  struct onboard_hub {
> >  
> >  	struct regulator *vdd;
> >  	struct device *dev;
> > 
> > +	struct gpio_desc *reset_gpio;
> > 
> >  	bool always_powered_in_suspend;
> >  	bool is_powered_on;
> >  	bool going_away;
> > 
> > @@ -56,6 +58,10 @@ static int onboard_hub_power_on(struct onboard_hub
> > *hub)
> > 
> >  		return err;
> >  	
> >  	}
> > 
> > +	/* Deassert reset */
> 
> The comment isn't really needed, it's clear from the context.

Ok, removed.

> > +	usleep_range(3000, 3100);
> 
> These shouldn't be hard coded. Instead you could add a model specific struct
> 'hub_data' (or similar) and associate it with the compatible string through
> onboard_hub_match.data

Will do.

> You could use fsleep() instead of usleep_range(). It does the _range part
> automatically (with a value of 2x).

Nice idea.

> > +	gpiod_set_value_cansleep(hub->reset_gpio, 0);
> 
> Since this includes delays maybe put the reset inside an 'if
> (hub->reset_gpio)' block. Not super important for these short delays, but
> they might be longer for some hubs.

gpiod_set_value_cansleep includes delays? Without gpio_desc it returns early 
on. Or do you mean the usleep_range before?
Actually in this case the 3ms is the minimum time from VDD stable to de-
assertion of GRST. So even in case the GPIO is manged by hardware itself, 
software has to wait here before proceeding, IMHO.

> > +
> > 
> >  	hub->is_powered_on = true;
> >  	
> >  	return 0;
> > 
> > @@ -65,6 +71,10 @@ static int onboard_hub_power_off(struct onboard_hub
> > *hub)> 
> >  {
> >  
> >  	int err;
> > 
> > +	/* Assert reset */
> 
> drop comment

Will do.

> > +	gpiod_set_value_cansleep(hub->reset_gpio, 1);
> 
> Put inside 'if (hub->reset_gpio)' to avoid unnecessary delays when no reset
> is configured.
> 
> > +	usleep_range(4000, 5000);
> 
> Use per-model values.

Will do.

> > +
> > 
> >  	err = regulator_disable(hub->vdd);
> >  	if (err) {
> >  	
> >  		dev_err(hub->dev, "failed to disable regulator: %d\n", 
err);
> > 
> > @@ -231,6 +241,14 @@ static int onboard_hub_probe(struct platform_device
> > *pdev)> 
> >  	if (IS_ERR(hub->vdd))
> >  	
> >  		return PTR_ERR(hub->vdd);
> > 
> > +	/* Put the hub into reset, pull reset line low, and assure 4ms 
reset low
> > timing. */
> drop comment, it's mostly evident from the code. Maybe not the
> usleep_range() part, but that should become clearer when per model values
> are used.

Will do.

> > +	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > +						  
GPIOD_OUT_HIGH);
> > +	if (IS_ERR(hub->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), 
"failed to get
> > reset GPIO\n"); +
> > +	usleep_range(4000, 5000);
> > +
> > 
> >  	hub->dev = dev;
> >  	mutex_init(&hub->lock);
> >  	INIT_LIST_HEAD(&hub->udev_list);




