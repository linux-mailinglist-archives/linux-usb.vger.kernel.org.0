Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0959582C98
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 18:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240356AbiG0QsN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240449AbiG0QrY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 12:47:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05A652E64
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 09:32:05 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h132so16333809pgc.10
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1TRS6lxdC7P+TgLzuseNCh/XM3JcRUBPWPh5jtlW9yA=;
        b=dylDx0BBPfbwR7b/4kCuHZNaewyhKf5EOaExE5+Kmb0Pj2jzay+RWZ14VpWqECHOTk
         Sp3FkxlOqqWYYd3pW90Y8QZnjg9fm8cQ2+LW7SOTSoINdunWBr4AWGeLkupMEUTTojDm
         zcmBr6qR6DjwtD0RwfLopOIHZfWoOFLWU61yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1TRS6lxdC7P+TgLzuseNCh/XM3JcRUBPWPh5jtlW9yA=;
        b=VTao8W77WLMgU8ISmm1mjLTGdgPYjIe0CwlHWu34ZnYQH47g9tPTHYb6IlIQJv1jyT
         wfuDJA5Z3ESO3j7oI5GfUn2tEj4JYfn57mYbNhSfze0hAdzB7taMBVMqtQPFwe8qistO
         jclayrPZcKykK7cSHU71Qu+1RFFXS4UUO32chDvmojpmn7QAJPnmHH4sB67+9bgKD0uH
         hXvoM8oOAjqGVREZWXgFiu+myzf6YlwU4K90Y/2X3/EIo7DRCJOGNjkYGo6hKUK1hm/u
         yZWoSnwJF5KmZcxVsDyJ6IMFNSsfCHXiOuyHhKAd4MJNfxBRrw/2NWFAQBF9skxw2yV6
         tdPw==
X-Gm-Message-State: AJIora+BOZpiqDHEalG1ja5e5lI6Qs4UAtrq/PPGnI1GA9jjPKuWOJxV
        rPn951zkoUZ9WBvOFju03ZTgFw0Joy8uuQ==
X-Google-Smtp-Source: AGRyM1vQU2jYl7HdvxRw2AE0c/TAVSrUdt4XzX2IDRlho/1FNtKWLInu4htlin0G04xwOjmNqQqI0A==
X-Received: by 2002:a63:ba18:0:b0:412:afd5:1260 with SMTP id k24-20020a63ba18000000b00412afd51260mr20009579pgf.617.1658939525302;
        Wed, 27 Jul 2022 09:32:05 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:472c:7351:bacf:5228])
        by smtp.gmail.com with UTF8SMTPSA id z28-20020aa7949c000000b0052516db7123sm14089324pfk.35.2022.07.27.09.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 09:32:04 -0700 (PDT)
Date:   Wed, 27 Jul 2022 09:32:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: misc: onboard_usb_hub: Add reset-gpio support
Message-ID: <YuFog1IRuKiejicE@google.com>
References: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
 <20220727093801.687361-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220727093801.687361-2-alexander.stein@ew.tq-group.com>
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
