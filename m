Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD35B708148
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 14:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjERM3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 08:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbjERM3c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 08:29:32 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10BB10E2
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 05:29:28 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25344113e9bso1441061a91.3
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684412968; x=1687004968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbUipjRPPyJaAMsWXfQMsf+P5pczVg9d+Q7IIdc7xyk=;
        b=jiNlRpzSxt69j879WsbhVXa+yU1QaWe0fe69ZzD3EM52CuVDSRW6a7phBekr00CBlz
         hVWrxXQTZeNGHjY9sxd0xRnos+b9UTKe2swr9QPCrTyPaDPJUZZHNtWabENxs1TamQQ+
         mBy6J1oYqiCWnXhhiC0JLgQWsk7iTUNpNMLPT8ZZ51KRJWSmbRU37zONIuqlUalh/FDM
         xObxA73VTsKelOHUAcifFrOUsN9GS8OblGWMLS+SsGH2raXf04RCTK+53npePQo5ynQv
         BJkbFCjScYz9bcPOhaUHNApc8OP1SzfULVCDxxmDmhb3ruX2LqIkQdFUamiVYcQHc7yp
         PYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684412968; x=1687004968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbUipjRPPyJaAMsWXfQMsf+P5pczVg9d+Q7IIdc7xyk=;
        b=g3PDXJYrvy7DYH1OIQurwIHp0KNNfmutt7RvV2ZUGqyJqYw3NUouYinBwJ3mXt1Upd
         jhmikn7O7WM0zmUNYMFdxUGv7XFgInSS5uT92aWO+Ec6sLqdLWMRK1Yk08VRPa35Y9wV
         4UrFNoHttrTdh5+WIZ0VOWw3swMlt73H00TMx/84i9BKWdlhonzXCzWRdZlU/gEOHmBh
         Xcgxw0Ws3F/cFKPoIKwMtu3Jq6MfaxATLKWWCy+3fxK/vMkSShIwZkWRGm2/GakeFiMT
         kKJZ94VwMacwXvrYXngL2La/LHPA2jP2H+KUL6mgSduwM9bqqnWsD/AkZmyXlj4/3kqV
         EIwg==
X-Gm-Message-State: AC+VfDx6chymnVUfr2fkrniIutHVkrdq+w/05TxYx8JGev2N41mQMrHR
        unSoNBSDMsRxQOXKuG6nFlPhbumjD+U=
X-Google-Smtp-Source: ACHHUZ4HY+46uzTYHyRmOzPbrU5qhbeCcR9dzDoFxPbNZTLT3nK2I6X0STL+91wkhA6mX+ncuj/HGw==
X-Received: by 2002:a17:902:d4c6:b0:1ac:637d:589b with SMTP id o6-20020a170902d4c600b001ac637d589bmr2392712plg.26.1684412967909;
        Thu, 18 May 2023 05:29:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001a69d1bc32csm1295359plx.238.2023.05.18.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:29:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 18 May 2023 05:29:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 95/97] usb: typec: wcove: Convert to platform remove
 callback returning void
Message-ID: <5b262ec3-cfe9-4307-9475-e7fceb9bc5d1@roeck-us.net>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-96-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-96-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 18, 2023 at 01:02:37AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/wcove.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
> index 20917d85d6f4..87d4abde0ea2 100644
> --- a/drivers/usb/typec/tcpm/wcove.c
> +++ b/drivers/usb/typec/tcpm/wcove.c
> @@ -671,7 +671,7 @@ static int wcove_typec_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int wcove_typec_remove(struct platform_device *pdev)
> +static void wcove_typec_remove(struct platform_device *pdev)
>  {
>  	struct wcove_typec *wcove = platform_get_drvdata(pdev);
>  	unsigned int val;
> @@ -684,8 +684,6 @@ static int wcove_typec_remove(struct platform_device *pdev)
>  
>  	tcpm_unregister_port(wcove->tcpm);
>  	fwnode_remove_software_node(wcove->tcpc.fwnode);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver wcove_typec_driver = {
> @@ -693,7 +691,7 @@ static struct platform_driver wcove_typec_driver = {
>  		.name		= "bxt_wcove_usbc",
>  	},
>  	.probe			= wcove_typec_probe,
> -	.remove			= wcove_typec_remove,
> +	.remove_new		= wcove_typec_remove,
>  };
>  
>  module_platform_driver(wcove_typec_driver);
> -- 
> 2.39.2
> 
