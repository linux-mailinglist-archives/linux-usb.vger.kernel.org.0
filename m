Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5A36273E5
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 01:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235584AbiKNAld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Nov 2022 19:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiKNAlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Nov 2022 19:41:32 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0831CE0E5;
        Sun, 13 Nov 2022 16:41:29 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 7B53532002E2;
        Sun, 13 Nov 2022 19:41:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 13 Nov 2022 19:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1668386488; x=
        1668472888; bh=853Q6QTGI1l6Ew34C/zHsFg9+iR6cwS96OTnFTcARoU=; b=s
        SuyPVan6+AaD5faJYeN3v9hb5EEhKagQ6ENUqDYTkZ3lNtBcQtwIiwxWBef+QkPr
        6Bce2Scm55FAEROHIoAarWHgGIArg/aOdJWfZeBIowqimKKYwOYU/1iWN0r86UO9
        5M1pj6Brka2/CNKLXms8VedYtJygc9zB/C5e7BjYx3oQUWgeMCCFalGj69GwF5CW
        b7oVm+LA5tR/5F0fHF/LVbm3FOkHc0ZW/rKPGszzKySmC5RmQBHWQ0KsrD32Ofjd
        DpL3l7qFhQq854b5Ns73DRb49GLeSWSUowpEeWu4RFiJjX3TC7IqP+KbeWciboAt
        fSsD8eOtFsBrrRL0GOuOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668386488; x=
        1668472888; bh=853Q6QTGI1l6Ew34C/zHsFg9+iR6cwS96OTnFTcARoU=; b=D
        VXsBuXktnlMPD3MEtIktJqFX4bxMNx7aVEPeLjw2r9EHyhY9J9FxilrLXt2sxX6L
        E+v9pQhDmmqzNCao/ZzF9A5OQbg/VZ9jeoBwQLDrk8WRJWkXwyyZqCyusmIE+mKl
        PZBNoeKqAGqI0w31LQw/esBvNUS8e0dW96Z7VBE90pjr+xELxAr1NSexQ43+UOuI
        kzM/qjYrAd92qgcEqtThK6UavDkMMzmwEmrxrUoG+AVJwq125B6UpWA7ze+Y+3QU
        C/YAsvFCwLcvc7/Gvo+6KWBlAh5ZbZoj69n5VcJBoQYo1Ms6uDX8E6UXNvuwvSqk
        af2nOS9lCoSAbIda9TWKA==
X-ME-Sender: <xms:t45xY-KawIhKRxJ9n__ESocnH9PGcZGql6PKqmW5E9_l6p0_VEE_Kw>
    <xme:t45xY2Iad1Fq3vyaWmFnezb4aGf922Kb1dFFdt8HOAcKD2yKwJQarzYIp7IV7xebs
    T-4Brw2iH-SnrgPRg>
X-ME-Received: <xmr:t45xY-ufIvcEfusp15dg7_wPCZwsQo8d1HKL33uy9UxVinbBpEOEaJU5QCBQeNpOL0Ih2NCnU_91E8G7wB2jVupRlgBV2bnpOEwFMHcIu54J2vdbO_MnqBUxzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:t45xYzal8tCPFq0BYWdkRI8IF-k7DZtS53AVhPZg1rzhXIDYGqCfiw>
    <xmx:t45xY1agylV04XVjN8WiSc6jU8hxTP_MwlHZ6bwG41dHOTiWSlMwGQ>
    <xmx:t45xY_AkgndULWIIscYO-OnroRmm9c6vMJCEg6GO_wgUvMSmPe2ZkQ>
    <xmx:uI5xY7BTq1cjM2hSRSC7TznLx4LKk_B_FYW-ZeCpslhKE3hTK1PdNg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 19:41:27 -0500 (EST)
Message-ID: <f4309a22-83a6-1d65-d9b4-7ecb1d3e251b@sholland.org>
Date:   Sun, 13 Nov 2022 18:41:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 09/11] ARM: dts: suniv: add device tree for PopStick
 v1.1
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-10-andre.przywara@arm.com>
 <7d7a84bd-78e2-868b-6659-9dcc596c718c@sholland.org>
 <20221114001733.02c94151@slackpad.lan>
