Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5399247CA
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 08:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbfEUGIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 02:08:38 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13395 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbfEUGIi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 02:08:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce395e10000>; Mon, 20 May 2019 23:08:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 23:08:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 May 2019 23:08:36 -0700
Received: from [10.19.108.117] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 06:08:33 +0000
Subject: Re: [Patch V3 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
To:     Nagarjuna Kristam <nkristam@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <64954535-57fb-7444-306a-1a5a48dceeaf@nvidia.com>
Date:   Tue, 21 May 2019 14:08:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558418913; bh=UvUqDJrg9A4rO8e6fIklLqQYuvypaWqvewxtTskjIuo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=g6xGJ2D4vQQL5atpuY0aEqDpO/B+TVl1pJJ9zbj+yHe/anpTRbfVcgsgs5MWOKz0d
         3sflWrvNgMTxstvJECvY1sB/3capZhPgWlDDPc01BVjzLks2ZUjUCN2/2DtUxBxm1L
         ajpXwSQKeSAnbJvlARLqPGvWeROxMaaEUaSRGTxSYXCCcTiBAnMAo7rxH19NI+oJiN
         vsQKR+gQXZdtKdmMx5YQ1JpU/GdDGTeQd8TdhFN/jWUE19jaryBIc/Lsj6Kbrz0gsC
         dSGgpKTFIQ/mZVPU7ejjKbsQsl2cJA6GMob728Eq0muJ+0btWhQjUfHMFD8BUkvCQX
         QC+G1p5QnQXXA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>

Thanks,

JC

On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 101 +++++++++++++++++++++
>   1 file changed, 101 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> new file mode 100644
> index 0000000..d78b436
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> @@ -0,0 +1,101 @@
> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
> +=======================================================================
> +
> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
> +USB 3.0 SuperSpeed protocols.
> +
> +Required properties:
> +--------------------
> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
> +- reg: Must contain the base and length of the XUSB device registers, XUSB device
> +  PCI Config registers and XUSB device controller registers.
> +- interrupts: Must contain the XUSB device interrupt.
> +- clocks: Must contain an entry for all clocks used.
> +  See ../clock/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +   - dev: Clock to enable core XUSB dev clock.
> +   - ss: Clock to enable XUSB super speed clock.
> +   - ss_src: Clock to enable XUSB super speed dev clock.
> +   - hs_src: Clock to enable XUSB high Speed dev clock.
> +   - fs_src: Clock to enable XUSB full Speed dev clock.
> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
> +  configure the USB pads used by the XUDC controller.
> +- power-domains: A list of PM domain specifiers that reference each power-domain
> +  used by the XUSB device mode controller. This list must comprise of a specifier
> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt and
> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> +- power-domain-names: A list of names that represent each of the specifiers in
> +  the 'power-domains' property. Must include 'ss' and 'dev'.
> +
> +For Tegra210:
> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> +
> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- phy-names: Should include an entry for each PHY used by the controller.
> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
> +  - "usb2" phy, USB 2.0 (D+/D-) data lines.
> +
> +- extcon: Must contains an extcon entry which detects USB VBUS pin.
> +  See ../extcon/extcon-usb-gpio.txt for details.
> +
> +Example:
> +--------
> +	pmc: pmc@7000e400 {
> +		compatible = "nvidia,tegra210-pmc";
> +		reg = <0x0 0x7000e400 0x0 0x400>;
> +		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
> +		clock-names = "pclk", "clk32k_in";
> +
> +		powergates {
> +			pd_xusbss: xusba {
> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				#power-domain-cells = <0>;
> +			};
> +
> +			pd_xusbdev: xusbb {
> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> +				resets = <&tegra_car 95>;
> +				#power-domain-cells = <0>;
> +			};
> +		};
> +	};
> +
> +	xudc@700d0000 {
> +		compatible = "nvidia,tegra210-xudc";
> +		reg = <0x0 0x700d0000 0x0 0x8000>,
> +			<0x0 0x700d8000 0x0 0x1000>,
> +			<0x0 0x700d9000 0x0 0x1000>;
> +
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> +		clock-names = "dev", "ss", "ss_src",
> +			      "hs_src", "fs_src";
> +
> +		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
> +		power-domain-names = "dev", "ss";
> +
> +		nvidia,xusb-padctl = <&padctl>;
> +
> +		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
> +		phy-names = "usb2;
> +
> +		avddio-usb-supply = <&vdd_pex_1v05>;
> +		hvdd-usb-supply = <&vdd_3v3_sys>;
> +
> +		extcon = <&extcon_usb>;
> +	};
> +
> +	extcon_usb: extcon_vbus {
> +		compatible = "linux,extcon-usb-gpio";
> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +	};
> +
