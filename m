Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7422A525EA4
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 11:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378796AbiEMJHL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 05:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378270AbiEMJHI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 05:07:08 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C4E5EDCF
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 02:07:07 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a5so6733552wrp.7
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tQhMv5wgd6P5e5ZPKnJXTqhF5TWWKVPkk+00hnqjRXs=;
        b=l8ZqzODxTeK4g2pTFG9ZfVYndijHwk3ii/cTxtexptHo590e35fS20iJwufNZdEh92
         2jnMvPNFHcft1cWJ2CbcRhtpHmMAmc8dJINengKkOOb5LUd5kbGum+qa3F+Uqhq9WxGl
         Y+4vNppopCVyTh/NMA/pHCUtSirsXcuUpHKpHmqmDSiZwaJhIZS9BkwROWE1xhfpXly0
         vSZYHS/eCsuDxwTwx4exGV1Fcw0wIFsgGORQL+NhF0F+GT4P72xlIFvgV2ehYcMbmDo+
         /yl0yWZV9wzV5KCbXL8PYSXGFZ+bnosYCEC8iFJe3AHNNRz4j1c+vziQGTi+0eTaY+OS
         xqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tQhMv5wgd6P5e5ZPKnJXTqhF5TWWKVPkk+00hnqjRXs=;
        b=dixcRNLMt7iBGsGHHY5NAXMIm2HjjYckcDcnku3ikX5VF5k2Mc4E7sjl3eNSLvMKqx
         ZhwS6hjERh4yfuCRCx5N9Q4E1Fg/nxu2tCvniyWpjpyn/sbZWe8MvJgVH3sHjP5qtka3
         BsvRYv4oqpMKRdplc2w4gKI/gcKOjwTM/FPR9n5ANl4jYPqbRlx5S1ltvp2w/9BpEPEr
         cx2J0djR/AXpDsFj10O0tmRz4T3ZkV3CRjVr7lKK6nDj+p7csk2SKtCJ6oYmzitrWpHu
         axbeeivpzaWlibJ2MWwxBWvt2aAd1t64ZlThUb2cstt3SlCx8eR7c2RI15r4QTKUVy1t
         NtYQ==
X-Gm-Message-State: AOAM530rchZaJSh8UaeTc/EjPFPGF6UXTFXfZM/8tDR5DqhtNMiF6uQT
        JQQkve+lgsqrTJPNkXwwbVaAxQ==
X-Google-Smtp-Source: ABdhPJy98bvsVxNsD1pSSLGnY3/tw/4jQw9PX2RSQLFiZDfcJuBduq4HwVBFKrcSH9BcOE5sNaEWQA==
X-Received: by 2002:a5d:4090:0:b0:20c:8b91:3b17 with SMTP id o16-20020a5d4090000000b0020c8b913b17mr2991905wrp.348.1652432826026;
        Fri, 13 May 2022 02:07:06 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s23-20020adfa297000000b0020c5253d8f4sm1662710wra.64.2022.05.13.02.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 02:07:05 -0700 (PDT)
Message-ID: <da78aaf6-c9ae-d591-fdc4-723f097ace2c@linaro.org>
Date:   Fri, 13 May 2022 11:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To:     Neal Liu <neal_liu@aspeedtech.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Felipe Balbi <balbi@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Li Yang <leoyang.li@nxp.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        BMC-SW@aspeedtech.com
References: <20220513065728.857722-1-neal_liu@aspeedtech.com>
 <20220513065728.857722-4-neal_liu@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513065728.857722-4-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/05/2022 08:57, Neal Liu wrote:
> Add device tree binding documentation for the Aspeed USB2.0 Device
> Controller.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  .../devicetree/bindings/usb/aspeed,udc.yaml   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,udc.yaml

Please name the file as first compatible, so "aspeed,ast2600-udc.yaml"


> 
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,udc.yaml b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
> new file mode 100644
> index 000000000000..d1d2f77d1c54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/aspeed,udc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 Facebook Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/aspeed,udc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED USB 2.0 Device Controller
> +
> +maintainers:
> +  - Neal Liu <neal_liu@aspeedtech.com>
> +
> +description: |+
> +  The ASPEED USB 2.0 Device Controller implements 1 control endpoint and
> +  4 generic endpoints for AST260x.
> +
> +  Supports independent DMA channel for each generic endpoint.
> +  Supports 32/256 stages descriptor mode for all generic endpoints.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

No child properties? No ports or any other devices? No usb-hcd.yaml?
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    udc: udc@1e6a2000 {

Node name: usb

> +            compatible = "aspeed,ast2600-udc";
> +            reg = <0x1e6a2000 0x300>;
> +            interrupts = <9>;
> +            clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_usb2bd_default>;
> +    };


Best regards,
Krzysztof
