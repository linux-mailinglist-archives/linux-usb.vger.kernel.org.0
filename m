Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23524926F0
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 14:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242186AbiARNQo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 08:16:44 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:30788 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236141AbiARNQk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jan 2022 08:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511800; x=1674047800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SZIx2UUKyccq9b4BJo1ObjbdH1RlvdPaczN/UfYCdfk=;
  b=e/zjBlSIP/r2n1BQrGKu6+RCWcHZhld5vYzvG6J3ttWWq0iOnfLW+dHg
   g59XVZlTpepCsRBkRlnph65EZ6vN7+qgb7d1BBK3q7zZpD1/qnpLhxBmB
   fbB1duMhjHL0Z4N5+sLCt5wahlWTHIapqtaYtfprZsnI8I4zxmBALyvXq
   0GZf8yJoAdWX8Dyo06Xbs2oWagocPdPZ20LUSaJGVVzmyTYnniojqVxXk
   XvqDNC47YdD7ipmZeOTjwXfllnSfovuRu1FGevooNo1ZUUsvrEUj2qNYX
   LbSo+DN/zI7LkPJgVmH1t73FkqN8uyTRbqcojIPoX5ySFHpk6AiRAiXez
   A==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564691"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jan 2022 14:16:37 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Jan 2022 14:16:37 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Jan 2022 14:16:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511797; x=1674047797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SZIx2UUKyccq9b4BJo1ObjbdH1RlvdPaczN/UfYCdfk=;
  b=ktOFLDOZWGrQRCsEs8VYKEwby9Z8ywSqB4djYKXbd29oHwwNchkjhrb9
   hoeLmTYYJ7KZtJMq8slQRmJ3x/r4H+zsRMMlfKmxCXHDolXu7DOVihKc5
   eEDFA2OKPfBVyvLf2GES6yqE6opHymalaC9BPbY2nTvg/i9ycKci2ci21
   dDb/vZRmFStyA0EcMJoIH+ciMo9lpWD2i2/9DBOaEhQGyk7LD6fdH+iZT
   43qrb8Wxt2unT3zwxmjiEhJZY+t63YTAIEesHTj7D8/aDLqZ3rjAPf84L
   E+1nkUJKa1SyrhyF97kEf7SUvUJw22fPwJDhPv7m4mEmjHtRXsYC8fc6z
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564690"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2022 14:16:37 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 09B88280065;
        Tue, 18 Jan 2022 14:16:37 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: imx8mp: Add memory for USB3 glue layer to usb3 nodes
Date:   Tue, 18 Jan 2022 14:16:26 +0100
Message-Id: <20220118131626.926394-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
References: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB3 glue layer has 2 areas in the register set, see RM Rev.1
section 11.2.5.2.1 GLUE_usb3 memory map:
* USB3 control/status
* PHY control/status

Provide the memory area to the usb3 nodes for accessing the features
in the USB3 control area.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 6b840c05dd77..baaa49b419fa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -921,10 +921,14 @@ usb3_phy0: usb-phy@381f0040 {
 
 		usb3_0: usb@32f10100 {
 			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10100 0x8>;
+			reg = <0x32f10100 0x8>,
+			      <0x381f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_ROOT>;
-			clock-names = "hsio", "suspend";
+				 <&clk IMX8MP_CLK_USB_ROOT>,
+				 <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "hsio", "suspend", "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -962,10 +966,14 @@ usb3_phy1: usb-phy@382f0040 {
 
 		usb3_1: usb@32f10108 {
 			compatible = "fsl,imx8mp-dwc3";
-			reg = <0x32f10108 0x8>;
+			reg = <0x32f10108 0x8>,
+			      <0x382f0000 0x20>;
 			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
-				 <&clk IMX8MP_CLK_USB_ROOT>;
-			clock-names = "hsio", "suspend";
+				 <&clk IMX8MP_CLK_USB_ROOT>,
+				 <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "hsio", "suspend", "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
 			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.25.1

