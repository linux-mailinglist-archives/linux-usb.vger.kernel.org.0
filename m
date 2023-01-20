Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571CA674F86
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 09:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjATIdA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 03:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjATIc5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 03:32:57 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10F0EFA2
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 00:32:55 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r2so4140721wrv.7
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 00:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkaAqFgb4it3mvCkd7k8jnjh+xQ0D3T2hXPLsObnTt0=;
        b=pZAEN5+ecunvFCuVUgLp7l0Ll+h/58xzFsashP6zVAw0a/+r6g3O1n4ZCdq75PBB8L
         BUDI1ToDwEk1v624ldzp+ahYK6JROS1Jb5g0s8NydrszlhqEMaex9Si2W2uvFMlbA5pC
         LvuRJqqZcd/55TcgXhNt5VtMtH9o7O6ZdU9ErOPX66Uc7LBg9fzkn6BG3iVcdtZJttSR
         UnXqpRvAmxbTvPT2ogprhtY/vjFsnr+6MFvArpfPk6nqqSF9VdsiJxAc751BcRh2XUyM
         8o5W4WrGRi9KVqT016O5VDPu+yhcKI6H5y8OxwtlRkQVC9CaXf28yqvRnbJyMuJq74F5
         QaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkaAqFgb4it3mvCkd7k8jnjh+xQ0D3T2hXPLsObnTt0=;
        b=IXkkXHZe4XqTnTVVa+Yq6Jlk0GyaoH+/kESm7omm/BosAvJCbnlKUl5fXVVR8rV0CT
         hvfTTcypqJJlwITCk3TtnhPLR4nw3w24g0mKb8yRv1HAQ2bzdatDX5Fy7cEkpye0Nwy6
         druAsBhdvI+XaJCqbyUnBhMvkvHkLGWWIlnLl5NL3gz/AO9r+YNTMjpEKiCNMA5nCBjW
         JaIPaZiyK4UK2orwQqqoc15Rw9ZaGYyTkuujD6X06/UBd8eTSwRMcTL+ljYP/UvhV7rp
         CEG1ajk3MtB02I5RcYDnIvLjR//JJ41+l8ybkAxDD7P2Wulufu4RLGyOEA/ulOBz9u5o
         oINQ==
X-Gm-Message-State: AFqh2kpuJDQq84swDUtBNqa49EM99gATAbSOzLWfdCfKmMoe0Ql0DqWa
        2EcoVKDBV39wA1sMy3SXb7Wr2Q==
X-Google-Smtp-Source: AMrXdXvProHmH8bClV23f+0uvhBTkuhYKijSSiN/0rHM+HjEEdUwyEGeElL57QkmwgdfdhcvLE/+zA==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr9651179wrb.3.1674203574136;
        Fri, 20 Jan 2023 00:32:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d4148000000b002bdd21f25ebsm20901473wrq.71.2023.01.20.00.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:32:53 -0800 (PST)
Message-ID: <2789cf94-60b4-7e35-50f8-e21b564a1dfb@linaro.org>
Date:   Fri, 20 Jan 2023 09:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
 <20230119121639.226729-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119121639.226729-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/01/2023 13:16, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V5 -> V6: no changes
> V4 -> V5: updated subject and updated binding to use 'firmware-name'.
> V3 -> V4: no changes
> V2 -> V3: fix additionalProperties warning on new schema
> V1 -> V2: based on the review comments. Fix some addressed issues on
> 
>  .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..5d87c9f09913
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress cypd4226 Type-C Controller
> +
> +maintainers:
> +  - Wayne Chang <waynec@nvidia.com>
> +
> +description:
> +  The Cypress cypd4226 is a dual Type-C controller that is controlled
> +  via an I2C interface.
> +
> +properties:
> +  compatible:
> +    const: cypress,cypd4226
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reg:
> +    const: 0x08
> +
> +  interrupts:
> +    items:
> +      - description: cypd4226 host interrupt
> +
> +  firmware-name:
> +    enum:
> +      - nvidia,gpu
> +      - nvidia,jetson-agx-xavier
> +    description: |
> +      The name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nvidia,gpu" for the NVIDIA RTX product series
> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
> +
> +patternProperties:
> +  '^connector@[0-1]+$':
> +    $ref: /schemas/connector/usb-connector.yaml#

On this level:
unevaluatedProperties: false

> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra194-gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <2>;

Drop, does not look like relevant or used here.

> +
> +      ucsi-ccg@8 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "cypress,cypd4226";
> +        reg = <0x08>;
> +        interrupt-parent = <&gpio_aon>;
> +        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
> +        firmware-name = "nvidia,jetson-agx-xavier";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ccg_typec_con0: connector@0 {
> +          compatible = "usb-c-connector";
> +          reg = <0>;
> +          label = "USB-C";
> +          data-role = "dual";
> +          port {
> +            ucsi_ccg_p0: endpoint {
> +              remote-endpoint = <&usb_role_switch0>;
> +            };
> +          };
> +        };
> +      };
> +    };

Best regards,
Krzysztof

