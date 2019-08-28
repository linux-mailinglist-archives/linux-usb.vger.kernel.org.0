Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27D99FA69
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 08:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfH1GVd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 02:21:33 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:5741 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726232AbfH1GVd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Aug 2019 02:21:33 -0400
X-UUID: 912eb4ade9a34facb4bf727e242203e4-20190828
X-UUID: 912eb4ade9a34facb4bf727e242203e4-20190828
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1422246930; Wed, 28 Aug 2019 14:21:37 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 28 Aug 2019 14:21:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 28 Aug 2019 14:21:34 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] arm64: dts: mt8183: enable USB remote wakeup
Date:   Wed, 28 Aug 2019 14:21:01 +0800
Message-ID: <1566973261-21677-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1566973261-21677-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1566973261-21677-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 22E3B909B89E165B91830DABF3469875FDA9C6DC94953577A2332E66565D7D712000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable USB remote wakeup for MT8183

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 142ff52f0f42..077256f3397b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -150,6 +150,7 @@
 &ssusb {
 	vusb33-supply = <&mt6358_vusb_reg>;
 	dr_mode = "host";
+	wakeup-source;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 28da334237c6..c20cc0e8c2b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -215,6 +215,13 @@
 			#clock-cells = <1>;
 		};
 
+		pericfg: syscon@10003000 {
+			compatible = "mediatek,mt8183-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8183-pinctrl";
 			reg = <0 0x10005000 0 0x1000>,
@@ -384,6 +391,7 @@
 			clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
 				 <&infracfg CLK_INFRA_USB>;
 			clock-names = "sys_ck", "ref_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
2.23.0

