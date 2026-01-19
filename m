Return-Path: <linux-usb+bounces-32479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B78EBD3A013
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17043062CFA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F44336EFF;
	Mon, 19 Jan 2026 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="JR3kSHVA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274127991E;
	Mon, 19 Jan 2026 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807983; cv=none; b=uOTdeELWlDcyOuQAoL9Zzr/x7B4kW3ZWFxnVGv368NuGLzonXN94vcy8d93iNpgVXRptWFT8kjEVBrfH7Q6koRfEJTtw+YP3c/XdgKaX9KKD96CjFg7pJ76r7p/yRs4bB1PJVQlEiicSLnuaQpP0Q3vGtJESTqleZUcAlGGZmfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807983; c=relaxed/simple;
	bh=wFnaLVPpDQm//bP6iFP69Ahx9vGyahry2cq4Wey0uVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HOes3FjbEB/3VbU+0gy3boDkp0sf6m9C9d5gEQweUAjsL2hbx6ImzsgniR5Qyt84PTvbd3wREIFEtd/CSn441Eyo9rluwDqCaJ3qkvTmJw4u7svEpkE0xZsq5JyOHHf3o95Plkea0uy60YVefA+08/4+DXz9vcgqhtzVMsq+XKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=JR3kSHVA; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807949;
	bh=U0ahzAOwsK3I30DVXt7Ne0dyRxyxzPxU5WVcboIAjPU=;
	h=From:To:Subject:Date:Message-Id;
	b=JR3kSHVA6czN1Hfs6EmBfPpqLufzbFUFrVXa0w6FgA9ALhKWpoHCEoeiJmDea3Ii8
	 zPN72i39Tp7txSZdlTw+s4MPf/YUKuC4HMxXBPJ57JIM64Y5CUU03Lu7/p0pV+b4YU
	 yvRjoh3YJ/k/gHLQFGVg+DoaHBnCYSBb9Pgc7Tcg=
X-QQ-mid: esmtpsz17t1768807947t6c620025
X-QQ-Originating-IP: 4/DQe9zBJPz+u7arfEakRzgFkkH4PMCGXrVkOz+gmz8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:32:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9088237500228411525
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v14 9/9] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
Date: Mon, 19 Jan 2026 15:31:00 +0800
Message-Id: <20260119073100.143-10-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NFNrK8KlcSCRWT5gKTpomERfTBWZBEWLNm7vkYvxJ0BFkXG6eKFhOBbs
	pryx8J9fojFRJePxoLUQmiYekFPx/kkKIz+DTEO/IsoY57n9N6iVidK1XczeG4nP5Tf8VYC
	CPvqyVsXFIARR2yi0JIwiBbY1LjCx7nykUYASF2wwxQFQIaAchOsbKsb/iAL+duZuMzPvcu
	ejYx3PJEpi21o3qbNoTR8ZGpmsT+F/VpVoyucBgizC59QK0ywL38ypBoYM3HuNdlWpcNwya
	R43BYjKC9HIEwbYDtTDhXL+1PvBLrDSvPgSmiClnzeiRLuFVaDp5D4MQUePqH1ocFk1Ec23
	OzuBNNwsauYRCRZg5Mo+6w75TT5PKs5oUzhNctrAiCxOXm/cdU5xjdicpDw9FgdnHi/yrmw
	cpgDyr2iwqsXrHX6+r5w+fR6WBwbPR4KcBCrt2u4xm3xkLJldTJLvTC6xgH6PhVBU+iR970
	PBe8ejw9jLUESHS2/rsKihWCvSIyrgX9iPeaW5zlx0zVSCpFk0PpECARyeVCk/01cwYU1w6
	2sK4CXSKnyX4Z5E7FZwAFR+6SB64lkVfVuRFw+a8qNgXvCW0OwHPdtXzU5+1ieAKJZizbEQ
	a0w0En0Tc1Tp4QPI4zp42xvdaJ9K2aBvYG2lF4CDpFT3/HXMQi9FdONl0tvEY+9VUR8MoaN
	X3Z5fAOc2Xp125wxoxqlacrDW8J83u1vxpWnF1jeGttHy4g4gRU4yq72p0sSjmaQaEHwxKD
	dugBh6t5RwicINv0KoUOjU9f57gwAhrf/KYW2ImiB3sR+bDyigd63/KdLh/xSsyWHkOwWUt
	bJdTVuBzoTN00XrV59MUSD1Mf0fx7Nq1qwnpUA0uVjW0ef6jVPcLMlJitPv2pqRdt3Qozir
	JVNwnRaNsoGEDmfCsLRk3QshwDQsRSx9e4xlMCn/bRWOgpqEgRJja7m50RppXjEOQW2GEqr
	uvwnCSb+Fo9XRak+ODlySqDJDzX/3dbMrZor4eRp/RAz6FFcYJNnP8ORDOQEVXSoeImi8lI
	Tq0/GwJ70GuvijEyFk
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 EVB IND board has a Type-C interface DisplayPort.
It use fusb302 chip as Type-C controller.

fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v10)

Changes in v9:
- Add usb role switch for Type-C.
- Remove USB2 PHY in Type-C connection.

(no changes since v4)

Changes in v3:
- Fix wrong vdo value.
- Fix port node in usb-c-connector.

Changes in v2:
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.
---

 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 147 ++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1ab904c..be1e90f7a453 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/usb/pd.h>
 #include "rk3399.dtsi"
 
 / {
@@ -19,6 +20,21 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	sound: sound {
+		compatible = "rockchip,rk3399-gru-sound";
+		rockchip,cpu = <&i2s0 &spdif>;
+	};
+
+	vbus_typec: regulator-vbus-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_typec0_en>;
+		regulator-name = "vbus_typec";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -31,6 +47,11 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 	};
 };
 
+&cdn_dp {
+	phys = <&tcphy0_dp>;
+	status = "okay";
+};
+
 &cpu_b0 {
 	cpu-supply = <&vdd_cpu_b>;
 };
@@ -55,6 +76,12 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_l>;
 };
 
+&dp_out {
+	dp_controller_output: endpoint {
+		remote-endpoint = <&dp_phy_in>;
+	};
+};
+
 &emmc_phy {
 	status = "okay";
 };
@@ -341,6 +368,71 @@ regulator-state-mem {
 	};
 };
 
+&i2c4 {
+	i2c-scl-rising-time-ns = <475>;
+	i2c-scl-falling-time-ns = <26>;
+	status = "okay";
+
+	usbc0: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0x00001c46>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&tcphy0_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_role_sw: endpoint {
+						remote-endpoint = <&dwc3_0_role_switch>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					dp_altmode_mux: endpoint {
+						remote-endpoint = <&tcphy0_typec_dp>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2s2 {
 	status = "okay";
 };
@@ -354,6 +446,16 @@ &io_domains {
 };
 
 &pinctrl {
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vcc5v0_typec0_en: vcc5v0-typec0-en {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -400,10 +502,48 @@ &sdmmc {
 	status = "okay";
 };
 
+&sound {
+	rockchip,codec = <&cdn_dp>;
+	status = "okay";
+};
+
+&spdif {
+	status = "okay";
+};
+
 &tcphy0 {
 	status = "okay";
 };
 
+&tcphy0_dp {
+	mode-switch;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tcphy0_typec_dp: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&dp_altmode_mux>;
+		};
+
+		dp_phy_in: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_controller_output>;
+		};
+	};
+};
+
+&tcphy0_usb3 {
+	orientation-switch;
+
+	port {
+		tcphy0_orientation_switch: endpoint {
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+	};
+};
+
 &tcphy1 {
 	status = "okay";
 };
@@ -461,7 +601,14 @@ &usb_host1_ohci {
 };
 
 &usbdrd_dwc3_0 {
+	usb-role-switch;
 	status = "okay";
+
+	port {
+		dwc3_0_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
 };
 
 &usbdrd3_0 {
-- 
2.51.1


