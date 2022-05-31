Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5F45397D9
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 22:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347693AbiEaUPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 16:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347377AbiEaUPD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 16:15:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A4178913
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 13:15:01 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id x62so7202604ede.10
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oFtwwjCwLQncprSW0uxMAdDJMdxwLty5X6vUURCLEwk=;
        b=ITMWpvDnZ+RR0dXG8wMy2xR2rl4TYKiJPd4P2ee+6b+YSNrXIfd5C5/sxHiIaiV8l/
         Rr8j5rbfZJQdWDicbqJLULlJ8a1LPJtojDk9pZRk5GN9Grou5i7tAHjAOnAm+43fQbft
         AItTPaS/anUqkjrgHeA8gWiVTOnJVpyYwkX4kWPrZRx3KFfTtM/N/iDSPeACILsT4aQf
         M3SWSLCBTTSyyMcH3BloOhEZjIv4V9qKLVXjfngWe+ZrAh5pvVrbUk/ZDUnhXwaHIcji
         8VSjsm3e2xhEeVQO89RSDtV5LDweV0ruYx2PZwybiDHSYQi1HJRfQptttYSjG2nvuBwD
         fRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oFtwwjCwLQncprSW0uxMAdDJMdxwLty5X6vUURCLEwk=;
        b=w4UXHTMba6sgmqSzCmuuhx9h5b6ohBx3l6uCQz+BCrWOVYEoixvLz/bQI2oZNLdWGk
         dzQNlicC2x6hEkhtlh7jTiN7bYfpG3SUkkUxMoXSs74BsB1OVOuGQjvZKaHnRlSeNOBH
         4nX9RdTsCAAxlluhoDcaO7CsmYauyu4hOITS0xqKYiAV1UwYKIvX7xmh9a9R06YJ3lcg
         Htxpol/Hr9F3zdMFk4+Z+ta9eo8MOqtibjFUNqHYTijomK9YIvRVfJjQvsFKmorEo71W
         LPtB7ccbIf8iY/UOmTqOctc7x+90V/kZL/Kw0mo0FhdEmh6ySe7XdmyBklr97Sd1BKrp
         t6Yg==
X-Gm-Message-State: AOAM532BS3EZVIGkjgfsnw9WTjFdbjdN58y+JQ0guj6ykGrxrOuP/jum
        bv2xwH6deqyLiuqAC8/hGHSeFg==
X-Google-Smtp-Source: ABdhPJxh3X5a34X2qfUbuwM7ahlfxQCxIkomDGMgER9D0LcMD1yvEUBK+ewRUPxHTf67kQQv6tje2Q==
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id b1-20020aa7d481000000b0042dd5fdf963mr10752639edr.209.1654028100222;
        Tue, 31 May 2022 13:15:00 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906091800b006ff05d4726esm5251077ejd.50.2022.05.31.13.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 13:14:59 -0700 (PDT)
Message-ID: <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
Date:   Tue, 31 May 2022 22:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding documentation
Content-Language: en-US
To:     ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     cy_huang@richtek.com, alice_chen@richtek.com,
        chiaen_wu@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-2-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531104211.17106-2-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/05/2022 12:42, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 

Subject - remove "binding documentation". It's already implied by prefix.

> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 000000000000..9d5c4487ca9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 Battery Charger
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-charger
> +
> +  interrupts:
> +    description: |
> +      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
> +      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
> +      are required.
> +    items:
> +      - description: BC1.2 done irq for mt6370 charger
> +      - description: usb plug in irq for mt6370 charger
> +      - description: mivr irq for mt6370 charger

s/for mt6370 charger//
in each item

> +
> +  interrupt-names:
> +    items:
> +      - const: attach_i
> +      - const: uvp_d_evt
> +      - const: mivr
> +
> +  io-channels:
> +    description: |
> +      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
> +      is required.

Constraints (e.g. maxItems) are needed.

> +
> +  usb-otg-vbus:

Let's keep the same name as in MT6360:

usb-otg-vbus-regulator
> +    type: object
> +    description: OTG boost regulator.
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +    properties:
> +      enable-gpio:
> +        maxItems: 1
> +        description: |
> +          Specify a valid 'enable' gpio for the regulator and it's optional

This description is pointless - does not bring any more information. You
repeat the schema. Please, avoid such descriptions.

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false


How about example? Or is it going to be in MFD schema?


Best regards,
Krzysztof
