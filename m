Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A665C1350FC
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 02:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgAIBbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 20:31:35 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7235 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgAIBbf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 20:31:35 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e1682600000>; Wed, 08 Jan 2020 17:31:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 08 Jan 2020 17:31:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 08 Jan 2020 17:31:30 -0800
Received: from [10.19.108.118] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 01:31:28 +0000
Subject: Re: [PATCH v5 3/5] dt-bindings: phy: tegra: Add Tegra194 support
From:   JC Kuo <jckuo@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200103081814.9848-1-jckuo@nvidia.com>
 <20200103081814.9848-4-jckuo@nvidia.com> <20200103223940.GA9205@bogus>
 <baa9b5f4-74be-0ab4-0b24-bf926cf3207c@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <4c3f3776-65e2-aafd-7bb9-fa69df301cb6@nvidia.com>
Date:   Thu, 9 Jan 2020 09:31:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <baa9b5f4-74be-0ab4-0b24-bf926cf3207c@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578533472; bh=yv+sG1oLTyGNOFQKfWpRTYpWpAeICrtXJQhslfyq10I=;
        h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KLQMWToNXlnnhH05QLUOYIkUoR/SZHBsl57vOhV9Fk1riSDhAGEeBBEyXMw5VKmxU
         YLyNx/tv/HMKaf7YcQoSKux2ZEzsMoTB8YSQUPUjvNpejIgwno8M2OgSlE5JGGPi1m
         k6SKBk07gtPokRhxfhnhPpz6VUWT+jL2fKvev4aIQGyVVpcEmcR0B9TIYWcLnKjE4F
         tbxGABvmpI2nziDRvWHDmrHccXdy3HpuOkey6aStbm6t+vC/HFVi5XCBhBdDuw6SUq
         pImTG+dzsp3svWFCwvkhRdv+iEXx6INY3iQPGJidm/pypGkEJgkL6N3iBrvRVMXMLR
         VjTPN1Fv8qdAA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,
For now we have two options.
1. reusing the existing "maximum-speed" which is documented in usb/generic.txt
Pro: no need to add new property
Con: only "super-speed" and "super-speed-plus" are valid for Tegra XUSB PADCTL,
therefore extra code/document change is required.

+	if (device_property_present(&port->dev, "maximum-speed")) {
+		maximum_speed =  usb_get_maximum_speed(&port->dev);
+		if (maximum_speed == USB_SPEED_SUPER)
+			usb3->disable_gen2 = true;
+		else if (maximum_speed == USB_SPEED_SUPER_PLUS)
+			usb3->disable_gen2 = false;
+		else
+			return -EINVAL;
+	}

2. introducing a new proprietary "nvidia,disable-gen2" property
Pro: its logic perfectly matches the need, and code change is minimum

+        usb3->disable_gen2 = of_property_read_bool(np, "nvidia,disable-gen2");

Con: it's a new and proprietary property.

Please let me know which one do you prefer or there is something else works better.

Thanks,
JC


