Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1EC781997
	for <lists+linux-usb@lfdr.de>; Sat, 19 Aug 2023 14:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbjHSMrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Aug 2023 08:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjHSMrr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Aug 2023 08:47:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146AF237D4
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 05:46:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99d937b83efso223869266b.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692449180; x=1693053980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgQakRG+/IxAgG5KIp0blnFHhBf98jcw1gjHSQfAMhU=;
        b=jE2j+v1yEXxx3S80AV52Kr3yHs9VM3DK5N74eEpRUvemTJbE97usvhvzZkidP/knw/
         GbyEDu4481wlUYvRWLFvXXq9BchZnFk+W4NVDyxKHG0tUoITrUaINNQiRRiSbP2USbQk
         Kb+ezDyXT5vcYxR1RU3KtJmpySq9LkNXKsQJWj69oiWbAkDAy8QpmyEVp5jKjef8b75r
         gAMnACYx7ALLcdxXIoZrcpyP3qGH6Xy0yFMoIHdOns5JkQQjS/pMeeKAq8DsAp0UcxKG
         6BvXe9pwyQWW9K/GHyLlT529WF8dFc4hQFBQeKP90MbeNNudDEUTidHo8KWIblX8/PFp
         rgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692449180; x=1693053980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pgQakRG+/IxAgG5KIp0blnFHhBf98jcw1gjHSQfAMhU=;
        b=ZmVEFQ3zX1Bm/5RShzxBUWNHQ4iiW/tIm7X0vl6mF8P1bDwFpJhmICQkAEpQkCN/LW
         fXsCAStMBWa6bbwDLpZbvCd9+aUAn31rbg1jX0a1hkR5zivkon+Z6tmYR/69WK8YeSID
         nD8ljTOLfHbh0w/RHnIxugfGeROQ5ZEI39Jk3cIiOHVoaHeVpe++c5nR5WFO3VJjCKP7
         5Axy3BXh1gusPaUc6/gS6l725fuAiCgERnidR346opK+Cd84JYLQz9H6BFQEqVENLsWW
         tdpAjXR3QFCW6napLHSbWZNROj19yRE0ixd80hFWGieNeLHARMzKKeOblEMnJ1lP8T8m
         JPIQ==
X-Gm-Message-State: AOJu0YzELsRzUpCtvzZjQc07Du2dACAuIZd1Sleq2fh1BkYyhGDkp+SE
        MFvwt0gqaYvaQrKNNY+0OazIpqXKy+Q6/wopiEE=
X-Google-Smtp-Source: AGHT+IFUJWEjwf2m+gKo06Pbl83FhgotKSlIy3Dwb8z92hYw7hrFGxTP7ZiYBAOODXX9MAotF1AsLw==
X-Received: by 2002:a17:906:7698:b0:973:ff8d:2a46 with SMTP id o24-20020a170906769800b00973ff8d2a46mr1422612ejm.3.1692449179880;
        Sat, 19 Aug 2023 05:46:19 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id qq12-20020a17090720cc00b0099d0c0bb92bsm2610166ejb.80.2023.08.19.05.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 05:46:19 -0700 (PDT)
Message-ID: <ba8e2a3c-8abd-8cd1-7490-10b13b131af3@linaro.org>
Date:   Sat, 19 Aug 2023 14:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: usb: Add ti,tps25750
Content-Language: en-US
To:     Abdel Alkuor <alkuor@gmail.com>, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abdel Alkuor <abdelalkuor@geotab.com>
References: <20230818153015.513053-1-alkuor@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230818153015.513053-1-alkuor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/08/2023 17:30, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> TPS25750 provides power negotiation and capabilities management
> for USB Type-C applications.
> 
> Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> ---
> v2: 

git format-patch -v2 -1

>  - Remove redundant word 'binding' from Subject
>  - Add new line before reg property
>  - Remove unused description in interrupts property
>  - Drop interrupt-names property
>  - Add maxItems to firmware-name property
>  - Use generic node name 'typec' instead of 'tps25750'
> ---
>  .../devicetree/bindings/usb/ti,tps25750.yaml  | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,tps25750.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps25750.yaml b/Documentation/devicetree/bindings/usb/ti,tps25750.yaml
> new file mode 100644
> index 000000000000..d98c34df340d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,tps25750.yaml
> @@ -0,0 +1,81 @@
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  firmware-name:
> +    description: |
> +      Should contain the name of the default patch binary
> +      file located on the firmware search path which is
> +      used to switch the controller into APP mode
> +    maxItems: 1
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
> +        typec: tps25750@21 {

Nothing improved in node name. Drop the label "typec", because it is not
used.

I still wait for the user, as I wrote in your v1.

Best regards,
Krzysztof

