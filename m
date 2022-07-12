Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0481157224D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 20:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbiGLSSK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 14:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiGLSSJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 14:18:09 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EC7C84F9
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:18:07 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v7so6108826pfb.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WPyCZCcgRUzZsgo3Nml1/n2m8T3DKmOD/9FwlsdSDuo=;
        b=JhQTJ6OKu27VMYtC3XrWaDPw7r7oalG+HImNIEPECos7kj5Wc3fciQs0P/9MiucS57
         OwI3hSNEUjik2LWWm4A7A8y3BHrA/pp3Y404MDzKU8VYmgy3FTLHU3iGPbdlYzYz3Ey3
         KVQjAESmtXhwuEJ2T/BEOiEGt19IHnl+B3Br8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WPyCZCcgRUzZsgo3Nml1/n2m8T3DKmOD/9FwlsdSDuo=;
        b=eY1z5+37i3tLv2XMYU+6prNv7CgYl+ZYmo/7jele/83eJ8SVYbLQ7ciEvVJVFw0oVo
         +Rcli2Yhv4uKKtpm4BDAh9o6iaxAyDzA4nJjDgMs4BfMUgw9xIM7YX9ZVV1W6qPrAOzx
         ZMKI1xi2ed43DclA1Zmy0khz5RwVzRU11geh3Jhx+/U+iKHw0Jq6qzto/txMhAdjDyu3
         yoLx25tFLBTuRkEMKnX1eV6prbxoeWpXOPq0RVFS/UnCM9dg1mYC7krxjtGKNF57XcHe
         AIt8Z3kMagqu7r4rSXsti98UBRfJOwH9vQK13P0EU+CW5XF/k1+GMtS/I7SN4gJ2wQD1
         MX3w==
X-Gm-Message-State: AJIora/MbX+Yr7wlkBzfV1bZeL8aHLpXNhOyzAr3Eh8s0oykalp/B58/
        gdpgt5543txiRzG8qd6O7LEr5g==
X-Google-Smtp-Source: AGRyM1uGdihPeZQVnDJohJX0eeNE/WnDTki1ikwigoXt19hTTs9u9zfpuLT70MecM9aJEN7LGXK0vA==
X-Received: by 2002:a63:2314:0:b0:412:a5ee:fe1e with SMTP id j20-20020a632314000000b00412a5eefe1emr20949768pgj.186.1657649887265;
        Tue, 12 Jul 2022 11:18:07 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e036:8c0d:9cf:7a45])
        by smtp.gmail.com with UTF8SMTPSA id y22-20020a634956000000b0040c8dd84ff5sm6411768pgk.72.2022.07.12.11.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 11:18:06 -0700 (PDT)
Date:   Tue, 12 Jul 2022 11:18:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <Ys263f5K4WRoSZ45@google.com>
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <20220712150627.1444761-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220712150627.1444761-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 05:06:26PM +0200, Alexander Stein wrote:
> Despite default reset upon probe, release reset line after powering up
> the hub and assert reset again before powering down.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> My current DT node on my TQMa8MPxL looks like this
> ```
> &usb_dwc3_1 {
> 	dr_mode = "host";
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&pinctrl_usbhub>;
> 	status = "okay";
> 
> 	hub_2_0: hub@1 {
> 		compatible = "usb451,8142";
> 		reg = <1>;
> 		peer-hub = <&hub_3_0>;
> 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> 	};
> 
> 	hub_3_0: hub@2 {
> 		compatible = "usb451,8140";
> 		reg = <2>;
> 		peer-hub = <&hub_2_0>;
> 		reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> 	};
> };
> ```
> which I don't like much for 2 reasons:
> * the pinctrl has to be put in a common top-node of USB hub node. The pinctrl
>   can not be requested twice.

Agreed, that's not great. The pinctrl doesn't have to be necessarily in the USB
controller node, it could also be in the static section of the board, but that
isn't really much of an improvement :( Not sure there is much to do given that
the USB devices also process the pinctrl info (besides the onboard_hub platform
device doing the same).

> * Apparently there is no conflict on the reset-gpio only because just one device
>   gets probed here:
> > $ ls /sys/bus/platform/drivers/onboard-usb-hub/
> > 38200000.usb:hub@1  bind  uevent  unbind

Right, the driver creates a single platform device for each physical hub.

> But this seems better than to use a common fixed-regulator referenced by both
> hub nodes, which just is controlled by GPIO and does not supply any voltages.

Agreed, if the GPIO controls a reset line it should be implemented as such.

> Note: It might also be necessary to add bindings to specify ramp up times and/or
> reset timeouts.

The times are hub specific, not board specific, right? If that's the case then
a binding shouldn't be needed, the timing can be derived from the compatible
string.

>  drivers/usb/misc/onboard_usb_hub.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 6b9b949d17d3..348fb5270266 100644
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
> @@ -38,6 +39,7 @@ struct usbdev_node {
>  struct onboard_hub {
>  	struct regulator *vdd;
>  	struct device *dev;
> +	struct gpio_desc *reset_gpio;
>  	bool always_powered_in_suspend;
>  	bool is_powered_on;
>  	bool going_away;
> @@ -56,6 +58,10 @@ static int onboard_hub_power_on(struct onboard_hub *hub)
>  		return err;
>  	}
>  
> +	/* Deassert reset */

The comment isn't really needed, it's clear from the context.

> +	usleep_range(3000, 3100);

These shouldn't be hard coded. Instead you could add a model specific struct
'hub_data' (or similar) and associate it with the compatible string through
onboard_hub_match.data

You could use fsleep() instead of usleep_range(). It does the _range part
automatically (with a value of 2x).

> +	gpiod_set_value_cansleep(hub->reset_gpio, 0);

Since this includes delays maybe put the reset inside an 'if (hub->reset_gpio)'
block. Not super important for these short delays, but they might be longer
for some hubs.

> +
>  	hub->is_powered_on = true;
>  
>  	return 0;
> @@ -65,6 +71,10 @@ static int onboard_hub_power_off(struct onboard_hub *hub)
>  {
>  	int err;
>  
> +	/* Assert reset */

drop comment

> +	gpiod_set_value_cansleep(hub->reset_gpio, 1);

Put inside 'if (hub->reset_gpio)' to avoid unnecessary delays when no reset
is configured.

> +	usleep_range(4000, 5000);

Use per-model values.

> +
>  	err = regulator_disable(hub->vdd);
>  	if (err) {
>  		dev_err(hub->dev, "failed to disable regulator: %d\n", err);
> @@ -231,6 +241,14 @@ static int onboard_hub_probe(struct platform_device *pdev)
>  	if (IS_ERR(hub->vdd))
>  		return PTR_ERR(hub->vdd);
>  
> +	/* Put the hub into reset, pull reset line low, and assure 4ms reset low timing. */

drop comment, it's mostly evident from the code. Maybe not the usleep_range()
part, but that should become clearer when per model values are used.

> +	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(hub->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
> +
> +	usleep_range(4000, 5000);
> +
>  	hub->dev = dev;
>  	mutex_init(&hub->lock);
>  	INIT_LIST_HEAD(&hub->udev_list);
> -- 
> 2.25.1
> 
