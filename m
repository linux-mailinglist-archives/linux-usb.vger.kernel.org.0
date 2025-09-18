Return-Path: <linux-usb+bounces-27669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F1B47271
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 17:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8DCC5A1077
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 15:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3BC2FB0A7;
	Sat,  6 Sep 2025 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLhdTWN7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BF2F4A16;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757173420; cv=none; b=P1j5wLst5P49ZGehMD+3C703tjR+ovMMU/TVjKqfadqIRpOvVO6DSQidEKSRtk+wLVvJbyo9fslougZXdjTAl4LTarbNuWUrn0gz+/PXcHrawC6tKIyX29VgJ42rZ6EnvRFF/9B1Cx3iOJrmH0RvzMUsz43YncO3ZJxqECz5LjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757173420; c=relaxed/simple;
	bh=1cAbo9qjTQz9D7gtBYoRZ1si0Ch/NYth8AtFWmyYid0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjhQARiwKjjkWravVRbFgbMVd+ePj572n1U3l1J/5tJ94grdOJoTr5wDDrqUpBzmtzt6YfiAnn1soal8YggA/RHu04lxaueYrFQs+t4nypD5Tk99wdKkThY+qSsq4ZVl2KjIF5flnVT5HyD2wC5mrq3Xljx2gx1Hrqzst09jS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLhdTWN7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9322DC4CEF9;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173420;
	bh=1cAbo9qjTQz9D7gtBYoRZ1si0Ch/NYth8AtFWmyYid0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CLhdTWN7518b2YOZowl6uCZwUxi++4k1F1qckpDAxy8CETpIqc4fiRIn+Bx1NVlAW
	 Mv3if92PKSZvnlGyZIH5c/nZBvIEGadIsml2nw7Qr4HFnuXOlSb8bsbHdSdTx8mFfd
	 9uL4RkhrRUcQSi37RwbtfhjztXy9R/otvtbFlpW55u3wbLTgKMeR/ByAKIhgSFz/Ac
	 E+TA0d3rSOczq+vaKq3QWzPiRj7xjIedG66OxxwENd79o0nix6Z3yXcmkmbHKb8OTD
	 hnA+8lmn7p7wUwfZHDC94E/lNpqN2xGH/fp8uTmY2tUlr3yB78HlIFSUfG7OzIFaGV
	 UXpqLD5jbLDzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6E6CA1012;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:33 +0000
Subject: [PATCH v2 20/22] arm64: dts: apple: t8103: Add Apple Type-C PHY
 and dwc3 nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-20-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10863; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=1cAbo9qjTQz9D7gtBYoRZ1si0Ch/NYth8AtFWmyYid0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesGUd8VN/rhB+X1KvfeIja8NKqZa5Qt3LlUofZdj8b
 ReLnSDbUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjI0hxGhoY4D2Z+vlOprPzJ
 Qt6+p85FqGetYyvMKCybvuFz5LSPjAx/+P/md1wKfh367VPJrUdKwqxh6b39r4/Pn5ySeMz2PrM
 rNwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Add all nodes and connections required to make USB3 work on M1-based
