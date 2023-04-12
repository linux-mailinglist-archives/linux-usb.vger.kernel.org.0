Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3D36DEEE3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 10:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjDLIp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 04:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjDLIpy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 04:45:54 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8A97EE1
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 01:45:34 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-504eccc8fc8so430286a12.2
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681289088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXiGiAF3mJm/6hgfCTKaagk5zrHngr0ItbqxTgvmii8=;
        b=Iby5Da+EYSzmdOPTZXODowMP7540ZuBWkvBKylh61H7VO+gDBx/NRyaAz1jg1IWt+u
         VV8aQWB4H+l5myKvLOKE5q9Xmu30gu4vFJ1hy93tqoLbv/cVaPQVVeDHxEQNmtVixfLL
         yvy7zcFnD16fIjbkq29v5qPM0NrKC97u30nUpO8uUFIiVSK0hbmqEl2opfQqsTYJ8DGu
         hZwnFk4GgzlbzX4/M3ksH1Au4pKYQMcuA2QQAngVM3CAs1N9JPF9GTUcEEToxXVB1oAc
         16cAtGLaCmQLH8w2BOmZ063P6ib4WMWqXeuCg/smmqOQ2mABEFIestObP/ZI0ksTIZUu
         KdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681289088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXiGiAF3mJm/6hgfCTKaagk5zrHngr0ItbqxTgvmii8=;
        b=M+gwoHMW1aG3hXEad1zMIwnmdirWvj/8bNQc4vVzb9ke/CPrBTkzNAtdOIypbg2kyg
         UnAS4nps6SCY1lJs7Iw91eDNhxs3C44Afs3JClWo4REZBBOsksqPixA5IBFrcr3LgQRJ
         I85zKdFP5Z9mGE52f5jzsq0MyIvJteQScW/IQhgrvU5hY0j4962PI4O7uIfJangr8m3A
         HWiijeayqXrKRYF0WqijKARqi3cCwxD4byggl7OiHFp7Cs1kSifZWASriX+BP3w29fjF
         znjY3cWHci77Q4I0uJMnw/vB7kpnCQ1tVtrfbCeptcXdMtYWARa3pBh4MoLM8FXQeprV
         uNsQ==
X-Gm-Message-State: AAQBX9czra3jFnayr1+pdg/OZBHlLbwYm3p8N0X2uSvJVV8o4epkatkv
        sbKyj37ZZEci+THeQOuS6UVR9CpqqU/c5DUEROI=
X-Google-Smtp-Source: AKy350aonQuINRVoZBdNIRp5k/+iTxbe085iISMQDF1/o+RSzs78iZn4aQ4I9E5uICTAMMyjmj6qNw==
X-Received: by 2002:a17:906:c78a:b0:947:eafc:a738 with SMTP id cw10-20020a170906c78a00b00947eafca738mr5025769ejb.60.1681288366167;
        Wed, 12 Apr 2023 01:32:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id rv12-20020a1709068d0c00b0094e5fd589f9sm427786ejc.19.2023.04.12.01.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:32:45 -0700 (PDT)
Message-ID: <a22dff0a-56e6-be1b-10b2-ce3b31f420c5@linaro.org>
Date:   Wed, 12 Apr 2023 10:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 5/7] dt-bindings: usb: Add StarFive JH7110 USB Bindings
 YAML schemas
Content-Language: en-US
To:     Minda Chen <minda.chen@starfivetech.com>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Mason Huo <mason.huo@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
 <20230406015216.27034-6-minda.chen@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406015216.27034-6-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/04/2023 03:52, Minda Chen wrote:
> StarFive JH7110 platforms USB have a wrapper module around
> the Cadence USBSS-DRD controller. Add binding information doc
> for that.

That's one of the most redundant subjects I saw. You basically used four
words for one meaning. These are not exactly synonyms, but they all are
either imprecise or meaning the same.

Subject: drop second/last, redundant "Bindings YAML schemas". The
"dt-bindings" prefix is already stating that these are bindings.



> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> ---
>  .../bindings/usb/starfive,jh7110-usb.yaml     | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> new file mode 100644
> index 000000000000..c8b30b583854
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller

What do you wrap here? Are you sure this is a wrapper? I think this is
just USB controller?

> +
> +maintainers:
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-usb
> +
> +  reg:
> +    items:
> +      - description: OTG controller registers
> +      - description: XHCI Host controller registers
> +      - description: DEVICE controller registers
> +
> +  reg-names:
> +    items:
> +      - const: otg
> +      - const: xhci
> +      - const: dev
> +
> +  interrupts:
> +    items:
> +      - description: XHCI host controller interrupt
> +      - description: Device controller interrupt
> +      - description: OTG/DRD controller interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: host
> +      - const: peripheral
> +      - const: otg
> +
> +  clocks:
> +    items:
> +      - description: lpm clock
> +      - description: stb clock
> +      - description: apb clock
> +      - description: axi clock
> +      - description: utmi apb clock
> +
> +  clock-names:
> +    items:
> +      - const: lpm
> +      - const: stb
> +      - const: apb
> +      - const: axi
> +      - const: utmi_apb
> +
> +  resets:
> +    items:
> +      - description: PWRUP reset
> +      - description: APB clock reset
> +      - description: AXI clock reset
> +      - description: UTMI_APB clock reset
> +
> +  reset-names:
> +    items:
> +      - const: pwrup
> +      - const: apb
> +      - const: axi
> +      - const: utmi
> +
> +  starfive,stg-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:

Same problem as for other patches.

> +        - description: phandle to System Register Controller stg_syscon node.
> +        - description: register offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +    description:
> +      The phandle to System Register Controller syscon node and the offset
> +      of STG_SYSCONSAIF__SYSCFG register for USB.
> +


Best regards,
Krzysztof

