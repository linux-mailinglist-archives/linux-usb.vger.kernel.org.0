Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49A4665284
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 04:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjAKDxg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 22:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjAKDx3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 22:53:29 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD5D1004D;
        Tue, 10 Jan 2023 19:53:22 -0800 (PST)
X-UUID: 7a99abf2916311eda06fc9ecc4dadd91-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gQZKq9ub0U1JpjHTlr1nkQUsvL0Dcoim+aUp6I2Olm0=;
        b=KBXfn/EZO4MDq3ZNODGvh9VkXE0OoXUt1CYLMyy3/UV7iPyup6bXS8iYUGAVaOxXKw3c+6J8by+KHa2e9Fn6EJTOmceuEk/m+GRXDqiPXV1BY+mbyzNK9DCMPM9VbeGrWuaEPTy3CVbPdz0HfP5KWMS5jp43O4sOkqkLNZT1FLk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:c628dc0e-5027-4373-8a8b-adf6f2f1a6a6,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:45
X-CID-INFO: VERSION:1.1.17,REQID:c628dc0e-5027-4373-8a8b-adf6f2f1a6a6,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:45
X-CID-META: VersionHash:543e81c,CLOUDID:f8fc4c54-dd49-462e-a4be-2143a3ddc739,B
        ulkID:230111101907THW46AZC,BulkQuantity:7,Recheck:0,SF:38|28|17|19|48|102,
        TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
        ,OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:1,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 7a99abf2916311eda06fc9ecc4dadd91-20230111
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1472216421; Wed, 11 Jan 2023 11:53:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 11:53:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 11 Jan 2023 11:53:14 +0800
Message-ID: <d4a6da02-c8ce-1171-7b63-1546f33b441d@mediatek.com>
Date:   Wed, 11 Jan 2023 11:53:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To:     =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC:     =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= 
        <bear.wang@mediatek.com>,
        "wenst@chromium.org" <wenst@chromium.org>,
        "macpaul@gmail.com" <macpaul@gmail.com>,
        =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= 
        <Miles.Chen@mediatek.com>,
        =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= 
        <Rex-BC.Chen@mediatek.com>,
        =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= 
        <TingHan.Shen@mediatek.com>, <yow-shin.liou@mediatek.com>,
        <ben.lok@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <74ecff7a-bc75-0514-6aa2-b1401b8d43b8@linaro.org>
 <1f1222103100b02c4ff7d2273860b1beed49256c.camel@mediatek.com>
