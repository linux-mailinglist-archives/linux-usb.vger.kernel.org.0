Return-Path: <linux-usb+bounces-3507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D57FF3CE
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 16:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB76B210F5
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647CC537F1;
	Thu, 30 Nov 2023 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="o3kX6ZpA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FF610F1;
	Thu, 30 Nov 2023 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701358973; x=1701963773; i=wahrenst@gmx.net;
	bh=yhMkKS+sAlCsS1nNe3kHstRuH6SokhhYvl1bbZnnXtY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=o3kX6ZpAW7/CVSaaWHkLLKKxrL20QRhKA612lOqZlaFcRPAgSguhiwxe/jCQhq3E
	 iaHrCojRc/26nflDqXkt4Ov98eXeZp2jCZ+vNqgtuF438xBAnD6yPND4oMIDxqzoI
	 VSgVEibrKmp7Hem5QBYxtPLTHJdJycYRyckR7eysVFn0ASDHtXNjtKgIX/Lqyd0rE
	 zWw+GmsRBZp3SF7rOmPENbWt8ElN79cXh4Z2YRG4CrFY8UpMRbRbZXci1FbDNEbMH
	 vugIU/oCge48hvZKpGS70pYHzWjjYsJwaUMFLONBq83EPDsahsDsnV4g62CXZbZXu
	 SKryzRamASum2Bno8g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1rDyFK16X5-005LZD; Thu, 30
 Nov 2023 16:42:53 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Cyril Brulebois <kibi@debian.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 2/2] ARM: dts: bcm2711: Add generic xHCI
Date: Thu, 30 Nov 2023 16:42:29 +0100
Message-Id: <20231130154229.22334-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130154229.22334-1-wahrenst@gmx.net>
References: <20231130154229.22334-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nFOnVGoxmH762IJxTV32OFk9LqgZ3wepQQVwxougTVVzIBWmZvy
 nNHHfDUkuPckCm4Z4sgDnaLTLwqUX/h2LZsqboWyB9MARFQm27Zv1oW+QinSfQIBP1oq+hd
 veQSjYLIKpc3ag+fioQB3WyLpX2xnsbOQrc1qtAyRzdxlccqztroRIO99GPbXI5Y0ur8YHT
 xESY0cmdfGx+g6+8NiV3A==
UI-OutboundReport: notjunk:1;M01:P0:DqP/bVl2bc0=;gsZO/adFcmtHNOXehG7oq16NB2h
 Lz4hEN8rIxhea/py7dGMLbE20wsDTNnx6NXytzUx+yykdzT4w1zJDygTSEHj7Lzm3GqDy2EE6
 PGCVz3dWrpqzW+/J/ek4GjD72GJkAN/JZjRSeOsxfiDsEz+xgXHFpl6UZExpLWgKAHTcNyFBD
 sEB606hLvLFNURFv7Y4LgguXDSBvdkCv2qIROWwg16EGQdbAjpb8mhLkegljbbORLtP5e6bBB
 SPqeDWuF426P3LFP79LTyEM1OXCcVujnke7ZwFKVpZy+53UGrkLxroHWftaiz6wUvIb+V7+oa
 2vLUJdcJpdglXAUYCLdUQP+7oF9q7qZF/T1EEz2uOg6LLjIvWE/9H7sAwtryiRwYnQoNv3qg5
 gQ3aBIWnyTfpQg3+rUKpohyhE4LTNoqUIjfGOOW4q1s1v8cn1naO926YivD2yzf7b+XXjc1I2
 sEWu484sHfVU5HfxdC1W8svE7caWvBjAEcgahxxKQpl2YIGtwlfqE0uJVYH5bBJSiK7OQjypD
 Buq/9d/6U/a9NVoev60gmQZUDyj5DaX7uXkYtmeI2eDxMGggbX9h8VeHM5v3Jby/pn51C5TAu
 84D3teo8Ys1tnsvOap8WgoJYY75XSKejfgpL7Avf+ttxvNCBrlJoK7mXwfflg2GCt//FqXj1m
 LFdkvEdyAipcKhORbzplvRLXaA/mLlcaN6uLT+kpiAmiwBuPbH79QEG3BJymYRaPPMxLUSIF8
 +AeQH8IMABumwynWM0h7cAHWlXauNRAxGhIFxlUEFm7cZFy7uGEBOv10lXcI/AKQDftgOoxEx
 VZpqEO662l2JDrgjA64YjLRLLv48EpJ650lgbaREpO3JPmyah8o82JGUWrRoTvBymbQPVp2Y0
 e5G6FC8+wT0yB4ELNOhCcgLUSGoZmj5GOx1TiH0rsQ4HZ/EE7LPe4TFJ+g6unm//pI4hoyhv9
 M5P6fA==

The BCM2711 SoC also has a generic xHCI. The USB port is currently
only usable on the Compute Module 4 (e.g. via IO board). Because
DWC2 and xHCI share the same PHY, we let the bootloader enable it
on demand.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi |  5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/d=
ts/broadcom/bcm2711-rpi.dtsi
index 98817a6675b9..d233a191c139 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm2835-rpi.dtsi"

+#include <dt-bindings/power/raspberrypi-power.h>
 #include <dt-bindings/reset/raspberrypi,firmware-reset.h>

 / {
@@ -76,3 +77,7 @@ &v3d {
 &vchiq {
 	interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 };
+
+&xhci {
+	power-domains =3D <&power RPI_POWER_DOMAIN_USB>;
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm2711.dtsi
index 4a379a14966d..8e68884c2f0d 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -604,6 +604,20 @@ genet_mdio: mdio@e14 {
 			};
 		};

+		xhci: usb@7e9c0000 {
+			compatible =3D "brcm,xhci-brcm-v2";
+			reg =3D <0x0 0x7e9c0000 0x100000>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			/* DWC2 and this IP block share the same USB PHY,
+			 * enabling both at the same time results in lockups.
+			 * So keep this node disabled and let the bootloader
+			 * decide which interface should be enabled.
+			 */
+			status =3D "disabled";
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible =3D "brcm,2711-v3d";
 			reg =3D <0x0 0x7ec00000 0x4000>,
=2D-
2.34.1


