Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5102C54EC5E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 23:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378993AbiFPVPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 17:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379009AbiFPVPs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 17:15:48 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D8B60D92
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q140so2323691pgq.6
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tml1AzLWRr4YzF3sAdjGFBXOgQpNGM4CdcoqHXy6fq8=;
        b=jqIsk7Q+m6EcCuXgHO5qdrSbk9XCkK4QrELg4P/y5TFyxvqpcMjqJNM+E8zK9d5Q7c
         FcDjUcLBJ/8XBeegZ7WhoXEoQ9Rms8fcCrmoVVla5DeUWH6FcdNUr90bcpBiNfd+0yX0
         QUgEc7zEmcPW4VNgURMMFv7Yf6dnaMW3BF2L0DpMkLVllk6pUf88SARfSTB/OlxSXWd/
         S/ngORpZ2XySJVG+qWCpq4u1c45IieRfdipQCz36HZit/QPrMn0O9wYhQRmtnisyxeFf
         qptBWeOlEWksEUDXOIzm9lezHFrXuazZFiYdP96fsDiKS/P1FjazmQAqxUHu6o5SMaQW
         SbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tml1AzLWRr4YzF3sAdjGFBXOgQpNGM4CdcoqHXy6fq8=;
        b=1s3i2abnuJjtUUX7EjuxfX1eY1vP8qVZmBEknWN2aE6599NksU91R/DrBuekLyBLPM
         0CfoOU7D0zmxDEmdL4FV40ky7dC4WSH0WFG9yb5ntE9ua4zTEI5b+DPU0YrOwPw97GkR
         VlyHtLwxHlxwY9H3pUazbO+GLBmoeaZHKenI3OHJVtFNCAnCh9WfPTOV6APEYH6PFZL+
         K6ijfUm7Kp5Hx6udnCtohXslsyoJiJNWOEPrR/STtjooZBFfZ0S5Ts7XI2uZQAJ+dnqJ
         4LcsaCy4NY8gyjIGIqyuhkWunFoZiQzxcvOvtbNnG+AhSPCRTIhXCbFJHxyzllY3OLHB
         yKUQ==
X-Gm-Message-State: AJIora9Lve7E1/v8NQYgi6ETunXflG/kh8z1uxBji6dog8mu5UN8pRkc
        Wb2qnjhz/Ocm0O/C7z3cXE1o1Q==
X-Google-Smtp-Source: AGRyM1sh6e+GuWnqSFtrhbHqrmFWx8Qa99sAGwZCXTtI91IuORU3SI44Gi/lqC6ObXbqOvNYusLNiw==
X-Received: by 2002:a63:3ec7:0:b0:408:d3ac:9c0c with SMTP id l190-20020a633ec7000000b00408d3ac9c0cmr6200985pga.176.1655414146402;
        Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d88d00b0016196bcf743sm2052571plz.275.2022.06.16.14.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:15:46 -0700 (PDT)
Message-ID: <28b73da7-d97c-5ea5-0b22-724fa971aeb0@linaro.org>
Date:   Thu, 16 Jun 2022 14:15:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
Content-Language: en-US
To:     ChiaEn Wu <peterwu.pub@gmail.com>, jic23@kernel.org,
        lars@metafoo.de, matthias.bgg@gmail.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com, ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-7-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613111146.25221-7-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/06/2022 04:11, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
>  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
>  2 files changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> new file mode 100644
> index 000000000000..6c2639e81e50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> @@ -0,0 +1,279 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6370 SubPMIC
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |
> +  MT6370 is a highly-integrated smart power management IC, which includes a
> +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
> +  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
> +  driver, a backlight WLED driver, a display bias driver and a general LDO for
> +  portable devices.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370
> +
> +  reg:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  adc:
> +    type: object
> +    description: |
> +      Provides 9 channels for system monitoring, including vbusdiv5, vbusdiv2,
> +      vbat, vsys, chg_vddp, ts_bat, ibus, ibat, and temp_jc.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6370-adc
> +
> +      "#io-channel-cells":
> +        const: 1
> +
> +    required:
> +      - compatible
> +      - '#io-channel-cells'

Decide in your entire patchset whether you use ' or ". Don't mix.

Since you did not test your bindings, I am not reviewing it. First, test
them. No need for me to do the job of a automated tool, right?

Best regards,
Krzysztof
