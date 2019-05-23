Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D43727BF4
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 13:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfEWLkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 07:40:07 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15183 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbfEWLkH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 07:40:07 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce686950002>; Thu, 23 May 2019 04:40:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 May 2019 04:40:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 May 2019 04:40:05 -0700
Received: from [10.24.193.7] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 May
 2019 11:40:02 +0000
Subject: Re: [Patch V3 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
 <20190523101359.GD30331@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <9a617a32-96e5-9622-747e-d6ab6e90c305@nvidia.com>
Date:   Thu, 23 May 2019 17:11:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523101359.GD30331@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558611605; bh=ILDdYUf/PZUzSIHaXUje7hlRQV29KDo46iEtGkgcolY=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Vs7xN7n9O9zAV9uZ2XSGwY6YJhlIVsMRimGAyjfBiApl2/nSmSIWcubs82EL4ZZMx
         LnI5kSTvkEV8Bo3VPaFEl6yR5/ncavSdbo8ehpK3deso5uS8Si44JPn3mqzQ1MftKP
         Z75wEYz2CRQTnaYj7Eun5YjLA+xafm76ZOSbo5OxIW6k0LXeAnuba+x+ppFbkyVDg1
         VK3rDN764bYTY36s3iUf22itgSQg88idlJm9iT0YTFx2pbw5Qd5qulcVwN9u2kZfa+
         rdGX/a8Gi2AEWqtqxC8qF4HSyIUepQEeEk/n/JPQlTeOwSByE0/I3WbaatG9XNjr3S
         0vjdAVtL2kKrg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23-05-2019 15:43, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:28PM +0530, Nagarjuna Kristam wrote:
>> Add device-tree binding documentation for the XUSB device mode controller
>> present on Tegra210 SoC. This controller supports the USB 3.0
>> specification.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 101 +++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>> new file mode 100644
>> index 0000000..d78b436
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>> @@ -0,0 +1,101 @@
>> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
>> +=======================================================================
>> +
>> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
>> +USB 3.0 SuperSpeed protocols.
>> +
>> +Required properties:
>> +--------------------
>> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
>> +- reg: Must contain the base and length of the XUSB device registers, XUSB device
>> +  PCI Config registers and XUSB device controller registers.
>> +- interrupts: Must contain the XUSB device interrupt.
>> +- clocks: Must contain an entry for all clocks used.
>> +  See ../clock/clock-bindings.txt for details.
>> +- clock-names: Must include the following entries:
>> +   - dev: Clock to enable core XUSB dev clock.
>> +   - ss: Clock to enable XUSB super speed clock.
>> +   - ss_src: Clock to enable XUSB super speed dev clock.
>> +   - hs_src: Clock to enable XUSB high Speed dev clock.
>> +   - fs_src: Clock to enable XUSB full Speed dev clock.
> 
> You use inconsistent spelling for "speed" here.
> 
will do
>> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
>> +  configure the USB pads used by the XUDC controller.
>> +- power-domains: A list of PM domain specifiers that reference each power-domain
>> +  used by the XUSB device mode controller. This list must comprise of a specifier
>> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt and
>> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
>> +- power-domain-names: A list of names that represent each of the specifiers in
>> +  the 'power-domains' property. Must include 'ss' and 'dev'.
>> +
>> +For Tegra210:
>> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
>> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
>> +
>> +- phys: Must contain an entry for each entry in phy-names.
>> +  See ../phy/phy-bindings.txt for details.
>> +- phy-names: Should include an entry for each PHY used by the controller.
>> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
>> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
>> +  - "usb2" phy, USB 2.0 (D+/D-) data lines.
>> +
>> +- extcon: Must contains an extcon entry which detects USB VBUS pin.
>> +  See ../extcon/extcon-usb-gpio.txt for details.
> 
> Do the phys, phy-names and extcon properties only apply to Tegra210? It
> sounds like those would also apply to other generations, so they should
> go before the "For Tegra210:" line.
> 
Will move before Tegra210
>> +
>> +Example:
>> +--------
>> +	pmc: pmc@7000e400 {
>> +		compatible = "nvidia,tegra210-pmc";
>> +		reg = <0x0 0x7000e400 0x0 0x400>;
>> +		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>> +		clock-names = "pclk", "clk32k_in";
>> +
>> +		powergates {
>> +			pd_xusbss: xusba {
>> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
>> +				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
> 
> We typically use the literal number here to be consistent with the cases
> where the clock ID differs from the reset ID.
> 
Will keep reset ID to numeric values
>> +				#power-domain-cells = <0>;
>> +			};
>> +
>> +			pd_xusbdev: xusbb {
>> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
>> +				resets = <&tegra_car 95>;
> 
> It seems like don't follow that rule exactly since this is the same
> thing we have for XUSB already. I think it'd be best to stick with the
> literal number (like here) and remove the odd ones out. I can prepare
> patches to convert over the existing oddballs.
> 
>> +				#power-domain-cells = <0>;
>> +			};
>> +		};
>> +	};
>> +
>> +	xudc@700d0000 {
>> +		compatible = "nvidia,tegra210-xudc";
>> +		reg = <0x0 0x700d0000 0x0 0x8000>,
>> +			<0x0 0x700d8000 0x0 0x1000>,
>> +			<0x0 0x700d9000 0x0 0x1000>;
> 
> Use tabs, followed by spaces to properly align with the first entry,
> like you do for clock-names below.
> 
Will allign accordingly
>> +
>> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> 
> Ditto.
> 
>> +		clock-names = "dev", "ss", "ss_src",
>> +			      "hs_src", "fs_src";
>> +
>> +		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
>> +		power-domain-names = "dev", "ss";
>> +
>> +		nvidia,xusb-padctl = <&padctl>;
>> +
>> +		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
>> +		phy-names = "usb2;
> 
> Does it perhaps make sense to include the pad controller snippet in here
> as well?
>> Thierry
> 
Will add the reference.
-Nagarjuna
>> +
>> +		avddio-usb-supply = <&vdd_pex_1v05>;
>> +		hvdd-usb-supply = <&vdd_3v3_sys>;
>> +
>> +		extcon = <&extcon_usb>;
>> +	};
>> +
>> +	extcon_usb: extcon_vbus {
>> +		compatible = "linux,extcon-usb-gpio";
>> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
>> +	};
>> +
>> -- 
>> 2.7.4
>>
