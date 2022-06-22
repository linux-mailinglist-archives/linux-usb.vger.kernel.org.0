Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006CA554A6E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 15:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350380AbiFVNE6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 09:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350021AbiFVNEz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 09:04:55 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BBC658F
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903093; x=1687439093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hsE+SxtSbI20PcB6X+2FIGDwio8lUT1/4myfdKMjlk=;
  b=PTpS674y7DLErMj3mUPT617STM6T6IL6MzZJj4cPlIXFLl0roh7KiNLo
   dHEsixtzIX8MCr6KfC3WShZAvP0C41dI0MTJ9Izw05XjwtorWg1RJtw8t
   1Zs9D44d0+XHBG5EjFpSSE5eFXfzphSRxRIof5UPxxaC7Xv1aOfXLlnR9
   C6tQ+/guB2mTwuyNGZV0npkMivlMZ0Ma0p4euApEpWhSZliFZul1FvsbI
   kVhKOxPYNBnDqt3g7CU+HlrUCBGSSkp4TvcwE4GFjr3KXtvKjDyXWSJi/
   7gwDfdloiFT2RxeFWPvsHrvHQF5Pqnku/3TwAj79z+vDnt2QpNh+lTo3u
   A==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605524"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jun 2022 15:04:48 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 22 Jun 2022 15:04:48 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 22 Jun 2022 15:04:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903088; x=1687439088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hsE+SxtSbI20PcB6X+2FIGDwio8lUT1/4myfdKMjlk=;
  b=JfMOQx546RfjncDhaD0aDXW9/0BOXbwS/Wzev4ntFLdkN0KBQRtO4fYi
   878EPnpkoWmJNQVP4AnezpMOuqiU+/Nq5tu5RqlbvWH6mGX+2LHLI8nLL
   um5yMb5jTDDWn+gPl7d8mjkjSZCq4+xy6XmYj1M5oZlVZma2rHj9W/DCR
   yCv51tqeTMDUf0dAlSDYK+i5gfAhmdaju+Ja7IkvEBHyBX+FFQvpeXirB
   ilB8Sc91UdgoKx7Hwx7j7xvSqpbzmrd7/mxhq618w5d9P/n0S4CvicnPm
   /LHymGQoXR2RjC/Gl+vHvVb9Y5z5QRZEQYk3olezdpsMoQYy5JUZF6yqm
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605523"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jun 2022 15:04:48 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D20C9280072;
        Wed, 22 Jun 2022 15:04:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 4/4] arm64: dts: tqma8mpql: add USB support
Date:   Wed, 22 Jun 2022 15:04:40 +0200
Message-Id: <20220622130440.955465-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
References: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With last feature bits added, USB is supported on TQMa8MPQL for both host
and DR interface.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 772cbb664b2a..d8947a180318 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -272,7 +272,7 @@ &flexcan2 {
 
 &gpio1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio1>;
+	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_usbhub>;
 
 	gpio-line-names = "GPO1", "GPO0", "", "GPO3",
 			  "", "", "GPO2", "GPI0",
@@ -282,6 +282,13 @@ &gpio1 {
 			  "", "", "", "",
 			  "", "", "", "",
 			  "", "", "", "";
+
+	usb-hub-reset-hog {
+		gpio-hog;
+		gpios = <11 0>;
+		output-high;
+		line-name = "USB_HUB_RST#";
+	};
 };
 
 &gpio2 {
@@ -465,6 +472,52 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb0>;
+	status = "okay";
+};
+
+&usb3_0 {
+	fsl,over-current-active-low;
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	/* dual role is implemented, but not a full featured OTG */
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		type = "micro";
+		label = "X29";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbcon0>;
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	fsl,disable-port-power-control;
+	fsl,permanently-attached;
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl_backlight: backlightgrp {
 		fsl,pins = <MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19		0x14>;
@@ -672,6 +725,19 @@ pinctrl_uart4: uart4grp {
 			   <MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140>;
 	};
 
+	pinctrl_usbcon0: usb0congrp {
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x1c0>;
+	};
+
+	pinctrl_usb0: usb0grp {
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x1c0>,
+			   <MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x1c0>;
+	};
+
+	pinctrl_usbhub: usbhubgrp {
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11		0x10>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x192>,
 			   <MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d2>,
-- 
2.25.1

