Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64DDEBAF63
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 10:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438330AbfIWI04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 04:26:56 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8075 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438360AbfIWI0y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 04:26:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8881d40000>; Mon, 23 Sep 2019 01:27:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 23 Sep 2019 01:26:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 23 Sep 2019 01:26:54 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 08:26:54 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 08:26:53 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 23 Sep 2019 08:26:53 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d8881ca0001>; Mon, 23 Sep 2019 01:26:53 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Nagarjuna Kristam" <nkristam@nvidia.com>
Subject: [Patch V10 5/8] arm64: tegra: Add xudc node for Tegra210
Date:   Mon, 23 Sep 2019 13:55:49 +0530
Message-ID: <1569227152-3030-6-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
References: <1569227152-3030-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569227220; bh=EotW9WarrX7CtWNEHHlbpDUot4FQQgJb5GwzwlvtykU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=IXapSXZONIiYa+f0/hd4V6N1mRzahe8XA/h5j8bzGoJt5LIkNAGEIvy7N+XR8rIFS
         2udS5olsLdrBywvriZ0FUMoT8Rrz4Ht/5jpHML07CPcd0PquYFmS9QoHMVmz6lXVZH
         27dOvNyHpwpHL3iHVey/RSqC6HPeHFZniFaoCMIBCpMM8fRpZXqY25vgAmR5N2LoXf
         o7hRmi5J8JMvNbOnzyH4BglfQaiviXVURdFxNQahEFdoNLSBjhqud2lShrZDpLogY1
         BFPzFodajwtSj48M9CTnW4hTTK6cOaV+fwNhY0L4Ob9cSxNzpkQ3Sk3gLS0D50eHug
         Zv+sssd1IbePw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra210 has one XUSB device mode controller, which can be operated
HS and SS modes. Add DT support for XUSB device mode controller.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 30a7c48..fe6a708 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1206,6 +1206,25 @@
 		status = "disabled";
 	};
 
+	usb@700d0000 {
+		compatible = "nvidia,tegra210-xudc";
+		reg = <0x0 0x700d0000 0x0 0x8000>,
+		      <0x0 0x700d8000 0x0 0x1000>,
+		      <0x0 0x700d9000 0x0 0x1000>;
+		reg-names = "base", "fpci", "ipfs";
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SS>,
+			 <&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+			 <&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
+		clock-names = "dev", "ss", "ss_src", "hs_src", "fs_src";
+		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
+		power-domain-names = "dev", "ss";
+		nvidia,xusb-padctl = <&padctl>;
+		status = "disabled";
+	};
+
 	mipi: mipi@700e3000 {
 		compatible = "nvidia,tegra210-mipi";
 		reg = <0x0 0x700e3000 0x0 0x100>;
-- 
2.7.4

