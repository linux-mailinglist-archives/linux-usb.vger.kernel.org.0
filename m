Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16EFF61344E
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 12:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiJaLOh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 07:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbiJaLOg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 07:14:36 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41E1BE096;
        Mon, 31 Oct 2022 04:14:35 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55164113E;
        Mon, 31 Oct 2022 04:14:41 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38F7A3F703;
        Mon, 31 Oct 2022 04:14:32 -0700 (PDT)
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
        Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 5/7] arm64: dts: allwinner: h616: Add USB nodes
Date:   Mon, 31 Oct 2022 11:13:56 +0000
Message-Id: <20221031111358.3387297-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031111358.3387297-1-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the nodes for the MUSB and the four USB host controllers to the SoC
.dtsi, along with the PHY node needed to bind all of them together.

EHCI/OHCI and MUSB are compatible to previous SoCs, but the PHY requires
some quirks (handled in the driver).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 622a1f7d16412..74aed0d232a9c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -504,6 +504,166 @@ mdio0: mdio {
 			};
 		};
 
+		usbotg: usb@5100000 {
+			compatible = "allwinner,sun50i-h616-musb",
+				     "allwinner,sun8i-h3-musb";
+			reg = <0x05100000 0x0400>;
+			clocks = <&ccu CLK_BUS_OTG>;
+			resets = <&ccu RST_BUS_OTG>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			extcon = <&usbphy 0>;
+			status = "disabled";
+		};
+
+		usbphy: phy@5100400 {
+			compatible = "allwinner,sun50i-h616-usb-phy";
+			reg = <0x05100400 0x24>,
+			      <0x05101800 0x14>,
+			      <0x05200800 0x14>,
+			      <0x05310800 0x14>,
+			      <0x05311800 0x14>;
+			reg-names = "phy_ctrl",
+				    "pmu0",
+				    "pmu1",
+				    "pmu2",
+				    "pmu3";
+			clocks = <&ccu CLK_USB_PHY0>,
+				 <&ccu CLK_USB_PHY1>,
+				 <&ccu CLK_USB_PHY2>,
+				 <&ccu CLK_USB_PHY3>,
+				 <&ccu CLK_BUS_EHCI2>;
+			clock-names = "usb0_phy",
+				      "usb1_phy",
+				      "usb2_phy",
+				      "usb3_phy",
+				      "pmu2_clk";
+			resets = <&ccu RST_USB_PHY0>,
+				 <&ccu RST_USB_PHY1>,
+				 <&ccu RST_USB_PHY2>,
+				 <&ccu RST_USB_PHY3>;
+			reset-names = "usb0_reset",
+				      "usb1_reset",
+				      "usb2_reset",
+				      "usb3_reset";
+			status = "disabled";
+			#phy-cells = <1>;
+		};
+
+		ehci0: usb@5101000 {
+			compatible = "allwinner,sun50i-h616-ehci",
+				     "generic-ehci";
+			reg = <0x05101000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_BUS_EHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>,
+				 <&ccu RST_BUS_EHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@5101400 {
+			compatible = "allwinner,sun50i-h616-ohci",
+				     "generic-ohci";
+			reg = <0x05101400 0x100>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci1: usb@5200000 {
+			compatible = "allwinner,sun50i-h616-ehci",
+				     "generic-ehci";
+			reg = <0x05200000 0x100>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_BUS_EHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>,
+				 <&ccu RST_BUS_EHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@5200400 {
+			compatible = "allwinner,sun50i-h616-ohci",
+				     "generic-ohci";
+			reg = <0x05200400 0x100>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci2: usb@5310000 {
+			compatible = "allwinner,sun50i-h616-ehci",
+				     "generic-ehci";
+			reg = <0x05310000 0x100>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI2>,
+				 <&ccu CLK_BUS_EHCI2>,
+				 <&ccu CLK_USB_OHCI2>;
+			resets = <&ccu RST_BUS_OHCI2>,
+				 <&ccu RST_BUS_EHCI2>;
+			phys = <&usbphy 2>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci2: usb@5310400 {
+			compatible = "allwinner,sun50i-h616-ohci",
+				     "generic-ohci";
+			reg = <0x05310400 0x100>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI2>,
+				 <&ccu CLK_USB_OHCI2>;
+			resets = <&ccu RST_BUS_OHCI2>;
+			phys = <&usbphy 2>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci3: usb@5311000 {
+			compatible = "allwinner,sun50i-h616-ehci",
+				     "generic-ehci";
+			reg = <0x05311000 0x100>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI3>,
+				 <&ccu CLK_BUS_EHCI3>,
+				 <&ccu CLK_USB_OHCI3>;
+			resets = <&ccu RST_BUS_OHCI3>,
+				 <&ccu RST_BUS_EHCI3>;
+			phys = <&usbphy 3>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci3: usb@5311400 {
+			compatible = "allwinner,sun50i-h616-ohci",
+				     "generic-ohci";
+			reg = <0x05311400 0x100>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_OHCI3>,
+				 <&ccu CLK_USB_OHCI3>;
+			resets = <&ccu RST_BUS_OHCI3>;
+			phys = <&usbphy 3>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.25.1