Apple machines.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j293.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j456.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j457.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 137 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 105 +++++++++++++++++++++++
 7 files changed, 302 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..968fe22163d4431fe5e7049854687e61e0ec50f1 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -29,6 +29,18 @@ &wifi0 {
 	brcm,board-type = "apple,atlantisb";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-left";
+};
+
+&typec1 {
+	label = "USB-C Back-right";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..678f89c3d47fbf2d0705b46bb8feba3fa018ca7a 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -46,6 +46,18 @@ &wifi0 {
 	brcm,board-type = "apple,honshu";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Left-back";
+};
+
+&typec1 {
+	label = "USB-C Left-front";
+};
+
 &i2c2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca685708aff136af92a1b316f3c3dd..bce9b911009e2b0caa9d8b2222cd1e8c3215f3b9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,15 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Left-back";
+};
+
+&typec1 {
+	label = "USB-C Left-front";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..9983e11cacdf19d0a92ede108ceac21b7a02d5da 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -47,6 +47,18 @@ hpm3: usb-pd@3c {
 	};
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-right";
+};
+
+&typec1 {
+	label = "USB-C Back-right-middle";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..a622ff607d407519000d1526b7244419a59644a3 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -29,6 +29,18 @@ &wifi0 {
 	brcm,board-type = "apple,santorini";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-right";
+};
+
+&typec1 {
+	label = "USB-C Back-left";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 0c8206156bfefda8a32c869787b2e0c8e67a9d17..758b2196954bc139c201d25298444f59c7832ea5 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,6 +15,8 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
 	};
 
 	chosen {
@@ -53,6 +55,30 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <106 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec0: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec0_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_0_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec0_connector_ss: endpoint {
+						remote-endpoint = <&atcphy0_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	hpm1: usb-pd@3f {
@@ -61,6 +87,117 @@ hpm1: usb-pd@3f {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <106 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec1: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec1_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_1_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					typec1_connector_ss: endpoint {
+						remote-endpoint = <&atcphy1_typec_lanes>;
+					};
+				};
+			};
+		};
+	};
+};
+
+/* USB controllers */
+&dwc3_0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_0_hs: endpoint {
+				remote-endpoint = <&typec0_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_0_ss: endpoint {
+				remote-endpoint = <&atcphy0_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_1_hs: endpoint {
+				remote-endpoint = <&typec1_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_1_ss: endpoint {
+				remote-endpoint = <&atcphy1_usb3>;
+			};
+		};
+	};
+};
+
+/* Type-C PHYs */
+&atcphy0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy0_typec_lanes: endpoint {
+				remote-endpoint = <&typec0_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy0_usb3: endpoint {
+				remote-endpoint = <&dwc3_0_ss>;
+			};
+		};
+	};
+};
+
+&atcphy1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy1_typec_lanes: endpoint {
+				remote-endpoint = <&typec1_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy1_usb3: endpoint {
+				remote-endpoint = <&dwc3_1_ss>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 589ddc0397995ecf6fc11b135164229ab1ee7cf8..f22a1feaf459ddf1601ce7374c2aa0c216b371a1 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/apple.h>
 #include <dt-bindings/spmi/spmi.h>
 
@@ -972,6 +973,110 @@ nvme@27bcc0000 {
 			resets = <&ps_ans2>;
 		};
 
+		dwc3_0: usb@382280000 {
+			compatible = "apple,t8103-dwc3";
+			reg = <0x3 0x82280000 0x0 0xcd00>, <0x3 0x8228cd00 0x0 0x3200>;
+			reg-names = "dwc3-core", "dwc3-apple";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			usb-role-switch;
+			role-switch-default-mode = "host";
+			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
+			power-domains = <&ps_atc0_usb>;
+			resets = <&atcphy0>;
+			phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		dwc3_0_dart_0: iommu@382f00000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x3 0x82f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		dwc3_0_dart_1: iommu@382f80000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x3 0x82f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		atcphy0: phy@383000000 {
+			compatible = "apple,t8103-atcphy";
+			reg = <0x3 0x83000000 0x0 0x4c000>,
+				<0x3 0x83050000 0x0 0x8000>,
+				<0x3 0x80000000 0x0 0x4000>,
+				<0x3 0x82a90000 0x0 0x4000>,
+				<0x3 0x82a84000 0x0 0x4000>;
+			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+				"pipehandler";
+
+			#phy-cells = <1>;
+			#reset-cells = <0>;
+
+			orientation-switch;
+			mode-switch;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		dwc3_1: usb@502280000 {
+			compatible = "apple,t8103-dwc3";
+			reg = <0x5 0x02280000 0x0 0xcd00>, <0x5 0x0228cd00 0x0 0x3200>;
+			reg-names = "dwc3-core", "dwc3-apple";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			usb-role-switch;
+			role-switch-default-mode = "host";
+			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
+			power-domains = <&ps_atc1_usb>;
+			resets = <&atcphy1>;
+			phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		dwc3_1_dart_0: iommu@502f00000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x5 0x02f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		dwc3_1_dart_1: iommu@502f80000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x5 0x02f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		atcphy1: phy@503000000 {
+			compatible = "apple,t8103-atcphy";
+			reg = <0x5 0x03000000 0x0 0x4c000>,
+				<0x5 0x03050000 0x0 0x8000>,
+				<0x5 0x0 0x0 0x4000>,
+				<0x5 0x02a90000 0x0 0x4000>,
+				<0x5 0x02a84000 0x0 0x4000>;
+			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+				"pipehandler";
+
+			#phy-cells = <1>;
+			#reset-cells = <0>;
+
+			orientation-switch;
+			mode-switch;
+			power-domains = <&ps_atc1_usb>;
+		};
+
 		pcie0_dart_0: iommu@681008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x81008000 0x0 0x4000>;

-- 
2.34.1



