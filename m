Return-Path: <linux-usb+bounces-3322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 062DB7F9116
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 03:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD36B211B0
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 02:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF8A3C35;
	Sun, 26 Nov 2023 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="iX7PpgDO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D62BC;
	Sat, 25 Nov 2023 18:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700967407; x=1701572207; i=wahrenst@gmx.net;
	bh=ae8bjDGLrd8SODQBQpQFN5h1gMGw+YkRkmMEpiG27lw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=iX7PpgDOZuWUKdYtAG/ZK5bCFNznzsGuMHI+ukUVqmsEvNqsxNJBbVCOO+hRjGl2
	 Zce5YD5D/IsWx/3GqYlModR6pS9briBQu8nkNpArRxmwFA4vKhiqFwjkCXCBsnjhe
	 bP0CGyX3y/nFauBAnL8XqkFljPJs0f6SI1BG0TIS7tiu6iwULEiSuOHCTSpViWmBL
	 TQ8QN8oMjh25Bg6RkUxu7XjIqWoPgtc1aJ2oBhZTaMuzuw8nHJjmia0I/SI1mXTUl
	 TsuDBBNzlSycMTgprUBELwh6cXAQFWyBV7dNo7T/V2f+CFhc3V2H7svvPfmnkzUh+
	 wWC4uVql2ShXl8HNCA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1rEECH0l9q-008MYz; Sun, 26
 Nov 2023 03:56:47 +0100
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
Subject: [PATCH 2/3] ARM: dts: bcm2711: Add generic xHCI
Date: Sun, 26 Nov 2023 03:56:11 +0100
Message-Id: <20231126025612.12522-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126025612.12522-1-wahrenst@gmx.net>
References: <20231126025612.12522-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LbLdy05e4OaGCeGKKccPl+U1DEWeZ14f3uBvm9qPfxhlgS8nN5g
 lWIUbxwjMqwgEtGB18RDBriWr1nuK07nbN67TBSdtFf8C6Vxx47DLSLDSlbpcNdcFQuOPDT
 jckKn7chrj3jamIGBa8uRaYjUVRbRxWbKHi+CPaH6fsLPcQkCXgl93225c+kmhNUK5CrePG
 zL/b+bKM7gBRaBYmu5i0Q==
UI-OutboundReport: notjunk:1;M01:P0:TjJW6+Z+Z/o=;pisWYDE9TFwEHqZv4EoMTlkbZEO
 tStRlZDvnBnNsk1Z+cLOgo0NF7zSBTrkikRJOkczHOk+oAw0Q8AOo3cESqXQOvCOEUcgnPZUM
 pGUqko9cG0/1c2f9hF/C5axwmvrnmjKJ5ayPIjeGpNyFyTfzvcHs3LJNCbhNsXSl7GViENmyY
 EYjcySpSIXkY3TnaWMLMoS1va8TpBF5SPIUGRonSNHFhkzesyel/dSBN/apU//zg1B8kNb85H
 Db62ljWTV2UBxo7905bIamIeIjmzyYi1BV6nPy3nahm1sEF3gGWJuKrS+0U8/F2tMaKiqKK2y
 I9ev2Y+S8h7Wn4K6b6inZHyFdL9gj/SBWuv77kZDhq2NMGEaoHjzqPy+lweo5h97DxlYAfOJj
 MRdsQrX8vt5MvkCFsmyuxsmmi7eCUBLms0pDQUqU8tfz/ruDouIPezenNke7gA3c1CS1mELmi
 dSrLkSsLiOw7IpoGA4DVPx+EkeYDMBMyJOS6vCOqqQURCNwdhGNvuLyGcV9yUfzq2B2k6QZ1q
 ew3qcrGtCiJ4hPRwVzBmIFcpPCIOU2aNzYjzdhnVxvMWlUgYFx1RaQE4yEKF69eiMlpypLASF
 G97JOa2RTi3xbf47RywlJdPM7vXKs+3SyIx0gGoSBIx/NTujf15+L+0LFxniJPqQhvOsviTzC
 hl+oev9RHTcscsvivWKyrHx7xbCWtbR8vrHEbxVzGTnBfJcFTvIWazJ+hmh9q0xF5ZQo5qmFB
 XEAemsKWwiK7cAI2U2P7VxEx/dKNLVYR111IV4gja8kzig8m0TGc3kbrxs14felnTDaMxz71q
 gALqhBTd8OCRfzfFe3HhR+mYXR4r4ok2UXspbGvEbDK1jfZhRGQVyzNlRvqmiQFYRgiG9N5n5
 inELtw6FrjSz0DgwpKceFzo4QK74c9UZ+BrdoMsZciLiQSZGNTzaJqyj5N6mNA9+Gff9+Cz0h
 /Lb+0Q==

The BCM2711 SoC also has a generic xHCI. The USB port is currently
only usable on the Compute Module 4 (e.g. via IO board).

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 14 insertions(+)

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
index 4a379a14966d..724f1f0f4be7 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -604,6 +604,15 @@ genet_mdio: mdio@e14 {
 			};
 		};

+		xhci: usb@7e9c0000 {
+			compatible =3D "generic-xhci";
+			reg =3D <0x0 0x7e9c0000 0x100000>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			status =3D "disabled";
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible =3D "brcm,2711-v3d";
 			reg =3D <0x0 0x7ec00000 0x4000>,
=2D-
2.34.1


