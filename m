Return-Path: <linux-usb+bounces-3753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B5805F12
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 21:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9DE8281FB1
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 20:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87CB68EA7;
	Tue,  5 Dec 2023 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NH6VoiTD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04D71A4;
	Tue,  5 Dec 2023 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701806764; x=1702411564; i=wahrenst@gmx.net;
	bh=51jUPbm6/S373S1XdgCs7OEHNtM2V5AN/Pt7BeLnFo4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=NH6VoiTDilABNRMCQrY2M7Fw9zElE4h2FYWKSjqos73gypCG4tT/BxqBr4qecyCY
	 PtFT4Nt08dXfFaB0LYsb5aHvYCORX1rf7p02CHm1UjYQowqKrfPt/8OsYNPdSMGZO
	 x/Tazd5PXzdtHIwVdUwpNEiwyFkTYnRNaLpvo4osUJoTcnzf2dMJ0rD98J6+TUipg
	 W06IGW8T98mfjW/i05475Ie1yIHJ+0VFkzTqmnno0oJ4dKOw9kvSAWYXK9HKK4BI2
	 9B7wQH9hMKdnQJAkHdbPqXutA0t8uLRgISkXJf3jgdBJtuoG0a2sz6qLMJ2/UNtQW
	 rZ9AJJwZ0rpfXTB2jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1qxUgG1Ymm-00M5P7; Tue, 05
 Dec 2023 21:06:04 +0100
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
Subject: [PATCH V4 3/3] ARM: dts: bcm2711: Add BCM2711 xHCI support
Date: Tue,  5 Dec 2023 21:05:31 +0100
Message-Id: <20231205200531.8232-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205200531.8232-1-wahrenst@gmx.net>
References: <20231205200531.8232-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KgWSquO6kpuFUC6BnC7EI87vl7h/1oyUbpH2rECpuOK4nyJh1fj
 ubTjyLgrZ6KdIhfCtTECBTeSe7WZczrJWBFfyYJvH2gexaW/HlXREckdHaKuMc/uNNY3dMe
 etUaFNSmv2ug+n7+oxCAAiT18mwj1nSj2OS49zmSxJ+iQMA8JGtybhS5a7XbWuZtIFtl9Ce
 KgWrgiQrKekhvfVTNAjIA==
UI-OutboundReport: notjunk:1;M01:P0:iqIneQT7tew=;idYTigGNSaoYLI75HsETsYdzC7c
 OHOlh0l2sg8Lha1gjRDP3Qt8/RRm/KmajB3gXTeUGqbocJ8ulC/EvmpJxT3WQPrBs8SxFbCN0
 tVJZ3pDCQ/15M3AFhyH3DLx5ZwaoYUJUhUr5uB2nf7M6iq6xf5MDGyvgQkVlg8HBWe3NAw/k0
 /ncZRrXwSnC4zL5ksWlXjUPA4Ta06/z+eMCe+WMIRj+i6qa6YM2xCkXaFmavr9hobb9skUhaM
 CPa/JGAaqDQBmA+PXXR56TnhA5u8c4Gj+qK/AEZI0X/9JjPEYlZWZNguR8jm8JllNUNMe52Vj
 kwyULuxTL8m3vN2tcdb5qPwccxLmcs/SHH5/XMwKaPRexE+KOf5PYkm5dUyOieexXpP8ovni4
 bHVJSjOnW7f6PEt9bWFJM3RhnJkX8QHUDr9dGtHivgaDqpwBeB9vY2RhAP8gmGaFsqI3MMwXI
 gn8SzeB2GA+XGF5ybEzYXIBp+CH5IoeQBtZHjsyonHd6XymLfVgK/oNVhdzAYAYYsqOxs1IVx
 z1e+CbOHYcFbqpFdTcJfsz9/ozX70XrEMeIqgcB8+cx0ZlCTwQqttr1Vbn+JoKSua/SmfU3qZ
 WXCpXpEWWyWuso/UEvfYVbv0nvWQCakna02TSK7S48+5SOjKvZeD19r1SRzxhQUSz+bEhQW/b
 +xD7JRF56hgk4fIoC2zyYuvYq7Rm24mCkTTyFRsGMj7xLI7NgwB6O/EmvqEMMVTmfHtqBn2nm
 SKtvFSRR+Rk7MIbFTk0curc1VFx4HkuGQpyPX3iVvSKu7aVPfXWEvaKAZ2jQeRfm+UPdJYif6
 0jLAPNzCVD9Yzp5D2uAdcPbO2x7adLlkHn/TxjUJzClcem5atOrO775NALG4D1qtkzemZiiIJ
 mQgvLiHHsFX7pzHvlqWEdmSThGYWiil975QnpYkU62+1Z2hSgpu+DsND50kDJif1k8Jx/59Gd
 GLdzlA==

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
index 4a379a14966d..22c7f1561344 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -604,6 +604,20 @@ genet_mdio: mdio@e14 {
 			};
 		};

+		xhci: usb@7e9c0000 {
+			compatible =3D "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";
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


