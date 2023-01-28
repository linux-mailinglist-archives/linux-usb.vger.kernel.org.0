Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C30067F71D
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jan 2023 11:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjA1K3H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Jan 2023 05:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbjA1K3F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Jan 2023 05:29:05 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BB9126DC
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 02:29:03 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso6693205wmb.0
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9C/J+Fu3WqzJtiT/Bo9AU5JcV2nkWAcR65XhuY/8zw=;
        b=lNrrz/c/JVMyM4ROuoxS/NwPT8/yTzKYcZHFlzMfbUTBQf2O0wtrQz6PUvvUUkUwL9
         9mrNdIi1zBXoHjxn38l6SNcbeyTRzdYNUWH51oY1kZh/i+Q01JpM1sJdzg59dmmDPHFa
         C1fL0sQubPt8I7oGzgiRq+Ri5jsyaYGnpm3hM4WisBBadYan8mNJaxE0UWnTNAEQjHVq
         vXrWgxNzZZIFm8ph28yS4nqyO99cO9jqyxIWuSTINkrwHE8pkyNzRwgyhrq7luFJfv/Z
         zlStTXUOsWGnOJLFeFQUl6c/ULyYRqhorUHPnBzVQRvmjPeuJR8/cjOVF1taYCKJtSiN
         +NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9C/J+Fu3WqzJtiT/Bo9AU5JcV2nkWAcR65XhuY/8zw=;
        b=R5+FsWw74g1kuE+s/yB23p+/HCAwy7GvkkxcaHIWCifprLzS+Z9n8uHGHYtL0so2Df
         IVEw0w3cZCXztBfr1WhApd/uj89N0FdIeLnS0eYuSsyOUay8TMUqGwjF3xjeYGwf3+W8
         WZjWc49r22I8UiCrh3jz5WKDaqK2ji3dxsYv76BV7JhlX6DzkycjixHwCHliVaixe8Vv
         WIiIzELdVz+YhU9eS/891qiTN6LGE4Q4AWTli+SiRP29odBTpPiVlH2dhSBEv1SAyzuc
         BEKnW7aFcfdZ+wSO08PqUFCxZyGq+2x8fQDQD/e+1gOdunQiIEsYOJZ3yjTSX7xGESxD
         EkYQ==
X-Gm-Message-State: AO0yUKU58cKXuemjTRfHOd11jduBvpxkIewhYtxqs+y+HMdzHuv77SaJ
        pwsoTej30xCSaCrN0cBYm4qiOg==
X-Google-Smtp-Source: AK7set8cK8kqpsUJRM/HfLEaaDOiJu5mN5ZMXZ0mrE5DBGvRGp39c1OqOXSVXOX5P4o7MT8uM0YaiA==
X-Received: by 2002:a05:600c:458a:b0:3dc:45a7:2b8a with SMTP id r10-20020a05600c458a00b003dc45a72b8amr2207868wmo.10.1674901742156;
        Sat, 28 Jan 2023 02:29:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b003dab77aa911sm12108357wms.23.2023.01.28.02.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:29:01 -0800 (PST)
Message-ID: <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
Date:   Sat, 28 Jan 2023 11:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
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
References: <20230127151041.65751-1-jonathanh@nvidia.com>
 <20230127151041.65751-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127151041.65751-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/01/2023 16:10, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V9: added 'unevaluatedProperties' and 'additionalProperties'
> V8: removed 'additionalProperties'
> V7: updated example to use 'typec' for the node name
> V6: no changes
> V5: updated subject and updated binding to use 'firmware-name'.
> V4: no changes
> V3: fix additionalProperties warning on new schema
> V2: based on the review comments. Fix some addressed issues on

Thanks, this is looking good, although few more questions popped up
while comparing it with other bindings.

(...)

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

How many connectors do you expect/support? 1111 is valid? I guess you
wanted only [01]?

> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

I would assume that at least one connector is required (oneOf: required:).

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
> +
> +      typec@8 {
> +        compatible = "cypress,cypd4226";
> +        reg = <0x08>;
> +        interrupt-parent = <&gpio_aon>;
> +        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
> +        firmware-name = "nvidia,jetson-agx-xavier";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        connector@0 {
> +          compatible = "usb-c-connector";
> +          reg = <0>;
> +          label = "USB-C";
> +          data-role = "dual";
> +          ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +              reg = <0>;
> +              endpoint {
> +                remote-endpoint = <&usb_role_switch0>;
> +              };
> +            };
> +          };
> +        };
> +      };
> +    };

Best regards,
Krzysztof

