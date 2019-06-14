Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC7E458BA
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 11:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfFNJeL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 05:34:11 -0400
Received: from inva021.nxp.com ([92.121.34.21]:54026 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727058AbfFNJeL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jun 2019 05:34:11 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CC3B200E5C;
        Fri, 14 Jun 2019 11:34:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 23474200E53;
        Fri, 14 Jun 2019 11:34:04 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4D359402DD;
        Fri, 14 Jun 2019 17:33:57 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Date:   Fri, 14 Jun 2019 17:35:42 +0800
Message-Id: <20190614093544.11730-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614093544.11730-1-peter.chen@nxp.com>
References: <20190614093544.11730-1-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx7ulp USBOTG1 support.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index fca6e50f37c8..5115e47715c3 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -30,6 +30,7 @@
 		serial1 = &lpuart5;
 		serial2 = &lpuart6;
 		serial3 = &lpuart7;
+		usbphy0 = &usbphy1;
 	};
 
 	cpus {
@@ -133,6 +134,33 @@
 			clock-names = "ipg", "per";
 		};
 
+		usbotg1: usb@40330000 {
+			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
+			reg = <0x40330000 0x200>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_USB0>;
+			phys = <&usbphy1>;
+			fsl,usbmisc = <&usbmisc1 0>;
+			ahb-burst-config = <0x0>;
+			tx-burst-size-dword = <0x8>;
+			rx-burst-size-dword = <0x8>;
+			status = "disabled";
+		};
+
+		usbmisc1: usbmisc@40330200 {
+			compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc";
+			#index-cells = <1>;
+			reg = <0x40330200 0x200>;
+		};
+
+		usbphy1: usbphy@0x40350000 {
+			compatible = "fsl,imx7ulp-usbphy", "fsl,imx6ul-usbphy";
+			reg = <0x40350000 0x1000>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
+			#phy-cells = <0>;
+		};
+
 		usdhc0: mmc@40370000 {
 			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
 			reg = <0x40370000 0x10000>;
-- 
2.14.1

