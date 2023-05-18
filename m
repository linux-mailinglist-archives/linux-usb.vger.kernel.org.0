Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279F9708146
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 14:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbjERM3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 08:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjERM3N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 08:29:13 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E279010D2
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 05:29:12 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53404873a19so1309532a12.3
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684412952; x=1687004952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ovHJT+oKcHWdvmi0CxlPgyNmMFmdo9aZyNXlJHi3zQ=;
        b=jvyFsrkXMIwmBC2OZ/PVh2dkthMG/5310dq1TkKv8oe5nLo9cdsFFtbebSsHxW4suU
         wXTqmVdgHfUs8T9iDIiASg8rU8aUUvQ2XW1m6YAnlCF54YFu3tldCXdjGpcsRRpuDnV/
         gI4ws4CaN1EJTi7WD0ueEgU1QA5eUh/Z31hGMMVKgMCLPktEdWOwnkFjZZ4EDokzVrlg
         wvAw35LV502ziDBD0IcwA6oE1Dfe2YSj8acmQhi2g2MxoaH3sw9m4zMdhrMA+RwD1WD8
         mmin/eeGo8GPShrAEU8ntgphLc7lW4di/syenbCrmdPznmSM2G5pMusP9Lg2mcFiLvfp
         4BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684412952; x=1687004952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ovHJT+oKcHWdvmi0CxlPgyNmMFmdo9aZyNXlJHi3zQ=;
        b=bBk/ZhMOE3ufoLpn/Tv9fJT//M1PRf9lINnf9Gs3m2Op3F+coFL8ePTvjT94cMZfbV
         hYcPJSfAlM4FdeknwhBjuK+p5JO9K7taQSduFajSdeXeWiJl5hBHH5PVERd0rFkeni2+
         ZM1Rf1jPj60BNsTWgUTIRmC7tYqXEYG/dJy1uBWJhF5gClW+PBRGAZL1X7hEDZZZiizm
         LfC8aCDQ5+oIU4+tz1Jz2qehK6MBfCuEFlU1yxsEsUD6wKGGMxOGpZqZcnL/qjWRhWrz
         99+4ilUaFNCM5YRzwUuFGg4VeVuC1stlvkGsI9GvrWhyn8YPM6z0sY839GLrr8tkd0sH
         Q3IA==
X-Gm-Message-State: AC+VfDxmz1+0DybzdK7TeRTTjUXwfO8+UhdQ2JIVBLDDgqmpAdxfnn8g
        XvlIqiT5AfVM9tA31NGqnL8=
X-Google-Smtp-Source: ACHHUZ75+ALZoBfMtEXlLlAxfxBazlz7y6MyID5JB/bb0qqMXCuSWrE1LzMkljdkpj/9+hJQb8CiJg==
X-Received: by 2002:a17:902:ea07:b0:1ac:7d8a:365 with SMTP id s7-20020a170902ea0700b001ac7d8a0365mr2542290plg.26.1684412952263;
        Thu, 18 May 2023 05:29:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b001ac7ab3e97csm1282684pls.260.2023.05.18.05.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:29:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 18 May 2023 05:29:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 94/97] usb: typec: tcpci_mt6360: Convert to platform
 remove callback returning void
Message-ID: <2af0cb1b-b4f6-4fc5-809e-eaf07083c523@roeck-us.net>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-95-u.kleine-koenig@pengutronix.de>
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

On Thu, May 18, 2023 at 01:02:36AM +0200, Uwe Kleine-König wrote:
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
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index c5bb201a5163..2a079464b398 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -178,12 +178,10 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int mt6370_tcpc_remove(struct platform_device *pdev)
> +static void mt6370_tcpc_remove(struct platform_device *pdev)
>  {
>  	dev_pm_clear_wake_irq(&pdev->dev);
>  	device_init_wakeup(&pdev->dev, false);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id mt6370_tcpc_devid_table[] = {
> @@ -198,7 +196,7 @@ static struct platform_driver mt6370_tcpc_driver = {
>  		.of_match_table = mt6370_tcpc_devid_table,
>  	},
>  	.probe = mt6370_tcpc_probe,
> -	.remove = mt6370_tcpc_remove,
> +	.remove_new = mt6370_tcpc_remove,
>  };
>  module_platform_driver(mt6370_tcpc_driver);
>  
> -- 
> 2.39.2
> 