On 1/6/20 3:10 PM, JC Kuo wrote:
> On 1/4/20 6:39 AM, Rob Herring wrote:
>> On Fri, Jan 03, 2020 at 04:18:12PM +0800, JC Kuo wrote:
>>> Extend the bindings to cover the set of features found in Tegra194.
>>> Note that, technically, there are four more supplies connected to the
>>> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_PLL)
>>> , but the power sequencing requirements of Tegra194 require these to be
>>> under the control of the PMIC.
>>>
>>> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
>>> is possible for some platforms have long signal trace that could not
>>> provide sufficient electrical environment for Gen 2 speed. This patch
>>> adds a "maximum-speed" property to usb3 ports which can be used to
>>> specify the maximum supported speed for any particular USB 3.1 port.
>>> For a port that is not capable of SuperSpeedPlus, "maximum-speed"
>>> property should carry "super-speed".
>>>
>>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>>> ---
>>> Changes in v5:
>>> - re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
>>> Changes in v4: none
>>> Changes in v3: none
>>> Changes in v2:
>>> - fix a typo
>>>
>>>  .../phy/nvidia,tegra124-xusb-padctl.txt        | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>> index 9fb682e47c29..7d0089006e67 100644
>>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>> @@ -37,6 +37,7 @@ Required properties:
>>>    - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
>>>    - Tegra210: "nvidia,tegra210-xusb-padctl"
>>>    - Tegra186: "nvidia,tegra186-xusb-padctl"
>>> +  - Tegra194: "nvidia,tegra194-xusb-padctl"
>>>  - reg: Physical base address and length of the controller's registers.
>>>  - resets: Must contain an entry for each entry in reset-names.
>>>  - reset-names: Must include the following entries:
>>> @@ -62,6 +63,10 @@ For Tegra186:
>>>  - vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>>>  - vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
>>>  
>>> +For Tegra194:
>>> +- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
>>> +  3.3 V.
>>> +- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
>>>  
>>>  Pad nodes:
>>>  ==========
>>> @@ -154,6 +159,11 @@ For Tegra210, the list of valid PHY nodes is given below:
>>>  - sata: sata-0
>>>    - functions: "usb3-ss", "sata"
>>>  
>>> +For Tegra194, the list of valid PHY nodes is given below:
>>> +- usb2: usb2-0, usb2-1, usb2-2, usb2-3
>>> +  - functions: "xusb"
>>> +- usb3: usb3-0, usb3-1, usb3-2, usb3-3
>>> +  - functions: "xusb"
>>>  
>>>  Port nodes:
>>>  ===========
>>> @@ -221,6 +231,11 @@ Optional properties:
>>>    is internal. In the absence of this property the port is considered to be
>>>    external.
>>>  
>>> +- maximum-speed: Only for Tegra194. A string property that specifies maximum
>>> +  supported speed of a usb3 port. Valid values are:
>>> +  - "super-speed-plus": default, the usb3 port supports USB 3.1 Gen 2 speed.
>>
>> Not defined as a valid value in usb/generic.txt. '-gen2' instead of 
>> '-plus' would be clearer IMO. However, is there any need to define the 
>> maximum speed possible? The purpose of this property is to limit the 
>> speed below the max.
>>
> usb_get_maximum_speed(), which parses "maximum-speed" property, indeed handles
> string "super-speed-plus". Should "super-speed-plus" be documented in
> usb/generic.txt"?
> 
> static const char *const speed_names[] = {
> 	[USB_SPEED_UNKNOWN] = "UNKNOWN",
> 	[USB_SPEED_LOW] = "low-speed",
> 	[USB_SPEED_FULL] = "full-speed",
> 	[USB_SPEED_HIGH] = "high-speed",
> 	[USB_SPEED_WIRELESS] = "wireless",
> 	[USB_SPEED_SUPER] = "super-speed",
> 	[USB_SPEED_SUPER_PLUS] = "super-speed-plus",
> };
> 
> A proprietary "nvidia,disable-gen2" property was proposed in earlier revision to
> "limit the speed below the max". I like it because it fit our needs better and
> requires only one line of code change.
> 
>    usb3->disable_gen2 = of_property_read_bool(np, "nvidia,disable-gen2");
> 
> Should I fallback to that approach?
> 
> Thanks,
> JC
> 
>>> +  - "super-speed": the usb3 port supports USB 3.1 Gen 1 speed only.
>>> +
>>>  For Tegra124 and Tegra132, the XUSB pad controller exposes the following
>>>  ports:
>>>  - 3x USB2: usb2-0, usb2-1, usb2-2
>>> @@ -233,6 +248,9 @@ For Tegra210, the XUSB pad controller exposes the following ports:
>>>  - 2x HSIC: hsic-0, hsic-1
>>>  - 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
>>>  
>>> +For Tegra194, the XUSB pad controller exposes the following ports:
>>> +- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
>>> +- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
>>>  
>>>  Examples:
>>>  =========
>>> -- 
>>> 2.17.1
>>>
