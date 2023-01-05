Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7677D65E7CE
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 10:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbjAEJ3r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 04:29:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbjAEJ3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 04:29:47 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDCC4C72A;
        Thu,  5 Jan 2023 01:29:40 -0800 (PST)
X-UUID: a51015a577254496999df810184e8b70-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F8vHiUWoDSzO/kvwU/kQ5GyXJ4YHFhfMCpPp4lOgl4w=;
        b=BDVzc8pMwf7F6o4DXGwhz36LmOzQyvwXkj/irh8XYMwxuCEjkTvP0iPZPGwkR1nIWWMr+6N7kv2d+nxFmXTn0b+FTxHJnv6KVEgdLDiq8+WOd9dDB/GiAS7K070E6QJtusn9PJLVL9iJdI5pncwDbzrmDIKxH5FsqJbRNr3jk/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:08821f59-4320-45d3-9f15-2ea667e42508,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:fa9be5f4-ff42-4fb0-b929-626456a83c14,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a51015a577254496999df810184e8b70-20230105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 331524927; Thu, 05 Jan 2023 17:29:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 17:29:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 17:29:35 +0800
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC:     Bear Wang <bear.wang@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Macpaul Lin <macpaul@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 2/3] arm64: dts: mediatek: switch MT8195 boards into different USB configurations
Date:   Thu, 5 Jan 2023 17:28:08 +0800
Message-ID: <20230105092809.14214-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105092809.14214-1-macpaul.lin@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This modification includes
  1. Remove common USB configurations in mt8195.dtsi.
  2. Switch include dtsi "mt8195-laptop-usb.dtsi" for LAPTOP devices.
     - mt8195-cherry.dtsi
     - mt8195-evb.dts
  3. Switch include dtsi "mt8195-iot-usb.dtsi" for IOT devices.
     - mt8195-demo.dts

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 97 -------------------
 4 files changed, 3 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 560103e29017..a28da16d1d74 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/spmi/spmi.h>
-#include "mt8195.dtsi"
+#include "mt8195-laptop-usb.dtsi"
 #include "mt6359.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index dec85d254838..07a864cb8b54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -5,7 +5,7 @@
  */
 /dts-v1/;
 
-#include "mt8195.dtsi"
+#include "mt8195-iot-usb.dtsi"
 #include "mt6359.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index 690dc7717f2c..c7026c0f2ca9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -4,7 +4,7 @@
  * Author: Seiya Wang <seiya.wang@mediatek.com>
  */
 /dts-v1/;
-#include "mt8195.dtsi"
+#include "mt8195-laptop-usb.dtsi"
 
 / {
 	model = "MediaTek MT8195 evaluation board";
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..ac953a6e3ca7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1046,31 +1046,6 @@
 			status = "disabled";
 		};
 
-		xhci0: usb@11200000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x11200000 0 0x1000>,
-			      <0 0x11203e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port0 PHY_TYPE_USB2>,
-			       <&u3port0 PHY_TYPE_USB3>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
-				 <&topckgen CLK_TOP_SSUSB_REF>,
-				 <&apmixedsys CLK_APMIXED_USB1PLL>,
-				 <&clk26m>,
-				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
-			wakeup-source;
-			status = "disabled";
-		};
-
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8195-mmc",
 				     "mediatek,mt8183-mmc";
@@ -1114,78 +1089,6 @@
 			status = "disabled";
 		};
 
-		xhci1: usb@11290000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x11290000 0 0x1000>,
-			      <0 0x11293e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port1 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
-				 <&apmixedsys CLK_APMIXED_USB1PLL>,
-				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
-			wakeup-source;
-			status = "disabled";
-		};
-
-		xhci2: usb@112a0000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x112a0000 0 0x1000>,
-			      <0 0x112a3e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port2 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
-				 <&clk26m>,
-				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
-			wakeup-source;
-			status = "disabled";
-		};
-
-		xhci3: usb@112b0000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x112b0000 0 0x1000>,
-			      <0 0x112b3e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port3 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
-				 <&clk26m>,
-				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
-			wakeup-source;
-			status = "disabled";
-		};
-
 		pcie0: pcie@112f0000 {
 			compatible = "mediatek,mt8195-pcie",
 				     "mediatek,mt8192-pcie";
-- 
2.18.0

