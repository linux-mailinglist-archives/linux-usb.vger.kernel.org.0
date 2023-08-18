Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B8C780888
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 11:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359190AbjHRJcJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 05:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359243AbjHRJbw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 05:31:52 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CDD3C19
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 02:31:39 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5280ef23593so820227a12.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692351097; x=1692955897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pL7L3WqTivmRh2NkcdS+o8QoBLa4Dg7vH4Pm6EApcf8=;
        b=vCjDYRIlAAp5DeEkp/TeWIxPOdQQKKZMZR76F/a9136wSifkRBIsipwCC9T5xagszg
         lRU47G6naZfec/ZXJdbIQ4ttG+jUBZadVCNFFGZ5YbA8x7Q0cpOJ8UM1avgwnVqzhvMS
         nvTUbidt9XAzZv/j6YHEyCidXw0bynRO7FEYVwcoCd0Af7es0s+9HHbtRknjWwMo0To8
         c87g8Ygxerd9FfHi6pp/Wmy0CtPceg62o/Rf1NrvgDN3ZFS+VdSCgp4VESjLvLrZc2g4
         +M6rxEFJOahVODgK23bqQHi7v+WN8ddVF3YwWTM6J5nfHV/3YWM409dTcFkxOaWvl6ul
         D4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692351097; x=1692955897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pL7L3WqTivmRh2NkcdS+o8QoBLa4Dg7vH4Pm6EApcf8=;
        b=f5F4M+pa8vh+bBDGOAgIuLmMfrBlysN6KRsnc43PL9BpTSVNuk7Z+KcfS0Vcmq+dMN
         N1wysM7BDVn8PuE8lW5zglhKjOXW83njFB5u3rshEuzITTbr6FVdOAotWLoyNg8BCFwD
         DbTBYbtSCU+IW9Zzkiq6Xe1PCgKV3hjfJpL7QYQ9tHSZZ8Z5oKuTVQ3XWe6MDsYt1Z/W
         LMdk0xzzYJ+VSnCCqzPVnK9IKkW5gPCD748eUDfQIs8m3moAaTTQLKkIuacBQJIDTI5H
         b+bnAeJ2Ump7FqGUmRedVMXkTU4USZ9cf8Ogs0vY4F/mKtOerxOd2oWTAcHcT79fzciX
         U2pA==
X-Gm-Message-State: AOJu0YzqYaeDsSk5zbpDb7LrDGoL2E/v6B3PQxWlAjSzhhrImkXpDYBj
        3Mknn8n/VU8jYEwhI3W+ZjWEGw==
X-Google-Smtp-Source: AGHT+IFEfIKo8zmvgiACt6EAKWKYfHjNWnIq6cJKnY6qX//b9iaqG1p449CeXVv+Rj+D+S5crLWdPg==
X-Received: by 2002:a17:906:23f2:b0:99c:7915:b844 with SMTP id j18-20020a17090623f200b0099c7915b844mr1388984ejg.57.1692351097620;
        Fri, 18 Aug 2023 02:31:37 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id h17-20020a17090634d100b00993cc1242d4sm948376ejb.151.2023.08.18.02.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 02:31:37 -0700 (PDT)
Message-ID: <eba26f0e-40dd-3661-b089-bc34c9426000@linaro.org>
Date:   Fri, 18 Aug 2023 11:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: usb: Add binding for ti,tps25750
Content-Language: en-US
To:     Abdel Alkuor <alkuor@gmail.com>, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abdel Alkuor <abdelalkuor@geotab.com>
References: <20230817235212.441254-1-alkuor@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230817235212.441254-1-alkuor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/08/2023 01:52, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> TPS25750 provides power negotiation and capabilities management
> for USB Type-C applications.
> 
> Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>

Where is any user of it? DTS, driver or 3rd party upstream open-source
project?


A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.

> ---
>  .../devicetree/bindings/usb/ti,tps25750.yaml  | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,tps25750.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps25750.yaml b/Documentation/devicetree/bindings/usb/ti,tps25750.yaml
> new file mode 100644
> index 000000000000..326c9c2f766b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,tps25750.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,tps25750.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments 25750 Type-C Port Switch and Power Delivery controller
> +
> +maintainers:
> +  - Abdel Alkuor <abdelalkuor@geotab.com>
> +
> +description: |
> +  Texas Instruments 25750 Type-C Port Switch and Power Delivery controller
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps25750

Blank line

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |

Drop description

> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: irq

Drop interrupt-names, it is useless in this form.

> +
> +  firmware-name:
> +    description: |
> +      Should contain the name of the default patch binary
> +      file located on the firmware search path which is
> +      used to switch the controller into APP mode

maxItems: 1

> +
> +  connector:
> +    type: object
> +    $ref: ../connector/usb-connector.yaml#
> +    description:
> +      Properties for usb c connector.
> +    required:
> +      - data-role
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - connector
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tps25750: tps25750@21 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            compatible = "ti,tps25750";
> +            reg = <0x21>;
> +


Best regards,
Krzysztof

