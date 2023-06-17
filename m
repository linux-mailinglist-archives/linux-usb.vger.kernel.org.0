Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E783A733F97
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jun 2023 10:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346311AbjFQIW6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Jun 2023 04:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjFQIW5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Jun 2023 04:22:57 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8393C1FF6
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 01:22:55 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9786fc23505so213728666b.2
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686990174; x=1689582174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC+vEEL2KSY0Tw/5J6CHeL6CxIP7ysab2iFSmvj+s+s=;
        b=b3fk5m39rjiIWp4Ty7fDkLDZRuDMIe+upsBIc/IU/zzxmRtFtkqAua3LWydwLRCjki
         jAU7wx2OX3QrQ7YNKru65K7On+s0ZDzBKw7MsCSxUzt0rDb/0lfHRA9IBu6d6dR62RLc
         0zrtXYlWlzMHmE8ZqnuowucNX63QkKi7P+lQLtGX5Dl+p/OPwzN3E21KJ9j1VvwcYw9T
         xvRaXktp7S4CQCUX9z3vaaboIR1QJfnr9nmXc3UJuXQJd/JzdTdwGhkZ3t4zBXZjNMe9
         Ia+w4agT1My3V72zQ0/QGK/1rcyigEAcepuW+iFBd5LWtZaf7hReo9Xh3FglamA0f+0y
         Q2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686990174; x=1689582174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC+vEEL2KSY0Tw/5J6CHeL6CxIP7ysab2iFSmvj+s+s=;
        b=fCl++ppJWxWCnkkaPuaM53XCrnSI6acDHq6aD6Exm1AecEQW8udP4PDuIZde840B4L
         f6jGXnoRcHNJvkPhTzCFVrLNumEYVwcF5+/nhmmEZiWRCSP0UB1Bp2q51zwX/wsLMKXA
         /NFZ/7K5xrKNRK9sifiz7NBsee3pOT7M2o2jn4cXM3IELZ8gk+7jvhfUkp3MopAp055j
         YUi2peykzvC2wuOvq0/dMY6U3ymnEwx9ztmHQQhXNgKgkVRJrkIFr0KvjX0uybxr0NSR
         3Jnltnj5qMMIMumNCwkDpRqm209nBQjhCorCslwVclFAmMvpwgOpW2yGo1LF4qPwYxQS
         SU5g==
X-Gm-Message-State: AC+VfDw+7U9CCAf9LCAnEQ3niA+0FSY/osS7daSf/KK3+uV2cTxoHIwj
        rMxpr+bm1FUo3+ZlNhWx7WwvFA==
X-Google-Smtp-Source: ACHHUZ7LweH1B3zdgTpICOXYMpy7z6YXVQsrg7xvsGUXQUtCqWRVZpgvO6M+J+IVcxc/ROlQHQy8Lw==
X-Received: by 2002:a17:907:9305:b0:96f:8666:5fc4 with SMTP id bu5-20020a170907930500b0096f86665fc4mr3992221ejc.50.1686990173877;
        Sat, 17 Jun 2023 01:22:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z19-20020a170906815300b009871b3f961asm816874ejw.58.2023.06.17.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 01:22:53 -0700 (PDT)
Message-ID: <63698c0e-1e30-cb88-d71d-6bdf7f5ad4d7@linaro.org>
Date:   Sat, 17 Jun 2023 10:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/5] dt-bindings: phy: realtek: Add the doc about the
 Realtek SoC USB 2.0 PHY
Content-Language: en-US
To:     Stanley Chang <stanley_chang@realtek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Ray Chi <raychi@google.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230614092850.21460-1-stanley_chang@realtek.com>
 <20230614092850.21460-4-stanley_chang@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230614092850.21460-4-stanley_chang@realtek.com>
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

