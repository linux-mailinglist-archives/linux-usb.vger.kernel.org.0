Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C0519FA4B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 18:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgDFQji (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 12:39:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27759 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729527AbgDFQji (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 12:39:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586191177; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=p0XtF/zhQFXWOlfW1YKM6MOQlK8lTjQ5wMkXZkRGCnY=; b=BrxzIhzVOa8UKyaxbR3jwpyICwlC5DoHM0zTm4kPGkmMIzIY4Ynt0QOrpYoCzUUkZ73/AIfa
 dIfWMjUeLNEBJM2W/FvBcd7BMl+nQmXedhV4b9MpNcNiscdPejMWsPzyUCH5sOT9JtrVACN4
 mMqzejB0aiN9oOm7i9eHVLOS6uI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8b5b3d.7f0a1db726c0-smtp-out-n05;
 Mon, 06 Apr 2020 16:39:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67E3DC4478C; Mon,  6 Apr 2020 16:39:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 01CCEC433D2;
        Mon,  6 Apr 2020 16:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01CCEC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1585206368-685-1-git-send-email-sanm@codeaurora.org>
 <1585206368-685-2-git-send-email-sanm@codeaurora.org>
 <20200404171700.GA10096@bogus>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <5e2eb0a4-ed70-4212-fc70-6ee850507a7e@codeaurora.org>
Date:   Mon, 6 Apr 2020 22:09:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200404171700.GA10096@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

On 4/4/2020 10:47 PM, Rob Herring wrote:
> On Thu, Mar 26, 2020 at 12:36:07PM +0530, Sandeep Maheswaram wrote:
>> Convert USB DWC3 bindings to DT schema format using json-schema.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> ---
>>   .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 --------------
>>   .../devicetree/bindings/usb/qcom,dwc3.yaml         | 158 +++++++++++++++++++++
>>   2 files changed, 158 insertions(+), 104 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> new file mode 100644
>> index 0000000..0f69475
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> @@ -0,0 +1,158 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
>> +
>> +maintainers:
>> +  - Manu Gautam <mgautam@codeaurora.org>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,msm8996-dwc3
>> +          - qcom,msm8998-dwc3
>> +          - qcom,sdm845-dwc3
>> +      - const: qcom,dwc3
>> +
>> +  reg:
>> +    description: Offset and length of register set for QSCRATCH wrapper
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    enum: [ 1, 2 ]
>> +
>> +  "#size-cells":
>> +    enum: [ 1, 2 ]
>> +
>> +  power-domains:
>> +    description: specifies a phandle to PM domain provider node
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description:
>> +      A list of phandle and clock-specifier pairs for the clocks
>> +      listed in clock-names.
>> +    items:
>> +      - description: System Config NOC clock.
>> +      - description: Master/Core clock, has to be >= 125 MHz
>> +          for SS operation and >= 60MHz for HS operation.
>> +      - description: System bus AXI clock.
>> +      - description: Mock utmi clock needed for ITP/SOF generation
>> +          in host mode. Its frequency should be 19.2MHz.
>> +      - description: Sleep clock, used for wakeup when
>> +          USB3 core goes into low power mode (U3).
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cfg_noc
>> +      - const: core
>> +      - const: iface
>> +      - const: mock_utmi
>> +      - const: sleep
>> +
>> +  assigned-clocks:
>> +    items:
>> +      - description: Phandle and clock specifier of MOCK_UTMI_CLK.
>> +      - description: Phandle and clock specifoer of MASTER_CLK.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 2
> Need to drop this as it is redundant. Soon this will generate an error.
Will do in next version.
>> +    items:
>> +      - description: Must be 19.2MHz (19200000).
> Sounds like a constraint:
>
> - const: 19200000
>
>> +      - description: Must be >= 60 MHz in HS mode, >= 125 MHz in SS mode.
> - minimum: 60000000
>    maximum: ?

Tried  as below but facing errors

assigned-clock-rates:
     items:
       - const: 19200000
       - minimum: 60000000
         maximum: 150000000

Errors

linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: 
usb@a6f8800: assigned-clock-rates: Additional items are not allowed 
([150000000] was unexpected)
linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: 
usb@a6f8800: assigned-clock-rates:0: [19200000] is too short
linux-next/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: 
usb@a6f8800: assigned-clock-rates: [[19200000], [150000000]] is too long

>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: The interrupt that is asserted
>> +          when a wakeup event is received on USB2 bus.
>> +      - description: The interrupt that is asserted
>> +          when a wakeup event is received on USB3 bus.
>> +      - description: Wakeup event on DM line.
>> +      - description: Wakeup event on DP line.
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: hs_phy_irq
>> +      - const: ss_phy_irq
>> +      - const: dm_hs_phy_irq
>> +      - const: dp_hs_phy_irq
>> +
>> +  qcom,select-utmi-as-pipe-clk:
>> +    description:
>> +      If present, disable USB3 pipe_clk requirement.
>> +      Used when dwc3 operates without SSPHY and only
>> +      HS/FS/LS modes are supported.
>> +    type: boolean
>> +
>> +# Required child node:
>> +
>> +patternProperties:
>> +  "^dwc3@[0-9a-f]+$":
>> +    type: object
>> +    description:
>> +      A child node must exist to represent the core DWC3 IP block
>> +      The content of the node is defined in dwc3.txt.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    usb@a6f8800 {
>> +        compatible = "qcom,sdm845-dwc3", "qcom,dwc3";
>> +        reg = <0 0x0a6f8800 0 0x400>;
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
>> +                 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
>> +                 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
>> +                 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +                 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
>> +        clock-names = "cfg_noc", "core", "iface", "mock_utmi",
>> +                      "sleep";
>> +
>> +        assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
>> +                          <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>> +        assigned-clock-rates = <19200000>, <150000000>;
>> +
>> +        interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "hs_phy_irq", "ss_phy_irq",
>> +                          "dm_hs_phy_irq", "dp_hs_phy_irq";
>> +
>> +        power-domains = <&gcc USB30_PRIM_GDSC>;
>> +
>> +        resets = <&gcc GCC_USB30_PRIM_BCR>;
>> +
>> +        dwc3@a600000 {
>> +            compatible = "snps,dwc3";
>> +            reg = <0 0x0a600000 0 0xcd00>;
> You need 'ranges' in the parent for this address to be translatable.
Will add in next version.
>
>> +            interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>> +            iommus = <&apps_smmu 0x740 0>;
>> +            snps,dis_u2_susphy_quirk;
>> +            snps,dis_enblslpm_quirk;
>> +            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +            phy-names = "usb2-phy", "usb3-phy";
>> +        };
>> +    };
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
