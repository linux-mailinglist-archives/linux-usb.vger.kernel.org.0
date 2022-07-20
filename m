Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 382D157B17E
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 09:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiGTHPT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 03:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiGTHPR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 03:15:17 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1658115C;
        Wed, 20 Jul 2022 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658301316; x=1689837316;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UbBe5LGXkcJ9/bTutZqXZ/PCCEf3AqHgDkxtBAOY54M=;
  b=CrrdXqzXE9TlkCDWM6IFAgfiuDoHb4SOBvaV19ebisogPK3pYJ87XktJ
   iLwue7bcRDQttj4ZCN2hGdT/6fe5AsLAzzsSX8FKGNGYZdRgUCqGO+GKq
   NS4Gg7EP/pU6Wqd50sO0ybNH3kPYzQquFBgzVcmGET8XWbyj0NVPqAi3F
   VNuaJ76yiYckwlI0EeBLGUAsSBQVZWZDbKIJ+pUCSe+u21o6/lhDZdRM7
   BsFciI0S0d490vGFyLk2F4/EmasBdYK7Q2E0xxFrABIV/OlbTtBdJK0gb
   BaEDREnuLUEr2fFKTtW6fYT62IVGIpXswAW+zLHDMMW53z9Dn+MtD/UcG
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25149490"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jul 2022 09:15:13 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 20 Jul 2022 09:15:13 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 20 Jul 2022 09:15:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658301313; x=1689837313;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=UbBe5LGXkcJ9/bTutZqXZ/PCCEf3AqHgDkxtBAOY54M=;
  b=X3lqtVJwFgiKKE5TdcpuamRN/cTVsJhiopcEYxBW3WNeyPH17xQgvKO8
   LTbrmQpSIZB1F2Ez5R1WNR5ZccA0W+xdV+7YUP0UUOxjAMJf6wc4hGslc
   1RgGTjY8XTTQ0p0610Mxewm4xNjapWoYkN9igefxNHEzMmIvaOl4a/nkj
   /dNXTmnlGHSS8IrfwFEHsxqSleefXDo8kO1pBpeaY3kHhM7eDU5lWcg6O
   039nxcbyzzdck3wNIe8mGbUWiY5k/8/Zt42YV1HCJrpQI3U1W3YzgDzOb
   HJZrqPg4PAUzCoxw8IWXDxxcUct1RrgndJ+MDEQXE1x6PcfSOq+ayQ2/D
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650924000"; 
   d="scan'208";a="25149489"
Subject: Re: Re: [PATCH v2 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2022 09:15:13 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 27BF9280056;
        Wed, 20 Jul 2022 09:15:13 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Date:   Wed, 20 Jul 2022 09:15:12 +0200
Message-ID: <2543198.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtHDjF8HPUGdMWlE@google.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com> <20220715073300.868087-2-alexander.stein@ew.tq-group.com> <YtHDjF8HPUGdMWlE@google.com>
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

Hi Matthias,

Am Freitag, 15. Juli 2022, 21:44:12 CEST schrieb Matthias Kaehlcke:
> On Fri, Jul 15, 2022 at 09:32:59AM +0200, Alexander Stein wrote:
> > Despite default reset upon probe, release reset line after powering up
> > the hub and assert reset again before powering down.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Use device specific sleep times, if present
> > * Use fsleep instead of usleep_range
> > 
> >  drivers/usb/misc/onboard_usb_hub.c | 29 +++++++++++++++++++++++++++++
> >  drivers/usb/misc/onboard_usb_hub.h |  5 +++++
> >  2 files changed, 34 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.c
> > b/drivers/usb/misc/onboard_usb_hub.c index 6b9b949d17d3..1dd7f4767def
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
> > +	const struct onboard_hub_devtype_data *devtype_data;
> 
> This kind of device specific data is often call platform data, let's
> call the struct 'onboard_hub_pdata' and the field 'pdata'?

I took flexcan as a reference, but I do not mind using other names if that is 
preferred.

> > +	struct gpio_desc *reset_gpio;
> > 
> >  	bool always_powered_in_suspend;
> >  	bool is_powered_on;
> >  	bool going_away;
> > 
> > @@ -56,6 +59,11 @@ static int onboard_hub_power_on(struct onboard_hub
> > *hub)
> > 
> >  		return err;
> >  	
> >  	}
> > 
> > +	if (hub->devtype_data)
> 
> Instead of these checks let's make sure all hubs have pdata. Actually your
> onboard_hub_probe() already esnures that the field is assigned.

