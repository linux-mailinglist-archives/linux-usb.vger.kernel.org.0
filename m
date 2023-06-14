Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC7E721E6A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 08:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjFEGnU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 02:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjFEGnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 02:43:19 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A29FE62
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:42:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-977d7bdde43so157933966b.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Jun 2023 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685947375; x=1688539375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8/neVu5etF2OWMNQ2EIJRqVF5AKOphn5GqsmS4dQ1g=;
        b=DWkwAPUf8wkMA3Zy4TjBBj8Y2W6BRIrkS/j/0Ix+QGMGAFOty9OE0ZD6DZUvTLDcCw
         461HxBz2c6i0WYuxWsKTxi0l+X1389ijffpL+2TsWLUckuNnne8xgdobhpbiSBK8HFuZ
         Lj7yvDHNajZALicV+AnvmGYgaANzmOvA0Pfws0fsc95/fcBIvbL8y7C6vrpIzPzTkOdv
         M38staejTomw2yAa0JC/GJHLtyO7Loqa3TyUaO0UXUTtYSo+T5Ewwu7zYDbhnsXSYPzr
         e2zYGnKifiGb3H18+ZG1EkegtOiG3tfRVZ8wS/zC+ge4ZYhRmguu2hFSOwkKTqwS7M1y
         Ipug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685947375; x=1688539375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8/neVu5etF2OWMNQ2EIJRqVF5AKOphn5GqsmS4dQ1g=;
        b=iG2EkG9Xf7e7bcvVsPiLOP2Fl0XntYy1WDGb5I/6be+WmDVhdEv3YKCvh5xflHCMBL
         Yr+JOWGs8lx++4qPXXq1Wp61LFIfhz/ZOtM2HMhF0JJnNh3lMqUqe5NqDqxW0aX+Vcyl
         jG3GgDadWt26HiLIsv+tJkFyPMfFwgpZZZQpPaCq5ISfwTKHL8LNX23OS80Ffndt5DUD
         V0QClYb7CfJzoqEsPw5q9QfdXCka2sgIu4DgS9OfbkL/d/8Pkgk/CmZ4sSLLb0Z4/MJn
         ITpMiNRcdKBSAXcTSG99WAMPhnQ7F9iExq7eTfJlCFwDIJNUT0xH7tmn0bJ8xvqao+Ve
         sUbw==
X-Gm-Message-State: AC+VfDyI6mceeSKkBNhSqY79pSSlseB2uzkA7TbS5Wwm+7HnkPtZyhBq
        ih4G8+4FWZGOc4ssjIpY/yJBbA==
X-Google-Smtp-Source: ACHHUZ7kks+zPvl0Do19pc6zr+YUiMBMU7U9Uq1FIBwnETbGWqXG0wu1J9EL9cAEcfRyLIMo7N070Q==
X-Received: by 2002:a17:907:3da3:b0:977:d660:c5aa with SMTP id he35-20020a1709073da300b00977d660c5aamr2266649ejc.31.1685947375726;
        Sun, 04 Jun 2023 23:42:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id la24-20020a170906ad9800b009745482c5b7sm3866650ejb.94.2023.06.04.23.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:42:55 -0700 (PDT)
Message-ID: <be3716e0-383f-e79a-b441-c606c0e049df@linaro.org>
Date:   Mon, 5 Jun 2023 08:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 21/21] net: macb: add support for gmac to sam9x7
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        gregkh@linuxfoundation.org, linux@armlinux.org.uk,
        mturquette@baylibre.com, sboyd@kernel.org, sre@kernel.org,
        broonie@kernel.org, arnd@arndb.de, gregory.clement@bootlin.com,
        sudeep.holla@arm.com, balamanikandan.gunasundar@microchip.com,
        mihai.sain@microchip.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        durai.manickamkr@microchip.com, manikandan.m@microchip.com,
        dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
        balakrishnan.s@microchip.com
References: <20230603200243.243878-1-varshini.rajendran@microchip.com>
 <20230603200243.243878-22-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230603200243.243878-22-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/06/2023 22:02, Varshini Rajendran wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Add support for GMAC in sam9x7 SoC family
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 29a1199dad14..609c8e9305ba 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4913,6 +4913,7 @@ static const struct of_device_id macb_dt_ids[] = {
>  	{ .compatible = "microchip,mpfs-macb", .data = &mpfs_config },
>  	{ .compatible = "microchip,sama7g5-gem", .data = &sama7g5_gem_config },
>  	{ .compatible = "microchip,sama7g5-emac", .data = &sama7g5_emac_config },
> +	{ .compatible = "microchip,sam9x7-gem", .data = &sama7g5_gem_config },

These are compatible, aren't they? Why do you need new entry?

Best regards,
Krzysztof

