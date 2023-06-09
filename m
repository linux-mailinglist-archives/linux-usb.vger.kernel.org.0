Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC5872A068
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 18:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjFIQnu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 12:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjFIQns (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 12:43:48 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902673A8F
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 09:43:46 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so3426286a12.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Jun 2023 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686329025; x=1688921025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDvwJ9aeIkOA3iXyv0MPp32gXWxaPsXZJPItdpmp4w0=;
        b=xmogwDKhpfrIvfAo3aZ+ZANC+mmK04qhGYoKJuRWdwU1uR0hGSwc2J2In+93mOMrtd
         zZ+Nbc/v+/sPh7QcxiqXiyHYHNG98GlRdbbeZM3Tu+gtmnJ0mj/F6+zx4BZ9fjWikiBg
         WZOQbJL2nHrhLcAP+SPpyyC2LAWhhKokpqe6PIbn0wQHGKnrT+Y4f+nTZKiqTzQ/BAbM
         Vrv+4aQxAWSnQp4VFFtYaVkQ4F6gNFsmr8dYpgRXP+Spexn1EtUvG0ja2KOqV7h/+9/c
         AdscdOwVWDbAawYTuob/OUZ4D2H2BUVYmOKL4amljHDB2O+hIsQv3cn1qB2wTxe5wTx/
         WkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329025; x=1688921025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDvwJ9aeIkOA3iXyv0MPp32gXWxaPsXZJPItdpmp4w0=;
        b=R/XLAyk6SHlisi4F+/JyhKhEElN9mDJ5zIoHgjU3M9p5XCZgrC2Mcko5t/NThl/GxA
         3GaWpbTjtPaln71vM9blTPGIMY8AgATM9Uqw4BLZmx2SkByXB47qOWY89CzRJNwbl0PP
         vOSZrv52hD/IhT9XabyWVtYZtGU9YEzILAP2Ca8dEQZeMgUJxWDoCHY1fZh5AgT+El/1
         3B+83qoyHae5yh8YWWkoEKljVY/bd70dP6pGorJL8K4TtduBw+I0U6uwn0FFGWk3HM7y
         WPa3gBBIphr4Bt3TmAXTJSru2lZD4Lc6kZs3QpxPRDV95ecDEMb0K3Zz81BTVJXxRztw
         aQkg==
X-Gm-Message-State: AC+VfDz+UbvR0Hz79vi/V9dqtqW6zm/KmQydZb2JxZSioXpolzgtO/60
        E/uE8t5TVzt8VRfgoaTspW33HQ==
X-Google-Smtp-Source: ACHHUZ7gTP+FH0+rX1aclSuynljP+FikYYhxF2C0Ydmc0OQ2iOdaBhUrUhXrrGI3di08c96cueJ7Hw==
X-Received: by 2002:a17:907:9620:b0:978:8790:9103 with SMTP id gb32-20020a170907962000b0097887909103mr2808905ejc.70.1686329024821;
        Fri, 09 Jun 2023 09:43:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id dk17-20020a170906f0d100b0097886843f75sm1502034ejb.177.2023.06.09.09.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 09:43:44 -0700 (PDT)
Message-ID: <b8f35a9a-7553-92fa-6fdd-2522dc9bd36d@linaro.org>
Date:   Fri, 9 Jun 2023 18:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT
 schema format
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608033642.4097956-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/06/2023 05:36, Xu Yang wrote:
> Convert the binding to DT schema format. Besides, this also add other
> optional properties not contained in txt file.

Why ones do you add?

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - change filename to fsl,mxs-usbphy.yaml
>  - add other optional properties
>  - narrow fsl,anatop to imx6
>  - use additionalProperties
> ---
>  .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++++++
>  .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
>  2 files changed, 128 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> new file mode 100644
> index 000000000000..1b6b19fdf491
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS USB Phy Device
> +
> +maintainers:
> +  - Xu Yang <xu.yang_2@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-usbphy
> +          - fsl,vf610-usbphy
> +          - fsl,imx7ulp-usbphy

Keep the list sorted.

> +      - items:
> +          - enum:
> +              - fsl,imx28-usbphy
> +              - fsl,imx6ul-usbphy
> +              - fsl,imx6sl-usbphy
> +              - fsl,imx6sx-usbphy
> +              - fsl,imx6q-usbphy
> +          - const: fsl,imx23-usbphy
> +      - items:
> +          - const: fsl,imx6sll-usbphy
> +          - const: fsl,imx6ul-usbphy
> +          - const: fsl,imx23-usbphy
> +      - items:
> +          - const: fsl,imx7ulp-usbphy
> +          - const: fsl,imx6ul-usbphy
> +      - items:
> +          - const: fsl,imx8dxl-usbphy
> +          - const: fsl,imx7ulp-usbphy
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

You should list the items.

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2

You should list the items.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  fsl,anatop:
> +    description:
> +      phandle for anatop register, it is only for imx6 SoC series.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  phy-3p0-supply:
> +    description:
> +      One of USB PHY's power supply. Can be used to keep a good signal
> +      quality.
> +
> +  fsl,tx-cal-45-dn-ohms:
> +    description:
> +      Resistance (in ohms) of switchable high-speed trimming resistor
> +      connected in parallel with the 45 ohm resistor that terminates
> +      the DN output signal.
> +    minimum: 35
> +    maximum: 54
> +    default: 45
> +
> +  fsl,tx-cal-45-dp-ohms:
> +    description:
> +      Resistance (in ohms) of switchable high-speed trimming resistor
> +      connected in parallel with the 45 ohm resistor that terminates
> +      the DP output signal.
> +    minimum: 35
> +    maximum: 54
> +    default: 45
> +
> +  fsl,tx-d-cal:
> +    description:
> +      Current trimming value (as a percentage) of the 17.78 mA TX
> +      reference current.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 79
> +    maximum: 119
> +    default: 100
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          oneOf:
> +            - enum:
> +              - fsl,imx6sl-usbphy

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +              - fsl,imx6sx-usbphy
> +              - fsl,imx6sll-usbphy
> +              - fsl,imx6q-usbphy
> +              - fsl,vf610-usbphy
> +            - items:
> +              - const: fsl,imx6ul-usbphy
> +              - const: fsl,imx23-usbphy
> +    then:
> +      required:
> +        - fsl,anatop
> +
> +additionalProperties: false
> +


Best regards,
Krzysztof

