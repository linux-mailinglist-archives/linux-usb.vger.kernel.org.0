Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11043B302
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 12:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389331AbfFJKTr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 06:19:47 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10250 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389323AbfFJKTr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 06:19:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfe2ec20000>; Mon, 10 Jun 2019 03:19:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 03:19:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Jun 2019 03:19:46 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 10:19:46 +0000
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 10:19:45 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 10:19:45 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfe2ebe0003>; Mon, 10 Jun 2019 03:19:45 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V4 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date:   Mon, 10 Jun 2019 15:49:07 +0530
Message-ID: <1560161949-26031-7-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
References: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560161986; bh=7YmoanRJ7MnFiUzxCmsICgi7gtNanoIU5xm5389vJnQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=B0Y9S+H7nC2G6/DL4zfQ2VlTF3i8uRp7IV6+6nhFPWxLU9fAQ8WDWhC27/HjjanNz
         KFx+yZxN337xTNo3bC1f084yVdAzJ5V7N/CyEEF9+Nuto8QKp+x4cKXqxmTP2hvxOb
         ysvXsnBf78SEIz4HO6i106UY6vibY4McvFm6S/0a6wIe9KcwNF/Zwo8Dallhy+09YT
         1q7fq8tsT99dCKe+ijs2WBE1ImppkrBKx70oAl0JIVfChYoMFy9RmNHOCBgMjF+NX9
         rIWNNHxekf/7fgoemZ8Zrh7Oa5biQimBpSEJsUa4XfabFPjggdfaKgEmOwG9wc81c6
         Y4cMjktAd04oA==
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

