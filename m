Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 506E2194014
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgCZNp2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46725 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbgCZNp1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id j17so7788185wru.13
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AU04T7R28AnwsevYjG0o1Xbn1nqZG5sUZ8RGzfBF3kA=;
        b=RBaTfrVM5LRsiv4rdexrCfAK1BM1ZzQ3nZevtO77pGI1h+PUJMuPMaljZRqFwcu42h
         hzmyaP+1zVbTmB0+Wd5nd2Ze1ExaRntd3XpIxgrQ3wDU8pWZpOYN1sBxN2iQsn+PPkcb
         x3LgXVaavRtZBe9u1MiT5GrC+y3+HYztQLL1ZqjwSiRpfSzMZ9rlrxK7t0ynNNDJAMlR
         bqGIvl0X1ISjR5HmBaZjgVN1KW7KQ+xJkpqotireI9ZUNVQwdyWiRg31vIMPSU/ISHd/
         KTxBUJigTxWktzQMTI4A+PLPXYriWuOgBSBBcgbL1VBuAKuf/UUj8Ps3BpzH5hqxni2p
         JSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AU04T7R28AnwsevYjG0o1Xbn1nqZG5sUZ8RGzfBF3kA=;
        b=Ty+MtVtlJO9VugQXDZRFJhYMMEtwZj7yyK1XhBxe+X8wDphktNz7VZPZ+i8FVpER7B
         MdG/oFXf/thzH3NTp9gh6V71uvSVUkgscFrpjybqVaqrbfbMa0MPGNfGr6OMM954jXQD
         leelhk6VoeH6BteUHX+GJy+tfGnST17oDwkqE/vQgC2bGzdL1iSRpaTJ+3va/WrmBRz+
         RYhSAtZ+62wgfvRyeNBzoDjhgvubbKsz3QqH5JlOP4L4mLbxuXLhG1qo6j7C20wsAc6i
         3nNbGZIqXC8eGCoPQldA6qyohBrEDWjVc0eIWLb5meCOoaAIyjQm7XTQtODW8I+E5T0A
         7OOA==
X-Gm-Message-State: ANhLgQ2U1eh0E5Beaww1SkeYbvWye0ujzTLud8aqWdZVy/XfylyjFWMY
        m9BxfW6NCtvftbca85v1rx4DBA==
X-Google-Smtp-Source: ADFU+vuZcZCJwGQXyCMfeycm/RxgZJJs3dW6FjU8Fke7xx90SppWrCNrLg/7uKoVjOIuZp6FIDV8RQ==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr9977749wru.390.1585230324340;
        Thu, 26 Mar 2020 06:45:24 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:23 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 10/14] arm64: dts: amlogic: use the new USB control driver for GXL and GXM
Date:   Thu, 26 Mar 2020 14:45:02 +0100
Message-Id: <20200326134507.4808-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Add the correcly architectured USB Glue node and adapt all the Amlogic
GXL and GXM board to the new organization.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |  3 +-
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  3 +-
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |  3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  3 +-
 .../amlogic/meson-gxl-s905d-phicomm-n1.dts    |  4 ++
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts |  4 ++
 .../dts/amlogic/meson-gxl-s905w-tx3-mini.dts  |  4 ++
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  4 ++
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  |  3 +-
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  3 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 45 ++++++++++---------
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  3 +-
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |  3 +-
 .../boot/dts/amlogic/meson-gxm-vega-s96.dts   |  4 ++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |  7 ++-
 16 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 248b018c83d5..ed9f89ee86a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -360,8 +360,9 @@
 	status = "okay";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
 
 &usb2_phy0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 12d5e333e5f2..d853981f1ab5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -223,6 +223,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "otg";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 4d5949496596..2cfea3094f6c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -243,6 +243,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index a1119cfb0280..867e30f1d62b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -216,6 +216,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
index b5667f1fb2c8..9ef210f17b4a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
@@ -29,3 +29,7 @@
 &cvbs_vdac_port {
 	status = "disabled";
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
index 6509c4950950..ecc9df7ca023 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
@@ -20,3 +20,7 @@
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
index dd729ac2300d..6705c2082a78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts
@@ -24,3 +24,7 @@
 &ir {
 	linux,rc-map-name = "rc-tanix-tx3mini";
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 440bc23c7342..8bcdffdf55d0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -207,3 +207,7 @@
 	pinctrl-0 = <&uart_ao_b_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	dr_mode = "peripheral";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index e8348b2728db..e493831a80f0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -272,8 +272,9 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
 
 &usb2_phy0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 62dd87821ce5..f1acca5c4434 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -218,6 +218,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 43eb7d149e36..93963e1b7fc0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -188,8 +188,9 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
 
 &usb2_phy0 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 259d86399390..95b301a7c725 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -14,26 +14,43 @@
 	compatible = "amlogic,meson-gxl";
 
 	soc {
-		usb0: usb@c9000000 {
-			status = "disabled";
-			compatible = "amlogic,meson-gxl-dwc3";
+		usb: usb@d0078080 {
+			compatible = "amlogic,meson-gxl-usb-ctrl";
+			reg = <0x0 0xd0078080 0x0 0x20>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
+			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1_DDR_BRIDGE>;
+			clock-names = "usb_ctrl", "ddr";
 			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
 
-			dwc3: dwc3@c9000000 {
+			dr_mode = "otg";
+
+			phys = <&usb2_phy0>, <&usb2_phy1>;
+			phy-names = "usb2-phy0", "usb2-phy1";
+
+			dwc2: usb@c9100000 {
+				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+				reg = <0x0 0xc9100000 0x0 0x40000>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_USB1>;
+				clock-names = "otg";
+				phys = <&usb2_phy1>;
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@c9000000 {
 				compatible = "snps,dwc3";
 				reg = <0x0 0xc9000000 0x0 0x100000>;
 				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 				dr_mode = "host";
 				maximum-speed = "high-speed";
 				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>;
 			};
 		};
 
@@ -71,18 +88,6 @@
 		reset-names = "phy";
 		status = "okay";
 	};
-
-	usb3_phy: phy@78080 {
-		compatible = "amlogic,meson-gxl-usb3-phy";
-		#phy-cells = <0>;
-		reg = <0x0 0x78080 0x0 0x20>;
-		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clkc CLKID_USB>, <&clkc_AO CLKID_AO_CEC_32K>;
-		clock-names = "phy", "peripheral";
-		resets = <&reset RESET_USB_OTG>, <&reset RESET_USB_OTG>;
-		reset-names = "phy", "peripheral";
-		status = "okay";
-	};
 };
 
 &efuse {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index f82f25c1a5f9..4310f01ccc89 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -437,6 +437,7 @@
 	vref-supply = <&vddio_ao18>;
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "peripheral";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index c2bd4dbbf38c..83eca3af44ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -179,6 +179,7 @@
 	pinctrl-names = "default";
 };
 
-&usb0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
index 0bdf51d041ae..d3fdba4da9a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts
@@ -39,3 +39,7 @@
 &ir {
 	linux,rc-map-name = "rc-vega-s9x";
 };
+
+&usb {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 5ff64a0d2dcf..84399e802188 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -141,8 +141,11 @@
 	compatible = "amlogic,meson-gxm-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 };
 
-&dwc3 {
-	phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>, <&usb2_phy2>;
+&usb {
+	compatible = "amlogic,meson-gxm-usb-ctrl";
+
+	phy-names = "usb2-phy0", "usb2-phy1", "usb2-phy2";
+	phys = <&usb2_phy0>, <&usb2_phy1>, <&usb2_phy2>;
 };
 
 &vdec {
-- 
2.22.0

