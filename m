Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D08917640
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 12:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfEHKuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 06:50:44 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14210 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfEHKuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 06:50:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd2b47e0000>; Wed, 08 May 2019 03:50:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 08 May 2019 03:50:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 08 May 2019 03:50:42 -0700
Received: from [10.19.66.43] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 10:50:40 +0000
Subject: Re: [PATCH V2 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-5-git-send-email-nkristam@nvidia.com>
 <20190425151401.GF24213@ulmo> <20190503143007.GA20469@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <1e86cec5-24e3-6ddb-b3b8-f70a4e949494@nvidia.com>
Date:   Wed, 8 May 2019 16:21:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503143007.GA20469@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557312638; bh=oh9YF2oWwrkyw4dmV2yT/BAb6zjzPFPiQyZkDx7vtT4=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ki9HS2zRYz7dWQj1PxjtTCQ4EMql0RsKkwjCcinsgdShrSEm7sydciUzjPJo2Z0ZX
         AiANn5GTyZQ4wIqQpBLkkcKZTV/0LlI7jK25DQQMB6WhK2smrTW3InQldyJTp+4atw
         OzPtkrMUFk3kqwZQbIggzEDlIPGXuejixOsZR3eny0tEWXvaTVHO61INtXwkzmIwNj
         lFrM1Tu9A8+Z1M8amypD7pjsBt7duZ6iQpFpi1W6ksKUGjF79Kuq8A0jXQtX1s0tmL
         7kZCjhlOAo0t7U3V85CArPX85j5QAE0H/T3qR0fePIMWQaZbxM3xdiZ8+jOaQI/Zrd
         F0ttgTq5jn7vw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 03-05-2019 20:00, Thierry Reding wrote:
> On Thu, Apr 25, 2019 at 05:14:01PM +0200, Thierry Reding wrote:
>> On Mon, Mar 11, 2019 at 04:41:52PM +0530, Nagarjuna Kristam wrote:
>>> Add device-tree binding documentation for the XUSB device mode controller
>>> present on tegra210 SoC. This controller supports USB 3.0 specification
>>
>> Tegra210, please. "... supports the USB 3.0 ...". Also end sentences
>> with a fullstop.
>>
Will update
>>>
>>> Based on work by Andrew Bresticker <abrestic@chromium.org>.
>>>
>>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>>> ---
>>>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 105 +++++++++++++++++++++
>>>  1 file changed, 105 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>>> new file mode 100644
>>> index 0000000..990655d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>>> @@ -0,0 +1,105 @@
>>> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
>>> +=======================================================================
>>> +
>>> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
>>> +USB 3.0 SuperSpeed protocols.
>>> +
>>> +Required properties:
>>> +--------------------
>>> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
>>> +- reg: Must contain the base and length of the XUSB device registers, XUSB device
>>> +  PCI Config registers and XUSB device controller registers.
>>> +- interrupts: Must contain the XUSB device interrupt
>>> +- clocks: Must contain an entry for ell clocks used.
>>
>> s/ell/all/
>>
will do
>>> +  See ../clock/clock-bindings.txt for details.
>>> +- clock-names: Must include the following entries:
>>> +   - xusb_device
>>> +   - xusb_ss
>>> +   - xusb_ss_src
>>> +   - xusb_hs_src
>>> +   - xusb_fs_src
>>
>> It'd be good to explain what each of these are.
> 
> Perhaps we should also drop the xusb_ prefix here. That's already
> implied by this being the XUDC controller bindings.
> 
xusb_ prefix is added to be in sync with USB host driver. considering that this file
already for XUSB hardware, it can be removed.
Will add details and remove xusb_ prefix. 
>>
>>> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
>>> +  configure the USB pads used by the XUDC controller
>>> +- power-domains: A list of PM domain specifiers that reference each power-domain
>>> +  used by the XUSB device mode controller. This list must comprise of a specifier
>>> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt and
>>> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
>>> +- power-domain-names: A list of names that represent each of the specifiers in
>>> +  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_device'
> 
> Same here, I'd drop the xusb_ prefix. I think the "device" power domain
> is also usually referred to as "XUSB_DEV", so perhaps make that "dev"
> instead?
> 
> Thierry
> 
will update accordingly. and apply event at clocks naming for "device" to "dev".
>>> +
>>> +For Tegra210:
>>> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
>>> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
>>> +- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
>>
>> My understanding is that this last supply is really needed for the XUSB
>> pad controller to bring up the PLL. In fact, I've just moved the same
>> supply to the XUSB pad controller from the XUSB controller for all of
>> the supported boards because having this in the XUSB controller would
>> fail under some circumstances.
>>
Will remove avdd-pll-utmip-supply from xudc driver, as its now part of padctl

>>> +
>>> +- phys: Must contain an entry for each entry in phy-names.
>>> +  See ../phy/phy-bindings.txt for details.
>>> +- extcon-usb: Must contains an extcon-usb entry which detects
>>
>> In the example below, this is simply "extcon".
>>
yes, its extcon only, will update accordingly.
>>> +  USB VBUS pin. See ../extcon/extcon-usb-gpio.txt for details.
>>> +
>>> +Optional properties:
>>> +--------------------
>>> +- phy-names: Should include an entry for each PHY used by the controller.
>>> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
>>> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines
>>> +  - "usb2" phy, USB 2.0 (D+/D-) data lines
>>
>> Why are these optional? phys is required and references phy-names
>> explicitly, so I think that effectively makes these phy-names required
>> as well.
>>
Reason being is SS mode is optional, but not usb 2.0 or earlier and hence added in
optional, but considering phys and phy-names goes together, will move this section to
required.
>>> +
>>> +Example:
>>> +--------
>>> +	pmc: pmc@7000e400 {
>>> +		compatible = "nvidia,tegra210-pmc";
>>> +		reg = <0x0 0x7000e400 0x0 0x400>;
>>> +		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>> +		clock-names = "pclk", "clk32k_in";
>>> +
>>> +		powergates {
>>> +			pd_xusbss: xusba {
>>> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
>>> +				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
>>> +				#power-domain-cells = <0>;
>>> +			};
>>> +
>>> +			pd_xusbdev: xusbb {
>>> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
>>> +				resets = <&tegra_car 95>;
>>> +				#power-domain-cells = <0>;
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	xudc@700d0000 {
>>> +		compatible = "nvidia,tegra210-xudc";
>>> +		reg = <0x0 0x700d0000 0x0 0x8000>,
>>> +			<0x0 0x700d8000 0x0 0x1000>,
>>> +			<0x0 0x700d9000 0x0 0x1000>;
>>> +
>>> +		interrupts = <0 44 0x4>;
>>
>> This should use symbolic names defined in the following includes:
>>
>> 	dt-bindings/interrupt-controller/irq.h
>> 	dt-bindings/interrupt-controller/arm-gic.h
>>
>> Thierry
>>
will update with corresponding macros.

-Nagarjuna
>>> +
>>> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
>>> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
>>> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
>>> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
>>> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
>>> +		clock-names = "xusb_device", "xusb_ss", "xusb_ss_src",
>>> +			      "xusb_hs_src", "xusb_fs_src";
>>> +
>>> +		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
>>> +		power-domain-names = "xusb_device", "xusb_ss";
>>> +
>>> +		nvidia,xusb-padctl = <&padctl>;
>>> +
>>> +		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
>>> +		phy-names = "usb2;
>>> +
>>> +		avddio-usb-supply = <&vdd_pex_1v05>;
>>> +		hvdd-usb-supply = <&vdd_3v3_sys>;
>>> +		avdd-pll-utmip-supply = <&vdd_1v8>;
>>> +
>>> +		extcon = <&extcon_usb>;
>>> +	};
>>> +
>>> +	extcon_usb: extcon_vbus {
>>> +		compatible = "linux,extcon-usb-gpio";
>>> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
>>> +	};
>>> +
>>> -- 
>>> 2.7.4
>>>
> 
> 