For Realtek hubs (no platform data yet), of_id->data therefore hub-
>devtype_data is NULL.
But I agree that providing platformdata for all hubs seems reasonable to get 
rid of these checks.

> > +		fsleep(hub->devtype_data->power_stable_time);
> > +	if (hub->reset_gpio)
> > +		gpiod_set_value_cansleep(hub->reset_gpio, 0);
> 
> I would have expected:
> 
>   	if (hub->reset_gpio) {
> 		fsleep(hub->devtype_data->power_stable_time);
> 		gpiod_set_value_cansleep(hub->reset_gpio, 0);
> 	}
> 
> For the TUSB8041 the 'power_stable_time' (td2 in the datasheet) is "VDD and
> VDD33 stable before de-assertion of GRSTz", so no delay without reset.

Your suggestion only works if you control the reset line (GRSTz) by GPIO. If 
this line is controlled by hardware using RC circuits this waiting time still 
has to be respected when power is supplied.
I prefer that the USB hub is properly reset once this function exits. Without 
waiting time the hardware controlled GRSTz might not yet be at a proper level.

> > +
> > 
> >  	hub->is_powered_on = true;
> >  	
> >  	return 0;
> > 
> > @@ -65,6 +73,12 @@ static int onboard_hub_power_off(struct onboard_hub
> > *hub)> 
> >  {
> >  
> >  	int err;
> > 
> > +	if (hub->reset_gpio) {
> > +		gpiod_set_value_cansleep(hub->reset_gpio, 1);
> > +		if (hub->devtype_data)
> > +			fsleep(hub->devtype_data->reset_duration);
> > +	}
> > +
> > 
> >  	err = regulator_disable(hub->vdd);
> >  	if (err) {
> >  	
> >  		dev_err(hub->dev, "failed to disable regulator: %d\n", 
err);
> > 
> > @@ -219,6 +233,7 @@ static void onboard_hub_attach_usb_driver(struct
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
> > @@ -227,10 +242,24 @@ static int onboard_hub_probe(struct platform_device
> > *pdev)> 
> >  	if (!hub)
> >  	
> >  		return -ENOMEM;
> > 
> > +	of_id = of_match_device(onboard_hub_match, &pdev->dev);
> > +	if (of_id)
> > +		hub->devtype_data = of_id->data;
> > +	else
> > +		return -ENODEV;
> 
> Please change to:
> 
> 	if (!of_id)
> 		return -ENODEV;
> 
> 	hub->pdata = of_id->data;
> 
> With the currently supported Realtek hubs will fail to probe. Please add a
> pdata for the RTS541x hubs. The have no reset signal, so the values can be
> 0.

RTS541x hubs should still probe, but their of_id->data is NULL.
Nevertheless providing platform data for all hubs seems reasonable.

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
> > +	if (hub->devtype_data && hub->reset_gpio)
> 
> drop check 'hub->devtype_data' check

With platform data always provided this will be removed.

> > +		fsleep(hub->devtype_data->reset_duration);
> > +
> > 
> >  	hub->dev = dev;
> >  	mutex_init(&hub->lock);
> >  	INIT_LIST_HEAD(&hub->udev_list);
> > 
> > diff --git a/drivers/usb/misc/onboard_usb_hub.h
> > b/drivers/usb/misc/onboard_usb_hub.h index d3a5b6938582..7e743f4c8aaa
> > 100644
> > --- a/drivers/usb/misc/onboard_usb_hub.h
> > +++ b/drivers/usb/misc/onboard_usb_hub.h
> > @@ -6,6 +6,11 @@
> > 
> >  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
> >  #define _USB_MISC_ONBOARD_USB_HUB_H
> > 
> > +struct onboard_hub_devtype_data {
> > +	unsigned long power_stable_time;	/* power stabilization time in us 
*/
> > +	unsigned long reset_duration;		/* reset pulse width in 
us */
> 
> Let's encode the unit in the field name:
> 
> 	unsigned long power_stable_us;
> 	unsigned long reset_us;

Sure thing. Will be changed.

> > +};
> 
> Is it necessary to define this struct in onboard_usb_hub.h? It seems it
> could as well be defined in onboard_usb_hub.c.

As you pointed out in Patch 3 not possible, unfortunately.

Thanks and best regards,
Alexander



