Return-Path: <linux-usb+bounces-29831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3EC18AA5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C660A4272A4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C54313E39;
	Wed, 29 Oct 2025 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="SsrOt5fI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347330FC15;
	Wed, 29 Oct 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722185; cv=none; b=TCd83+qywX5m7gqyzJMyGsVMyZU60EyjJFXJ2JsQMnLXreHm4Mc2Lzf3kOX6faB+5c77hYtjbxH2f73oKvijxsMU7slZmlVQyGoBuHZZIVlAt1p+ds007vKaXHeYzQCfB76Mb/6eOtt87iBPPHxyUwHO9MecprCPZly5yuXUr2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722185; c=relaxed/simple;
	bh=Ksu1m13XDgyOSNrC/yix/S/ref0aCyYvyb9gG5K8i98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=o3DI6qeUJhmqfRY9XTJPkdLYylpNPhFc6i4hZtOHXzP5a2+6PrcOyQZfYKjWyhrU+Xw4dgKkorXuQ3CKek1fGFWyQ3sv7s72FLsXVc6OnkQuEJHk0IZlH9fHwbYCDAh3s+rrYMu+7/vgVf0te55HF+9YeEaqfwrSKrobtO1yBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=SsrOt5fI; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722180;
	bh=1RfAR5qe3fDpGYWfe4IMPee9wlWopj1wjBrVtJQSHJQ=;
	h=From:To:Subject:Date:Message-Id;
	b=SsrOt5fIppt0YBJh8yDpIJQNMSDu4wUOzfXmTcuETjFr8wrA6JOoE6Sao4l2vykn7
	 TBQYhAkvRDL6Qh+D89BYW1izJXOHZgzesu9z9f/VQqLrLSbrsQn+L67llIwYIFjr/y
	 13gIExQP6k0d/eiDAaEVBKxFOvzNN0Hyir6PxsSM=
X-QQ-mid: zesmtpsz6t1761722139t9151357f
X-QQ-Originating-IP: /bUuDFF9LoIstyTpUXcLBmZNXpV9iclT5Q9ER/D5JLM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:15:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10265484516757037659
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
Date: Wed, 29 Oct 2025 15:14:35 +0800
Message-Id: <20251029071435.88-11-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M7n9VusxZAlPpcFABy826l+dX5bFLJ2tIe+Ym4xWc0gIXQagk5S7825C
	f0IhRLDnvP4dRMuvkw4vZrQ90mOJuuhE19CZUq9Iqjzfkzmk5Tx1n3DWbu6r2W6pbsV45AM
	YiYCjN5HYHASQdu92D3MaYyMK2szeySDAthZt89ko477ZvPT9e3IsXc5c+Yb8nKcoWxGofv
	KdkQMBNHG9VHW/6kznWApTGaSmnvw1no7Yfaei2QbDNsMBs4wWUPGSZLKJvBZez1xmZkG97
	BGDztmzjSG1b1EdK16VfSrezHZUK+wW6vxWKyu3EkP9DidhpCid4Xa//Aa+RwQuLQMfz3v8
	/voGtML0TbgvcXCVsPPixoZc3XpKd8Dywrjv46CVBWt7dFNW0JRYUpwagehV+hBJWoxAD01
	uqluaeDjEj+DMbYEurGC0AUVzqD26sboh88cAVYZNn+6h903CVuktyOKX3ACj+RNS7gbiwQ
	g6B/m5n1h5wxxQSbMnJlUBXynRAnek8dOEeMP7GCLadUIvaj/QR5QYMn/tkyYfVR/KFKB3A
	IXCXiOl3y0cb6hB62LdVUMftlUnDHR/htOFK1eoriQ6uYQ0j+JgyCQR0RMRF66CH/JjCnBp
	x0GdfPcRzXtR4QZmLECi+64T4XDhUPMxeIU5VXgmRYG5MLenCztbvyfeKK74aJv1wHYzQhl
	aMflFdsPSnV1AnWr+AAdahvZfDYUHdEoYV1neShEGcNUS6THzSMqE6JUgo3OGfvGHz3wR77
	m0G5u6b1vpmSybDiUiH9qiktKALx1qhQq683s/ZyQgzz65hnqSh8lWALrPXYbCIcCC/Jo3w
	FQblldDEjdnj1Cc9zDF8r7LsVZDt+gPRTYkR/zoa6EJJOUHKbfDbA+l42SYDn+Y6VbQHqEo
	WauadUjZLybqJ14u5Q3dIxFW3WGW0stmqZK544J5TKvBVzaNf1xTHn4fcVcylVGR135wg14
	j2ByJgyvznh4wtWCEr+pIZkNBL5XaYPcMzXAJvlEmu+nwCUiCR0lb/M0ny8olOlfwksMNkU
	OSXlmsIEaPC57wgYLA9pZSfhn1wvHMeIWoXzzhl75NpEFFp2wJ
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

(no changes since v4)

Changes in v3:
- Fix wrong vdo value.
- Fix port node in usb-c-connector.

Changes in v2:
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.

 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1ab904c..aeeee6bd2973 100644
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
+					usbc_hs: endpoint {
+						remote-endpoint = <&u2phy0_typec_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc_ss: endpoint {
+						remote-endpoint = <&tcphy0_typec_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usbc_dp: endpoint {
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
+			remote-endpoint = <&usbc_dp>;
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
+		tcphy0_typec_ss: endpoint {
+			remote-endpoint = <&usbc_ss>;
+		};
+	};
+};
+
 &tcphy1 {
 	status = "okay";
 };
@@ -418,6 +558,12 @@ &tsadc {
 
 &u2phy0 {
 	status = "okay";
+
+	port {
+		u2phy0_typec_hs: endpoint {
+			remote-endpoint = <&usbc_hs>;
+		};
+	};
 };
 
 &u2phy0_host {
-- 
2.49.0


