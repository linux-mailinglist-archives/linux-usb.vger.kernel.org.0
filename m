Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37C874FF7D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 08:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjGLGjq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 12 Jul 2023 02:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjGLGjX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 02:39:23 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0AC1BC2
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 23:38:26 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id E227481F6;
        Wed, 12 Jul 2023 14:38:12 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 14:38:12 +0800
Received: from [192.168.125.127] (183.27.98.46) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Jul
 2023 14:38:11 +0800
Message-ID: <b20b63ec-1106-36a5-494d-b9ea81ca5645@starfivetech.com>
Date:   Wed, 12 Jul 2023 14:38:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] usb: cdns3: starfive: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "Peter Chen" <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Roger Quadros <rogerq@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        <linux-usb@vger.kernel.org>, <kernel@pengutronix.de>
References: <20230707073653.3396988-1-u.kleine-koenig@pengutronix.de>
From:   Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230707073653.3396988-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Uwe
  Thanks！

On 2023/7/7 15:36, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/cdns3/cdns3-starfive.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
> index fc1f003b145d..a7265b86e427 100644
> --- a/drivers/usb/cdns3/cdns3-starfive.c
> +++ b/drivers/usb/cdns3/cdns3-starfive.c
> @@ -166,7 +166,7 @@ static int cdns_starfive_remove_core(struct device *dev, void *c)
>  	return 0;
>  }
>  
> -static int cdns_starfive_remove(struct platform_device *pdev)
> +static void cdns_starfive_remove(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct cdns_starfive *data = dev_get_drvdata(dev);
> @@ -178,8 +178,6 @@ static int cdns_starfive_remove(struct platform_device *pdev)
>  	pm_runtime_put_noidle(dev);
>  	cdns_clk_rst_deinit(data);
>  	platform_set_drvdata(pdev, NULL);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> @@ -232,7 +230,7 @@ MODULE_DEVICE_TABLE(of, cdns_starfive_of_match);
>  
>  static struct platform_driver cdns_starfive_driver = {
>  	.probe		= cdns_starfive_probe,
> -	.remove		= cdns_starfive_remove,
> +	.remove_new	= cdns_starfive_remove,
>  	.driver		= {
>  		.name	= "cdns3-starfive",
>  		.of_match_table	= cdns_starfive_of_match,
> 
> base-commit: 5133c9e51de41bfa902153888e11add3342ede18
