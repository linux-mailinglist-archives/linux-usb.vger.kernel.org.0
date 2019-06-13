Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D9244E84
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 23:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfFMVcN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 17:32:13 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40549 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbfFMVcM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 17:32:12 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so145916qtn.7;
        Thu, 13 Jun 2019 14:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bV+jbWLbQyP5MQv/RIkQ4h7mTt3iu1hS0A/gRh+q9oc=;
        b=kJnsl/xHkCeIRlcPBHqRtJWSFxXRiryJOKDwxmG6EWcAcj7ejfkqG+EYVr9ST4Hd14
         ncB9hi0BgawHfVsYzt2Ut+eade/AIHiEBC5DmdXqxR2mhr9PR192KBz9JjV2K0kTL2sh
         aPW2NjXZO/tmqqmfSPM1Se0CSuj9C6B+srzMx/2Pfio7ko1AZJtE1ODLfFz/j7T248rg
         myERSjAuacvlCBtb5QZ/O3LCt7C1oKk5Qh8rW93rci14OKfHHOPkOjq4pHBXDdSVwsHK
         B9hilzRARCvlZDM1xh0sm0Ci0IOZMgeJWT9gVox2BkDr6g+aVcTzU25aTE7jcUCuKDEr
         TabA==
X-Gm-Message-State: APjAAAWH0mnA0vgXo+/ImjCKmbCX5QHroeO+tjy719pfvlufmf2FA1vO
        eSeY6lyR6WyJFG1IitOWTkn7HVY=
X-Google-Smtp-Source: APXvYqxItT0FcgweR+DA+RahPmYsCBs8tX4ll8M1VN4Cz/+iJXrwrzmp2/jti9IbKhtmp/r2OS5A3w==
X-Received: by 2002:a0c:9564:: with SMTP id m33mr5337341qvm.89.1560461530974;
        Thu, 13 Jun 2019 14:32:10 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id h185sm589865qkd.11.2019.06.13.14.32.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 14:32:10 -0700 (PDT)
Date:   Thu, 13 Jun 2019 15:32:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mark.rutland@arm.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [Patch V3 4/8] dt-bindings: usb: Add  NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190613213209.GA27327@bogus>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 16, 2019 at 12:09:28PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 101 +++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
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

Wouldn't an analog supply belong in the phy node?

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

Use the usb-connector binding for new bindings.

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
> -- 
> 2.7.4
> 
