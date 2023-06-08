Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF67727EEE
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 13:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbjFHLjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 07:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjFHLjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 07:39:18 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F450E6C;
        Thu,  8 Jun 2023 04:39:09 -0700 (PDT)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDQRy-1qHdZz01wM-00AVpQ; Thu, 08 Jun 2023 13:38:53 +0200
Message-ID: <6901b02a-fbf5-d4c5-69d5-174298ad8ff5@i2se.com>
Date:   Thu, 8 Jun 2023 13:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
To:     Xu Yang <xu.yang_2@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <0530fbbb-e345-8f8a-5332-526ddcd55eb2@i2se.com>
 <DB7PR04MB450531C695BF4326220A8ADE8C50A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <DB7PR04MB450531C695BF4326220A8ADE8C50A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:WemzV1Ls2lVnz43mzWba/xzakp7lccit0lGaDQSyllX558oKiCS
 4HmAqD3ERVuvCtSO9/YkYfI48IDT/C3lFPJrxACvP9FC1bxBDQYMec14jnsBrLtDW1z19E2
 27nhsnY6ojQSNvGGHY8UJPwG6gUDHRP+VpqQjHSyqy7z8QNts8rzF0xCeuFTwDbAblKE4i2
 YDP1aCxBXGgeTujZZLelQ==
UI-OutboundReport: notjunk:1;M01:P0:yFvJcOyGQPs=;k71yeynlfstm4//ZkW1Q6+uoYxY
 BQyxhPHRrylaWqEgdnzfgbT1DcApq19NcfC3Df1RpDGK0z7dnlq/Iqms3catY6BtulREBObbN
 /V3YE6ClNbQPF+ZShkUMwbF4Mz/UCx7pVm24zPYKK4R+FNTTpnfEDaxA6FzUxWLMwSwyFWW7w
 hV4i9BKeOEmvGK5t5MSGWGdpObGf1zb/5CxnNg9Ibxr95RXCNkMWMQMCmpPZ9wXULSdle8WIa
 S//8d94qKTX8lFEobIwiJwQeJ1odajHzcAyTNxOiGIjdA9AAf18Wtky4Ebow31GAZi98xNFoL
 axVfjYrf1zsUji69NIPD3lLHl1Y//qhHkraqCYDjjO02hN6ezyHrB9wvTRG7G2Dyw0CgDAij+
 Eyiq80zTDlM/UHVTz9Vp10po5Dll1JiYbETOWi1JcXAGQf2r8uB8kFqJ2LGjwjb6rXq8pZNGt
 UzZTDlTalNRlcmg0ffih5as6Nae13GNHBPvfFQ+absUgsLiXaf+GtA+i+X0lF0gh+402KWysi
 Vf3KAJegqjDYZseiBS3Lw3PjNrkiu+feZZDl0/Dxwws5aL6qMjvp3kfo4IL+aAXY74LbQiV57
 eVRa6axM9+dNR82r0a+MEjNFx6ebBJqMyg5WFx6KODKaMUikMxntheGxk+HSa2KBS7/b9x8De
 1clEcejZHhXlz1pwG6FXI3UnCQQxatJM8qJ/CaO3Sg==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Xu,

