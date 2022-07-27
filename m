Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7C95831B8
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 20:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiG0SN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 14:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242727AbiG0SNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 14:13:39 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3537697D
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 10:14:59 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f11so16440369pgj.7
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 10:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i09kfNrJT7x+8npe74O6KIRb9mCDZdOaFliRvpOfdf0=;
        b=GPX3W6Wp2oJ1GpU13ncug2ynKfx6rmGLVpclgH0sC8B6D5S9ZavN/14QaQag3eutQZ
         dj7ldlsVjMC7tWXqlFrT9OdHIg9ch2y2pqWBtsy63uhW2pBDTJHVvYML/ijjy8pv16mA
         l8rtouVR34+mNvRGzU7wXdOLxFFU5nD3DfPfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i09kfNrJT7x+8npe74O6KIRb9mCDZdOaFliRvpOfdf0=;
        b=Nq1btIM9niy5s7M1kVMQ7kxBLJZnhGTmx2z53483KVFIMaD5gQ8YciAPSiCshe0ubA
         CPpsaOTcgJo1zF48hCDuFva33vhM7TVK4mlV7DLwMnDEby+LSoHMg3df49bnlkZv70qg
         VMJvuwD//72F8PVuNg5a9SRnCFC5wugd3QyzSTPzZgs4QqiSBFN/OZqBS1IE2hB04BIp
         z62TE2w/nJooBFPYuFu3xmoRabji9muAOe20wCwppcL+hS1W93vfIAhO8vA3vtShyk6E
         5AzaTLA89w4nfJSZ8/g9bHokS2YoJt3CbN87/KTkIgl77ocd4buHzerzSsQQBINBYpko
         Lblw==
X-Gm-Message-State: AJIora+WSkqhQ20aCqu2M7mF6V1WBxTY10/GzQduyWjEGtsTkf4AWTYf
        7lneau8/n7uinZXHMSpKwi3TqQ==
X-Google-Smtp-Source: AGRyM1vNS//qunbqThXmU/7Rt1OOrbTXoZ2hp/J5NDCIczUObxZoy6jMzOaKbenUEXn1v5nEJqy1ww==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:630e with SMTP id b12-20020a056a00114c00b005282c7a630emr22654660pfm.86.1658942099296;
        Wed, 27 Jul 2022 10:14:59 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:472c:7351:bacf:5228])
        by smtp.gmail.com with UTF8SMTPSA id z2-20020a17090a170200b001efd39b7e39sm2031349pjd.37.2022.07.27.10.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 10:14:59 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:14:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <YuFykRtbvxGssSVs@google.com>
References: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220727141117.909361-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,

(copying my comments from v3 to keep the discussion on the latest version)

On Wed, Jul 27, 2022 at 04:11:16PM +0200, Alexander Stein wrote:
> Despite default reset upon probe, release reset line after powering up
> the hub and assert reset again before powering down.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> * Patch 1 dropped as it already applied
> 
> Changes in v4:
> * Rebased to [1] commit e0c6b1f3d757 ("USB: usbsevseg: convert sysfs snprintf to sysfs_emit")
> * Added platform data for usb424
>   Reset pulse length taken from [2], Table 3-2 Symbol RESET_N
>   Completely untested
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git Branch usb-testing
> [2] http://ww1.microchip.com/downloads/en/devicedoc/00001692c.pdf
> 
>  drivers/usb/misc/onboard_usb_hub.c | 28 ++++++++++++++++++++++++++++
>  drivers/usb/misc/onboard_usb_hub.h | 22 +++++++++++++++++-----
>  2 files changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index de3627af3c84..0c81417dd9a7 100644
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

Is this delay here actually needed? There is a delay in onboard_hub_power_on(),
before de-asserting the reset, isn't that enough?

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

Same question here: onboard_hub_power_on() is called a few lines below and
has a delay before de-asserting the reset. Is the delay here really needed?
