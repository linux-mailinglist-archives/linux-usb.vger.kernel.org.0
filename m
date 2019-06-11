Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3BCA3C555
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 09:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404189AbfFKHnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jun 2019 03:43:32 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:49150 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403920AbfFKHnc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jun 2019 03:43:32 -0400
X-UUID: 61b29e41fa6d47a7ae42b6bcebcd34f3-20190611
X-UUID: 61b29e41fa6d47a7ae42b6bcebcd34f3-20190611
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1932523170; Tue, 11 Jun 2019 15:43:11 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Jun
 2019 15:43:09 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 15:43:09 +0800
Message-ID: <1560238989.8487.122.camel@mhfsdcap03>
Subject: Re: [Patch V4 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Date:   Tue, 11 Jun 2019 15:43:09 +0800
In-Reply-To: <1560161949-26031-5-git-send-email-nkristam@nvidia.com>
References: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
         <1560161949-26031-5-git-send-email-nkristam@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1E83E09A0ACA320913AA3B54C7BF879C832F44EB01B88D683A1920F5C0F8E0812000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-06-10 at 15:49 +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> new file mode 100644
> index 0000000..cde4e11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> @@ -0,0 +1,108 @@
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
> +- reg-names: Must include all the register names needed for the driver
add names list?

> +- interrupts: Must contain the XUSB device interrupt.
> +- clocks: Must contain an entry for all clocks used.
> +  See ../clock/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +   - dev: Clock to enable core XUSB dev clock.
> +   - ss: Clock to enable XUSB super speed clock.
> +   - ss_src: Clock to enable XUSB super speed dev clock.
> +   - hs_src: Clock to enable XUSB high speed dev clock.
> +   - fs_src: Clock to enable XUSB full speed dev clock.
> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
> +  configure the USB pads used by the XUDC controller.
> +- power-domains: A list of PM domain specifiers that reference each power-domain
> +  used by the XUSB device mode controller. This list must comprise of a specifier
> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt and
> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> +- power-domain-names: A list of names that represent each of the specifiers in
> +  the 'power-domains' property. Must include 'ss' and 'dev'.
> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- phy-names: Should include an entry for each PHY used by the controller.
> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
> +  - "usb2" phy, USB 2.0 (D+/D-) data lines.
> +
> +For Tegra210:
> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> +
> +
> +Optional properties:
> +--------------------
> +- usb-role-switch: boolean property to indicate use of USB Role Switch driver.
> +
> +Sub-nodes:
> +----------
> +- The port would be added as subnode if use "usb-role-switch" property.
> +  see graph.txt.
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
> +				resets = <&tegra_car 156>;
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
> +		      <0x0 0x700d8000 0x0 0x1000>,
> +		      <0x0 0x700d9000 0x0 0x1000>;
> +		reg-names = "base", "fpci", "ipfs";
> +
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			 <&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> +		clock-names = "dev", "ss", "ss_src", "hs_src", "fs_src";
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
> +		usb-role-switch;
> +		port {
> +			usb_role_switch: endpoint@0 {
> +				remote-endpoint = <&bconn_ep>;
> +			};
> +		};
> +
> +	};


