Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319BE4CF38A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 09:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbiCGIcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 03:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbiCGIcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 03:32:05 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D8F55494
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 00:31:12 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id n15so7804046wra.6
        for <linux-usb@vger.kernel.org>; Mon, 07 Mar 2022 00:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=M/a9sSwIlTaA0uOLJ9Rhq9zNudgRJnKE3XEQH6XwFTk=;
        b=rObXpXR3EaNrhwjqznYI5UI/8FW8+HkUOrYJHj0N9jvZN7ux/1LqsMbdB0xtvY8r+8
         MJ9B0tASl1hXnNc0pV/OfoduCWvT439CKst/kIy9PV/klegMlInhxK9AoT83oZAMxWsK
         1XGuP2VKlhDirgv2lIItCN64UFVG15ahzoo86J1EdkkKtSeYEOHpn2yt9kJRUB1m5Hh2
         6TH1SJUbNAmMiSJntJ2N9SHkqINNZE3deeA4HRSbwxzHeCCXYgnPetPmm0nAEKGQec0E
         epM3gjETw6giPTSM+m2Ovo7tPANwqmUyP0aR/B9zMlbAI38eBsyA+cJQlwt27fsSUb3C
         /+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=M/a9sSwIlTaA0uOLJ9Rhq9zNudgRJnKE3XEQH6XwFTk=;
        b=PTvheyopBQkNgTEwbA2vFm2UpZ6qaaJyYA77ptFWyX2DMQb5jYdksKZOW/wGk+i2NR
         6DR2cQnma6QqbZDjSFXg0EO3DgK1zKGheuSJII0Oajw0dd51FyfidtDFw0seuK1YBA2J
         TtTv44JW8mTlKJQUR2R1h2C61x8VxIiynOAY6X2IWDQjxhnVOsSqmH7pXYPjEZO3fSwe
         /0hIo21kmLnT4dcQsYosqPlVvMj1n1wvvhnhaJl0KSD2KzdUDUa6sa/8+XG6NotZ2Y+t
         oH9faH8dosw+EjzQ0BceEg5VvaZpyUxZ8po4ujHri9EznI/vKhdAsilTR5iUaNOHlZ6x
         vB+Q==
X-Gm-Message-State: AOAM531LQ0v8lDClnndNAR0xwo1gfMMKlXGFbJsx291FnSlZhVwh3BS4
        KAQbqedDyX6Kp/x/CzrlwfEowA==
X-Google-Smtp-Source: ABdhPJyEq7eU3DL5hMKyDwdqWuJL5kvEefFehXEj8huNMwMlxYC7JfjL1Sd0vMOPNsNkU9dppusmZw==
X-Received: by 2002:adf:f94a:0:b0:1ef:9485:e43d with SMTP id q10-20020adff94a000000b001ef9485e43dmr7164123wrr.552.1646641870512;
        Mon, 07 Mar 2022 00:31:10 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096? ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
        by smtp.gmail.com with ESMTPSA id v188-20020a1cacc5000000b00384b71a50d5sm12607329wme.24.2022.03.07.00.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:31:10 -0800 (PST)
Message-ID: <ae246f3f-debd-f183-7d77-ab72c9332cd5@baylibre.com>
Date:   Mon, 7 Mar 2022 09:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] usb: dwc3-meson-g12a: constify drvdata structs
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <a3c178c9-7c33-d7b8-9f6e-734dc28728ab@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <a3c178c9-7c33-d7b8-9f6e-734dc28728ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/03/2022 21:59, Heiner Kallweit wrote:
> Constify the drvdata structs. This also matches the definition of
> member drvdata in dwc3_meson_g12a.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index bd814df3b..b282ad0e6 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -188,7 +188,7 @@ static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
>    * reset to recover usage of the port.
>    */
>   
> -static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
>   	.otg_switch_supported = true,
>   	.otg_phy_host_port_disable = true,
>   	.clks = meson_gxl_clocks,
> @@ -202,7 +202,7 @@ static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
>   	.usb_post_init = dwc3_meson_gxl_usb_post_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
>   	.otg_switch_supported = true,
>   	.otg_phy_host_port_disable = true,
>   	.clks = meson_gxl_clocks,
> @@ -216,7 +216,7 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
>   	.usb_post_init = dwc3_meson_gxl_usb_post_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata axg_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
>   	.otg_switch_supported = true,
>   	.clks = meson_gxl_clocks,
>   	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
> @@ -229,7 +229,7 @@ static struct dwc3_meson_g12a_drvdata axg_drvdata = {
>   	.usb_post_init = dwc3_meson_gxl_usb_post_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
>   	.otg_switch_supported = true,
>   	.clks = meson_g12a_clocks,
>   	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
> @@ -241,7 +241,7 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
>   	.usb_init = dwc3_meson_g12a_usb_init,
>   };
>   
> -static struct dwc3_meson_g12a_drvdata a1_drvdata = {
> +static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
>   	.otg_switch_supported = false,
>   	.clks = meson_a1_clocks,
>   	.num_clks = ARRAY_SIZE(meson_a1_clocks),

Looks good:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
