Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C66C627309
	for <lists+linux-usb@lfdr.de>; Sun, 13 Nov 2022 23:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbiKMWlK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Nov 2022 17:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235540AbiKMWlH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Nov 2022 17:41:07 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947DAFCF1;
        Sun, 13 Nov 2022 14:41:06 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 094EE5C009F;
        Sun, 13 Nov 2022 17:41:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 13 Nov 2022 17:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1668379266; x=
        1668465666; bh=Zro3JnOVSvXjXtDx/e2Z/r/RhYG0V57L3bmv0eP/xkM=; b=K
        Pkzc21ryJ8mWRn0lw4mxKhqwB+WqcPVNLVHOa/+Kv7SR4Uo6/CI5JG4HY/E2NHHo
        5R5ou5lPsmhi9pw82wsXyDnXfFv6JU7OOdLVV0p1NuB62cNf1OGjyhJJEuoQYzBn
        P0mITeWfQPmnseBuG0pi4B7ALfEYfi1kd8J8SFu1AsTg39Rey1FZgSGnHXh0Lo2z
        VxbIEcQ8zMsv7j6eMsud+6dsvtVrZ7udtnt6z/DsmusQGuWn9/TQglFCNeSvNoB4
        SV2MhCdvABXq1+E9ywbxswzJ6n71bW8VeQgr9yd3B3113EhGn9qTc1p6+S4EfigW
        1jD3o7QR3LeZswQbXtv9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668379266; x=
        1668465666; bh=Zro3JnOVSvXjXtDx/e2Z/r/RhYG0V57L3bmv0eP/xkM=; b=a
        0NV50iwtoTUMewCHG3SmmrxeIISEhg8qxXVbLcBc3AqOatzcJhwsdA46iM9TOf9p
        4k9rWMfuDTCYobU64tlmMjnrBMC1ONGVpPHMqK9B4816k8eZwvSc0lJji0XlDG0y
        HkbFPENjpt/zGLW57WKhaLjbAFhFp1ui5Zzd5dpUqOhbflrYL+bXGe/UZYAtY+YP
        TWUqjXr0f6jWodg54SRAWK3W5QJ65M6SJIN4Oo5RGfqqW+pdVrqr0XDrFlynjAyM
        MPbqKWBJ0kTcj4URkaN15xIOhRRHP8XP9ayiGSHhlTWrxFPDenhSrIavYx3PE62o
        Ine2RVe1mY5zzuXZ71T4A==
X-ME-Sender: <xms:gXJxY77Emsp6b2AffTwsN3UOEV4ELDYrt2AoYrpWun4ks-SjczZURg>
    <xme:gXJxYw6VxrvS7Tq1_yBimqCxXnyardEgMPk1UGHL8ybfFk1Q03SiVB4z7bbGDc8My
    uYNL0u8yWEYwXiw6A>
X-ME-Received: <xmr:gXJxYydjwOFth0JF1j8OQII2cMpURMoOLaMvdCrX3dz8ho5_8jempdDYGZDj2laGGzVWIrA63ErtCNmlRG62c9uZbb9ldFxaKK0cK2dOcyPi-YOQ4kxJlQ1aWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:gXJxY8Kt1navcaV5rqsZgXUV_vx_WPjU5jOeIHPpujigSENaZiY0LA>
    <xmx:gXJxY_ILoCDvim-xQyGWtLT6kkWCApVI7KJupA8VWtLEuIykLIe2AQ>
    <xmx:gXJxY1we3w4pjwtxnKYolnDQIT0T8q-nWxfSjQe5eeV0NgVzX0C3dw>
    <xmx:gnJxYxyAKQWDHmzV8vDEW6wm1BQCGdR75h8nnn4opfFXpSti8Kon2w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 17:41:05 -0500 (EST)
Message-ID: <7d7a84bd-78e2-868b-6659-9dcc596c718c@sholland.org>
Date:   Sun, 13 Nov 2022 16:41:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 09/11] ARM: dts: suniv: add device tree for PopStick
 v1.1
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-10-andre.przywara@arm.com>
From:   Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221106154826.6687-10-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/6/22 09:48, Andre Przywara wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> an on-board CH340 USB-UART converted connected to F1C200s's UART0.
> 
> Add a device tree for it. As F1C200s is just F1C100s with a different
> DRAM chip co-packaged, directly use F1C100s DTSI here.
> 
> This commit covers the v1.1 version of this board, which is now shipped.
> v1.0 is some internal sample that have not been shipped at all.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/Makefile                    |  3 +-
>  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 99 +++++++++++++++++++
>  2 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6aa7dc4db2fc..0249c07bd8a6 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1391,7 +1391,8 @@ dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
>  	sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_MACH_SUNIV) += \
> -	suniv-f1c100s-licheepi-nano.dtb
> +	suniv-f1c100s-licheepi-nano.dtb \
> +	suniv-f1c200s-popstick-v1.1.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
>  	tegra20-acer-a500-picasso.dtb \
>  	tegra20-asus-tf101.dtb \
> diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> new file mode 100644
> index 000000000000..7d69b5fcb905
> --- /dev/null
> +++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "suniv-f1c100s.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Popcorn Computer PopStick v1.1";
> +	compatible = "sourceparts,popstick-v1.1", "sourceparts,popstick",
> +		     "allwinner,suniv-f1c200s", "allwinner,suniv-f1c100s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 */
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	reg_vcc3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> +	bus-width = <4>;
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};
> +
> +&otg_sram {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pc_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "u-boot-with-spl";
> +				reg = <0x0 0x100000>;
> +			};
> +
> +			ubi@100000 {
> +				label = "ubi";
> +				reg = <0x100000 0x7f00000>;
> +			};
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pe_pins>;
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "peripheral";

The patch description says the board has a USB Type-A port. Why is the
USB controller set to peripheral mode?

Regards,
Samuel

> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};

