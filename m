Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2FE572859
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbiGLVQ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiGLVQ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:16:27 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5532BEB5A
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:16:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w2so11358158ljj.7
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yNdXTNqSoBlf8fUHUAGckkR13j3v9qziPb7ne3GL+wM=;
        b=gcYm0VSy3YrEltE79SSKm5Y5QOpFqR2X9KExOppyjqbTbYykTOfQQnS25KpzeycsTx
         Xjrg6+75hjq/+UvIwBkox3Fzi7OCDfNH59ou2ge0uy1AHrtWFDgkUtRRFNaCSs6uO5te
         zykDcrglFXs27Wepw+JG5MJhcfG1Ndm7Vgx4iTOk7VJIWUq97ktFjXn4eScmrNpZlZd2
         Pkfl8JkR73CS00NdMg8fPUiCTwWnzSqRMOa0JcAm7gYZ2GZufaNbhdlPzIxzAmFBpX67
         VHhQev/o9n9meAzid/L/kqqM/BUrci1DU6H5iFq6rmatZogYZjuzPlND8aDNmq08JhNq
         mXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yNdXTNqSoBlf8fUHUAGckkR13j3v9qziPb7ne3GL+wM=;
        b=XND21zCl0Z3GbkkpmnHoJMAvm6XFOxwXZIIYVyKVdZGL0YKoVgpWkTSGX0he/iQRTW
         wZdV3b5hiasNgDekCh8h2dD1gRXq/kPPnHckuzax9l9ugPDalZUwYB919wkl0NguiqKp
         +kwgenZ3/Tk5eKpDOvJR9IQ2KpygX5fvYP4c2nzfynQQScQTsUVDdychd2CkXIouDEQY
         Z3jl15HKC+j1KjSge9i+PJNIk3UtOdwnNa8BEjTeMEreAl7fisY8LafiEjVY3Ioan5z6
         CeDcCmCXM3nKoUE9WG/thc1MbC02ABAuRTZU+Bq7CQdc5BWjLA90ZfoMKBiAyVnFG+kd
         2qvA==
X-Gm-Message-State: AJIora8hzysKjxjOCSec+FtxSjKiaMj2Dw6DHvZ96AC38e8J/JDEG63n
        aCPC77rawMAdJCUdIcbwj9TMjgGhsDs/JA==
X-Google-Smtp-Source: AGRyM1tQuNo5xx8FI5K3taOjbf6GPHXx2mOkeQktt27dTnGsdtA+9D2+BZHIwHpDR3DyBY4CHXF5PQ==
X-Received: by 2002:a05:651c:4cf:b0:25d:6b69:1b84 with SMTP id e15-20020a05651c04cf00b0025d6b691b84mr7234254lji.291.1657660584064;
        Tue, 12 Jul 2022 14:16:24 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b00489e38c4fc4sm1274301lfs.276.2022.07.12.14.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:16:23 -0700 (PDT)
Message-ID: <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
Date:   Tue, 12 Jul 2022 23:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/07/2022 17:06, Alexander Stein wrote:
> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> 
> This initial version of the binding only describes USB related aspects
> of the USB8041, it does not cover the option of connecting the controller
> as an i2c slave.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Well, this is essentially a ripoff of
> Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
> replaced, reset-gpio added and example adjusted.
> IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
> to rename bindings files? I guess a common onboard-usb-hub.yaml matching
> the driver seens reasonable. Any recommendations how to proceed?
> 
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> new file mode 100644
> index 000000000000..9a49d60527b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for the TI USB8041 USB 3.0 hub controller
> +
> +maintainers:
> +  - Matthias Kaehlcke <mka@chromium.org>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    items:

No items. It's just one item.

> +      - enum:
> +          - usb451,8140
> +          - usb451,8142
> +
> +  reg: true
> +
> +  reset-gpio:

reset-gpios

> +    maxItems: 1
> +    description:
> +      GPIO specifier for GSRT# pin.

Combine maxItems and above into:
items:
 - description: GPIO specifier for GSRT# pin.

> +
> +  vdd-supply:
> +    description:
> +      phandle to the regulator that provides power to the hub.

s/phandle to the regulator that provides//
and create some nice sentence from left-over, like "VDD power supply to
the hub"


> +
> +  peer-hub:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'

No quotes.

> +    description:
> +      phandle to the peer hub on the controller.
> +
> +required:
> +  - peer-hub
> +  - compatible
> +  - reg

Messed order. Use same as they appear in properties, so
compatible+reg+peer-hub.

But another question - why "peer-hub"? I remember some discussion about
naming, so was peer preferred over companion?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* 2.0 hub on port 1 */
> +        hub_2_0: hub@1 {
> +          compatible = "usb451,8142";
> +          reg = <1>;
> +          peer-hub = <&hub_3_0>;
> +          reset-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;

reset-gpios


Best regards,
Krzysztof
