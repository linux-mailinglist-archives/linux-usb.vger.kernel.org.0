Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11093551F0D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 16:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241213AbiFTOjP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 10:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348423AbiFTOim (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 10:38:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466B32621
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 06:55:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E343AB811A9
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 13:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A235BC3411B;
        Mon, 20 Jun 2022 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655733321;
        bh=3qrZRHH7IYedHqWHSfk6xUu/yk+xsR9N78kQjdASRHw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lj06i6CWpaMhlPfLtKSZT+GPlYhuLs+ECW41z2Wu49HqxZrj2d5Bn8USI1JNZisKZ
         bhD2sWN8cFvgrr8fzwnib+p+7wnlowNzD7oFBGbdwjxvkJw+by5pvSq+4BIrxxDmcv
         7pVY6u3YXALarvx8L+Y3aVzW5JoX5t5dSfgr6HI7pFoYkYu/jAD6mXuJ6Gfvx+DUr7
         eTbefFYi2M/5R1obZJvqDOZJRev5OtqCH2XUh93yIN265drt4+WTAFD0lkS0Yozskb
         y4n9pLko1nJqXuwpjXin7t5BqeNER06roPoUs7hoLP/fXG9/oNcU6VAworfDhB9mbV
         V2xv64bOiBp/A==
Date:   Mon, 20 Jun 2022 21:55:15 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] usb: chipidea: ci_hdrc_imx: use dev_err_probe()
Message-ID: <20220620135515.GB1227419@Peter>
References: <20220614120522.1469957-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614120522.1469957-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-06-14 14:05:22, Alexander Stein wrote:
> Use dev_err_probe() to simplify handling errors in ci_hdrc_imx_probe()
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 097142ffb184..9ffcecd3058c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -348,25 +348,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		data->pinctrl = devm_pinctrl_get(dev);
>  		if (PTR_ERR(data->pinctrl) == -ENODEV)
>  			data->pinctrl = NULL;
> -		else if (IS_ERR(data->pinctrl)) {
> -			if (PTR_ERR(data->pinctrl) != -EPROBE_DEFER)
> -				dev_err(dev, "pinctrl get failed, err=%ld\n",
> -					PTR_ERR(data->pinctrl));
> -			return PTR_ERR(data->pinctrl);
> -		}
> +		else if (IS_ERR(data->pinctrl))
> +			return dev_err_probe(dev, PTR_ERR(data->pinctrl),
> +					     "pinctrl get failed\n");
>  
>  		data->hsic_pad_regulator =
>  				devm_regulator_get_optional(dev, "hsic");
>  		if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {
>  			/* no pad regualator is needed */
>  			data->hsic_pad_regulator = NULL;
> -		} else if (IS_ERR(data->hsic_pad_regulator)) {
> -			if (PTR_ERR(data->hsic_pad_regulator) != -EPROBE_DEFER)
> -				dev_err(dev,
> -					"Get HSIC pad regulator error: %ld\n",
> -					PTR_ERR(data->hsic_pad_regulator));
> -			return PTR_ERR(data->hsic_pad_regulator);
> -		}
> +		} else if (IS_ERR(data->hsic_pad_regulator))
> +			return dev_err_probe(dev, PTR_ERR(data->hsic_pad_regulator),
> +					     "Get HSIC pad regulator error\n");
>  
>  		if (data->hsic_pad_regulator) {
>  			ret = regulator_enable(data->hsic_pad_regulator);
> @@ -458,9 +451,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  				&pdata);
>  	if (IS_ERR(data->ci_pdev)) {
>  		ret = PTR_ERR(data->ci_pdev);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "ci_hdrc_add_device failed, err=%d\n",
> -					ret);
> +		dev_err_probe(dev, ret, "ci_hdrc_add_device failed\n");
>  		goto err_clk;
>  	}
>  
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

