Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0733F665157
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 02:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbjAKByA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 20:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234763AbjAKBx4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 20:53:56 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0B506163;
        Tue, 10 Jan 2023 17:53:54 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84834169E;
        Tue, 10 Jan 2023 17:54:36 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9F733F67D;
        Tue, 10 Jan 2023 17:53:52 -0800 (PST)
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
Subject: [PATCH v5 08/11] ARM: dts: suniv: add device tree for PopStick v1.1
Date:   Wed, 11 Jan 2023 01:53:29 +0000
Message-Id: <20230111015332.172021-9-andre.przywara@arm.com>
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

From: Icenowy Zheng <uwu@icenowy.me>

PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
wired to a USB Type-A plug, a SD slot and a SPI NAND flash on board, and
an on-board CH340 USB-UART converted connected to F1C200s's UART0.

Add a device tree for it. As F1C200s is just F1C100s with a different
DRAM chip co-packaged, directly use F1C100s DTSI here.

This commit covers the v1.1 version of this board, which is now shipped.
v1.0 is some internal sample that have not been shipped at all.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/Makefile                    |  3 +-
 .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 81 +++++++++++++++++++
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d08a3c450ce72..b100053182d35 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1399,7 +1399,8 @@ dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
 	sun9i-a80-cubieboard4.dtb
 dtb-$(CONFIG_MACH_SUNIV) += \
-	suniv-f1c100s-licheepi-nano.dtb
+	suniv-f1c100s-licheepi-nano.dtb \
+	suniv-f1c200s-popstick-v1.1.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
 	tegra20-asus-tf101.dtb \
diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
new file mode 100644
index 0000000000000..184c245041a6e
--- /dev/null
+++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+/dts-v1/;
+#include "suniv-f1c100s.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Popcorn Computer PopStick v1.1";
+	compatible = "sourceparts,popstick-v1.1", "sourceparts,popstick",
+		     "allwinner,suniv-f1c200s", "allwinner,suniv-f1c100s";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6 */
+			linux,default-trigger = "heartbeat";
+		};
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
+	cd-gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
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
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pe_pins>;
+	status = "okay";
+};
+
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

