Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8350F61E192
	for <lists+linux-usb@lfdr.de>; Sun,  6 Nov 2022 11:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiKFK0a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 05:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiKFK02 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 05:26:28 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14EC657B
        for <linux-usb@vger.kernel.org>; Sun,  6 Nov 2022 02:26:26 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id d3so12210560ljl.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Nov 2022 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ytmh4jbXfi9+Pd2tuj2AuZetiod5sILdkUhYFeo1RE=;
        b=jAp1SS54obPp+wR/9rCqhPETHwKqfwRhPo29/Pmn/B2OJxMlk7nb+3X4t28lyeK2f7
         RGZTWcII5kTt2q/sybyS4Uzey+EpSsWPzlRuO0gVoEpHoIDG/Njv6DIiXwSIDGL7fJ58
         G5KqFlYlI5Hj7J9++5jRfbl8au5q6vjC8NeMQ2QpkV0oV4r9vOb4syPachtHY10y/uzH
         xbKJdo+qIsAvAtztZ1WhI/CIJxfRCM2/y/k3R/XBpFEgPobvNPfKCe4jh4g6FsJvDfXQ
         Es349T71qwMk+k4KuaORwalm1sxKTALfA5mZNlGM4vu1fW35zZLXda5DMDmKRUsC+Zyz
         aEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ytmh4jbXfi9+Pd2tuj2AuZetiod5sILdkUhYFeo1RE=;
        b=Dme21irUNhbrsUesuJnEN/ccw+OAMAiW+m1FCU7i9WM5mWD0LVJZ77dPO2Lb8se9xU
         awh65FYdvlpZKp/X7Oo1fOG5MpD9U3TlRz+skRrnAAgolH90sRF5KUy+nXHqKm2dT3P7
         U5reeqKI7VFxuHDiy18UPXSNhi8MGbLus1x85A09kurMvEEsYDV9MWcxCZlq45mnD4eQ
         R2whA8//v8d6ouCXjPGwLFan3adbKJAMYKGsi8L7P2NR+F3n/6Gkpi1+6nrDHnSyKtXk
         FfLDOpKY7el7ehdi3BbEiHdIfdVh0FOrr9EMKVZku38M0I1Eg3eX7Gd/Xwf+N3RaSOHc
         +sxQ==
X-Gm-Message-State: ACrzQf0zZbVVDyKPBoBDQq/842zbiGtwfw1fiUj4poJVgk7URnWz9bJ0
        SsJ9MukI4r0JRLwvMixatMDhZA==
X-Google-Smtp-Source: AMsMyM42uXgzC4cj2TfFp9j6pGwXckTRPf/v1fSxwWikkVCziEdZD6wSPHYoRKKkqnaYGwa2dAm+ZA==
X-Received: by 2002:a2e:b6c3:0:b0:277:642d:5733 with SMTP id m3-20020a2eb6c3000000b00277642d5733mr10183917ljo.120.1667730384845;
        Sun, 06 Nov 2022 02:26:24 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512314800b004979e231fafsm640888lfi.38.2022.11.06.02.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 02:26:24 -0800 (PST)
Message-ID: <d057f811-5eb1-720a-d94d-7a989def80a0@linaro.org>
Date:   Sun, 6 Nov 2022 11:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] dt-bindings: usb: usb251xb: Convert to YAML schema
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org
References: <20221103203741.116730-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103203741.116730-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/11/2022 21:37, Marek Vasut wrote:
> Convert the usb251xb hub DT bindings from text to yaml schema so it is
> possible to validate DTs against the schema.
> 
> Adjust the example to describe two different hubs at different I2C bus
> addresses, to avoid I2C address collission in the example.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Thank you for your patch. There is something to discuss/improve.

> +  dynamic-power-switching:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      enable auto-switching from self- to bus-powered operation if the
> +      local power source is removed or unavailable (boolean)
> +
> +  oc-delay-us:
> +    enum: [100, 4000, 8000, 16000]
> +    description: |
> +      Delay time (in microseconds) for filtering the over-current sense
> +      inputs. Valid values are 100, 4000, 8000 (default) and 16000. If

Drop this sentence and instead add:

    default: 8000

> +      an invalid value is given, the default is used instead.


> +
> +  compound-device:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      indicate the hub is part of a compound device (boolean)
> +
> +  port-mapping-mode:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      enable port mapping mode (boolean)
> +
> +  led-usb-mode:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      led usb/speed indication mode selection (boolean, default is speed mode)
> +
> +  led-speed-mode:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      led usb/speed indication mode selection (boolean, default is speed mode)
> +
> +  string-support:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      enable string descriptor support (required for manufacturer, product
> +      and serial string configuration)
> +
> +  non-removable-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      Should specify the ports which have a non-removable device connected.
> +
> +  sp-disabled-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      Specifies the ports which will be self-power disabled
> +
> +  bp-disabled-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      Specifies the ports which will be bus-power disabled
> +
> +  sp-max-total-current-microamp:
> +    maximum: 100000
> +    description: |
> +      Specifies max current consumed by the hub from VBUS when
> +      operating in self-powered hub. It includes the hub silicon
> +      along with all associated circuitry including a permanently
> +      attached peripheral (range: 0 - 100000 uA, default 1000 uA)

Drop the range description.

default: 1000

and similarly in other places

> +
> +  bp-max-total-current-microamp:
> +    maximum: 510000
> +    description: |
> +      Specifies max current consumed by the hub from VBUS when
> +      operating in self-powered hub. It includes the hub silicon
> +      along with all associated circuitry including a permanently
> +      attached peripheral (range: 0 - 510000 uA, default 100000 uA)
> +
> +  sp-max-removable-current-microamp:
> +    maximum: 100000
> +    description: |
> +      Specifies max current consumed by the hub from VBUS when
> +      operating in self-powered hub. It includes the hub silicon
> +      along with all associated circuitry excluding a permanently
> +      attached peripheral (range: 0 - 100000 uA, default 1000 uA)
> +
> +  bp-max-removable-current-microamp:
> +    maximum: 510000
> +    description: |
> +      Specifies max current consumed by the hub from VBUS when
> +      operating in self-powered hub. It includes the hub silicon
> +      along with all associated circuitry excluding a permanently
> +      attached peripheral (range: 0 - 510000 uA, default 100000 uA)
> +
> +  power-on-time-ms:
> +    maximum: 510
> +    description: |
> +      Specifies the time it takes from the time the host initiates the
> +      power-on sequence to a port until the port has adequate power.
> +      The value is given in ms in a 0 - 510 range (default is 100ms).
> +
> +  swap-dx-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      Specifies the ports which will swap the differential-pair (D+/D-),
> +      default is not-swapped.
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      usb2512b@2c {

Generic node names, so "usb-hub"

> +        compatible = "microchip,usb2512b";
> +        reg = <0x2c>;
> +        reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
> +      };
> +
> +      usb2514b@2d {

usb-hub

> +        compatible = "microchip,usb2514b";
> +        reg = <0x2d>;
> +        vendor-id = /bits/ 16 <0x0000>;
> +        product-id = /bits/ 16 <0x0000>;
> +        string-support;
> +        manufacturer = "Foo";
> +        product = "Foo-Bar";
> +        serial = "1234567890A";
> +        /* correct misplaced usb connectors on port 1,2 */
> +        swap-dx-lanes = <1 2>;
> +      };
> +    };

Best regards,
Krzysztof

