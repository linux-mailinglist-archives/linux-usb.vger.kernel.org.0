Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F71A2249F5
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jul 2020 10:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgGRIr6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jul 2020 04:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgGRIr5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jul 2020 04:47:57 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8608EC0619D2
        for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2020 01:47:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c80so17896458wme.0
        for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2020 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=/BnbLofxmYkS2s72/Cz2jlRqnsmW/+MfglcmklLNuWs=;
        b=tvocZCrLluWjeyiIUmxqQn6+132t6YQ8t5d6caP1zTGxMf9FO/6TULpIAJJektRvnk
         cuHZ0Y3jPti+TBrLRICtop4GzeEV9yjUCPQD4tthdn2tVn6ilD1oeoHNPsdqRUCYR02S
         1QKyIJWGMZOEoUC+eqzjGjolkQTbQrh6aIMu+7mJ4mNXAhpLTyN2kJNWmwjv+UmkjCDG
         Xktz7g/wmmti2BtrlgEHXSt+ybTBz53mqy3kRnhzvtv2EWuDSbxtOeSjhPc1jJUL9McC
         jBB6Lx79iU8FOeCNBDptTHsI1UMe/0BDWk6NZDUGxVg7S04ida+hTxLK/oOixlb9MBtQ
         /WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=/BnbLofxmYkS2s72/Cz2jlRqnsmW/+MfglcmklLNuWs=;
        b=Fo0iwKbgsmcta+CELaFLsOaDFuHyc5xO+4g8IjN93RuPhJlvIy5Dk34pMFftByHOPc
         MhCr7pUGro7TGsP7EWzevNA0FCutYXFeV5lkUW8uUr5+OtxD4ukbuuU3cbyekGUmx5hG
         o7rutHIHH0rqSjDdYo3YMh9m3H8vLHRbxdGfxuU+Jd5c938UEc9fmW2ZZ6Q6h9a4GsSB
         ITCRhC8cZfNFyd21wOUaEuVecol/VWl49isppU/BlmSSOFpwjRsWu8b00JgEUhmuGcNv
         LMh+vg4+jzXA+fLN/mn9yGy0ZgBcZ+4ABihfukMqP6AMI1rLcAf3m0OUptBSRXfCyLF1
         ru+Q==
X-Gm-Message-State: AOAM532eskWInsPcbxrm9Et1s/0G6K0SK8du/OaiNTsYozL8FV6JA66k
        KIWp5UtNyqS4fUCs7Y48WwHCmA==
X-Google-Smtp-Source: ABdhPJyAsg4NxrlLyDTwnHWx/NChOXQU5czRAJbgjnftVNHkZw/92YTtToJGLENcYVJJ5BKm7Vd+sQ==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr13648684wmj.161.1595062075973;
        Sat, 18 Jul 2020 01:47:55 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local ([2a01:e35:2ec0:82b0:9d0:bf63:799d:4aa1])
        by smtp.gmail.com with ESMTPSA id b10sm17451188wmj.30.2020.07.18.01.47.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Jul 2020 01:47:55 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <d9c2c755-452d-62bd-f792-1d84b76ceea4@baylibre.com>
Date:   Sat, 18 Jul 2020 10:47:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200713160522.19345-2-dan@dlrobertson.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Le 13/07/2020 à 18:05, Dan Robertson a écrit :
> The reset is a shared reset line, but reset_control_reset is still used
> and reset_control_deassert is not guaranteed to have been called before
> the first reset_control_assert call. When suspending the following
> warning may be seen:
> 
> WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> Hardware name: Hardkernel ODROID-N2 (DT)
> [..]
> pc : reset_control_assert+0x184/0x19c
> lr : dwc3_meson_g12a_suspend+0x68/0x7c
> [..]
> Call trace:
>  reset_control_assert+0x184/0x19c
>  dwc3_meson_g12a_suspend+0x68/0x7c
>  platform_pm_suspend+0x28/0x54
>  __device_suspend+0x590/0xabc
>  dpm_suspend+0x104/0x404
>  dpm_suspend_start+0x84/0x1bc
>  suspend_devices_and_enter+0xc4/0x4fc
>  pm_suspend+0x198/0x2d4
> 
> Fixes: 6d9fa35a347a87 ("usb: dwc3: meson-g12a: get the reset as shared")
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>  drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 1f7f4d88ed9d..88b75b5a039c 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  		goto err_disable_clks;
>  	}
>  
> -	ret = reset_control_reset(priv->reset);
> +	ret = reset_control_deassert(priv->reset);
>  	if (ret)
> -		goto err_disable_clks;
> +		goto err_assert_reset;
>  
>  	ret = dwc3_meson_g12a_get_phys(priv);
>  	if (ret)
> -		goto err_disable_clks;
> +		goto err_assert_reset;
>  
>  	ret = priv->drvdata->setup_regmaps(priv, base);
>  	if (ret)
> @@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	if (priv->vbus) {
>  		ret = regulator_enable(priv->vbus);
>  		if (ret)
> -			goto err_disable_clks;
> +			goto err_assert_reset;
>  	}
>  
>  	/* Get dr_mode */
> @@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  
>  	ret = priv->drvdata->usb_init(priv);
>  	if (ret)
> -		goto err_disable_clks;
> +		goto err_assert_reset;
>  
>  	/* Init PHYs */
>  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>  		ret = phy_init(priv->phys[i]);
>  		if (ret)
> -			goto err_disable_clks;
> +			goto err_assert_reset;
>  	}
>  
>  	/* Set PHY Power */
> @@ -809,6 +809,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	for (i = 0 ; i < PHY_COUNT ; ++i)
>  		phy_exit(priv->phys[i]);
>  
> +err_assert_reset:
> +	reset_control_assert(priv->reset);
> +
>  err_disable_clks:
>  	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
>  				   priv->drvdata->clks);
> 


This should do the trick, I'll need to check first if it doesn't break the GXL/GXM
support first.

thanks for the fix

Neil