On 14/06/2023 11:28, Stanley Chang wrote:
> Add the documentation explain the property about Realtek USB PHY driver.
> 
> Realtek DHC (digital home center) RTD SoCs support DWC3 XHCI USB
> controller. Added the driver to drive the USB 2.0 PHY transceivers.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
> v3 to v4 change:
>     1. Remove the parameter and non hardware properties from dts.
>     2. Using the compatible data included the config and parameter
>        in driver.
> v2 to v3 change:
>     1. Broken down into two patches, one for each of USB 2 & 3.
>     2. Add more description about Realtek RTD SoCs architecture.
>     3. Removed parameter v1 support for simplification.
>     4. Revised the compatible name for fallback compatible.
>     5. Remove some properties that can be set in the driver.
> v1 to v2 change:
>     Add phy-cells for generic phy driver
> ---
>  .../bindings/phy/realtek,usb2phy.yaml         | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
> new file mode 100644
> index 000000000000..cfd77143475c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/realtek,usb2phy.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2023 Realtek Semiconductor Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/realtek,usb2phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek DHC SoCs USB 2.0 PHY
> +
> +maintainers:
> +  - Stanley Chang <stanley_chang@realtek.com>
> +
> +description:
> +  Realtek USB 2.0 PHY support the digital home center (DHC) RTD series SoCs.
> +  The USB 2.0 PHY driver is designed to support the XHCI controller. The SoCs
> +  support multiple XHCI controllers. One PHY device node maps to one XHCI
> +  controller.
> +
> +  RTD1295/RTD1619 SoCs USB
> +  The USB architecture includes three XHCI controllers.
> +  Each XHCI maps to one USB 2.0 PHY and map one USB 3.0 PHY on some
> +  controllers.
> +  XHCI controller#0 -- usb2phy -- phy#0
> +                    |- usb3phy -- phy#0
> +  XHCI controller#1 -- usb2phy -- phy#0
> +  XHCI controller#2 -- usb2phy -- phy#0
> +                    |- usb3phy -- phy#0
> +
> +  RTD1395 SoCs USB
> +  The USB architecture includes two XHCI controllers.
> +  The controller#0 has one USB 2.0 PHY. The controller#1 includes two USB 2.0
> +  PHY.
> +  XHCI controller#0 -- usb2phy -- phy#0
> +  XHCI controller#1 -- usb2phy -- phy#0
> +                               |- phy#1
> +
> +  RTD1319/RTD1619b SoCs USB
> +  The USB architecture includes three XHCI controllers.
> +  Each XHCI maps to one USB 2.0 PHY and map one USB 3.0 PHY on controllers#2.
> +  XHCI controller#0 -- usb2phy -- phy#0
> +  XHCI controller#1 -- usb2phy -- phy#0
> +  XHCI controller#2 -- usb2phy -- phy#0
> +                    |- usb3phy -- phy#0
> +
> +  RTD1319d SoCs USB
> +  The USB architecture includes three XHCI controllers.
> +  Each xhci maps to one USB 2.0 PHY and map one USB 3.0 PHY on controllers#0.
> +  XHCI controller#0 -- usb2phy -- phy#0
> +                    |- usb3phy -- phy#0
> +  XHCI controller#1 -- usb2phy -- phy#0
> +  XHCI controller#2 -- usb2phy -- phy#0
> +
> +  RTD1312c/RTD1315e SoCs USB
> +  The USB architecture includes three XHCI controllers.
> +  Each XHCI maps to one USB 2.0 PHY.
> +  XHCI controller#0 -- usb2phy -- phy#0
> +  XHCI controller#1 -- usb2phy -- phy#0
> +  XHCI controller#2 -- usb2phy -- phy#0
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - realtek,rtd1295-usb2phy
> +          - realtek,rtd1312c-usb2phy
> +          - realtek,rtd1315e-usb2phy
> +          - realtek,rtd1319-usb2phy
> +          - realtek,rtd1319d-usb2phy
> +          - realtek,rtd1395-usb2phy
> +          - realtek,rtd1395-usb2phy-2port
> +          - realtek,rtd1619-usb2phy
> +          - realtek,rtd1619b-usb2phy
> +      - const: realtek,usb2phy

That's not what your driver is saying... This patchset has random set of
changes.

I suggest to drop "realtek,usb2phy".

> +
> +  reg:
> +    items:
> +      - description: PHY data registers
> +      - description: PHY control registers
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  nvmem-cells:
> +    maxItems: 2
> +    description:
> +      Phandles to nvmem cell that contains the trimming data.
> +      If unspecified, default value is used.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: usb-dc-cal
> +      - const: usb-dc-dis
> +    description:
> +      The following names, which correspond to each nvmem-cells.
> +      usb-dc-cal is the driving level for each phy specified via efuse.
> +      usb-dc-dis is the disconnection level for each phy specified via efuse.
> +
> +  realtek,inverse-hstx-sync-clock:
> +    description:
> +      For one of the phys of RTD1619b SoC, the synchronous clock of the
> +      high-speed tx must be inverted. So this property is used to set the
> +      inverted clock.

Drop last sentence, it is redundant.

> +    type: boolean
> +
> +  realtek,driving-level:
> +    description:
> +      Each board or port may have a different driving capability. This
> +      will adjust the driving level value if the value is not the default.

I don't understand it. What is "driving capability" and if each port can
have it different, why do you need property for this?

You mention some default - why it is not expressed as "default: xx"?

What do the values mean?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +
> +  realtek,driving-compensate:
> +    description:
> +      For RTD1315e SoC, the driving level can be adjusted by reading the
> +      efuse table. Therefore, this property provides drive compensation for
> +      different boards with different drive capabilities.

if driving level can be read from nvmem, why do you have
realtek,driving-level in the first place? Don't you miss here some allOf
making this constrained per variant?

"Therefore" means "for that reason" or "as a consequence". How is this
property a consequence of reading driving level from efuse? Is it then
mutually exclusive with "realtek,driving-level"? But your schema does
not express it.

> +    $ref: /schemas/types.yaml#/definitions/int32
> +    minimum: -8
> +    maximum: 8
> +
> +  realtek,disconnection-compensate:
> +    description:
> +      This adjusts the disconnection level compensation for the different
> +      boards with different disconnection level.
> +    $ref: /schemas/types.yaml#/definitions/int32
> +    minimum: -8
> +    maximum: 8
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb_port0_usb2phy: usb-phy@13214 {
> +        compatible = "realtek,rtd1319d-usb2phy", "realtek,usb2phy";
> +        reg = <0x13214 0x4>, <0x28280 0x4>;
> +        #phy-cells = <0>;
> +
> +        realtek,driving-level = <0xe>;

Why this example is so empty? You have at least 6 more properties which
should be shown here.

Best regards,
Krzysztof

