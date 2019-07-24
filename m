Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0764473372
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 18:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfGXQOo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 12:14:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45865 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfGXQOn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 12:14:43 -0400
Received: by mail-io1-f65.google.com with SMTP id g20so90765560ioc.12;
        Wed, 24 Jul 2019 09:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U+1/75xZAzRWTYlUhVUY0io4DCPgugEaKO5dzrfUzCg=;
        b=Jom3cCcKCdIjdKHK36v0+Rixw+zNQp9Y1uZS2BLcrqFec8yf/tPySNh6DIXI2BLp0G
         HClAupm8QqbjVgzD8YmgE9z5BkhaGKdTVXm8HP0BgnPL+FbKYSL7/+rgp3cvx5btXg7k
         PafbhZoMQvBb7zOcfhgfC27fUhWwn+kQyLA/lea9twrePAv/AXy1FgUquNLtQXGqkhdq
         d4Ycwg6U6/uehqQO95vTCL7e3cYBTlSa3VB48qKLOK/Qp6vFmDTMQJqhrr/ylhBuAdWV
         d1LlVk7JM6HTtGBJzWQ2p/dsCeXyWQ8TcMu4EbyIJMW05yOgLkYmhoGHpugs3lQ5cPuL
         vS4A==
X-Gm-Message-State: APjAAAWespELFb/DIv+ASbUS7MkZITUpCfU0ax2uxi0Dkg/EudoF9FBZ
        /tRVo4CA3628NrmigRH5KQ==
X-Google-Smtp-Source: APXvYqw/2u0AejiCtJ2dnt2U6+ugYb6v99MWFKK9mR3zL7gqP8joHRKeGopKNVlAvpBse3T2Pg2/Nw==
X-Received: by 2002:a5d:8347:: with SMTP id q7mr72718745ior.277.1563984882457;
        Wed, 24 Jul 2019 09:14:42 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id t14sm39192427ioi.60.2019.07.24.09.14.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 09:14:41 -0700 (PDT)
Date:   Wed, 24 Jul 2019 10:14:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [Patch V5 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190724161436.GA9624@bogus>
References: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
 <1562326911-26855-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562326911-26855-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 05, 2019 at 05:11:47PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on Tegra210 SoC. This controller supports the USB 3.0
> specification.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 110 +++++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> new file mode 100644
> index 0000000..c6a1b81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> @@ -0,0 +1,110 @@
> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
> +=======================================================================
> +
> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
> +USB 3.0 SuperSpeed protocols.
> +
> +Required properties:
> +--------------------
> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
> +- reg: Must contain the base and length of all registers used.
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

The order matters and is the opposite of the example.

> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- phy-names: Should include an entry for each PHY used by the controller.
> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
> +  - "usb2" phy, USB 2.0 (D+/D-) data lines.
> +
> +For Tegra210:
> +- reg-names: Must include the following entries:
> +   - base: XUSB device controller registers.
> +   - fpci: XUSB device PCI Config registers.
> +   - ipfs: XUSB device registers.
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

usb@...

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

Use a label.

> +		phy-names = "usb2;
> +
> +		avddio-usb-supply = <&vdd_pex_1v05>;
> +		hvdd-usb-supply = <&vdd_3v3_sys>;
> +
> +		usb-role-switch;
> +		port {
> +			usb_role_switch: endpoint@0 {

Don't need a unit address.

> +				remote-endpoint = <&bconn_ep>;
> +			};
> +		};
> +
> +	};
> -- 
> 2.7.4
> 
