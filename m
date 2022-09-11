Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3EE95B521E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 02:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiILACG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Sep 2022 20:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiILACE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Sep 2022 20:02:04 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CED0A24979;
        Sun, 11 Sep 2022 17:02:02 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8C9B113E;
        Sun, 11 Sep 2022 17:02:08 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06B13F73B;
        Sun, 11 Sep 2022 17:01:59 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 6/7] arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
Date:   Mon, 12 Sep 2022 00:59:44 +0100
Message-Id: <20220911235945.6635-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220911235945.6635-1-andre.przywara@arm.com>
References: <20220911235945.6635-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The OrangePi Zero 2 has one USB-A host port, VBUS is provided by
a GPIO controlled regulator.
The USB-C port is meant to power the board, but is also connected to
the USB 0 port, which we configure as an MUSB peripheral.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../allwinner/sun50i-h616-orangepi-zero2.dts  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 02893f3ac99d..3197dc43397b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -49,8 +49,25 @@ reg_vcc5v: vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	reg_usb1_vbus: usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+		enable-active-high;
+		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
+		status = "okay";
+	};
 };
 
+&ehci1 {
+	status = "okay";
+};
+
+/* USB 2 & 3 are on headers only. */
+
 &emac0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ext_rgmii_pins>;
@@ -76,6 +93,10 @@ &mmc0 {
 	status = "okay";
 };
 
+&ohci1 {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -211,3 +232,24 @@ &uart0 {
 	pinctrl-0 = <&uart0_ph_pins>;
 	status = "okay";
 };
+
+&usbotg {
+	/*
+	 * PHY0 pins are connected to a USB-C socket, but a role switch
+	 * is not implemented: both CC pins are pulled to GND.
+	 * The VBUS pins power the device, so a fixed peripheral mode
+	 * is the best choice.
+	 * The board can be powered via GPIOs, in this case port0 *can*
+	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
+	 * then provided by the GPIOs. Any user of this setup would
+	 * need to adjust the DT accordingly: dr_mode set to "host",
+	 * enabling OHCI0 and EHCI0.
+	 */
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
-- 
2.35.3

