Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550CE6C31C6
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 13:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjCUMgJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 21 Mar 2023 08:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCUMgI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 08:36:08 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A2241B61;
        Tue, 21 Mar 2023 05:36:03 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id E093424E30A;
        Tue, 21 Mar 2023 20:36:00 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 20:36:00 +0800
Received: from [192.168.125.108] (183.27.97.64) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 20:35:59 +0800
Message-ID: <2311a888-8861-ade6-d46f-caff4fc3ec73@starfivetech.com>
Date:   Tue, 21 Mar 2023 20:35:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        "Roger Quadros" <rogerq@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
 <20230320153419.GB1713196-robh@kernel.org>
From:   Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230320153419.GB1713196-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2023/3/20 23:34, Rob Herring wrote:
> On Wed, Mar 15, 2023 at 06:44:11PM +0800, Minda Chen wrote:
>> USB Glue layer and Cadence USB subnode configuration,
>> also includes USB and PCIe phy dts configuration.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         |  7 +++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 54 +++++++++++++++++++
>>  2 files changed, 61 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index a132debb9b53..c64476aebc1a 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -236,3 +236,10 @@
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&usb0 {
>> +	status = "okay";
>> +	usbdrd_cdns3: usb@0 {
>> +		dr_mode = "peripheral";
>> +	};
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index f70a4ed47eb4..17722fd1be62 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -362,6 +362,60 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		usb0: usb@10100000 {
>> +			compatible = "starfive,jh7110-usb";
>> +			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_STB>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_APB>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
>> +			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
>> +			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
>> +				 <&stgcrg JH7110_STGRST_USB0_APB>,
>> +				 <&stgcrg JH7110_STGRST_USB0_AXI>,
>> +				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
>> +			starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
>> +			starfive,sys-syscon = <&sys_syscon 0x18>;
>> +			status = "disabled";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0x0 0x0 0x10100000 0x100000>;
>> +
>> +			usbdrd_cdns3: usb@0 {
>> +				compatible = "cdns,usb3";
> 
> This pattern of USB wrapper and then a "generic" IP node is discouraged 
> if it is just clocks, resets, power-domains, etc. IOW, unless there's an 
> actual wrapper h/w block with its own registers, then don't do this 
> split. Merge it all into a single node.
> 
I am afraid it is difficult to merge in one single node. 

1.If cadence3 usb device is still the sub device. All the dts setting are in
StarFive node. This can not work.
StarFive driver code Using platform_device_add generate cadenc3 usb platform device. 
Even IO memory space setting can be passed to cadence3 USB, PHY setting can not be passed.
For the PHY driver using dts now. But in this case, Cadence3 USB no dts configure.

2. Just one USB Cadence platform device.
Maybe this can work. But Cadence USB driver code cdns3-plat.c required to changed.

Hi Peter Pawel and Roger
   There is a "platform_suspend" function pointer in "struct cdns3_platform_data"，
   Add "platform_init" and "platform_exit" for our JH7110 platform. Maybe it can work.
   Is it OK?   
>> +				reg = <0x0 0x10000>,
>> +				      <0x10000 0x10000>,
>> +				      <0x20000 0x10000>;
>> +				reg-names = "otg", "xhci", "dev";
>> +				interrupts = <100>, <108>, <110>;
>> +				interrupt-names = "host", "peripheral", "otg";
>> +				phys = <&usbphy0>;
>> +				phy-names = "cdns3,usb2-phy";
> 
> No need for *-names when there is only 1 entry. Names are local to the 
> device and only to distinguish entries, so 'usb2' would be sufficient 
> here.
> 
The PHY name 'cdns3,usb2-phy'  is defined in cadence3 usb driver code.
Cadence USB3 driver code using this name to get PHY instance.
And all the PHY ops used in Cadence3 USB sub device. 
>> +				maximum-speed = "super-speed";
>> +			};
>> +		};
>> +
>> +		usbphy0: phy@10200000 {
>> +			compatible = "starfive,jh7110-usb-phy";
>> +			reg = <0x0 0x10200000 0x0 0x10000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_APP_125>;
>> +			clock-names = "125m", "app_125";
>> +			#phy-cells = <0>;
>> +		};
>> +
>> +		pciephy0: phy@10210000 {
>> +			compatible = "starfive,jh7110-pcie-phy";
>> +			reg = <0x0 0x10210000 0x0 0x10000>;
>> +			#phy-cells = <0>;
>> +		};
>> +
>> +		pciephy1: phy@10220000 {
>> +			compatible = "starfive,jh7110-pcie-phy";
>> +			reg = <0x0 0x10220000 0x0 0x10000>;
>> +			#phy-cells = <0>;
>> +		};
>> +
>>  		stgcrg: clock-controller@10230000 {
>>  			compatible = "starfive,jh7110-stgcrg";
>>  			reg = <0x0 0x10230000 0x0 0x10000>;
>> -- 
>> 2.17.1
>> 
