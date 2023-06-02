Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D35C7202E7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 15:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbjFBNPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 09:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbjFBNPv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 09:15:51 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067FBE50
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 06:15:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so2790525a12.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711720; x=1688303720;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoxSQc1MYJxdASn/j5T3GqnNf7NdGSBlZSYtkdHFO6w=;
        b=Bt13asXhpMupK2gnrz9Ad4xWSJmCylXAZBfJrKSm2ZseGZeiEi7XmT36b4LpdFkkJh
         iD3dcQG+FRSCbT/9Gu8L7EoFmjWu7cqnL1NkxEQoYaQ4vU4c2alz9teIsWevkytmOw+Z
         rFVtNFTPhG27EpYOx9DLfqC656dicazUWWETY08AerzgaGGNRmSmOlSIxCRLgZ2N3BM6
         xElYJe5u54hPeSd4YtPx0PXEbcntopMroJVmpvLLzB/nLEcbO3hvq4Nfo62K26IJ8sZN
         YXvNb3E8v+Iw4J6bBQaPI0G5vbMeiTpXE+3+ghBcpPYNBVBZWVV43RKViVXapYnkynXi
         AdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711720; x=1688303720;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoxSQc1MYJxdASn/j5T3GqnNf7NdGSBlZSYtkdHFO6w=;
        b=DBmXyu8RImxd60AuE4mQUKCT7kdGScL+xRJ9grMK4Y+facZmvFrYo46saI4e27u6m5
         RVrSgC8JQ1yLAUJKHe6cNZ79IpRavvjMEKP9kZWIJ4F/XUHBbAiG5LPoWwRTE/5ioPce
         yqKN2ETBjDGx2xRnFCG5GognRFvF/k6H9uNiUUEZtFu7eE2Elg3DGfx174Rx8qc4vUsY
         t3saW8vIq7POFL0tEvce+zEdzA5fila5whZMgib+wGPoV4UJ95x5xsn8RPM+cgzhGwKm
         h2ssY2Tc+TQtYNyqELjksQQ/bGOL1amJm2dOoQLaCd4zIGWJi2ifbwedx9IcPS7aVVMe
         Yt3Q==
X-Gm-Message-State: AC+VfDySTq9NKSbcUChZu2cyWJcPx2WOQJScc5VERTEHPUF021wcZZee
        S7gUG7h4Ke8+102Ihc/FOE4Aww==
X-Google-Smtp-Source: ACHHUZ5/PuNFNjq7JBB3HS5a933num/hOxjo3wal9RwgdiUS55cNFnhg/+vZM+ylE0qTXJkQ9P6MpA==
X-Received: by 2002:aa7:da42:0:b0:510:e80f:fa4e with SMTP id w2-20020aa7da42000000b00510e80ffa4emr2141577eds.1.1685711720149;
        Fri, 02 Jun 2023 06:15:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id g16-20020a056402181000b005149cb5ee2dsm662133edy.82.2023.06.02.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:15:19 -0700 (PDT)
Message-ID: <a1c109c9-9cf7-be76-df8f-74259559acb7@linaro.org>
Date:   Fri, 2 Jun 2023 15:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema
 format
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
References: <20230601080723.1556461-1-xu.yang_2@nxp.com>
Content-Language: en-US
In-Reply-To: <20230601080723.1556461-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Resending as my previous email probably got lost. If you got it twice,
apologies.

On 01/06/2023 10:07, Xu Yang wrote:
> Convert the binding to DT schema format.
> 


Thank you for your patch. There is something to discuss/improve.


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