Am 08.06.23 um 12:30 schrieb Xu Yang:
> Hi Stefan,
> 
>> -----Original Message-----
>> From: Stefan Wahren <stefan.wahren@i2se.com>
>> Sent: Thursday, June 8, 2023 3:56 PM
>> To: Xu Yang <xu.yang_2@nxp.com>; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org
>> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
>> imx@nxp.com>; linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
>> Subject: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the
>> message using the 'Report this email' button
>>
>>
>> Hi Xu,
>>
>> Am 08.06.23 um 05:36 schrieb Xu Yang:
>>> Convert the binding to DT schema format. Besides, this also add other
>>> optional properties not contained in txt file.
>>>
>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>
>>> ---
>>> Changes in v2:
>>>    - change filename to fsl,mxs-usbphy.yaml
>>>    - add other optional properties
>>>    - narrow fsl,anatop to imx6
>>>    - use additionalProperties
>>> ---
>>>    .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++++++
>>>    .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
>>>    2 files changed, 128 insertions(+), 33 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>>>    delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>> b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>>> new file mode 100644
>>> index 000000000000..1b6b19fdf491
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
>>> @@ -0,0 +1,128 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id:
>> http://devicetree.org/schemas/phy/fsl,mxs-
>> usbphy.yaml%23&data=05%7C01%7Cxu.yang_2%40nxp.com%7C5df4d949f975469013b408db67f5d46c%7C686ea1d3bc2b4c
>> 6fa92cd99c5c301635%7C0%7C0%7C638218077754788407%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo
>> iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=8Sz8tK9GVQqE6ywVLpxPB8YDFQvygZvj6s1NjZk
>> hbzU%3D&reserved=0
>>> +$schema: http://devicetree.org/meta-
>> schemas%2Fcore.yaml%23&data=05%7C01%7Cxu.yang_2%40nxp.com%7C5df4d949f975469013b408db67f5d46c%7C686ea1
>> d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638218077754788407%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
>> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=iaX16VnSJnvU%2F0tcnRgsdnTxMsD89
>> 5r4WquGsCFt9Qo%3D&reserved=0
>>> +
>>> +title: Freescale MXS USB Phy Device
>>> +
>>> +maintainers:
>>> +  - Xu Yang <xu.yang_2@nxp.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - fsl,imx23-usbphy
>>> +          - fsl,vf610-usbphy
>>> +          - fsl,imx7ulp-usbphy
>>
>> on the one side the fsl,imx7ulp-usbphy has an individual compatible
>>
>>> +      - items:
>>> +          - enum:
>>> +              - fsl,imx28-usbphy
>>> +              - fsl,imx6ul-usbphy
>>> +              - fsl,imx6sl-usbphy
>>> +              - fsl,imx6sx-usbphy
>>> +              - fsl,imx6q-usbphy
>>> +          - const: fsl,imx23-usbphy
>>> +      - items:
>>> +          - const: fsl,imx6sll-usbphy
>>> +          - const: fsl,imx6ul-usbphy
>>> +          - const: fsl,imx23-usbphy
>>> +      - items:
>>> +          - const: fsl,imx7ulp-usbphy
>>> +          - const: fsl,imx6ul-usbphy
>>
>> on the other side this should be compatible to imx6ul. So at least one
>> definition seems to be unnecessary.
>>
>> Looking at usb/phy/phy-mxs-usb.c suggests me that fsl,imx7ulp-usbphy is
>> not directly compatible to fsl,imx6ul-usbphy, because the platform data
>> is different. So maybe the using dts* files should be fixed instead?
> 
> The imx7ulp and imx6ul only has minor difference. In general, imx7ulp
> is compatilbe with imx6ul. We don't need to modify both dts file and
> this doc here. So the validation of existing dtb would not fail.

The fact that according to the schema imx6ul needs fsl,anatop and 
imx7ulp doesn't need it, let me think that the difference is not really 
minor.

Nevertheless the compatibles for imx7ulp-usbphy looks fishy to me, 
because there are two ways to describe imx7ulp-usbphy ( with and without 
fsl,imx6ul-usbphy ). From my understanding there should be only one way.

In case you are just concerned about validation issues in this series: 
it's acceptable to convert txt file to YAML and fix outstanding 
validation issues within the series via separate patch. In my opinion 
the goal is to get a proper DT schema and not just to avoid DT 
validation warnings.

Best regards

