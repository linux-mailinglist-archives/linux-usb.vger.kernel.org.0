Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682F557679F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 21:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiGOToR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 15:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiGOToP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 15:44:15 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96E13FA09
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 12:44:14 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id v7so5526249pfb.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 12:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5pyO7NES8WCuemXZt/cs3fOZNAsB0jVBNYGdxlU6vdI=;
        b=KcNlJGQexMaf/xvPEMj96E49uAKheNyfIKUwx2k82LZw0aKjE3N9caLO1BKee2KwnT
         wrKxF5lNuy2Dx2L7gSm2+xRCIPUWHQ4qB4H7WK2GOauiHCWnBB1JhkYAZ0ws474Gb7U1
         cxOl2dIlp+y1dGrw7GV2D5U2TfrN6QeC08VxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5pyO7NES8WCuemXZt/cs3fOZNAsB0jVBNYGdxlU6vdI=;
        b=oFb/0dRL9IJdbKftL82P+jHE1Ch2JxOpSlRE2k595huJoZRUkaa0XbiXc+vZg2gwkS
         lArg5R0R3DpNzIUJjrX764laKGHMnPpda+GcAsXIA+5Fd2YPF+cMH7jXBqkaMhqmj+co
         4cNqCqKpcxGO2pJlj9JQ21Dpd7A6kZBtXJ9r/gksbU1mq1tyR7Wijx8ujcSUfdXBVaRv
         yf3S20Hezpla32iCPnb7B4F+JKFD2iVToqQ2en15M6vNX+aetuZ2OJ/3lL/uITVvS6W1
         ALKQeQ3tl9t8R8nD29+jygqrSE1aMxVl+0jUGmvZarSCv7KFRMblHdlB8lvOxnwByjH6
         CekA==
X-Gm-Message-State: AJIora+E90n20ffmb4q8uXSa+xbCB0D/ORGtIdlSshqG1rdST90TWbTk
        1WjcZj4rMlvPDvaieoaSZiOw7w==
X-Google-Smtp-Source: AGRyM1uLDouIUIxvC+I1yducXmKoflq4sNMJX610AiOLlMjvAdFCzoixBxBkw7yBu6Iqiqm1jlDa/g==
X-Received: by 2002:a63:8bc8:0:b0:413:9952:6059 with SMTP id j191-20020a638bc8000000b0041399526059mr13217124pge.61.1657914254404;
        Fri, 15 Jul 2022 12:44:14 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:835b:7656:818:a69a])
        by smtp.gmail.com with UTF8SMTPSA id t187-20020a625fc4000000b0052ab8a92496sm3864663pfb.168.2022.07.15.12.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 12:44:14 -0700 (PDT)
Date:   Fri, 15 Jul 2022 12:44:12 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <YtHDjF8HPUGdMWlE@google.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
 <20220715073300.868087-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220715073300.868087-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 15, 2022 at 09:32:59AM +0200, Alexander Stein wrote:
> Despite default reset upon probe, release reset line after powering up
> the hub and assert reset again before powering down.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Use device specific sleep times, if present
> * Use fsleep instead of usleep_range
> 
>  drivers/usb/misc/onboard_usb_hub.c | 29 +++++++++++++++++++++++++++++
>  drivers/usb/misc/onboard_usb_hub.h |  5 +++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 6b9b949d17d3..1dd7f4767def 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/export.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -38,6 +39,8 @@ struct usbdev_node {
>  struct onboard_hub {
>  	struct regulator *vdd;
>  	struct device *dev;
> +	const struct onboard_hub_devtype_data *devtype_data;

This kind of device specific data is often call platform data, let's
call the struct 'onboard_hub_pdata' and the field 'pdata'?

> +	struct gpio_desc *reset_gpio;
>  	bool always_powered_in_suspend;
>  	bool is_powered_on;
>  	bool going_away;
> @@ -56,6 +59,11 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
>  		return err;
>  	}
>  
> +	if (hub->devtype_data)

Instead of these checks let's make sure all hubs have pdata. Actually your
onboard_hub_probe() already esnures that the field is assigned.

> +		fsleep(hub->devtype_data->power_stable_time);
> +	if (hub->reset_gpio)
> +		gpiod_set_value_cansleep(hub->reset_gpio, 0);

I would have expected:

  	if (hub->reset_gpio) {
		fsleep(hub->devtype_data->power_stable_time);
		gpiod_set_value_cansleep(hub->reset_gpio, 0);
	}

For the TUSB8041 the 'power_stable_time' (td2 in the datasheet) is "VDD and
VDD33 stable before de-assertion of GRSTz", so no delay without reset.

> +
>  	hub->is_powered_on = true;
>  
>  	return 0;
> @@ -65,6 +73,12 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
>  {
>  	int err;
>  
> +	if (hub->reset_gpio) {
> +		gpiod_set_value_cansleep(hub->reset_gpio, 1);
> +		if (hub->devtype_data)
> +			fsleep(hub->devtype_data->reset_duration);
> +	}
> +
>  	err = regulator_disable(hub->vdd);
>  	if (err) {
>  		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
> @@ -219,6 +233,7 @@ static void onboard_hub_attach_usb_driver(struct work_struct *work)
>  
>  static int onboard_hub_probe(struct platform_device *pdev)
>  {
> +	const struct of_device_id *of_id;
>  	struct device *dev = &pdev->dev;
>  	struct onboard_hub *hub;
>  	int err;
> @@ -227,10 +242,24 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  	if (!hub)
>  		return -ENOMEM;
>  
> +	of_id = of_match_device(onboard_hub_match, &pdev->dev);
> +	if (of_id)
> +		hub->devtype_data = of_id->data;
> +	else
> +		return -ENODEV;

Please change to:

	if (!of_id)
		return -ENODEV;

	hub->pdata = of_id->data;

With the currently supported Realtek hubs will fail to probe. Please add a pdata for
the RTS541x hubs. The have no reset signal, so the values can be 0.

> +
>  	hub->vdd = devm_regulator_get(dev, "vdd");
>  	if (IS_ERR(hub->vdd))
>  		return PTR_ERR(hub->vdd);
>  
> +	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(hub->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
> +
> +	if (hub->devtype_data && hub->reset_gpio)

drop check 'hub->devtype_data' check

> +		fsleep(hub->devtype_data->reset_duration);
> +
>  	hub->dev = dev;
>  	mutex_init(&hub->lock);
>  	INIT_LIST_HEAD(&hub->udev_list);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index d3a5b6938582..7e743f4c8aaa 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -6,6 +6,11 @@
>  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
>  #define _USB_MISC_ONBOARD_USB_HUB_H
>  
> +struct onboard_hub_devtype_data {
> +	unsigned long power_stable_time;	/* power stabilization time in us */
> +	unsigned long reset_duration;		/* reset pulse width in us */

Let's encode the unit in the field name:

	unsigned long power_stable_us;
	unsigned long reset_us;

> +};

Is it necessary to define this struct in onboard_usb_hub.h? It seems it
could as well be defined in onboard_usb_hub.c.
