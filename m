Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787375597D2
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 12:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbiFXK1v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 06:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiFXK1t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 06:27:49 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1AF7C522
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 03:27:46 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u12so3755648eja.8
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Nuxc36+s4sWQDaVadkc6oPNaa2rIDEmkVevDjA38UUQ=;
        b=Lu/cMZDQbpDrvP88FBrvMyrvBoGMLxkakNs1O/w0KJCcIFSPOUBY6OryS/oCJ06YOn
         GbDK7li6a4UHrHldXUyUMMOWrNS7pm9L5bfCAY7TmNWPkoDDJz8VXQFe9Fhpv3m1uc0L
         t4Sa3S5fCj+Jep4qZr+X95xroO/Fz5Hy4UOnCnNBFg2IacvUZRBw/4DLZFBdZxUBHoUe
         5PIG9v7XeqxkrKqcy2iOjNxequ8IQZPQLNBUYSNE3EU48hl1FQubHzyALQeSD5oD6gy4
         XQLb1KUjFcLMpjEJx38RU1Cy1e+e8w6rEg3l9/raR6EjGfIkJCCDcDqn2DXE/qEDSWEt
         gzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Nuxc36+s4sWQDaVadkc6oPNaa2rIDEmkVevDjA38UUQ=;
        b=A5IwCiuxQi1fV8Y2Oa/aycTzyia37WanS5z7r6HOYPBBTHu7b0wiu1cztCcq0lk1/F
         t3LmJFi+CuZjiVIV5yIqpQHHenvirZdN9fSne0FUkwIFkjnznGuWRtU+iZ0mlPZAx5F+
         Z5o6r5JUyD7VqrzctvpO/FddwxjcLXRHPq3cjYfyEWsrAqrU60YrIFDHQi87Zvb7ncd/
         UJRsRIOQhcY1kwnX5/bm+TKwEBa3oAII/avyKq06uvgbuGMyyjxIdkSedJ2dX7S3TFUV
         gVTX4S5GwlnivYK5e6Onq5DyVYmObuYweZ7w741G+K3g6ylLjUlWdpRz8wNVxV7+mUti
         pNXA==
X-Gm-Message-State: AJIora/Jvec8NRA/5UZguK2PGHJ99RdqbST9yF8Og+MUlvXkunk9dGHJ
        wS9ixFaFf1gnr1DwjvLhkr6hpw==
X-Google-Smtp-Source: AGRyM1t4wJC/XeeqGXInCg0idKMgknVDGZX7X/fQzRWF0oldACj/ylYne3Hz/Rt8agVjJawt7AOTzw==
X-Received: by 2002:a17:907:94cb:b0:721:252c:d4bb with SMTP id dn11-20020a17090794cb00b00721252cd4bbmr12681930ejc.148.1656066465307;
        Fri, 24 Jun 2022 03:27:45 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o12-20020a056402038c00b0043561e0c9adsm1640034edv.52.2022.06.24.03.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 03:27:44 -0700 (PDT)
Message-ID: <06819889-2c00-83d8-0d25-ce6c2559105a@linaro.org>
Date:   Fri, 24 Jun 2022 12:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 02/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Content-Language: en-US
To:     ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     chiaen_wu@richtek.com, alice_chen@richtek.com,
        cy_huang@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-3-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-3-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/06/2022 13:56, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Charger binding documentation.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v3
> - Add items and remove maxItems of io-channels
> - Add io-channel-names and describe each item
> - Add "unevaluatedProperties: false" in "usb-otg-vbus-regulator"
> - Rename "enable-gpio" to "enable-gpios" in "usb-otg-vbus-regulator"
> ---
>  .../power/supply/mediatek,mt6370-charger.yaml      | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> new file mode 100644
> index 0000000..f138db6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
> @@ -0,0 +1,87 @@
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
> +      - description: BC1.2 done irq
> +      - description: usb plug in irq
> +      - description: mivr irq
> +
> +  interrupt-names:
> +    items:
> +      - const: attach_i
> +      - const: uvp_d_evt
> +      - const: mivr
> +
> +  io-channels:
> +    description: |
> +      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
> +    minItems: 1
> +    items:
> +      - description: |
> +          VBUS voltage with lower accuracy (+-75mV) but higher measure
> +          range (1~22V)
> +      - description: |
> +          VBUS voltage with higher accuracy (+-30mV) but lower measure
> +          range (1~9.76V)
> +      - description: the main system input voltage
> +      - description: battery voltage
> +      - description: battery temperature-sense input voltage
> +      - description: IBUS current (required)
> +      - description: battery current
> +      - description: |
> +          regulated output voltage to supply for the PWM low-side gate driver
> +          and the bootstrap capacitor
> +      - description: IC junction temperature
> +
> +  io-channel-names:

It does not match io-channels, you need minItems here as well.

> +    items:
> +      - const: vbusdiv5
> +      - const: vbusdiv2
> +      - const: vsys
> +      - const: vbat
> +      - const: ts_bat
> +      - const: ibus
> +      - const: ibat
> +      - const: chg_vddp
> +      - const: temp_jc
> +

Best regards,
Krzysztof
