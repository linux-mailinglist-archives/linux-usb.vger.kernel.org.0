Return-Path: <linux-usb+bounces-17875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB29D9456
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2850BB2AB90
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F6E1D63D9;
	Tue, 26 Nov 2024 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GHKxhmxe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6031D5CEE
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612893; cv=none; b=dHeenpO5k++h/HuBuPL+uI4BjSNt/kk03kjOu6ANMKxne1VKdwLK4WDQExR+QR/0yKbHZnKuHPgj8nTn1tk5cmTJSPej5UA6fFxnFEgaAWoxkbe46QebVpHjmfiHfXBbmGYb6SM/mslS9Pwa/F/UoTH5tu2DwfHUCT/T1yDEBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612893; c=relaxed/simple;
	bh=2DMTJUAMbvgwMO6a642uq7ua8fsNBEbd1Oxy7nZyQa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQcta+ZPYlvOMWuTohqx6AVJYEhdTNypXNR5EYhaXNF4jJstrAJuQq4lOdLGOc2/DlyzPHRbjRFmaYiYDVAlOOn/FHCR1lZ8BaEfuKiOXjZMyTIg1Zob3CBBA3Y/D9ikhZVuFo0QYGdelDEbPgWimvSPpTf6je2T7mO7lspHhXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GHKxhmxe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43169902057so47396675e9.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612889; x=1733217689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLdnHZoveqIvO5Hl0Ml7DeyDrz+2Vaoq4NvOVCNrZ/A=;
        b=GHKxhmxesIrI/tdCGHSbmOfQHu6ELwNJAb70ipA17qFwm1GMQH19ccoVbHToRt9Csd
         8ZMaa8o9HGLQMySu7g+3G35vE56oMEIkRSZwp/gwiUQTNyOb6Zv0y+J85OrZfkT4K9KD
         On+9M8MDYDVrBBmofSaeo+X6YOUyTX4PIKCxqhKrNeQPoKffc+oATZ1anrOorshIcM00
         d9icarOpmzQNPzRMOOC/h+Ae6rtjfLsOlzBvmmm6QiJ+8cZroT13MoZiWwIytjRS26kY
         TTZgblhCkoouhIJmS3cglEKtKdQbv38tWxcK9L/teWhzlrUDatIygv/HU1BWOQpP/TnV
         ZPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612889; x=1733217689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLdnHZoveqIvO5Hl0Ml7DeyDrz+2Vaoq4NvOVCNrZ/A=;
        b=o9oDP95mIw58Fam/gEezAaUzk7P7tIciDHX56+rFx/oeCY78CLGbyLaqpJk7T0q7z+
         7QGHFjalzLx4Q9JCpMNQ0X3PHYRGsB87Ci9fKgnGah2dAxnCabrSriCL68JnhbPlXbrJ
         Jxn91vvn3VuIQR12u8E15dd+ga44Y7a9FqfanrsBecRfgw1CGKuubVWdHqs6i7t3aknq
         Zt9Z+A193mmdBWQPli/ZwgZC9r5hza39+9ZOfetfZs2W0D9O5MA7TrvqguKvhUuQnZUd
         fqRofJuJxwQENHB/HwvlZ1g4XMunkicV5AGFqEdD8KyhS0mbp1u5TDEuxQUoOBVewJIS
         lcVA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ48rWfW0CdEPVa969AlL60jrDnbOuVPeAd7Nl/WqDxuXw+WlXaP9G9ft0gcnerzv5AC4pUoYSz4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0N8+fHxGT2dh+MYbNwpkPNxvHzBx5hCmZTXwD3vBeigUY+XN
	4YN+lqgsDVSuKiOcLGyktFKFJnIhf/F7r9OYbWL+aZbjUhkUu6BoTlbPbAf0KmM=
X-Gm-Gg: ASbGncvYmODrC1x8qfTYMpksGTgSi6xYOfuw8knyWsqp9FEHoN8CLptkcHq2b+BrKaa
	DfmwP0/3P/9cylVCB8Uyspi9GQfVdYpwoPH0S49MTckmSP0M8/u/kycu8tkDgkHaoZD94Q2c363
	jtzXZKjKhy9B8gr8SoemJYWqv5AFOEOi3NGIqOM0LCismBHfOoljcRzLKletZ/y53KrbzCxm/Aq
	wEKYCTj1gZnnHpmmiOF+1kyNJ3sC04+FOJr0iklm8dzY5uy7OLqS7u4pjajwyGFiIzAuI4qM1jj
	S7E=
X-Google-Smtp-Source: AGHT+IFJiTv231Q0pA7mNGDg8+ehro7YZHPIBfZNFr1G9xSWhy4hE646eb2huz0yqoJ24h09vlKStA==
X-Received: by 2002:a05:6000:1acc:b0:382:450c:2601 with SMTP id ffacd0b85a97d-38260b6b632mr11281224f8f.24.1732612889501;
        Tue, 26 Nov 2024 01:21:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 14/15] arm64: dts: renesas: r9a08g045: Add USB support
Date: Tue, 26 Nov 2024 11:20:49 +0200
Message-Id: <20241126092050.1825607-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add USB nodes for the Renesas RZ/G3S SoC. This consists of PHY reset,
host and device support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this was patch 14/16 in v1
- added renesas,sysc-signal properties to USB PHYs
- collected tags
- Geert: I kept your tag; please let me know if you consider otherwise 

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 89cf57eb8389..6ce94bbecfa6 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -417,6 +417,125 @@ eth1: ethernet@11c40000 {
 			status = "disabled";
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g045-usbphy-ctrl", "renesas,rzg2l-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
+			resets = <&cpg R9A08G045_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus";
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g045";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			renesas,sysc-signal = <&sysc 0xd70 0x1>;
+			status = "disabled";
+		};
+
+		hsusb: usb@11e20000 {
+			compatible = "renesas,usbhs-r9a08g045",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11e20000 0 0x10000>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2P_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G045_USB_U2P_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e30000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e30000 0 0x100>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G045_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e30100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e30100 0 0x100>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G045_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e30200 {
+			compatible = "renesas,usb2-phy-r9a08g045";
+			reg = <0 0x11e30200 0 0x700>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G045_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			renesas,sysc-signal = <&sysc 0xd70 0x1>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.39.2


