Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D8771F0B6
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 19:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbjFAR1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 13:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231556AbjFAR1X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 13:27:23 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E5A19B
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 10:27:22 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f7bf3cf9eso170337766b.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Jun 2023 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640441; x=1688232441;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywHAd7umX8c1mvBvuckFfVUydEsgHA+GJNFS0AltCkY=;
        b=BgGNoDLofuERQiTZN/lQ0c7R8WrONxNiD/F9UORGVlGQ/z0mw+rldKvQjq8D/q7V86
         qkWwITW330snlXH76bz7qIY4w/OEW/xj8R25shaX5GcmhgGi75ZvWSdO9icgK/GNu70f
         ccEIkX7g9y80DYcHIWIvpAhoQ3o0besVhoTD4o3D6Zk+JIP0C06YJ/bAe4qqbZslnFtO
         KPO1nbInLw29zJZgTCYQObWX1RPwQBuaVvFtn9Sqm2bkXOg/vM3dtZDSR1JTPNS6qSnl
         rVa6nhocKOHe+Xo4nib4MUyxPaO5PYVOBWxLd7TMb1pEmt/cogsGaPZxO35Ow2lxrALe
         O/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640441; x=1688232441;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywHAd7umX8c1mvBvuckFfVUydEsgHA+GJNFS0AltCkY=;
        b=JBIRwgPQP8/lgR7mri/oFvHPO/1axmfCDLYRfyOfTN9WZOKXsV11D6edQTzxe6C7dG
         7uMSEm0jSEFg/aHIYZn2XDYqv/5u8B6LDtD9E2foOo8XJqpSZiDLi6PoVYHmDooONZao
         81fnlSQHkeYW5Mcq3yPDxGVTEa/GhYgwvYEuvnkg6URaKPzkPQe1vT8jJnpea8835u/B
         gOfwAfB4+w4laAHNLphwAPpTEVXXyXqIaLI2T7zFdRepNJOoRSjyTKQ0b0Au5EDVETxR
         Cmc+dfAVL0ryAsbrIQ7FQFRRKpAR0PFaAAlRiwBxPpF/y/adkyS0zJiSKxX2+aVb7fV3
         j0aA==
X-Gm-Message-State: AC+VfDzANBIwAlOVtCj4Qq6dNwvo48Fd0jWuufL9MDelGybHqjDJkUwy
        0aHfdcffX0Ih5xBMiV2XaPfZlA==
X-Google-Smtp-Source: ACHHUZ6VsFFYuiOtcvmekbYesmy2WkkSPy+SmgogYFK66VXaWe3UBLyCCmqvWDQLlcaV3532Bqv9Kw==
X-Received: by 2002:a17:906:4fc7:b0:96f:c988:941 with SMTP id i7-20020a1709064fc700b0096fc9880941mr8516840ejw.15.1685640441032;
        Thu, 01 Jun 2023 10:27:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id gt5-20020a170906f20500b0094ee700d8e4sm10846983ejb.44.2023.06.01.10.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 10:27:20 -0700 (PDT)
Message-ID: <21819d30-1df4-15a9-f458-32162f2a82b9@linaro.org>
Date:   Thu, 1 Jun 2023 19:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema
 format
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
References: <20230601080723.1556461-1-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601080723.1556461-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01/06/2023 10:07, Xu Yang wrote:
> Convert the binding to DT schema format.
> 


Thank you for your patch. There is something to discuss/improve.


e/bindings/phy/mxs-usb-phy.yaml
b/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml
> new file mode 100644
> index 000000000000..48b0e654e52c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.yaml

Filename matching compatibles, so for exmaple fsl,mxs-usbphy.yaml.

> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mxs-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS USB Phy Device
> +
> +maintainers:
> +  - Xu Yang <xu.yang_2@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-usbphy
> +          - fsl,vf610-usbphy
> +      - items:
> +          - enum:
> +              - fsl,imx28-usbphy
> +              - fsl,imx6ul-usbphy
> +              - fsl,imx6sl-usbphy
> +              - fsl,imx6sx-usbphy
> +              - fsl,imx6q-usbphy
> +          - const: fsl,imx23-usbphy
> +      - items:
> +          - enum:
> +              - fsl,imx7ulp-usbphy
> +              - fsl,imx6sll-usbphy
> +          - const: fsl,imx6ul-usbphy
> +          - const: fsl,imx23-usbphy
> +      - items:
> +          - const: fsl,imx8dxl-usbphy
> +          - const: fsl,imx7ulp-usbphy
> +          - const: fsl,imx6ul-usbphy
> +          - const: fsl,imx23-usbphy

I cannot find these in the old bindings. Please explain changes to
conversion in commit msg. So far you wrote that it is pure conversion.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  fsl,anatop:
> +    description:
> +      phandle for anatop register, it is only for imx6 SoC series
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +  fsl,tx-cal-45-dn-ohms:
> +    description:
> +      Resistance (in ohms) of switchable high-speed trimming resistor
> +      connected in parallel with the 45 ohm resistor that terminates
> +      the DN output signal.
> +    minimum: 35
> +    maximum: 54
> +    default: 45
> +
> +  fsl,tx-cal-45-dp-ohms:
> +    description:
> +      Resistance (in ohms) of switchable high-speed trimming resistor
> +      connected in parallel with the 45 ohm resistor that terminates
> +      the DP output signal.
> +    minimum: 35
> +    maximum: 54
> +    default: 45
> +
> +  fsl,tx-d-cal:
> +    description:
> +      Current trimming value (as a percentage) of the 17.78 mA TX
> +      reference current.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 79
> +    maximum: 119
> +    default: 100
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +

missing allOf narrowing anatop to imx6. Also interrupts and reg should
be narrowed to respective variants.

> +unevaluatedProperties: false

Instead additionalProperties: false.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usbphy1: usb-phy@20c9000 {
> +        compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> +        reg = <0x020c9000 0x1000>;
> +        interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;

Is 0 known flag? Use defines for it.

> +        fsl,anatop = <&anatop>;
> +    };
> +
> +...

Best regards,
Krzysztof

