Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACDB466515E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 02:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234010AbjAKByI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 20:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234948AbjAKByB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 20:54:01 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CC42EE39;
        Tue, 10 Jan 2023 17:54:00 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DB813D5;
        Tue, 10 Jan 2023 17:54:42 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DEE43F67D;
        Tue, 10 Jan 2023 17:53:58 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, soc@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v5 11/11] ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
Date:   Wed, 11 Jan 2023 01:53:32 +0000
Message-Id: <20230111015332.172021-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111015332.172021-1-andre.przywara@arm.com>
References: <20230111015332.172021-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Lctech Pi F1C200s (also previously known under the Cherry Pi brand)
is a small development board with the Allwinner F1C200s SoC. This is the
same as the F1C100s, but with 64MB instead of 32MB co-packaged DRAM.

Alongside the obligatory micro-SD card slot, the board features a
SPI-NAND flash chip, LCD and touch connectors, and unpopulated
expansion header pins.
There are two USB Type-C ports on the board: One supplies the power, also
connects to the USB MUSB OTG controller port. The other one is connected
to an CH340 USB serial chip, which in turn is connected to UART1.

Add a devicetree file, so that the board can be used easily.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/suniv-f1c100s.dtsi          |  6 ++
 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 76 +++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b100053182d35..5973ecf699707 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1400,6 +1400,7 @@ dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-cubieboard4.dtb
 dtb-$(CONFIG_MACH_SUNIV) += \
 	suniv-f1c100s-licheepi-nano.dtb \
+	suniv-f1c200s-lctech-pi.dtb \
 	suniv-f1c200s-popstick-v1.1.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 111f8bbc2a805..3c61d59ab5f86 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -207,6 +207,12 @@ uart0_pe_pins: uart0-pe-pins {
 				pins = "PE0", "PE1";
 				function = "uart0";
 			};
+
+			/omit-if-no-ref/
+			uart1_pa_pins: uart1-pa-pins {
+				pins = "PA2", "PA3";
+				function = "uart1";
+			};
 		};
 
 		i2c0: i2c@1c27000 {
diff --git a/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts b/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
new file mode 100644
index 0000000000000..2d2a3f026df33
--- /dev/null
+++ b/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022 Arm Ltd,
+ * based on work:
+ *   Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+/dts-v1/;
+#include "suniv-f1c100s.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Lctech Pi F1C200s";
+	compatible = "lctech,pi-f1c200s", "allwinner,suniv-f1c200s",
+		     "allwinner,suniv-f1c100s";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vcc3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&mmc0 {
+	broken-cd;
+	bus-width = <4>;
+	disable-wp;
+	vmmc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pa_pins>;
+	status = "okay";
+};
+
+/*
+ * This is a Type-C socket, but CC1/2 are not connected, and VBUS is connected
+ * to Vin, which supplies the board. Host mode works (if the board is powered
+ * otherwise), but peripheral is probably the intention.
+ */
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.25.1

