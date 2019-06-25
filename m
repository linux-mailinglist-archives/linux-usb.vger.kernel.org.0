Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D3D528F3
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 12:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731847AbfFYKE2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 06:04:28 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34069 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFYKE1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 06:04:27 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hfiJK-0002rS-QB; Tue, 25 Jun 2019 12:04:22 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hfiJK-00038F-Eu; Tue, 25 Jun 2019 12:04:22 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>, Peter Chen <Peter.Chen@nxp.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Date:   Tue, 25 Jun 2019 12:04:12 +0200
Message-Id: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The usb phys are internal to the SoC and so it their 5V supply. With
this regulator added explicitly the following (harmless) boot messages
go away:

	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not found, using dummy regulator
	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not found, using dummy regulator

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note I'm an USB noob, so please consider carefully before applying :-)
I also put the regulator near the usbphy node instead of in alphabetic
order. Not sure what is sensible/usual here, too.

Best regards
Uwe

 arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -614,6 +614,11 @@
 		};
 	};
 
+	reg_usb: regulator_usbphy {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-phy supply";
+	};
+
 	usbphy {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -623,12 +630,14 @@
 			reg = <0>;
 			compatible = "usb-nop-xceiv";
 			#phy-cells = <0>;
+			vcc-supply = <&reg_usb>;
 		};
 
 		usbphy1: usb-phy@1 {
 			reg = <1>;
 			compatible = "usb-nop-xceiv";
 			#phy-cells = <0>;
+			vcc-supply = <&reg_usb>;
 		};
 	};
 };
-- 
2.20.1

