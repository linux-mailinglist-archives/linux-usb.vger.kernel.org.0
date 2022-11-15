Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC70D629F7D
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 17:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbiKOQrL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 15 Nov 2022 11:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231853AbiKOQrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 11:47:09 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9132E14D35;
        Tue, 15 Nov 2022 08:47:08 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4FD13D5;
        Tue, 15 Nov 2022 08:47:14 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB9273F587;
        Tue, 15 Nov 2022 08:47:06 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:47:04 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 09/11] ARM: dts: suniv: add device tree for PopStick
 v1.1
Message-ID: <20221115164704.1d9db428@donnerap.cambridge.arm.com>
In-Reply-To: <4752971.GXAFRqVoOG@kista>
References: <20221106154826.6687-1-andre.przywara@arm.com>
        <20221106154826.6687-10-andre.przywara@arm.com>
        <4752971.GXAFRqVoOG@kista>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 07 Nov 2022 18:35:09 +0100
Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne nedelja, 06. november 2022 ob 16:48:24 CET je Andre Przywara napisal(a):
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> > wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> > an on-board CH340 USB-UART converted connected to F1C200s's UART0.
> > 
> > Add a device tree for it. As F1C200s is just F1C100s with a different
> > DRAM chip co-packaged, directly use F1C100s DTSI here.
> > 
> > This commit covers the v1.1 version of this board, which is now shipped.
> > v1.0 is some internal sample that have not been shipped at all.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |  3 +-
> >  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 99 +++++++++++++++++++
> >  2 files changed, 101 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 6aa7dc4db2fc..0249c07bd8a6 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1391,7 +1391,8 @@ dtb-$(CONFIG_MACH_SUN9I) += \
> >  	sun9i-a80-optimus.dtb \
> >  	sun9i-a80-cubieboard4.dtb
> >  dtb-$(CONFIG_MACH_SUNIV) += \
> > -	suniv-f1c100s-licheepi-nano.dtb
> > +	suniv-f1c100s-licheepi-nano.dtb \
> > +	suniv-f1c200s-popstick-v1.1.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
> >  	tegra20-acer-a500-picasso.dtb \
> >  	tegra20-asus-tf101.dtb \
> > diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> > b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts new file mode 100644
> > index 000000000000..7d69b5fcb905
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
> > + */
> > +
> > +/dts-v1/;
> > +#include "suniv-f1c100s.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model = "Popcorn Computer PopStick v1.1";
> > +	compatible = "sourceparts,popstick-v1.1", "sourceparts,popstick",
> > +		     "allwinner,suniv-f1c200s", "allwinner,suniv-  
> f1c100s";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> > +		led {
> > +			function = LED_FUNCTION_STATUS;
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6   
> */
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> > +
> > +	reg_vcc3v3: regulator-3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> > +	bus-width = <4>;
> > +	disable-wp;
> > +	vmmc-supply = <&reg_vcc3v3>;
> > +	status = "okay";
> > +};
> > +
> > +&otg_sram {
> > +	status = "okay";
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&spi0_pc_pins>;
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "spi-nand";
> > +		reg = <0>;
> > +		spi-max-frequency = <40000000>;
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +
> > +		partitions {  
> 
> "make dtbs_check" is not happy with cells and partitions. Do we really need 
> them? If yes, then binding needs to be updated beforehand.

Right, my dt-validate run didn't initially complain, but does now, after
updating dt-schema.git.
So yes, I will just drop the partitions, for now. The partition scheme
seems to be legit, as described in mtd/fixed-partitions.yaml, but it
apparently just needs to be somehow included in spi-nand.yaml. Will do
that later, then update this .dts.

Cheers,
Andre

> 
> > +			compatible = "fixed-partitions";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			partition@0 {
> > +				label = "u-boot-with-spl";
> > +				reg = <0x0 0x100000>;
> > +			};
> > +
> > +			ubi@100000 {
> > +				label = "ubi";
> > +				reg = <0x100000 0x7f00000>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_pe_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&usb_otg {
> > +	dr_mode = "peripheral";
> > +	status = "okay";
> > +};
> > +
> > +&usbphy {
> > +	status = "okay";
> > +};
> > --
> > 2.35.5  
> 
> 

