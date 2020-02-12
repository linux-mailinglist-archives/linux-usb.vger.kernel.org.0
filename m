Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D215A11C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 07:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgBLGLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 01:11:48 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8037 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728261AbgBLGLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Feb 2020 01:11:47 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4397140000>; Tue, 11 Feb 2020 22:11:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Feb 2020 22:11:46 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Feb 2020 22:11:46 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 06:11:46 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 12 Feb 2020 06:11:46 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.125]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e4397200000>; Tue, 11 Feb 2020 22:11:46 -0800
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v6 4/5] arm64: tegra: Add XUSB and pad controller on Tegra194
Date:   Wed, 12 Feb 2020 14:11:32 +0800
Message-ID: <20200212061133.11665-5-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212061133.11665-1-jckuo@nvidia.com>
References: <20200212061133.11665-1-jckuo@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581487892; bh=u1lowPE1sMxb0gkt8CFADo7xEAt4WBpN4FZZc8zeJhQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Uv0stT9TaOnwoKEVZDxafJFIy/oLzBSh4FJidRbZaVl7Jibl0wD6HHTl60ZliJ6vD
         lP1onIRXZROKS72G7RuE2NaKCBAvGkSzS0vkupb78aE0U8cobKiIGnxMo+kZ8hWVJy
         wjtD9YTNMv42MmUQEQif3oL3PDk2Jf1edBgs3Sj/qzA7vtYUPDth/Q3lxZU8wnAZic
         /HO7NHnNIreFe/1qqz9nvGalpHm8HTwgyAGGI8svOCajGOIrYUptamDwAcAVwPM3NC
         KT8RrvLhVSY1sA0uuaXTcD1ASwY9R2pFX5ujJt2yEgRu4Q5sdcQ/AfA2Cyy57BKMF5
         EB/OWvb1wR3gQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adds the XUSB pad and XUSB controllers on Tegra194.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
Changes in v6: rebase
Changes in v5: none
Changes in v4: none
Changes in v3: none
Changes in v2:
 - renamed xhci@3610000 with usb@3610000
 - moved padctl@3520000 and usb@3610000 inside /cbb
 - cleaned up "clocks" property of usb@3610000 node
 - added blanks lines to visually separate blocks

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 139 +++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ccac43be12ac..b9cba9c531b8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -537,6 +537,145 @@
 			status = "disabled";
 		};
 
+		xusb_padctl: padctl@3520000 {
+			compatible = "nvidia,tegra194-xusb-padctl";
+			reg = <0x03520000 0x1000>,
+			      <0x03540000 0x1000>;
+			reg-names = "padctl", "ao";
+
+			resets = <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
+			reset-names = "padctl";
+
+			status = "disabled";
+
+			pads {
+				usb2 {
+					clocks = <&bpmp TEGRA194_CLK_USB2_TRK>;
+					clock-names = "trk";
+
+					lanes {
+						usb2-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb2-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-0 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-1 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-2 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+
+						usb3-3 {
+							nvidia,function = "xusb";
+							status = "disabled";
+							#phy-cells = <0>;
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-0 {
+					status = "disabled";
+				};
+
+				usb2-1 {
+					status = "disabled";
+				};
+
+				usb2-2 {
+					status = "disabled";
+				};
+
+				usb2-3 {
+					status = "disabled";
+				};
+
+				usb3-0 {
+					status = "disabled";
+				};
+
+				usb3-1 {
+					status = "disabled";
+				};
+
+				usb3-2 {
+					status = "disabled";
+				};
+
+				usb3-3 {
+					status = "disabled";
+				};
+			};
+		};
+
+		usb@3610000 {
+			compatible = "nvidia,tegra194-xusb";
+			reg = <0x03610000 0x40000>,
+			      < 0x03600000 0x10000>;
+			reg-names = "hcd", "fpci";
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
+				 <&bpmp TEGRA194_CLK_XUSB_FALCON>,
+				 <&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
+				 <&bpmp TEGRA194_CLK_XUSB_SS>,
+				 <&bpmp TEGRA194_CLK_CLK_M>,
+				 <&bpmp TEGRA194_CLK_XUSB_FS>,
+				 <&bpmp TEGRA194_CLK_UTMIPLL>,
+				 <&bpmp TEGRA194_CLK_CLK_M>,
+				 <&bpmp TEGRA194_CLK_PLLE>;
+			clock-names = "xusb_host", "xusb_falcon_src",
+				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+				      "xusb_fs_src", "pll_u_480m", "clk_m",
+				      "pll_e";
+
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
+					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
+			power-domain-names = "xusb_host", "xusb_ss";
+
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			status = "disabled";
+		};
+
 		fuse@3820000 {
 			compatible = "nvidia,tegra194-efuse";
 			reg = <0x03820000 0x10000>;
-- 
2.17.1

