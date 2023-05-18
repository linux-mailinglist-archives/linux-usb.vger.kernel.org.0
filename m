Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCB8708142
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 14:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjERM25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 08:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjERM24 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 08:28:56 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6D710CF
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 05:28:55 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d24136685so245711b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 05:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684412934; x=1687004934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvkXA2mPqSaFnAQuHS4A0rmOCQvSNCrXQRwg+sSPOMU=;
        b=SurrS0NPOHoNg01wUHihvUXqjL3E+Y0johRZz2xt3EfXVjQTsoJxVDDrrTXmIUKaA+
         mfr9VvpKcJnsEWPPkJGu3HlVp/BqZi43UwMNB/zTm4iWE5uSk+HObEM9nRJT6C3s0J9i
         ETGgbEqViAdCXFQ1XpYCY+wSdtvo67g/mO4iWkbWbXaGCEOcT/dBx1y6h+voMOK2t7nM
         oIBXJADj3PD30ITaY8HWSdAZ//kPlIO4i2WDlAEDmFtjCeFYJ0Ti0DrqEAOG6wl0xLmp
         6nhSJl39BxBxVlEANi8rdql/+KNumyx3oXB8SK0WaTL/FpJF30p6SppKbUd0D0LHQKZS
         HeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684412934; x=1687004934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvkXA2mPqSaFnAQuHS4A0rmOCQvSNCrXQRwg+sSPOMU=;
        b=hjjoX5cHIxP97JTyBQB0q5bcQS0UbY1FMIa3L+/WmVm3Rtn2PHu0KPjaHbxM3erLto
         iQE47fuj3VnHhu1xGpVyN8FfprhK4s9vy8NoV9amUpG4Q603fKZ0mJ9u1R5N6rnkvM7Y
         Lwtkm6+1POb23YxjnD6wYknK6saNscayq+DFZL/DqQU15xGkOWKFDjm73P1lyJ/KbdFy
         39AxB73OQIuquiFivFyzAAc19WDjiRFSj+G2t8ITmhqDvcoWB0vCPWuWbFoW6LT/fLyS
         yzyEdIZHuY+7fvtlpyovU8E8hwlKgvkmX9IpKF6Ou8z45PCjvjNBT6d3tUmg/WQ1hw+Z
         39lQ==
X-Gm-Message-State: AC+VfDxXOyslfjfC0p5GfALu62DF+CFC+Eh/pPQa/UgGmbzBRWsqGMdr
        3js6yG72csEgCMJ15eb3b70=
X-Google-Smtp-Source: ACHHUZ6O+/H/cPs9HhB9sgWTZ158Wb2S5pgCVPuODTCiXEy3yT2GAzOqNBn2+X2UwvY8r1XsSBywSA==
X-Received: by 2002:a05:6a00:10d4:b0:63b:6279:1039 with SMTP id d20-20020a056a0010d400b0063b62791039mr2913187pfu.0.1684412934342;
        Thu, 18 May 2023 05:28:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s21-20020aa78295000000b0063f0068cf6csm1228153pfm.198.2023.05.18.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:28:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 18 May 2023 05:28:52 -0700
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
Subject: Re: [PATCH 93/97] usb: typec: tcpci_mt6360: Convert to platform
 remove callback returning void
Message-ID: <9d467c12-90d5-43ae-b5da-2a6516ab6767@roeck-us.net>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-94-u.kleine-koenig@pengutronix.de>
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

On Thu, May 18, 2023 at 01:02:35AM +0200, Uwe Kleine-König wrote:
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
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 6fa8fd5c8041..02b7fd302265 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -178,13 +178,12 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int mt6360_tcpc_remove(struct platform_device *pdev)
> +static void mt6360_tcpc_remove(struct platform_device *pdev)
>  {
>  	struct mt6360_tcpc_info *mti = platform_get_drvdata(pdev);
>  
>  	disable_irq(mti->irq);
>  	tcpci_unregister_port(mti->tcpci);
> -	return 0;
>  }
>  
>  static int __maybe_unused mt6360_tcpc_suspend(struct device *dev)
> @@ -222,7 +221,7 @@ static struct platform_driver mt6360_tcpc_driver = {
>  		.of_match_table = mt6360_tcpc_of_id,
>  	},
>  	.probe = mt6360_tcpc_probe,
> -	.remove = mt6360_tcpc_remove,
> +	.remove_new = mt6360_tcpc_remove,
>  };
>  module_platform_driver(mt6360_tcpc_driver);
>  
> -- 
> 2.39.2
> 
