Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D695826D7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 14:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbiG0MlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 08:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiG0Mk7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 08:40:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85873C151;
        Wed, 27 Jul 2022 05:40:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73F106144F;
        Wed, 27 Jul 2022 12:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FFAC433C1;
        Wed, 27 Jul 2022 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658925657;
        bh=XZ/CPw6WEAUkYKhiSwISxfNyJ/lYQsvD9iUIJImuY/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qxYANs3CnZAv4ofsiUEnPm4ivYlFPoB8PSA8XnuWaFlkUrrQCKrKvKMjgw87MbqEX
         xKjQOIFSdY4zZRVa0f/b2mS/+NOWOpZCbV/qej6GhOnDuU5nJ1cMmOtO+e9v0u/5HF
         4um2WjlxURKNIthvfl7C4iULfeBlZLId1Xt1itig=
Date:   Wed, 27 Jul 2022 14:40:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <YuEyVxJipCmQeMTk@kroah.com>
References: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
 <20220727093801.687361-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727093801.687361-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 27, 2022 at 11:38:00AM +0200, Alexander Stein wrote:
> Despite default reset upon probe, release reset line after powering up
> the hub and assert reset again before powering down.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Thanks Matthias for your review.
> 
> Changes in v3:
> * Require platform data unconditionally
> * Removed unecessary checks for that reason
> * Merged power_stable_time into reset_duration (no difference for now)
> * Rename 'reset_duration' to 'reset_us'
> * Renamed platform structure to onboard_hub_pdata
> * Renamed device struct field to pdata as well
> 
> Changes in v2:
> * Use device specific sleep times, if present
> * Use fsleep instead of usleep_range
> 
>  drivers/usb/misc/onboard_usb_hub.c | 28 ++++++++++++++++++++++++++++
>  drivers/usb/misc/onboard_usb_hub.h | 16 ++++++++++++----
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 6b9b949d17d3..2aa1db528b31 100644
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
> +	const struct onboard_hub_pdata *pdata;
> +	struct gpio_desc *reset_gpio;
>  	bool always_powered_in_suspend;
>  	bool is_powered_on;
>  	bool going_away;
> @@ -56,6 +59,9 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
>  		return err;
>  	}
>  
> +	fsleep(hub->pdata->reset_us);
> +	gpiod_set_value_cansleep(hub->reset_gpio, 0);
> +
>  	hub->is_powered_on = true;
>  
>  	return 0;
> @@ -65,6 +71,11 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
>  {
>  	int err;
>  
> +	if (hub->reset_gpio) {
> +		gpiod_set_value_cansleep(hub->reset_gpio, 1);
> +		fsleep(hub->pdata->reset_us);
> +	}
> +
>  	err = regulator_disable(hub->vdd);
>  	if (err) {
>  		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
> @@ -219,6 +230,7 @@ static void onboard_hub_attach_usb_driver(struct work_struct *work)
>  
>  static int onboard_hub_probe(struct platform_device *pdev)
>  {
> +	const struct of_device_id *of_id;
>  	struct device *dev = &pdev->dev;
>  	struct onboard_hub *hub;
>  	int err;
> @@ -227,10 +239,26 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  	if (!hub)
>  		return -ENOMEM;
>  
> +	of_id = of_match_device(onboard_hub_match, &pdev->dev);
> +	if (!of_id)
> +		return -ENODEV;
> +
> +	hub->pdata = of_id->data;
> +	if (!hub->pdata)
> +		return -EINVAL;
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
> +	if (hub->reset_gpio)
> +		fsleep(hub->pdata->reset_us);
> +
>  	hub->dev = dev;
>  	mutex_init(&hub->lock);
>  	INIT_LIST_HEAD(&hub->udev_list);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index d3a5b6938582..01d067db81f2 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -6,11 +6,19 @@
>  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
>  #define _USB_MISC_ONBOARD_USB_HUB_H
>  
> +struct onboard_hub_pdata {
> +	unsigned long reset_us;		/* reset pulse width in us */
> +};
> +
> +static const struct onboard_hub_pdata realtek_rts5411_data = {
> +	.reset_us = 0,
> +};
> +
>  static const struct of_device_id onboard_hub_match[] = {
> -	{ .compatible = "usbbda,411" },
> -	{ .compatible = "usbbda,5411" },
> -	{ .compatible = "usbbda,414" },
> -	{ .compatible = "usbbda,5414" },
> +	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
> +	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
> +	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
> +	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

This no longer applies to my tree due to some new devices being added.
Can you rebase against the usb-testing branch of the usb.git tree and
resend?

thanks,

greg k-h