> 
> Thanks,
> Xu  Yang
> 
>>
>>> +      - items:
>>> +          - const: fsl,imx8dxl-usbphy
>>> +          - const: fsl,imx7ulp-usbphy
>>> +
>>> +  reg:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  '#phy-cells':
>>> +    const: 0
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  fsl,anatop:
>>> +    description:
>>> +      phandle for anatop register, it is only for imx6 SoC series.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +
>>> +  phy-3p0-supply:
>>> +    description:
>>> +      One of USB PHY's power supply. Can be used to keep a good signal
>>> +      quality.
>>> +
>>> +  fsl,tx-cal-45-dn-ohms:
>>> +    description:
>>> +      Resistance (in ohms) of switchable high-speed trimming resistor
>>> +      connected in parallel with the 45 ohm resistor that terminates
>>> +      the DN output signal.
>>> +    minimum: 35
>>> +    maximum: 54
>>> +    default: 45
>>> +
>>> +  fsl,tx-cal-45-dp-ohms:
>>> +    description:
>>> +      Resistance (in ohms) of switchable high-speed trimming resistor
>>> +      connected in parallel with the 45 ohm resistor that terminates
>>> +      the DP output signal.
>>> +    minimum: 35
>>> +    maximum: 54
>>> +    default: 45
>>> +
>>> +  fsl,tx-d-cal:
>>> +    description:
>>> +      Current trimming value (as a percentage) of the 17.78 mA TX
>>> +      reference current.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 79
>>> +    maximum: 119
>>> +    default: 100
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          oneOf:
>>> +            - enum:
>>> +              - fsl,imx6sl-usbphy
>>> +              - fsl,imx6sx-usbphy
>>> +              - fsl,imx6sll-usbphy
>>> +              - fsl,imx6q-usbphy
>>> +              - fsl,vf610-usbphy
>>> +            - items:
>>> +              - const: fsl,imx6ul-usbphy
>>> +              - const: fsl,imx23-usbphy
>>> +    then:
>>> +      required:
>>> +        - fsl,anatop
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    usbphy1: usb-phy@20c9000 {
>>> +        compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
>>> +        reg = <0x020c9000 0x1000>;
>>> +        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>>> +        fsl,anatop = <&anatop>;
>>> +    };
>>> +
>>> +...
>>> diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-
>> usb-phy.txt
>>> deleted file mode 100644
>>> index 70c813b0755f..000000000000
>>> --- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
>>> +++ /dev/null
>>> @@ -1,33 +0,0 @@
>>> -* Freescale MXS USB Phy Device
>>> -
>>> -Required properties:
>>> -- compatible: should contain:
>>> -     * "fsl,imx23-usbphy" for imx23 and imx28
>>> -     * "fsl,imx6q-usbphy" for imx6dq and imx6dl
>>> -     * "fsl,imx6sl-usbphy" for imx6sl
>>> -     * "fsl,vf610-usbphy" for Vybrid vf610
>>> -     * "fsl,imx6sx-usbphy" for imx6sx
>>> -     * "fsl,imx7ulp-usbphy" for imx7ulp
>>> -     * "fsl,imx8dxl-usbphy" for imx8dxl
>>> -  "fsl,imx23-usbphy" is still a fallback for other strings
>>> -- reg: Should contain registers location and length
>>> -- interrupts: Should contain phy interrupt
>>> -- fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
>>> -
>>> -Optional properties:
>>> -- fsl,tx-cal-45-dn-ohms: Integer [35-54]. Resistance (in ohms) of switchable
>>> -  high-speed trimming resistor connected in parallel with the 45 ohm resistor
>>> -  that terminates the DN output signal. Default: 45
>>> -- fsl,tx-cal-45-dp-ohms: Integer [35-54]. Resistance (in ohms) of switchable
>>> -  high-speed trimming resistor connected in parallel with the 45 ohm resistor
>>> -  that terminates the DP output signal. Default: 45
>>> -- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a percentage) of
>>> -  the 17.78mA TX reference current. Default: 100
>>> -
>>> -Example:
>>> -usbphy1: usb-phy@20c9000 {
>>> -     compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
>>> -     reg = <0x020c9000 0x1000>;
>>> -     interrupts = <0 44 0x04>;
>>> -     fsl,anatop = <&anatop>;
>>> -};