From:   Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <1f1222103100b02c4ff7d2273860b1beed49256c.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/11/23 10:19, Chunfeng Yun (云春峰) and Krzysztof Kozlowski wrote:
> On Fri, 2023-01-06 at 13:56 +0100, Krzysztof Kozlowski wrote:
>> On 05/01/2023 10:28, Macpaul Lin wrote:
>>> Introduce the split MT8195 laptop and iot USB configurations.
>>> The hardware specifications for LAPTOP devices is different from
>>> IOT
>>> devices. The major differences include some hardware constrains for
>>> dual-role switch for USB controllers in different configurations,
>>> especially for power management and other control flows as well.
>>>
>>> Here are some hardware specifiction differences listed:
>>>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device
>>> mode).
>>>    2. IOT devices must support multiple gadget devices and host
>>> mode.
>>>    3. Dual-role switch is not fully supported. Only USB PORT0
>>> support
>>>       dual-role switch.
>>>    4. Power management is designed in primary and secondary
>>> dominator.
>>>       For a dual-role port, the device controller is the primary
>>> controller
>>>       for power management; while the host controller is the
>>> secondary.
>>>       LAPTOP devices should remove device nodes for avoiding
>>> abnormal
>>>       behavior.
>>>
>>> This modifcation is to add USB configurations "mt8195-laptop-
>>> usb.dtsi"
>>> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
>>>
>>> To remove common USB configurations for mt8195.dtsi and switch
>>> includes
>>> dtsi these new files for the boards will come in next patch.
>>>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>   .../boot/dts/mediatek/mt8195-iot-usb.dtsi     | 122
>>> ++++++++++++++++++
>>>   .../boot/dts/mediatek/mt8195-laptop-usb.dtsi  | 102
>>> +++++++++++++++
>>>   2 files changed, 224 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-iot-
>>> usb.dtsi
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-laptop-
>>> usb.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>>> new file mode 100644
>>> index 000000000000..f9bd79542044
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>>> @@ -0,0 +1,122 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2022 MediaTek Inc.
>>> + */
>>> +
>>> +#include "mt8195.dtsi"
>>> +
>>> +/ {
>>> +	soc {
>>> +		ssusb: ssusb@11200000 {
>>
>> Node name: usb

Got it.

>>
>>> +			compatible ="mediatek,mt8183-mtu3",
>>> "mediatek,mtu3";
>>> +			reg = <0 0x11201000 0 0x2dff>,
>>> +			      <0 0x11203e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port0 PHY_TYPE_USB2>,
>>> +			       <&u3port0 PHY_TYPE_USB3>;
>>> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
>>> +				 <&topckgen CLK_TOP_SSUSB_REF>,
>>> +				 <&infracfg_ao
>>> CLK_INFRA_AO_SSUSB_XHCI>;
>>> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
>>> +			#address-cells = <2>;
>>> +			#size-cells = <2>;
>>> +			ranges;
>>> +			status = "disabled";
>>> +
>>> +			xhci0: xhci@11200000 {
> s/xhci/usb
>>> +				compatible = "mediatek,mt8195-xhci",
>>> +					     "mediatek,mtk-xhci";
>>> +				reg = <0 0x11200000 0 0x1000>;
>>> +				reg-names = "mac";
>>> +				interrupts = <GIC_SPI 129
>>> IRQ_TYPE_LEVEL_HIGH 0>;
>>> +				assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP>,
>>> +						  <&topckgen
>>> CLK_TOP_SSUSB_XHCI>;
>>> +				assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>,
>>> +							 <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +				clocks = <&infracfg_ao
>>> CLK_INFRA_AO_SSUSB>,
>>> +					 <&infracfg_ao
>>> CLK_INFRA_AO_SSUSB_XHCI>,
>>> +					 <&topckgen CLK_TOP_SSUSB_REF>,
>>> +					 <&apmixedsys
>>> CLK_APMIXED_USB1PLL>;
>>> +				clock-names = "sys_ck", "xhci_ck",
>>> "ref_ck", "mcu_ck";
>>> +				status = "disabled";
>>> +			};
>>> +		};
>>> +
>>> +		xhci1: xhci1@11290000 {
>>
>> Node names should be generic, so just "xhci"
> also use "usb", no generic name "xhci" in the following spec
> 

Thanks for the reminding. I'll align the naming assignment in origin 
mt8195.dtsi and in the following specification.

>>
> https://urldefense.com/v3/__https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html*generic-names-recommendation__;Iw!!CTRNKA9wMg0ARbw!n5NxtuBHI5f9tS659pqDgRDZNAFxnXriet0G48KA64n1CEWYYsL0vXY0I-Mw99H8a8UDW5KR_79k7IvYg8Er5gNvmkXE9HZH$
>>   
>>
>>> +			compatible = "mediatek,mt8195-xhci",
>>> +				     "mediatek,mtk-xhci";
>>> +			reg = <0 0x11290000 0 0x1000>,
>>> +			      <0 0x11293e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port1 PHY_TYPE_USB2>,
>>> +			       <&u3port1 PHY_TYPE_USB3>;
>>> +			assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP_1P>,
>>> +					  <&topckgen
>>> CLK_TOP_SSUSB_XHCI_1P>;
>>> +			assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>,
>>> +						 <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +			clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_1P_BUS>,
>>> +				 <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_1P_XHCI>,
>>> +				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
>>> +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
>>> +			clock-names = "sys_ck", "xhci_ck", "ref_ck",
>>> "mcu_ck";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		ssusb1: usb1@112a1000 {
>>
>> usb
>>

Got it.

>>> +			compatible = "mediatek,mt8183-mtu3",
>>> "mediatek,mtu3";
>>> +			reg = <0 0x112a1000 0 0x2dff>,
>>> +				  <0 0x112a3e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port2 PHY_TYPE_USB2>;
>>> +			assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP_2P>;
>>> +			assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +			clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_2P_BUS>,
>>> +				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
>>> +				 <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_2P_XHCI>;
>>> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
>>> +			mediatek,syscon-wakeup = <&pericfg 0x400 4>;
>>> +			#address-cells = <2>;
>>> +			#size-cells = <2>;
>>> +			ranges;
>>> +			status = "disabled";
>>> +
>>> +			xhci2: xhci2@112a0000 {
>>
>> xhci
> use "usb", no need change it when move from mt8195.dtsi
> 

Got it.

>>
>>> +				compatible = "mediatek,mt8195-
>>> xhci","mediatek,mtk-xhci";
>>> +				reg = <0 0x112a0000 0 0x1000>;
>>> +				reg-names = "mac";
>>> +				interrupts-extended = <&gic GIC_SPI 533
>>> IRQ_TYPE_LEVEL_HIGH 0>,
>>> +					      <&pio 220
>>> IRQ_TYPE_EDGE_FALLING>;
>>> +				assigned-clocks = <&topckgen
>>> CLK_TOP_SSUSB_XHCI_2P>;
>>> +				assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +				clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_2P_XHCI>;
>>> +				clock-names = "sys_ck";
>>> +				status = "disabled";
>>> +			};
>>> +		};
>>> +
>>> +		xhci3: xhci3@112b0000 {
>>
>> xhci
> usb

Got it.

>>> +			compatible = "mediatek,mt8195-xhci",
>>> +				     "mediatek,mtk-xhci";
>>> +			reg = <0 0x112b0000 0 0x1000>,
>>> +			      <0 0x112b3e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port3 PHY_TYPE_USB2>;
>>> +			assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP_3P>,
>>> +					  <&topckgen
>>> CLK_TOP_SSUSB_XHCI_3P>;
>>> +			assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>,
>>> +						 <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +			clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_3P_BUS>,
>>> +				 <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_3P_XHCI>,
>>> +				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
>>> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
>>> +			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
>>> +			wakeup-source;
>>> +			usb2-lpm-disable;
>>> +			status = "disabled";
>>> +		};
>>
>>
>> Best regards,
>> Krzysztof
>>

Thanks
Macpaul Lin
