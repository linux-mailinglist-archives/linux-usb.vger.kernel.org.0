Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A3E60570
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 13:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfGELmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 07:42:16 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14522 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfGELmQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 07:42:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1f37960000>; Fri, 05 Jul 2019 04:42:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 05 Jul 2019 04:42:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 05 Jul 2019 04:42:15 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jul
 2019 11:42:15 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jul
 2019 11:42:14 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 5 Jul 2019 11:42:14 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1f37940001>; Fri, 05 Jul 2019 04:42:14 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date:   Fri, 5 Jul 2019 17:11:49 +0530
Message-ID: <1562326911-26855-7-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
References: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562326934; bh=7YmoanRJ7MnFiUzxCmsICgi7gtNanoIU5xm5389vJnQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=RUYHL2lCxcrxCfx1t0f2maxrZx7C21+lAt00cMmYxuuCBoKl3RTm2Idd0xkGJCNiU
         YAwZ4j+5BdYUvB73Ha74YjFL/zckGZ5D3L+SkvaKkFG2+yhwV40TUzWuFk0Y4VwGG+
         nX4N8kaEpKjRVVivMbS6JDw5W9sLHWb8YXfELYp4ncXQc00r6j3Leg8sdCIEDD45ap
         rHEDXMkJq18EI7gzLKuUAnYUofgaK2/xFBMw+XRV0oCFAEmN1IndDcw5JupsyNeepK
         avAA1j9z1Zy8l2kkjrW87PWzjgvzGplHPmvTPV/c3M7jUh/ww9tEn40FBf6+KCgaCS
         a9T1lY2doRz8g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable XUSB device mode driver for USB0 slot on Jetson TX1.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a7dc319..f3f3704 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1483,6 +1483,21 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	xudc@700d0000 {
+		status = "okay";
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
+		phy-names = "usb2";
+		avddio-usb-supply = <&vdd_3v3_sys>;
+		hvdd-usb-supply = <&vdd_1v8>;
+		usb-role-switch;
+
+		port {
+			usb_role_switch: endpoint@0 {
+				remote-endpoint = <&usb_b_conn_ep>;
+			};
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1641,4 +1656,18 @@
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
+
+	usb_type_b: connector {
+		compatible = "linux,typeb-conn-gpio", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		port {
+			usb_b_conn_ep: endpoint@0 {
+				remote-endpoint = <&usb_role_switch>;
+			};
+		};
+	};
+
 };
-- 
2.7.4

