Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF0165E7CD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 10:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjAEJ3r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 04:29:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbjAEJ3p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 04:29:45 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376E250E56;
        Thu,  5 Jan 2023 01:29:40 -0800 (PST)
X-UUID: 75271fb5dab549709ef9a96bd33fe431-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JgDZ+/qu7lWLc7KIp03ishgJU7UORnRWQNe+hK0SlRU=;
        b=QESefLiG+JiibGaGny3KYZdSlwwlFEpM2dLzj/RG+whCyjMRfuW5eAathtpiq22qUuc9ffJ63zKOJ70YkrzW93YKj4Cd4BpKVqDk3BtAkT1ItSIHo+q9ewNqVFsoY8JgXPt7pKyCgT+LduPkkV3hR0s40Ou9fXPwGlovW/ur9X4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f2a86c7b-0d4e-43ca-8fed-de12d06a8a61,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:f89be5f4-ff42-4fb0-b929-626456a83c14,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 75271fb5dab549709ef9a96bd33fe431-20230105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 229489431; Thu, 05 Jan 2023 17:29:36 +0800
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
Subject: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for mt8195-demo board
Date:   Thu, 5 Jan 2023 17:28:09 +0800
Message-ID: <20230105092809.14214-3-macpaul.lin@mediatek.com>
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

1. Enable USB device port (USB port0).
2. Enable u2 speed for other USB HOST (USB port1/2/3).
3. Configure mt6360 (TYPEC) related pinctrls.

Note: Full dual-role switch capability requires TYPEC MUX driver and dts
update will be send in separate patches.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 07a864cb8b54..207bb5f4c58f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+#include <dt-bindings/usb/pd.h>
 
 / {
 	model = "MediaTek MT8195 demo board";
@@ -380,6 +381,22 @@
 		};
 	};
 
+	mt6360_pins: mt6360-pins {
+		pins {
+			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
+				 <PINMUX_GPIO101__FUNC_GPIO101>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	u3_p0_vbus: u3_p0vbusdefault {
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
+			input-enable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
@@ -393,6 +410,14 @@
 				 <PINMUX_GPIO103__FUNC_URXD1>;
 		};
 	};
+
+	usb_otg_vbus: usb-otg-vbus-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "otg-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
 };
 
 
@@ -412,6 +437,22 @@
 	status = "okay";
 };
 
+&u3port0 {
+	status = "okay";
+};
+
+&u2port1 {
+	status = "okay";
+};
+
+&u2port2 {
+	status = "okay";
+};
+
+&u2port3 {
+	status = "okay";
+};
+
 &u3phy0 {
 	status = "okay";
 };
@@ -428,6 +469,16 @@
 	status = "okay";
 };
 
+&ssusb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&u3_p0_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	dr_mode = "otg";
+	mediatek,usb3-drd;
+	usb-role-switch;
+	status = "okay";
+};
+
 &xhci0 {
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&otg_vbus_regulator>;
-- 
2.18.0

