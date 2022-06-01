Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B18D53A09E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 11:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351292AbiFAJgI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 05:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351255AbiFAJgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 05:36:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C89E91568
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 02:35:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id me5so2001720ejb.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Jun 2022 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=80TA4biEL75JpwIy1s29sYa6y3k0xQC7PWeNV9LgrvQ=;
        b=tKtvsZK+FpDanzSTRFw0YIjrVyEJrG72uSqb0z+4vkE/CmrtUfaW7U2SdbLzLJ2PQr
         B81ViPqRk2Er7c00KN6OcOuV+VAAWhQXDS5qqmn59IAxUvfaNdLXuqqK6tY4ygbfPb6q
         tYV+Nxi5wEZf8fDRUT+7nP4JwSQcvGWx+5Fspvp5ZulhHt8EvsXsMLgtOZSjbB8fO1xG
         Gwgf0nZ2BJiCKvegpIzHvjJSEgUZgqEY2hLTHW13Ovwno4zk7n6/vIKZTKuhblXdPurq
         PJxjvEV6jtjisq0Rk3V9r00Qvso7tGD9biCoactt/Q1DrpwJUiCsHMVqgyXbXMNFUD1V
         RrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=80TA4biEL75JpwIy1s29sYa6y3k0xQC7PWeNV9LgrvQ=;
        b=D4LLhHll/WUcx6edaBAkqOr+1NaVc4xDu/L/fTwguQZAyNUfiKM5KSHHzHKqfxDt80
         1/2JnQinuNFomsTZriXuemwrd1yqeK8vQh4naL0kD0z+4Bs61XbJ7VdNMD48hlsm36tf
         89L+KS7YqnSN0q8fa5zQIJNqFQW/aM+FaLyEEJ0mRq7XLpO8M8dZfXpDU8CSf/SqSs0X
         OmpJHDNjaB5bkAkVFm6Raf9DPsLrsSFBD9EHdSzBILz8Gca+LyknkFBiHpT+xuXuxO6C
         ocbVLjMwQhArGjecbu0CGhK3urNvaZAQw1R6h8vTWKlqKu5DENLiLKgggMk8aWPpoU1+
         L/Zg==
X-Gm-Message-State: AOAM532//G9I6ojOLZZ9T+VkoUPPSRVq7L7dRYJZJjwtajCAqmK8EuO1
        8W/rAkD0hXsc7p28gjqKcA9SaA==
X-Google-Smtp-Source: ABdhPJxHNluoQgYzcVZlXvHgthHPUvCjucaP5txH3zIrCUu4kNf9JIOOTe88nyi6ufuCZ4jETDxlaA==
X-Received: by 2002:a17:907:908b:b0:703:9e42:3d07 with SMTP id ge11-20020a170907908b00b007039e423d07mr5211375ejb.748.1654076156968;
        Wed, 01 Jun 2022 02:35:56 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a1709066ac100b006feed212f50sm482860ejs.184.2022.06.01.02.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:35:56 -0700 (PDT)
Message-ID: <35389032-c4c5-8bb5-3a78-52ff6ee004b5@linaro.org>
Date:   Wed, 1 Jun 2022 11:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 03/17] dt-bindings: mmc: mtk-sd: add bindings for MT8365
 SoC
Content-Language: en-US
To:     Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
        chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        Wenbin Mei <wenbin.mei@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-4-fparent@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-4-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add MMC bindings for MT8365 bindings.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..3195b80ef057 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -38,6 +38,9 @@ properties:
>        - items:
>            - const: mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
> +      - items:
> +          - const: mediatek,mt8365-mmc

You code it so inconsistently... It's one patchset but each patch doing
the same thing differently.

Please put it under enum in entry above.


Best regards,
Krzysztof
