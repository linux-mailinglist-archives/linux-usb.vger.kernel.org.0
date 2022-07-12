Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7282C5715DC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 11:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbiGLJi7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 05:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232486AbiGLJiz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 05:38:55 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43212AE8
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 02:38:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id p6so6408181ljc.8
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 02:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DPmmhi+2J1rxKC4UbiQ/cFtEMBdLVlyhY+s/IdsukL0=;
        b=Gh3DmoyEfQ/kog6KzHV6sC/jLz88DNk+G8JpIZFTDJfrqZu2ZFpy8kJhfvW5pZDwNp
         6pgPlBNjjCn/Tk+L35mpODgdbYUXDBm4W2UpqNRhfMuVXdEfHOQap2hyqnvgnPl9Rv59
         xrcieOWOfa+DPq76bL5fE5+gX6dREG7jjJY/fwgl3yHr+G+/peSzHtXN7MJgAKaY1qv7
         pXuHWua24lARqSOa6xuzXuPxPfeltvG6ji7abBeocfrdnkntNAa5Wdec1Bg08HFnm25K
         3qfXsBfmQ+k/VJTcnbEtLrZRk8YGeZEqTDY3EY9UXLFnCdv82/gc2xxRS5IHLz/kN+Wu
         DBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DPmmhi+2J1rxKC4UbiQ/cFtEMBdLVlyhY+s/IdsukL0=;
        b=CaNWlYL+VwXVDSC3uUA8k1X5U+Ohp3DkdSzEdJIqjRF4iAdmvvYQ+SV5TizwHAz6l1
         QWRDkDDbu7D4ErgPHA0tVWNFwsg8EXvRxS0PwZfNTK1lnHyVWL92fhAr1gyFf+ugna7v
         VIdgrcS3NCvgUSpSveoZiFSAAJ7ADHgsCTPQ3igEU8V7rQ9TLGoNxfhst+oM/zKneWoU
         EqxdA/itouZL/zKF/8U/TE3uXMU6gGjXcHXBjfM7DXisRav2hbZqBZAIV0LKQ7WCDxFW
         NIUepZyX20PhN12ft9YiDmbvh8eeV8ib5XyoTDhCsHVluuPbQMsu09ED6W2r8zfSYeEe
         IjaQ==
X-Gm-Message-State: AJIora+yvrNap7+DTxK9JHzAJEoWBOTBIJjUTisKQfyrAYbzUuW4dK8q
        COk70D/zW3LDozgfWC5nbuw2yQ==
X-Google-Smtp-Source: AGRyM1tchxD7VKZTXRAYOEvY2VFhTArisZH6aNEblZI+hYGxn8HJ7tYZDZ9eGchgeZadyJEiJhI9HA==
X-Received: by 2002:a2e:131a:0:b0:25d:68eb:cf6 with SMTP id 26-20020a2e131a000000b0025d68eb0cf6mr6071967ljt.267.1657618731025;
        Tue, 12 Jul 2022 02:38:51 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b00489db87cb7csm1362314lfr.280.2022.07.12.02.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:38:50 -0700 (PDT)
Message-ID: <a281de26-0900-94b1-c139-f7af27a57d42@linaro.org>
Date:   Tue, 12 Jul 2022 11:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v16 2/3] dt-bindings: usb: Add analogix anx7411 PD binding
Content-Language: en-US
To:     Xin Ji <xji@analogixsemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     bliang@analogixsemi.com, qwen@analogixsemi.com,
        jli@analogixsemi.com, Rob Herring <robh@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220712090534.2783494-1-xji@analogixsemi.com>
 <20220712090534.2783494-2-xji@analogixsemi.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712090534.2783494-2-xji@analogixsemi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/07/2022 11:05, Xin Ji wrote:
> Add analogix PD chip anx7411 device binding
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> v13 -> v14 :
>     1. Fix Robot compile error. Fix node name not correct.

Node name is still not correct.

>     2. Change HEX to lowercase.
>     3. Use "ports" property.
> v12 -> v13 :
>     1. Drop the quotes for "$id" and "$schema"
>     2. Remove "allOf" label
>     3. Change node name from "i2c1" to "i2c"
>     4. Change node name from "typec" to "usb-typec"
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../bindings/usb/analogix,anx7411.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> new file mode 100644
> index 000000000000..bbd071ba338f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/analogix,anx7411.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
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
> +    $ref: ../connector/usb-connector.yaml
> +    description:
> +      Properties for usb c connector.
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
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        anx7411@2c {

Use generic node name:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "analogix,anx7411";
> +            reg = <0x2c>;
> +            interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
> +            interrupt-parent = <&gpio0>;
> +
> +            typec_con: connector {
> +                compatible = "usb-c-connector";
> +                power-role = "dual";
> +                data-role = "dual";
> +                try-power-role = "source";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                        reg = <0>;
> +                        typec_con_ep: endpoint {
> +                            remote-endpoint = <&usbotg_hs_ep>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...


Best regards,
Krzysztof
