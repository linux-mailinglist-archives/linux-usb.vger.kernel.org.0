Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF7F012CF4D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 12:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfL3LO3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 06:14:29 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19454 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbfL3LO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Dec 2019 06:14:27 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e09dc040000>; Mon, 30 Dec 2019 03:14:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 30 Dec 2019 03:14:26 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 30 Dec 2019 03:14:26 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Dec
 2019 11:14:26 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Dec
 2019 11:14:25 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 30 Dec 2019 11:14:25 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.64.167]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e09dc0e0000>; Mon, 30 Dec 2019 03:14:25 -0800
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Nagarjuna Kristam" <nkristam@nvidia.com>
Subject: [Patch V3 13/18] arm64: tegra: update OTG port entries for jetson-tx1
Date:   Mon, 30 Dec 2019 16:39:50 +0530
Message-ID: <1577704195-2535-14-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1577704452; bh=eBbk3un2Bjdw6UX/1mHaHb4DdWE3j9/foVfq7K9W134=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=M53VbcDNqN7fHfocv/924hQI91rfb+Wn1o9pYreDkgy/n+vg1e/Or5ZrvrQLActsL
         5FExl2/bqtjndWwdVNpoJK11dBardwcfujcKGurD8nhIIG48wABwDbq482up8dH3Px
         Uxikycdfv2fK0eUC5PejAawSpL/r9uraguQMlKCrplwGN35aEOnGPQ9Ofz7wxuobhO
         9u6Syjlaly54u9T7vRim/AwuZvTTs4CSsSduwYV3t3LMerkKEBLNQFnYaj49UbS4R4
         qjPX3+Jh0Z1w4fqhuUKNJ0QaLTREHHihaiZaX6xhyMYSvOC/zAFzo7S42805hCReeM
         TGCpXdG9WBfzw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Populate OTG vbus regulator. Add usb-role-switch entry to USB 2-0 port
and corresponding connector details.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2-V3:
 - No changes in this version
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index b009507..18c0610 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1336,7 +1336,6 @@
 		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-5}>;
 		phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3", "usb3-0",
 			    "usb3-1";
-
 		dvddio-pex-supply = <&vdd_pex_1v05>;
 		hvddio-pex-supply = <&vdd_1v8>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
@@ -1440,7 +1439,19 @@
 		ports {
 			usb2-0 {
 				status = "okay";
+				vbus-supply = <&vdd_usb_vbus_otg>;
 				mode = "otg";
+
+				usb-role-switch;
+				connector {
+					compatible = "usb-b-connector",
+						     "gpio-usb-b-connector";
+					label = "micro-USB";
+					type = "micro";
+					vbus-gpio = <&gpio TEGRA_GPIO(Z, 0)
+						     GPIO_ACTIVE_LOW>;
+					id-gpio = <&pmic 0 0>;
+				};
 			};
 
 			usb2-1 {
@@ -1606,6 +1617,17 @@
 			vin-supply = <&vdd_5v0_sys>;
 		};
 
+		vdd_usb_vbus_otg: regulator@11 {
+			compatible = "regulator-fixed";
+			reg = <9>;
+			regulator-name = "USB_VBUS_EN0";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_5v0_sys>;
+		};
+
 		vdd_hdmi: regulator@10 {
 			compatible = "regulator-fixed";
 			reg = <10>;
-- 
2.7.4

