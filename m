Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D81065E7D1
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 10:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbjAEJ3y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 04:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbjAEJ3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 04:29:47 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E30551C8;
        Thu,  5 Jan 2023 01:29:41 -0800 (PST)
X-UUID: 4c84c0dda6324fa98394c79dbf83d1c6-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZjHRlIJfTirwwzT2i8X7HQP34Mb9Rek8gHIaOk7TNeI=;
        b=isID7ba6a69YXl22VcxluctvnJE1Iec22+Wbn7DLHP8FpIR200pPhPOsvaAshPf1UeYRGG7/MmEGriytkmC0WGULFAowRG3VPWa81Q7aDMUhYibNU96PCTaLNXMXfvRORaIh5myKB+LaRaM8YNWpGt/aMR2/LmFiK2b7t6BKJas=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:13326e4e-dac3-482a-a3c2-66d47a0ed127,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
        ON:release,TS:70
X-CID-INFO: VERSION:1.1.17,REQID:13326e4e-dac3-482a-a3c2-66d47a0ed127,IP:0,URL
        :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
        ON:quarantine,TS:70
X-CID-META: VersionHash:543e81c,CLOUDID:17c2568b-8530-4eff-9f77-222cf6e2895b,B
        ulkID:230105172937GYO7OBP4,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
        il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
        I:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 4c84c0dda6324fa98394c79dbf83d1c6-20230105
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 493066764; Thu, 05 Jan 2023 17:29:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 17:29:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 17:29:34 +0800
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
Subject: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and IOT's USB configurations
Date:   Thu, 5 Jan 2023 17:28:07 +0800
Message-ID: <20230105092809.14214-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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

Introduce the split MT8195 laptop and iot USB configurations.
The hardware specifications for LAPTOP devices is different from IOT
devices. The major differences include some hardware constrains for
dual-role switch for USB controllers in different configurations,
especially for power management and other control flows as well.

Here are some hardware specifiction differences listed:
  1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device mode).
  2. IOT devices must support multiple gadget devices and host mode.
  3. Dual-role switch is not fully supported. Only USB PORT0 support
     dual-role switch.
  4. Power management is designed in primary and secondary dominator.
     For a dual-role port, the device controller is the primary controller
     for power management; while the host controller is the secondary.
     LAPTOP devices should remove device nodes for avoiding abnormal
     behavior.

This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.

To remove common USB configurations for mt8195.dtsi and switch includes
dtsi these new files for the boards will come in next patch.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../boot/dts/mediatek/mt8195-iot-usb.dtsi     | 122 ++++++++++++++++++
 .../boot/dts/mediatek/mt8195-laptop-usb.dtsi  | 102 +++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
new file mode 100644
index 000000000000..f9bd79542044
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#include "mt8195.dtsi"
+
+/ {
+	soc {
+		ssusb: ssusb@11200000 {
+			compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2dff>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+				 <&topckgen CLK_TOP_SSUSB_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xhci0: xhci@11200000 {
+				compatible = "mediatek,mt8195-xhci",
+					     "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
+						  <&topckgen CLK_TOP_SSUSB_XHCI>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>,
+					 <&topckgen CLK_TOP_SSUSB_REF>,
+					 <&apmixedsys CLK_APMIXED_USB1PLL>;
+				clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
+				status = "disabled";
+			};
+		};
+
+		xhci1: xhci1@11290000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11290000 0 0x1000>,
+			      <0 0x11293e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>,
+			       <&u3port1 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
+				 <&apmixedsys CLK_APMIXED_USB1PLL>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
+			status = "disabled";
+		};
+
+		ssusb1: usb1@112a1000 {
+			compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
+			reg = <0 0x112a1000 0 0x2dff>,
+				  <0 0x112a3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port2 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xhci2: xhci2@112a0000 {
+				compatible = "mediatek,mt8195-xhci","mediatek,mtk-xhci";
+				reg = <0 0x112a0000 0 0x1000>;
+				reg-names = "mac";
+				interrupts-extended = <&gic GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&pio 220 IRQ_TYPE_EDGE_FALLING>;
+				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+				clock-names = "sys_ck";
+				status = "disabled";
+			};
+		};
+
+		xhci3: xhci3@112b0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112b0000 0 0x1000>,
+			      <0 0x112b3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port3 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
+			wakeup-source;
+			usb2-lpm-disable;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi
new file mode 100644
index 000000000000..5e6999bfd83c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#include "mt8195.dtsi"
+
+/ {
+	soc {
+		xhci0: usb@11200000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x1000>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+				 <&topckgen CLK_TOP_SSUSB_REF>,
+				 <&apmixedsys CLK_APMIXED_USB1PLL>,
+				 <&clk26m>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		xhci1: usb@11290000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11290000 0 0x1000>,
+			      <0 0x11293e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
+				 <&apmixedsys CLK_APMIXED_USB1PLL>,
+				 <&clk26m>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		xhci2: usb@112a0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112a0000 0 0x1000>,
+			      <0 0x112a3e00 0 0x0100>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
+				 <&clk26m>,
+				 <&clk26m>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		xhci3: usb@112b0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112b0000 0 0x1000>,
+			      <0 0x112b3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port3 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
+				 <&clk26m>,
+				 <&clk26m>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
+			wakeup-source;
+			status = "disabled";
+		};
+	};
+};
-- 
2.18.0