From:   Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221114001733.02c94151@slackpad.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/13/22 18:17, Andre Przywara wrote:
> On Sun, 13 Nov 2022 16:41:04 -0600
> Samuel Holland <samuel@sholland.org> wrote:
> 
>> On 11/6/22 09:48, Andre Przywara wrote:
>>> From: Icenowy Zheng <uwu@icenowy.me>
>>>
>>> PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
>>> wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
>>> an on-board CH340 USB-UART converted connected to F1C200s's UART0.
>>>
>>> Add a device tree for it. As F1C200s is just F1C100s with a different
>>> DRAM chip co-packaged, directly use F1C100s DTSI here.
>>>
>>> This commit covers the v1.1 version of this board, which is now shipped.
>>> v1.0 is some internal sample that have not been shipped at all.
>>>
>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile                    |  3 +-
>>>  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 99 +++++++++++++++++++
>>>  2 files changed, 101 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 6aa7dc4db2fc..0249c07bd8a6 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1391,7 +1391,8 @@ dtb-$(CONFIG_MACH_SUN9I) += \
>>>  	sun9i-a80-optimus.dtb \
>>>  	sun9i-a80-cubieboard4.dtb
>>>  dtb-$(CONFIG_MACH_SUNIV) += \
>>> -	suniv-f1c100s-licheepi-nano.dtb
>>> +	suniv-f1c100s-licheepi-nano.dtb \
>>> +	suniv-f1c200s-popstick-v1.1.dtb
>>>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
>>>  	tegra20-acer-a500-picasso.dtb \
>>>  	tegra20-asus-tf101.dtb \
>>> diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
>>> new file mode 100644
>>> index 000000000000..7d69b5fcb905
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
>>> @@ -0,0 +1,99 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include "suniv-f1c100s.dtsi"
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/leds/common.h>
>>> +
>>> +/ {
>>> +	model = "Popcorn Computer PopStick v1.1";
>>> +	compatible = "sourceparts,popstick-v1.1", "sourceparts,popstick",
>>> +		     "allwinner,suniv-f1c200s", "allwinner,suniv-f1c100s";
>>> +
>>> +	aliases {
>>> +		serial0 = &uart0;
>>> +	};
>>> +
>>> +	chosen {
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +
>>> +	leds {
>>> +		compatible = "gpio-leds";
>>> +
>>> +		led {
>>> +			function = LED_FUNCTION_STATUS;
>>> +			color = <LED_COLOR_ID_GREEN>;
>>> +			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 */
>>> +			linux,default-trigger = "heartbeat";
>>> +		};
>>> +	};
>>> +
>>> +	reg_vcc3v3: regulator-3v3 {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vcc3v3";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +	};
>>> +};
>>> +
>>> +&mmc0 {
>>> +	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
>>> +	bus-width = <4>;
>>> +	disable-wp;
>>> +	vmmc-supply = <&reg_vcc3v3>;
>>> +	status = "okay";
>>> +};
>>> +
>>> +&otg_sram {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&spi0 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&spi0_pc_pins>;
>>> +	status = "okay";
>>> +
>>> +	flash@0 {
>>> +		compatible = "spi-nand";
>>> +		reg = <0>;
>>> +		spi-max-frequency = <40000000>;
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>> +
>>> +		partitions {
>>> +			compatible = "fixed-partitions";
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +
>>> +			partition@0 {
>>> +				label = "u-boot-with-spl";
>>> +				reg = <0x0 0x100000>;
>>> +			};
>>> +
>>> +			ubi@100000 {
>>> +				label = "ubi";
>>> +				reg = <0x100000 0x7f00000>;
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +&uart0 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&uart0_pe_pins>;
>>> +	status = "okay";
>>> +};
>>> +
>>> +&usb_otg {
>>> +	dr_mode = "peripheral";  
>>
>> The patch description says the board has a USB Type-A port. Why is the
>> USB controller set to peripheral mode?
> 
> It's a USB type-A *plug*, not a socket, because it's some TV stick
> style of device, just with a USB instead of an HDMI plug.

Ah, that makes sense. Please clarify this in the commit message.

Regards,
Samuel

