Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415524FEE9
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 04:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfFXCBU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 22:01:20 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55434 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbfFXCBU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 22:01:20 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4D4D21A0ED4;
        Mon, 24 Jun 2019 04:01:18 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A37261A1022;
        Mon, 24 Jun 2019 04:01:11 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5DE844030F;
        Mon, 24 Jun 2019 10:01:03 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        sergei.shtylyov@cogentembedded.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 7/8] ARM: dts: imx7ulp-evk: enable USBOTG1 support
Date:   Mon, 24 Jun 2019 10:02:57 +0800
Message-Id: <20190624020258.21690-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624020258.21690-1-peter.chen@nxp.com>
References: <20190624020258.21690-1-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable USBOTG1 support for evk board, it is dual-role function
port.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm/boot/dts/imx7ulp-evk.dts | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp-evk.dts b/arch/arm/boot/dts/imx7ulp-evk.dts
index a09026a6d22e..c8a56a2ae9a5 100644
--- a/arch/arm/boot/dts/imx7ulp-evk.dts
+++ b/arch/arm/boot/dts/imx7ulp-evk.dts
@@ -22,6 +22,17 @@
 		reg = <0x60000000 0x40000000>;
 	};
 
+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg1_vbus>;
+		regulator-name = "usb_otg1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio_ptc 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_vsd_3v3: regulator-vsd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -40,6 +51,17 @@
 	status = "okay";
 };
 
+&usbotg1 {
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1_id>;
+	srp-disable;
+	hnp-disable;
+	adp-disable;
+	over-current-active-low;
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc0>;
@@ -57,6 +79,19 @@
 		bias-pull-up;
 	};
 
+	pinctrl_usbotg1_vbus: otg1vbusgrp {
+		fsl,pins = <
+			IMX7ULP_PAD_PTC0__PTC0		0x20000
+		>;
+	};
+
+	pinctrl_usbotg1_id: otg1idgrp {
+		fsl,pins = <
+			IMX7ULP_PAD_PTC13__USB0_ID	0x10003
+			IMX7ULP_PAD_PTC16__USB1_OC2	0x10003
+		>;
+	};
+
 	pinctrl_usdhc0: usdhc0grp {
 		fsl,pins = <
 			IMX7ULP_PAD_PTD1__SDHC0_CMD	0x43
-- 
2.14.1

