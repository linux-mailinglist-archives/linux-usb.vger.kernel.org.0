Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4756184B7
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 17:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbiKCQdf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 12:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbiKCQcn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 12:32:43 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B581B9D6
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 09:32:29 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id a27so1548332qtw.10
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rX0HVR+cynesEOUQKKCl4qFi3aDxfpi5C+jbe+y7r5U=;
        b=d5aE8R/WJuFED5RD73DHx8j2z6kFOAAUI9D03MCNfvXYbtatgfwmvJ5MjKuSqDr59W
         DWU0eLDiXBI8dWnpe6iINYTJ9Nt2N/d5OfQUx5yQfdkRendA3wiRMZ1WUHgLJYV/c5cN
         v39yTJ+0ZPQb/zMefLs9hBi1nubQyZtOc0Ide1Y/QLd6CwZmaih4DdjumdyeQwNHCe9L
         FDQIjtE4wRIw0V8W8uT8im3srEeQXQNuZeVoOIvsut3hRBNfY91J561ZdBLA8Z+DMsa0
         GOvWrp8UYF3AaJQ+uy5ZBKXr83UhQeoYjza5iFC1QbVbijH4FTyjl+uXi7zvM2fPKynC
         bVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rX0HVR+cynesEOUQKKCl4qFi3aDxfpi5C+jbe+y7r5U=;
        b=5veJqXyMIEdRV3ijIuqpYI5ZGbB2TIGpi6cSRPnJqbcmyiNiyywbDmP0FrJDn7qKNL
         FgLk552CrEOcmMUmm6Y5BvZDwUg8jfcQWw+gKqyxxlvmFHqU6YnCFVRH9K1sXWOK8N0u
         tnni5FdZ0NFJbc88zEXxtyyPvXitvCDReG1gCdTWO+BlHqUGYTMnt0M0F0l+hQe7iwp4
         BiL3rlVLt/ds03WLE3526vsHHjmTbZ8RBde2PcJTjYZJQYpuTq3ECrFC4VRgmo7zG+pv
         XnyM/zI40oWPECjXln38WbjG+gqoTRJnvPewg0bgHk8YcTql2wTMpVKMXz8sBjaJ8A0v
         9Svg==
X-Gm-Message-State: ACrzQf36vKVJn6HStCBnW1p1aJcNFIqMbjuiQA8z8hgqW+29U5anhreL
        c7sE061b73/gyd0sCk+xkcmULg==
X-Google-Smtp-Source: AMsMyM5rb+cmVvgfW/TTQt3S2fEFt+1+z8TXz+2VjlUx1TETHaTkNQ1nXdkfc9ekJs46sHLhw3MUFg==
X-Received: by 2002:ac8:5f11:0:b0:39c:b7c7:e227 with SMTP id x17-20020ac85f11000000b0039cb7c7e227mr24972728qta.196.1667493148118;
        Thu, 03 Nov 2022 09:32:28 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id i18-20020a05620a405200b006fa84082b6dsm523356qko.128.2022.11.03.09.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:32:27 -0700 (PDT)
Message-ID: <4acf1dd3-afb3-b69a-5c03-05c74c4ad69c@linaro.org>
Date:   Thu, 3 Nov 2022 12:32:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 4/7] dt-bindings: usb: hpe,gxp-vuhc: add binding for
 gxp vEHCI
Content-Language: en-US
To:     richard.yu@hpe.com, verdun@hpe.com, nick.hawkins@hpe.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221103160625.15574-1-richard.yu@hpe.com>
 <20221103160625.15574-5-richard.yu@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103160625.15574-5-richard.yu@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/11/2022 12:06, richard.yu@hpe.com wrote:
> From: Richard Yu <richard.yu@hpe.com>
> 
> Create documentation for the hpe,gxp-vuhc binding to support access to
> the gxp virtual EHCI controller.
> 

Previous comments apply.

> Signed-off-by: Richard Yu <richard.yu@hpe.com>
> ---
>  .../devicetree/bindings/usb/hpe,gxp-vuhc.yaml | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/hpe,gxp-vuhc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/hpe,gxp-vuhc.yaml b/Documentation/devicetree/bindings/usb/hpe,gxp-vuhc.yaml
> new file mode 100644
> index 000000000000..1411a2550092
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hpe,gxp-vuhc.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/hpe,gxp-vuhc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP Virtual Universal Host Controller (vUHC)

This is getting confusing.

If it is EHCI, you miss usb-hcd.yaml reference. But in fact you describe
at syscon, maybe to avoid proper hardware description.

That does not look right.

> +
> +maintainers:
> +  - Richard Yu <richard.yu@hpe.com>
> +  - Jean-Marie Verdun <verdun@hpe.com>
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: hpe,gxp-vuhc
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    vuhc@80400000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +      compatible = "hpe,gxp-vuhc", "syscon";
> +      reg = <0x80400000 0x80>;
> +    };

Best regards,
Krzysztof

