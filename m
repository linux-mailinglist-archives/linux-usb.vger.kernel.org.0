Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C6F63A35E
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 09:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiK1Ira (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 03:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiK1Ir2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 03:47:28 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD5D17ABC
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 00:47:26 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id be13so16269606lfb.4
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 00:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXMY8f9iJDeQoKaNyCjgw4YZP5Yos8JV58NKPKjonWA=;
        b=INWnLSgoKorZYTLKYMFR0SCopMcQUb8vW+c8SCLMkc0NL95rTtpkyj2xYsncOheI7o
         JBaRFycHg/jwB3mN/13MkVibdO7w6IaJ7pnCrRdzbz3P5DOje8CZ09GGOIg6YvmLN3ws
         lgw87QYwpSNmpZn9/0VIBvaOYlUf8noaj/VbWjwdr1BP56VF51ns2rtj4vStbZglEqSk
         tYLiEMbaN6EtwozQ3W45bp28HoRV4OjIAEPGjQxTJUpgYVb0aeYuJR3/m8F05AnJiTnf
         bH6kE/boaq9iT4Gzqz3TJCdDvJoTm0bCFJT66I6CjWadlrhvW1NJ5FjWECNuOaCcru5b
         1qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXMY8f9iJDeQoKaNyCjgw4YZP5Yos8JV58NKPKjonWA=;
        b=1bFJ4HS7scuWXlDO52Wc0LJz3DAb5RUTM2WTkTzlfaNQIamPldVA/eJObMbVnlU0aL
         uyql0dJfXdLwBVQk3LyA7+V+aiZFk9bfX1q3TW+kQv7cB2GM7i9C7OYI9Qq0cnpOjrTw
         MNplc4CXCWS0EYyPKO/QbqgnPQMSHtOEYAQql3KpdQCEiM7+hLEFIRz0z5JpUFjgdt1C
         8C9gLiYQM+AnlH5NwMgoN0kBMdYSrBlLFcGnjPYTzPLRf6BN42eS6KqFdpETiDq21GLf
         mHfq/kzcPSXq/8N6KEyV5C+N2V1M+5Kra4OAns6y0z1Xcgv5miRH43YL4qJlYNEyIqRL
         SuzQ==
X-Gm-Message-State: ANoB5pmw5I2m4L0K/Z80+5hsQC9Dix3hiZs05y0vmHIluAvmji7hJJT7
        VyCJyFtKonKp/9CILXhqE7d4Ug==
X-Google-Smtp-Source: AA0mqf48HTjBl1q/N2bBerRjL5SpxOcN7KKcKyR6RessFHJh9U/pKAT/SphhbumIOtv4z0+d0iGbjA==
X-Received: by 2002:a05:6512:158c:b0:4a2:3ba8:fae9 with SMTP id bp12-20020a056512158c00b004a23ba8fae9mr16461067lfb.440.1669625245297;
        Mon, 28 Nov 2022 00:47:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b0049462af8614sm1637774lfr.145.2022.11.28.00.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:47:24 -0800 (PST)
Message-ID: <a7273cf2-56d0-4055-5050-44ecbc63cc4e@linaro.org>
Date:   Mon, 28 Nov 2022 09:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/6] dt-bindings: usb: Add binding for Genesys Logic
 GL850G hub controller
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221127073140.2093897-1-uwu@icenowy.me>
 <20221127073140.2093897-3-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127073140.2093897-3-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/11/2022 08:31, Icenowy Zheng wrote:
> The Genesys Logic GL850G is a USB 2.0 Single TT hub controller that
> features 4 downstream ports, an internal 5V-to-3.3V LDO regulator (can
> be bypassed) and an external reset pin.

Subject: drop second, redundant "binding for".

Few nits below.

> 
> Add a device tree binding for its USB protocol part. The internal LDO is
> not covered by this and can just be modelled as a fixed regulator.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> new file mode 100644
> index 000000000000..d1fe539db399
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/realtek,rts5411.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Genesys Logic GL850G USB 2.0 hub controller
> +
> +maintainers:
> +  - Icenowy Zheng <uwu@icenowy.me>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    items:

Drop items, you have only one item.

> +      - enum:
> +          - usb5e3,608
> +
> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO specifier for GRST# pin.

Drop "GPIO specifier for", so just "GRST# pin". No need to describe
DeviceTree syntax.

> +
> +  vdd-supply:
> +    description:
> +      phandle to the regulator that provides power to the hub.

Also drop "phandle to"

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub: hub@1 {
> +            compatible = "usb5e3,608";
> +            reg = <1>;
> +            reset-gpios = <&pio 7 2 GPIO_ACTIVE_LOW>;

Missing header.

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +        };
> +    };

Best regards,
Krzysztof

