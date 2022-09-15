Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E38B5B9475
	for <lists+linux-usb@lfdr.de>; Thu, 15 Sep 2022 08:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiIOG37 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Sep 2022 02:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiIOG3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Sep 2022 02:29:46 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CD695E61;
        Wed, 14 Sep 2022 23:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223360; x=1694759360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jizuBE7T9wBky3xHT1WArxRMZ9G8OPi9vTpXWjEpzCY=;
  b=kCNJcDagzrYL8/+X9bmPL8gKNf5LrA+1wifKrLVR8U03o0fCBOwJw6HO
   nKYfqk1z35ZpFlzAKLgf/282lowajCraskbFWQAH6QlK9+64mpKrOGg3F
   q5GPk/h8tstQY6KAyo5ap9Xh3Bbd2OqtXJUzbx9RTJjyNn7+p9remJEnV
   iy74JTz73J+4EDkDduUjuTlElfI1GaGQmISYVDG+AXvdyzQKMi3Jo/wSk
   jC11fzaa5GTS00R3HA7CeqRxhWWxUnwHrxhQB0/m9ZtjWtPTFS8Nc2tRu
   2QPfOXbv90reURH6nZimDHtEMRBT6c3OpzvzKC/Alm6zYUZ/bFylR2nBK
   w==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189615"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Sep 2022 08:29:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 15 Sep 2022 08:29:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 15 Sep 2022 08:29:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663223345; x=1694759345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jizuBE7T9wBky3xHT1WArxRMZ9G8OPi9vTpXWjEpzCY=;
  b=hqZBO/pUvKVe988+dQ7sjsQ9gkMWiCaJwkZbZhesSiK7IBJNoDALk4CS
   uLWyv63roTP9ezbEeKKwsQCuAaoVBY+kMVwAvuZaRurWgG47N+S3MR0QM
   GjR0k24rag4DH1/Gygt0GOeU8qWR7fkbWsBr/U4zSYsUsgWzbn9Ljbt6l
   W8P1hLF69888Xf4UcqVS5bp6B6Nt0/gcnSuyIQjzccjBKFcV4wKEtRdec
   ZdbYU1ajuoAHNinWuYfXICnQFrHXkRECExFgDbgvTKg2XFnIsRqewgwmE
   AM9QFbkWEIiGaDEgQqOoPd6ZagvhYXXfWEypW2w/euo4xbX6GL17k1/Iw
   g==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654552800"; 
   d="scan'208";a="26189614"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Sep 2022 08:29:05 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DB8A6280056;
        Thu, 15 Sep 2022 08:29:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: tqma8mpql: add support for 2nd USB (host) interface
Date:   Thu, 15 Sep 2022 08:28:55 +0200
Message-Id: <20220915062855.751881-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com>
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

The on-board USB hub has a single reset line which needs to be enabled.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 7bf6f81e87b4..1c440909f580 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -461,11 +461,23 @@ &usb3_0 {
 	status = "okay";
 };
 
+&usb3_1 {
+	fsl,disable-port-power-control;
+	fsl,permanently-attached;
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usb3_phy0 {
 	vbus-supply = <&reg_vcc_5v0>;
 	status = "okay";
 };
 
+&usb3_phy1 {
+	vbus-supply = <&reg_vcc_5v0>;
+	status = "okay";
+};
+
 &usb_dwc3_0 {
 	/* dual role is implemented, but not a full featured OTG */
 	hnp-disable;
@@ -486,6 +498,31 @@ connector {
 	};
 };
 
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbhub>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vcc_3v3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vcc_3v3>;
+	};
+};
+
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
@@ -720,6 +757,10 @@ pinctrl_usbcon0: usb0congrp {
 		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x1c0>;
 	};
 
+	pinctrl_usbhub: usbhubgrp {
+		fsl,pins = <MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11		0x10>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x192>,
 			   <MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d2>,
-- 
2.25.1

