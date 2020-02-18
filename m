Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDCBC161EB7
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 02:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgBRByw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 20:54:52 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:37711 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgBRByv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 20:54:51 -0500
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Tue, 18 Feb 2020
 09:55:09 +0800
From:   Hanjie Lin <hanjie.lin@amlogic.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH v9 3/3] arm64: dts: meson: a1: Enable USB2 PHY and DWC3 controller
Date:   Tue, 18 Feb 2020 09:54:19 +0800
Message-ID: <1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
References: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable USB2 PHY and DWC3 controller for Meson A1 SoC.

Signed-off-by: Yue Wang <yue.wang@amlogic.com>
Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6fdc0dd..3b7ca50 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -6,6 +6,9 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-a1-power.h>
+#include <dt-bindings/reset/amlogic,meson-a1-reset.h>
+#include <dt-bindings/clock/a1-pll-clkc.h>
+#include <dt-bindings/clock/a1-clkc.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -100,6 +103,17 @@
 				#power-domain-cells = <1>;
 				status = "okay";
 			};
+
+			usb2_phy1: phy@40000 {
+				compatible = "amlogic,a1-usb2-phy";
+				clocks = <&clkc_periphs CLKID_XTAL_USB_PHY>;
+				clock-names = "xtal";
+				reg = <0x0 0x40000 0x0 0x2000>;
+				resets = <&reset RESET_USBPHY>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+				power-domains = <&pwrc PWRC_USB_ID>;
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
@@ -114,6 +128,35 @@
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
+
+		usb: usb@ffe09000 {
+			status = "disabled";
+			compatible = "amlogic,meson-a1-usb-ctrl";
+			reg = <0x0 0xffe09000 0x0 0xa0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc_periphs CLKID_USB_CTRL>,
+				 <&clkc_periphs CLKID_USB_BUS>,
+				 <&clkc_periphs CLKID_XTAL_USB_CTRL>;
+			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_ctrl";
+			resets = <&reset RESET_USBCTRL>;
+
+			dr_mode = "host";
+
+			phys = <&usb2_phy1>;
+			phy-names = "usb2-phy1";
+
+			dwc3: usb@ff400000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff400000 0x0 0x100000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				snps,dis_u2_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+			};
+		};
 	};
 
 	timer {
-- 
2.7.4

