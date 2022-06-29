Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165D755FCE8
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 12:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbiF2KMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 06:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiF2KMi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 06:12:38 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BCC21258
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 03:12:37 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u12so31503102eja.8
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UQVs/vk3TXmyqHO0m20AymMZtMAnKjYQ1g4TBF6/kA4=;
        b=tnbsHSwQFfXRfiqLQMLSrwpXtVEZKHjoZImczR4HSgCINnV15+SS3BgKi+MZ9GTu91
         PwIy2TldEysT/aS+k6lpU5zR2HABIBWqHgagH8Dua908aU7MLwwpdtw8dlg9wHFlF8I7
         E0OyC++4PcPlsKCYhvi92uu3JJEzJEeNyAaO54vjoOP/ERc+XrTTDrhxhi9rBIj4qYKg
         jQqIiPMSGudU0xbc/8xyxGtCrCfNqZjLa7Jf2iVuxGs27tsnfFcH9RZq00A4Kkpm85P+
         nqn1rQnACnMurA89newiVOdC6RJH2z7xdzXMhtaYI1TIC9IB4bPAJ7iZxFhOXAOySxXV
         D2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UQVs/vk3TXmyqHO0m20AymMZtMAnKjYQ1g4TBF6/kA4=;
        b=kNT7/apNR8ud3XAm3TiW6p4eupdkjTS1PPr9g+m95h+0fY5HymQ53eRuvblaIyYMSE
         VV4cM/cxzMzKj2SLgRq+CM7rtanexPTX8omTBF2h7uT4Nyx5DZJUDMAq7d97uwvaqVQD
         CquVgqgSr+xLyFZayjYaEmXC9Gow/V/zs1ToZmA1pnLjceOPw5dCBpapghwUwL42ilXN
         uEYFkU3f792iXvfgvWtw/ZfkYyi04g2P7Y36JLUx15DkyQktgomUcw1YqECqxS3Tiy9d
         gpZX/jePGau632G4mjBCL7QX8ZuWC+ffwkYZedgF63N4gZNJphvI6RuBy27BE9mLYrhB
         +Xyw==
X-Gm-Message-State: AJIora9nMuMYpt1Qp893jM+kzaP1H7CNmTgC+enYcT4IFDadQbXg73NH
        +FmbKd0EVe5iE+OvfMLMTNuNUw==
X-Google-Smtp-Source: AGRyM1sjvx1wOPMp+bijYxCAGUlWcQdG9iZUFcyc5CG2oi0K7eSi07C87KiYcu9D21TT+wr8/GSRfA==
X-Received: by 2002:a17:906:5305:b0:712:388c:2bf5 with SMTP id h5-20020a170906530500b00712388c2bf5mr2513089ejo.559.1656497556306;
        Wed, 29 Jun 2022 03:12:36 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090613c500b00722fb3c99bcsm7531482ejc.203.2022.06.29.03.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:12:35 -0700 (PDT)
Message-ID: <f2b16788-32bd-a487-4087-66d876247fdb@linaro.org>
Date:   Wed, 29 Jun 2022 12:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v12 2/3] dt-bindings: usb: Add analogix anx7411 PD binding
Content-Language: en-US
To:     Xin Ji <xji@analogixsemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     bliang@analogixsemi.com, qwen@analogixsemi.com,
        jli@analogixsemi.com, Rob Herring <robh@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220628044843.2257885-1-xji@analogixsemi.com>
 <20220628044843.2257885-2-xji@analogixsemi.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628044843.2257885-2-xji@analogixsemi.com>
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

On 28/06/2022 06:48, Xin Ji wrote:
> Add analogix PD chip anx7411 device binding
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/usb/analogix,anx7411.yaml        | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> new file mode 100644
> index 000000000000..c5c6d5a9dc17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/analogix,anx7411.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop the quotes from both places.

> +
> +title: Analogix ANX7411 Type-C controller bindings
> +
> +maintainers:
> +  - Xin Ji <xji@analogixsemi.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - analogix,anx7411
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  connector:
> +    type: object
> +
> +    allOf:
> +      - $ref: ../connector/usb-connector.yaml

additionalProperties: false
(on the level of allOf)

> +
> +    properties:
> +      compatible:
> +        const: usb-c-connector
> +
> +      power-role: true
> +
> +      data-role: true
> +
> +      try-power-role: true
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c1 {

"i2c"

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec: anx7411@2C {

generic node name, so maybe usb-typec?

If fixed, keep Rob's Rb comment.

> +            compatible = "analogix,anx7411";
> +            reg = <0x2C>;
> +            interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +            interrupt-parent = <&gpio0>;
> +
> +            typec_con: connector {
> +                compatible = "usb-c-connector";
> +                power-role = "dual";
> +                data-role = "dual";
> +                try-power-role = "source";
> +
> +                port {

I think usb-c-connector requires "ports" node, doesn't it?

> +                    typec_con_ep: endpoint {
> +                        remote-endpoint = <&usbotg_hs_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...


Best regards,
Krzysztof
