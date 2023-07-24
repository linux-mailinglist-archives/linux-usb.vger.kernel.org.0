Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10DB775EC2B
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 09:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjGXHEo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 03:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjGXHEm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 03:04:42 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FF1133
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:04:40 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so10481120a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690182278; x=1690787078;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BnI7Q+4yw6+Z1QsdbFCjMZJuIk0S1yM6lQ+dTWG+bVY=;
        b=oFRBRV+e8Y/1GMGUalQeZ8ynScg1pxsFkjUl1Id0XqRLT9gzB1JUMgrzDpIBzhr9uK
         Ie7LEBjLzgAEz3u5KlizMJNhKWyIesAU8u5JO3iCWSIaJv2sHsA0RDYr3O2IZf1c/L6O
         gb+dUsj/Mt+25J4FLZxLNvECG6LUJN1cwl0ZLANi90v2YW+0yypreCt66Ih4P3LEEl8w
         FHahHHJ3r6hJzBFrhs97btXxpeOC3ByTuK2xETtWYywjFHXJ1v6Mj25nw6K2hYKiJ7Ci
         wRohVY3Eh/9V6BYEQGhwjOKW3f3OVfKZk8VfkJLrlRh0oc3nAxCaIdrXNwOh1kEDANx2
         sumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690182278; x=1690787078;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BnI7Q+4yw6+Z1QsdbFCjMZJuIk0S1yM6lQ+dTWG+bVY=;
        b=Jpd0nI87S0IbbFwTyIueu5W1uwSa1HxwBPidqZm2JyttS4r8rfZcHBPdK3wrm6MQTM
         e4SKPV7Ul93jVxlb3IlVhR49r9V9NyEshpbAUm5+a6kiqRgX/gnZvG3dE3e76NJ9OkSj
         YSqBXqhD2VU906ZYs8gj8YfC+9+Y2ULkpZN0czxHT6MX8IhoDPZzG3BKMEOgd2ulPycM
         dhRmaOrCDOav+gJxwEaIFAxbIprkYid+DEWnjw3ovYuhjyY2qzablYwSZq33wTeE9ArY
         xi6qmu2xlAbrQUvCnS5bzsRqANkmPj14HbPt/DUf5u0nwq+SVNVKp/LtwAD4aXu9q7qS
         y18w==
X-Gm-Message-State: ABy/qLZqEXz9M2+wJiU4puHX800rI8JzkzEHR/RaQNCuCZM92+1GJGCF
        iYL6/aJftb6hND/fzHs6rgEvrc/iTDgIkNgrZ5EpHQ==
X-Google-Smtp-Source: APBJJlEr9XbF2zEoV+DCoZBAEmLbxcPrw/9GpNugz7ENquW1MAgvZ4niHKqwkUjGuLAYUZXNkEqdzQ==
X-Received: by 2002:a17:906:1090:b0:997:e9a3:9c4f with SMTP id u16-20020a170906109000b00997e9a39c4fmr8787535eju.30.1690182278467;
        Mon, 24 Jul 2023 00:04:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id bt16-20020a170906b15000b00993159ce075sm6209126ejb.210.2023.07.24.00.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:04:37 -0700 (PDT)
Message-ID: <70a823a4-54d1-18a3-3d77-45564d88e8f1@linaro.org>
Date:   Mon, 24 Jul 2023 09:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Content-Language: en-US
To:     adrian.ho.yin.ng@intel.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        p.zabel@pengutronix.de
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
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

On 24/07/2023 08:36, adrian.ho.yin.ng@intel.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> 
> Existing binding intel,keembay-dwc3.yaml does not have the required
> properties for Intel SoCFPGA devices.
> Introduce new binding description for Intel SoCFPGA USB controller
> which will be used for current and future SoCFPGA devices.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> ---
>  .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> new file mode 100644
> index 000000000000..e36b087c2651
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/intel,socfpga-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel SoCFPGA DWC3 USB controller
> +
> +maintainers:
> +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - intel,agilex5-dwc3
> +      - const: intel,socfpga-dwc3

So you did not even wait for my answer? What happened here with this
compatible? I asked you to change file name, not add intel,socfpga-dwc3.
Again - why using different style for Agilex? Which style is correct?

> +
> +  reg:
> +    description: Offset and length of DWC3 controller register

What happened here? It wasn't here before.

> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Controller Master/Core clock
> +      - description: Controller Suspend clock
> +
> +  ranges: true
> +
> +  resets:
> +    description: A list of phandles for resets listed in reset-names

Neither was this useless description, it is obvious.

> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: dwc3
> +      - const: dwc3-ecc
> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: snps,dwc3.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/reset/altr,rst-mgr.h>
> +
> +    usb@11000000 {
> +          compatible = "intel,agilex5-dwc3", "intel,socfpga-dwc3";

Still wrong indentation....

> +          reg = <0x11000000 0x100000>;
> +          ranges;
> +          clocks = <&clkmgr 54>,
> +                   <&clkmgr 55>;
> +          resets = <&rst USB0_RESET>, <&rst USB1_RESET>;
> +          reset-names = "dwc3", "dwc3-ecc";
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +
> +          usb@11000000 {
> +                compatible = "snps,dwc3";
> +                reg = <0x11000000 0x100000>;
> +                interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +                dr_mode = "host";
> +          };
> +    };
> +

Drop trailing line.

Instead of resending just after your reply, allow for reviewer to respond.

Best regards,
Krzysztof

