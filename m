Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3A374ACDF
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 10:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjGGI1y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 04:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjGGI1x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 04:27:53 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F3490
        for <linux-usb@vger.kernel.org>; Fri,  7 Jul 2023 01:27:51 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e35791a83so1357854a12.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Jul 2023 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688718470; x=1691310470;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQJ5c3N6EKTWGPMRMDtrk/P3r+gReaLj0jfwbxhxXlo=;
        b=cGkm1kJmQKgYnpJp7pO9LwLaX4yJaKJlW8/1ct3ulwTnpxggvaxqIiNtBAvm1pTs1T
         6StKvLoVYnUb0XLqOSt1qY9Vq9btgK1a+y0eCoa07aKhCo1GcUDCub9itkkesa0VDD6G
         6HOqRr0ma4SS2HlnH9PE0txT23zfCmOrGn6rO/yFn6q/RxwdMNYfU56Vr3ToyNOAfHB4
         iBGhvi8cHfuWKlJan2vNnzhjDhGeM5Eo2inUsUu8oFPf8fFIb6x2wBtL4SLq9twpOMyn
         v6sl9ePg7+AwVtVXuLRGLnR2MjChiHIHKFVV8yZXC4wcr5GUZCYDFWApqiyDi+RP0FMu
         10jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718470; x=1691310470;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQJ5c3N6EKTWGPMRMDtrk/P3r+gReaLj0jfwbxhxXlo=;
        b=g17T6NccxraX5uIqWNJOQ5LvLjo98OX8aqx71KVTza6hrDd8fNvlnEVcAHWyri5YEO
         Hf+GxBtbZ1TEpu/dwl6ZmkM3RASdJwfH+bk2/vB7Ve+pDLleKJe7IusTjXsfayO9tJnt
         PQuu0X3T8Be1HtKXWnkVRTDg0/EGs0YqL5FKc86mefEWRKP8GYhwqVAHuPsohvdKaGTC
         zIoOzs92yYG0VkyMqFAnPMVO5l1/FGL+3CB3/bZQBOn9jrcFDKU9OXrbWgGPqqw6kxhb
         5dbe4N8hWZ+hjEiZFouc/zZ922RoSPfiibe5OapeVHnzYP5FFDsYQBAcK7uDLJ7R7BLw
         5ekg==
X-Gm-Message-State: ABy/qLatYEaXeAhtbRzmoIHHa37SrEC/uhCEi1PL1kcYz7msM2f4w3tg
        ++xZfGULyePn43w1vkbXD1GO7w==
X-Google-Smtp-Source: APBJJlG6YgCW6SEYlY65g4J/X5KQFAGjtpNOYA3+55v0jjRgAbsrPyMiFhRTbEelwi//SZW4Csk2TA==
X-Received: by 2002:a17:906:51cd:b0:993:d6e8:2386 with SMTP id v13-20020a17090651cd00b00993d6e82386mr382940ejk.16.1688718470204;
        Fri, 07 Jul 2023 01:27:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709063b8200b0098e42bef732sm1833038ejf.183.2023.07.07.01.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 01:27:49 -0700 (PDT)
Message-ID: <9f1bd0f1-d93e-243a-4622-721319fd1235@linaro.org>
Date:   Fri, 7 Jul 2023 10:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: Add HPE GXP UDCG Controller
Content-Language: en-US
To:     richard.yu@hpe.com, verdun@hpe.com, nick.hawkins@hpe.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230706215910.78772-1-richard.yu@hpe.com>
 <20230706215910.78772-2-richard.yu@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230706215910.78772-2-richard.yu@hpe.com>
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

On 06/07/2023 23:59, richard.yu@hpe.com wrote:
> From: Richard Yu <richard.yu@hpe.com>
> 
> Provide access to the two register regions for GXP Virtual EHCI
> controller through the hpe,gxp-udcg binding.

Thank you for your patch. There is something to discuss/improve.

> 
> Signed-off-by: Richard Yu <richard.yu@hpe.com>
> ---
>  .../devicetree/bindings/usb/hpe,gxp-udcg.yaml | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml b/Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml
> new file mode 100644
> index 000000000000..e6746374f97d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hpe,gxp-udcg.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/hpe,gxp-udcg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP USB Virtual EHCI controller

The word "virtual" in bindings pretty often raises questions, because we
describe usually real hardware, not virtual. Some explanation in
description would be useful.

> +
> +maintainers:
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +  - Richard Yu <richard.yu@hpe.com>
> +
> +description: |+

Drop |+

> +  The HPE GXP USB Virtual EHCI Controller implements 1 set of USB EHCI
> +  register and several sets of device and endpoint registers to support
> +  the virtual EHCI's downstream USB devices.
> +

If this is EHCI controller, then I would expect here reference to usb-hcd.

> +properties:
> +  compatible:
> +    enum:
> +      - hpe,gxp-udcg
> +
> +  reg:
> +    items:
> +      - description: UDC Global (UDCG) config controller
> +      - description: UDC Invidual config/interrupt controllers
> +
> +  reg-names:
> +    items:
> +      - const: udcg
> +      - const: udc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  hpe,vehci-downstream-ports:
> +    description: Number of downstream ports supported by the GXP

Why do you need this property in DT and what exactly does it represent?
You have one device - EHCI controller - and on some boards it is further
customized? Even though it is the same device?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 4
> +    minimum: 1
> +    maximum: 8
> +
> +  hpe,vehci-generic-endpoints:
> +    description: Number of generic endpoints supported by the GXP
> +    $ref: /schemas/types.yaml#/definitions/uint32

Same concerns.

> +    default: 16
> +    minimum: 1
> +    maximum: 16
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - hpe,vehci-downstream-ports
> +  - hpe,vehci-generic-endpoints
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    udcg@80400800 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof

