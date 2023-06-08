Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFF3727978
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 10:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjFHIC0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 04:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbjFHIBw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 04:01:52 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3482D73;
        Thu,  8 Jun 2023 01:01:41 -0700 (PDT)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N0nvJ-1pukHf42j7-00wmk4; Thu, 08 Jun 2023 09:56:11 +0200
Message-ID: <0530fbbb-e345-8f8a-5332-526ddcd55eb2@i2se.com>
Date:   Thu, 8 Jun 2023 09:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT
 schema format
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
Content-Language: en-US
In-Reply-To: <20230608033642.4097956-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Nq+0TWCdrgpDH2um6CRSNcS2fr4wTbEqMBQn/QIxtYmaXTavW1F
 jxNefkBZfJ+LYif31trnodbC6ttq0oIq+S9gQiaQm+T2HAicbzWxM7BMzaX8ED8UGRH3jsp
 kESD/G+Xl42PqR2gKzc/scl96vuazJETyrSBPZZOvKQgi8ilaZQBU1X3c2EFRZwT9eyrz6h
 q3dETnR0LFNtCJjqo73uA==
UI-OutboundReport: notjunk:1;M01:P0:9d4ZceqcnmQ=;yUTpceyBDozynEpfkmRNPNOnq3v
 VybfyqG+QOY+dnKE3hMhRF6hwbbykxpgZGPai+UP6fYxRdZD49iwXTEeTuIGqj7nzDaiL4P90
 uXDLnzx2/Rlu88vfXWUIg1YHBq5ZDWBgx5hUJG0TITMHSwQ0S1Tr6SO9Fi+w7xAVnkfWkvvDQ
 o+RkF0dvOFbaWcfocSgy5+GH7QjKHUzX0I8cmF4BcZvCIS1gHzaVTtKggGFLIF9xXzBVIbehI
 xmRLQOhYFhLEr3/b+s9LR6XpgXkIgQ9/LvJD5GMzt1EBGvFUG5pZipn/K3OoyEFaBsSdtbXOK
 1XxN6hQljTaWVLIFZ2IhmkH/zLxJRjhkjrYbtPJLbNwAfWXlJcft72QJf1OXL29W6PcAuQd8C
 sdkPM+PvlJKNmBaCBtUqtqrU+ZhAQW8HKVVXCsmMsxpzDqe77ffeGon6sN1U+jfBtsIxAX7Ns
 67sOP5TtgTzciKg1U082pKg/F1jzIQImTl9GS5PFU24Jv5jYT+BQ/rtilih1DNHOne8QWYZC/
 +TuRbzv8mpucg4/0YL4ZkwdKmseO/nlzUTp4SI9X6HTna57K2+t2AnH/9+BpjL9dFWuCziNLR
 9EI3s8eZOZxBx9z4D+jpkZFcnep/GWnchV86wndag2TlgYIGjMEHCcCjvUSXvO/IguNjVoA57
 +oxoeZQN08bVBs5Xdd9C+exnhGsAcNiZoHtuRbblkg==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Xu,

Am 08.06.23 um 05:36 schrieb Xu Yang:
> Convert the binding to DT schema format. Besides, this also add other
> optional properties not contained in txt file.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>   - change filename to fsl,mxs-usbphy.yaml
>   - add other optional properties
>   - narrow fsl,anatop to imx6
>   - use additionalProperties
> ---
>   .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++++++
>   .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
>   2 files changed, 128 insertions(+), 33 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>   delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
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

on the one side the fsl,imx7ulp-usbphy has an individual compatible

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

on the other side this should be compatible to imx6ul. So at least one 
definition seems to be unnecessary.

Looking at usb/phy/phy-mxs-usb.c suggests me that fsl,imx7ulp-usbphy is 
not directly compatible to fsl,imx6ul-usbphy, because the platform data 
is different. So maybe the using dts* files should be fixed instead?

> +      - items:
> +          - const: fsl,imx8dxl-usbphy
> +          - const: fsl,imx7ulp-usbphy
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
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
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usbphy1: usb-phy@20c9000 {
> +        compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
> +        reg = <0x020c9000 0x1000>;
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
