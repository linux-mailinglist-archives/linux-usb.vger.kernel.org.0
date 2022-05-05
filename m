Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A8F51CAFC
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 23:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385453AbiEEV3t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 17:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245352AbiEEV3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 17:29:47 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ED03B3E5
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 14:26:07 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-deb9295679so5487566fac.6
        for <linux-usb@vger.kernel.org>; Thu, 05 May 2022 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5ZhHf4MW0Qof6uDidr0te5emn/R13tODMUJVskTvaFw=;
        b=oHFKUE22Vr/kGoOQqbCtRvxD6uuM2NijCJhSt+rZ8uP/C7dyqgHqJ1WTv47VoOPrXu
         kC+eT8elAjl4V4TO7fJQQWkX6O/xenugzs1VgldoT8y96UbzXiWXmlJD3OLRzKoPE4oj
         XnFS7ViWSoUAESQ+pB5nuZ5bQIwylA4hEQXL/YuSfEBGmSEoje7U8gzyHcqHq+OmEctx
         zGDOz2PcSJdM5JBz8snD4Yz1oRKuvMO0NnYHIomFcghuwToNajkofdaph95M1ocDj9wW
         DPN7Z+JG/6hCsRhuDl7iFUj2mHoCkCS/0rboqbmtu2KjKvrC40LsMMUKKO9KQcLHj2DR
         Oz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=5ZhHf4MW0Qof6uDidr0te5emn/R13tODMUJVskTvaFw=;
        b=HcBSDXQ92S1QYA4wUnY3Rs0THeYZ/P31vpW5HhGVsW4XPU9hu+2WtS6BlgAKhTfWLY
         nDH0krAX7lqeky2MCzfIg+Chps69dCS9LlzNlmmXTnTgmxpsLC6o4F3VSRhQbiF2QZOw
         yrpFnkZuLM1yi8Uu6RhqdhPIzPrJlFa4XU5TNZPQs+ZWdtl+prnygt/E8VNqIvG79MUK
         okCCDran6c5qW5PWLzb9Va0Ksbt2H2IeuxsTH3qN1AO/DNJTDTVh2G7ggPs2vgCQeILq
         PwkwMvBqrBYlrPwaNZIw6ltgDK+9qc9+8aoQagrjtjrJLgjcu/dZKzcH0kn/HDPKTcdx
         Mk2Q==
X-Gm-Message-State: AOAM533nkXHwY7lGHn9bfMwBWS1FhZe0CKJ/vlLPf3wOlTnqLXIBdytb
        nqUS+73u8fevtSbNygzTFII=
X-Google-Smtp-Source: ABdhPJxCGw3epYyvSakAg9nuGk4M6awTQzbyplwU1j2dcnaCzE7x7udQigbULoLXIgjxpZC9h53P/w==
X-Received: by 2002:a05:6870:c144:b0:eb:5ef1:7d8c with SMTP id g4-20020a056870c14400b000eb5ef17d8cmr3195258oad.232.1651785966909;
        Thu, 05 May 2022 14:26:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bj34-20020a05680819a200b00325cda1ffa7sm906951oib.38.2022.05.05.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 14:26:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 5 May 2022 14:26:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jun Li <jun.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: tcpci: Don't skip cleanup in .remove() on
 error
Message-ID: <20220505212604.GB1988522@roeck-us.net>
References: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220502080456.21568-1-u.kleine-koenig@pengutronix.de>
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

On Mon, May 02, 2022 at 10:04:56AM +0200, Uwe Kleine-König wrote:
> Returning an error value in an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
> 
> In this case the remove callback even returns early without stopping the
> tcpm worker thread and various timers. A work scheduled on the work
> queue, or a firing timer after tcpci_remove() returned probably results
> in a use-after-free situation because the regmap and driver data were
> freed. So better make sure that tcpci_unregister_port() is called even
> if disabling the irq failed.
> 
> Also emit a more specific error message instead of the i2c core's
> "remove failed (EIO), will be ignored" and return 0 to suppress the
> core's warning.
> 
> This patch is (also) a preparation for making i2c remove callbacks
> return void.
> 
> Fixes: 3ba76256fc4e ("usb: typec: tcpci: mask event interrupts when remove driver")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index e07d26a3cd8e..f33e08eb7670 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -877,7 +877,7 @@ static int tcpci_remove(struct i2c_client *client)
>  	/* Disable chip interrupts before unregistering port */
>  	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
>  	if (err < 0)
> -		return err;
> +		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
>  
>  	tcpci_unregister_port(chip->tcpci);
>  
> 
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17
> -- 
> 2.35.1
> 
