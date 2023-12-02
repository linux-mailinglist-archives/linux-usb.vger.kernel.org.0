Return-Path: <linux-usb+bounces-3602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2C801FB0
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 00:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01121C20864
	for <lists+linux-usb@lfdr.de>; Sat,  2 Dec 2023 23:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7F6224D8;
	Sat,  2 Dec 2023 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CR58v8pi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31BBFD;
	Sat,  2 Dec 2023 15:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701559377; x=1702164177; i=wahrenst@gmx.net;
	bh=1yHSNAC8bttHA6etqyuvQwPmI2IH8vcMMN4otfV1ovM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=CR58v8piGKktaHJHTEyfJjzEDVT/Hl6nEuUOU010dXUC9Sc1fuyyMGL8VWzvWijb
	 WjfNzcIaC7fHJuZpoxMZFhk0/pTPMESOISVMKjJ46Flkece5+JG6zhcqqj3MH1Ucm
	 CmNf6LgK5eJ4pCl5U1OMVtLgCUkFdPxs4NTJgsdm4XLqXCn6XtpYRAlyMr3PUhiF+
	 j95phUHJrBUYjhxZJy2iSA72IwWrTFxeUgLor6RbIbLe+rayMrTmhyXIPNPDcvUGc
	 6g7E1VKPlIW+FaThs1MFCWa+Ytq8md9Y2IzYI9Hzl6urLg7YHSq6EC2qBSN6gWnHg
	 diC5jdbwLhcCuyODAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Vi-1rKRJJ0l0y-016Obq; Sun, 03
 Dec 2023 00:22:57 +0100
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
Subject: [PATCH V3 3/3] ARM: dts: bcm2711: Add BCM2711 xHCI support
Date: Sun,  3 Dec 2023 00:22:17 +0100
Message-Id: <20231202232217.89652-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231202232217.89652-1-wahrenst@gmx.net>
References: <20231202232217.89652-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oNPvOdjYtiFOilEXE/1leOM7ZjfciiG7DjObmgGpBw4RREIAqhu
 wCYZ0ZleIUeNr7Cqtc5NKBF2TQEljc6ld9ceaclTubDUDrpBnE3V3V5Gsp75zK5lKRXUeaq
 F5Ga4Vx8YfRFVjtgXKiTyyBti5dUJP/0suZIWpqTfhnBofokB7WSDnUtJVa6FvguMTeSzL/
 Rasr3YY/2Nq8Rv2/u3xpA==
UI-OutboundReport: notjunk:1;M01:P0:ybfmQK7mqQc=;v9tWK0EXOv41q04Vz6HWv8Tao3+
 YU/cNJsSwPSH2C4EUr4ZdCtwAxgbrB3m8Iuu4u56vmOhkjker+wYvFPAs7ZFNKKJ7iOUgZPul
 lb2Ft29bYfhQGCyFvUxZl50pKKsyqmZLLpFmRQw9FZbSzvCVF4iIdIPfH7mURvO3tuZQ8WUqa
 IBwLkQlYcIS25jpKzsFomejd6SaAGGFUYo8X+XA5qlrgSERsOcCJweoMyhqL7gsGBr5r1zcGp
 P+HYEYcAGLPktEXadcTwhbN6Je7bNHjQ9gpTX+5+2I9dnVXy2kI2EYIgmbZbwXZ6RsF2oEytD
 CpPFGmaKWu4PK7qgWYarR1I24oL3bs0+0gPLNCS8oDCHdafePRWwvlUahuZ8+Y81dFm0QM5XQ
 JxbFV/fVqgI8Nijb3pz7lR1nSFjQZbS4GWIDd0/IV/J9e4iSc6GVqKHXF/WWtnulHMtUCfwV5
 Hb+ihoxjSvkQApjCeBnBpgjDM5NFsPuzEolpqllQvBJCzlGhMboSTxC2s/s5MJAsLiXgNC/nv
 XP0ai6Lv8jx/AeVQANhn/gH7tGDlhUpTq98BZzl/9gDExo12xa9xswKBt+b1yJwqUxnNyoydO
 5uUUPwShycL24s1ZamwcKp4th0zaRPipZMfxsAJSV2OG8u77ClV+awqf89T5Jn2FX0wCQaEz/
 5JaVk+elzZROf7a+q+nrDLSSfGwrAm4Tn+OlKX4mSRAtXyS/Q4O8a/MqmQAm+Zyrcode2Ra9z
 iACwWSmQoNPfW9lXhDb3ofCJEurtYAbQsgoK0MHg/Cp4fumLR6G+i2kE9W1gL+1aoV0fqYe8e
 ELV4qr8l4LwGHOr3tRo6yMQBzjSVWXpeymx7wSkg2eFdHfvdzCkVzsXyXEqKHP4nLcLWFRMks
 kYE1+jF61K9Q62LzDjwOt4bukRmn5kxSk3arFziseHQ8DwTJwaRmtu2BH+ciRMgF0p3NXk1WL
 Xrj0gCQx7iTjbqp6YrnAkGAfZik=

The BCM2711 SoC also has a mostly generic xHCI. The USB port is
currently only usable on the Compute Module 4 (e.g. via IO board).
Because DWC2 and xHCI share the same PHY, we let the bootloader
enable it on demand.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
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
index 4a379a14966d..ed5ef36e08ff 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -604,6 +604,20 @@ genet_mdio: mdio@e14 {
 			};
 		};

+		xhci: usb@7e9c0000 {
+			compatible =3D "brcm,bcm2711-xhci";
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


