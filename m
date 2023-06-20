Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47464737070
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 17:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbjFTP31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 11:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbjFTP3Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 11:29:25 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84447C7;
        Tue, 20 Jun 2023 08:29:24 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-77e35128efdso102075039f.1;
        Tue, 20 Jun 2023 08:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687274964; x=1689866964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqJZkvuzvPgo2scZXFsGYob4H+PHCpMScUqNkfyiy4o=;
        b=XJEaa7E/5JOVa/9Zwh7ez5/u3XoAmfoJCQP+w9U//wXbv3GzAm3iIC9iGnlmtmvjSZ
         nNLA933GeWnn58QFL1XZk9hLkiAKyPLQERllD9dUZLLGk2UHCjOVLZkVJQs7oHestiWF
         WAQwZqkyXmw4tOmZwbtQoxoBI4OjQuLDE1JKf4LR6H4Th6+5QjoSUMLFeCTdfm+ohuBg
         HZ8dxBxQSrH5n9YU7+tszefr7uRYIsrWPMB6OSU6ThrcK7TrjFoOgF+Bnscl9GRK39dp
         HUJ3I8KsJpYeYwcmy6JPsDoDn01NOBAJ4E5Wew+fohuis+bb1cRXRnwBLh93IpvZF5Qu
         nTzw==
X-Gm-Message-State: AC+VfDw2hLtCnFUh9HCCuS/43yos7VWVSfNvQhP5Rh9qJGNcrI8i3d3M
        XgKOgOFNvhTdsKmdcV7tJg==
X-Google-Smtp-Source: ACHHUZ5nSRRKkIdQG/Zz+onC/2Filko74KvoJC06NM12cPl40tsZXvJx7rIbZCzo7blL68IYeqs8FA==
X-Received: by 2002:a05:6e02:14c:b0:33b:848:378b with SMTP id j12-20020a056e02014c00b0033b0848378bmr4106998ilr.8.1687274963697;
        Tue, 20 Jun 2023 08:29:23 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p7-20020a0566380e8700b0042673fd54c0sm685365jas.134.2023.06.20.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:29:22 -0700 (PDT)
Received: (nullmailer pid 3628745 invoked by uid 1000);
        Tue, 20 Jun 2023 15:29:21 -0000
Date:   Tue, 20 Jun 2023 09:29:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT
 schema format
Message-ID: <20230620152921.GA3626802-robh@kernel.org>
References: <20230613083445.1129137-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613083445.1129137-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 13, 2023 at 04:34:44PM +0800, Xu Yang wrote:
> Convert the binding to DT schema format. Besides, this also add clocks,
> '#phy-cells', phy-3p0-supply and power-domains properties which are not
> contained in txt file due to txt file lack updates.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - change filename to fsl,mxs-usbphy.yaml
>  - add other optional properties
>  - narrow fsl,anatop to imx6
>  - use additionalProperties
> Changes in v3:
>  - fix indentation
>  - add clocks property to example
> Changes in v4:
>  - remove [fsl,imx7ulp-usbphy, fsl,imx6ul-usbphy]
>  - limit item of reg and interrupts to 1
>  - sort enum items
>  - modify commit message
> ---
>  .../bindings/phy/fsl,mxs-usbphy.yaml          | 125 ++++++++++++++++++
>  .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
>  2 files changed, 125 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt

This should be applied by the PHY maintainers, but they weren't Cc'ed.

> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> new file mode 100644
> index 000000000000..cc9f2bc7e6fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -0,0 +1,125 @@
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
> +          - fsl,imx7ulp-usbphy
> +          - fsl,vf610-usbphy
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
> +          - const: fsl,imx8dxl-usbphy
> +          - const: fsl,imx7ulp-usbphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
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
> +                - fsl,imx6q-usbphy
> +                - fsl,imx6sl-usbphy
> +                - fsl,imx6sx-usbphy
> +                - fsl,imx6sll-usbphy
> +                - fsl,vf610-usbphy
> +            - items:
> +                - const: fsl,imx6ul-usbphy
> +                - const: fsl,imx23-usbphy
> +    then:
> +      required:
> +        - fsl,anatop
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    usbphy1: usb-phy@20c9000 {
> +        compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> +        reg = <0x020c9000 0x1000>;
> +        clocks = <&clks IMX6QDL_CLK_USBPHY1>;
> +        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +        fsl,anatop = <&anatop>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> deleted file mode 100644
> index 70c813b0755f..000000000000
> --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -* Freescale MXS USB Phy Device
> -
> -Required properties:
> -- compatible: should contain:
> -	* "fsl,imx23-usbphy" for imx23 and imx28
> -	* "fsl,imx6q-usbphy" for imx6dq and imx6dl
> -	* "fsl,imx6sl-usbphy" for imx6sl
> -	* "fsl,vf610-usbphy" for Vybrid vf610
> -	* "fsl,imx6sx-usbphy" for imx6sx
> -	* "fsl,imx7ulp-usbphy" for imx7ulp
> -	* "fsl,imx8dxl-usbphy" for imx8dxl
> -  "fsl,imx23-usbphy" is still a fallback for other strings
> -- reg: Should contain registers location and length
> -- interrupts: Should contain phy interrupt
> -- fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
> -
> -Optional properties:
> -- fsl,tx-cal-45-dn-ohms: Integer [35-54]. Resistance (in ohms) of switchable
> -  high-speed trimming resistor connected in parallel with the 45 ohm resistor
> -  that terminates the DN output signal. Default: 45
> -- fsl,tx-cal-45-dp-ohms: Integer [35-54]. Resistance (in ohms) of switchable
> -  high-speed trimming resistor connected in parallel with the 45 ohm resistor
> -  that terminates the DP output signal. Default: 45
> -- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a percentage) of
> -  the 17.78mA TX reference current. Default: 100
> -
> -Example:
> -usbphy1: usb-phy@20c9000 {
> -	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> -	reg = <0x020c9000 0x1000>;
> -	interrupts = <0 44 0x04>;
> -	fsl,anatop = <&anatop>;
> -};
> -- 
> 2.34.1
> 
