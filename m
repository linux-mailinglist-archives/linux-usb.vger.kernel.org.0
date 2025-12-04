Return-Path: <linux-usb+bounces-31153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC3CA28D6
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32DF53096CE2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086773128A1;
	Thu,  4 Dec 2025 06:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="mUYk7IKF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038861D516C;
	Thu,  4 Dec 2025 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829982; cv=none; b=tbOQMk3jwGDcbktMGryh34HgVqKIbwM0vNQxoGIWCklnsjyF6RY+RrIZl+WQV6RS6p06b9mUSIqb4xSmUa3t6CWr0HN+zgWVRYn+5Ovt6IKR7YcxpbO7l0eiKAUqhJFOWJgHDGEVFh8FczDHBTjBjBeO5gG/5/RqCuJCmWLxYN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829982; c=relaxed/simple;
	bh=CogOCq7Dgo3J6O+ahfKV8yupDN4OJqUtveUj18KHbi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Eok9hc9CX6slN1TLwJjgTn0SJnWo2aLilKCCXw1FddlooK5SqOHN2tnW1g26SlwHrxo2TAxO5ejZjHbBexLyxPJSoSuZuHNyc8oOgWVLaKy011HTwXze3Z8UNhGjVr3ayTHGfXRav1TXc8VBwGe+SShyxAYgeF5eSZcC/jpWu38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=mUYk7IKF; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829972;
	bh=Xn5Sqf6jlBXaETnSdjcUsZQPPZf1EW7Rcj8pIik+fGE=;
	h=From:To:Subject:Date:Message-Id;
	b=mUYk7IKFO62yWgvcas562YXn+UB1szp0PeCAEDJ8WdeoecWrnl9usiXIuu3n7SbNy
	 9y7YRdEJ3WksFjrX53E7qQAjjWjkUVZmoL3pKDDWC68X1FkXIunscCZtdaVsR0vZSX
	 13V9H9N1wLbweNVJtGcR4cIAUZz7udKiCWOq1r5k=
X-QQ-mid: esmtpsz21t1764829926tf415c76b
X-QQ-Originating-IP: tkTUpIKVnQyvaBhmC4pEHcMzVxAgXDbEu6gyl29qYRw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:32:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3720791288520952193
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
Subject: [RESEND PATCH v11 11/11] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
Date: Thu,  4 Dec 2025 14:31:09 +0800
Message-Id: <20251204063109.104-12-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MI8xiyr9SLuAXVPvvA1fD2UVI9ooUgKnNUS6Umv7n1kVpCvmgQu415wj
	z7ruqPFpIhIcp1fi/7uZLJmDcCC79V+Tf36VWIJTqAicDbEsrBcA1Dp23OXzJkJUH6po8xK
	YJifUrfY769qYmJXkXaqE4QJ4FigIJho4iK6Fs/2eSbxaEY9k0xuyJseySKYQbVjiRSScRw
	UHHuMR4Puz6CrMXVxsTGKhOrUNw/x33WoaB9nSasOZsQyqw31+AzjDyMagZsmkbg2qewcpq
	1u+jvemoS7wdAFtTairCgUaYQ7UPzVNgD2fVgz5XfIhNJGOvtPMCaXBq+8ianhBrC8o0mPP
	wPLMW2CxOOW2d1Qu6ucRoi2rLAvOhyXAt7M+PynyINNHqiQdAMxpQ0ys7z33ucRsX44Gotr
	cyObX2QZ6CqNULgV/YM90mudQkMr05yyNLjJfXoWqsEGbj905TaYgZpijXQ0pX/Dz5YLoyB
	0nJVj+Jmx3JYEu6cXXp/yHQHUy7weqKUpS92pLYeonPrJV0O+NwqBTW/o+aQarEAHW4Rzer
	8sAZ5SQeQHwvZKV8QzEIdR38NZP5KzGAcy8kpQfRxlJejzRZImO0pwCRa/3P/bIIB7plmbO
	hXQo36muSD1KsU+E+Ku/zU018q3XFskI8yzdVfLU1W7eVgCFCGvQuZQ902e8ALlObKlk9/h
	WU0ifUG8NUxuUIMuVQnzrTjU6XqPiJcg/rtyprZdfv8w6g4C5bSgFptp1BNqlO+IJWVfzYo
	RuoA+frwOTcs3eLhVvw9xhrGVbDaMXJmVV9WfwjTw9aQ7yLVaoj+WoXab/n5cik2OCPs5PW
	7SgsbgsgcdMcKOH0YAtGt8SMK86R7OUnZhpoNnAX5+2CE9DcNugca93SJUs8zKdO4jOSZ32
	vTaLhPr+Gsthz+94UBrDZc03EOX4c9ohwNt5dh9Va0fXcIBW+afJbUaflmyzRoNAda0WDaR
	quaEQI+63vvnlyqBlzRSyLFNWvKkyt3Nb6LOb0brnkRPLQh5Pw9gRYVJJgpLh0TZVQeMTYi
	lr1YH4myeCeBMn43F+
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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


