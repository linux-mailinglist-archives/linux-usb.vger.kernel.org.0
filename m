Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375AE5767C9
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 21:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiGOTup (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 15:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiGOTuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 15:50:44 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFB1BC08
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 12:50:43 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k19so4030863pll.5
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 12:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y32BDu7KsZwCEQIw+4o9pW5Cq7b+IeSabI5Ax2bAKjM=;
        b=hjh+6SIee0kd1DR10cEpcUgF7jlqKSTeEhq2Vkdjbl4o5zCa5FqZEolEClXA9IXyBw
         kuK/BuEo3zJ6kOda5UxgqoqchfAjhcUGTar8U9YCqFqc8mlIe9lXwK1Vzz7aWgLWGV2A
         h7KMFhGRXT/JMUi0b8gQrFlgVST6UslOZ1R5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y32BDu7KsZwCEQIw+4o9pW5Cq7b+IeSabI5Ax2bAKjM=;
        b=ejT+6TDukKSN6xxMRKjdJQiKVVqmTyDhORu7Ts43HVxp/KhVJa1Vqaw1ty88LYrR84
         umcX6NNrN+NMpjETNksTBNQYgpaj82KCUVdhhvzWC40pK/eyT5dQt6OJfHIP1LLNW0r/
         HGswpQHCvTy1dSquhLaFnmsnO/RR7Dy1ZeEm8O9L31t3xYCjtk8YZmSjxFBH4FrOEn2c
         d8Xp7VeifF9vpmv0ZnKyzb7+9oV5PN0qo7ccVBvPBaZeKYq/VXDhWp3tKMS29a3puyHP
         ndEojcgxGs2sADEKgdGoBNOYwZovY2eoJIuFMIb0SwYk0145HLcTvC5UnUE697BZC+hV
         c0pw==
X-Gm-Message-State: AJIora/BnqoRniYfbcKjvKeBHRwe2IQp79QO0XOewKIYudx9ph6/TI9y
        vXzp4yhaD9Y4WF1C0sPzOEEqNQ==
X-Google-Smtp-Source: AGRyM1snLXjJAt8iLQx5+1rv//V+aNbJ1mZmUWmhG4+d+o6LGCS+TGhqiROSIXhAnq9JLkx7GhVeeA==
X-Received: by 2002:a17:903:3093:b0:16b:deea:4d36 with SMTP id u19-20020a170903309300b0016bdeea4d36mr15137374plc.126.1657914642876;
        Fri, 15 Jul 2022 12:50:42 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:835b:7656:818:a69a])
        by smtp.gmail.com with UTF8SMTPSA id x3-20020a170902a38300b0015e8d4eb26esm3980768pla.184.2022.07.15.12.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 12:50:42 -0700 (PDT)
Date:   Fri, 15 Jul 2022 12:50:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: misc: onboard_usb_hub: Add TI USB8041 hub
 support
Message-ID: <YtHFEY+iAipCROPl@google.com>
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
 <20220715073300.868087-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220715073300.868087-3-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 15, 2022 at 09:33:00AM +0200, Alexander Stein wrote:
> This is a 4-port 3.0 USB hub.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Add devtype data containing waiting times
> 
>  drivers/usb/misc/onboard_usb_hub.c | 3 +++
>  drivers/usb/misc/onboard_usb_hub.h | 7 +++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 1dd7f4767def..319b4b1748fb 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -339,6 +339,7 @@ static struct platform_driver onboard_hub_driver = {
>  /************************** USB driver **************************/
>  
>  #define VENDOR_ID_REALTEK	0x0bda
> +#define VENDOR_ID_TI		0x0451
>  
>  /*
>   * Returns the onboard_hub platform device that is associated with the USB
> @@ -416,6 +417,8 @@ static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
>  	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
> +	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
> +	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index 7e743f4c8aaa..fcb6a9024bbd 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -11,7 +11,14 @@ struct onboard_hub_devtype_data {
>  	unsigned long reset_duration;		/* reset pulse width in us */
>  };
>  
> +static const struct onboard_hub_devtype_data ti_tusb8041_data = {
> +	.power_stable_time = 3000,
> +	.reset_duration = 3000,

Aren't these two values actually the same thing, i.e. the minimum
duration of the reset?

From the data sheet:

  A minimum reset duration of 3 ms is required

  td2: VDD and VDD33 stable before de-assertion of GRSTz (>= 3ms)

My understanding is that td2 is just another expression of the first
requirement.

> +};
> +
>  static const struct of_device_id onboard_hub_match[] = {
> +	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
> +	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usbbda,411" },
>  	{ .compatible = "usbbda,5411" },
>  	{ .compatible = "usbbda,414" },

Ah, now I see why the struct is defined in the .h file, never mind my comment
on the other patch.
