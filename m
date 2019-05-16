Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC241FFB1
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 08:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfEPGkc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 02:40:32 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4933 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEPGkc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 02:40:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd05e50001>; Wed, 15 May 2019 23:40:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 23:40:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 23:40:31 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:30 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 06:40:30 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd05dc0000>; Wed, 15 May 2019 23:40:30 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date:   Thu, 16 May 2019 12:09:30 +0530
Message-ID: <1557988772-15406-7-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557988837; bh=yCY1UeTlPIgQaaI6fLADgU+Axe9YEhqcvWbpwZJawWo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=TnzCj83KIYq0jAGhD+EVT8n2gQnI/U2G97uzmxmJD0lRaiZXWHlRWdsiF0J0Qn2yU
         6UES0JI8amuXJtDdROxWeUadBN7SLKuCjgcRinjqvP4aVjkxH2rzY0eRPXANZWJVMB
         oaovANYsJLakOGhhN9gmwb4/4J2VL/MGKO8U+Tu3bmR/s12YfoQPWiEWC1FKORkwuN
         XdsOIQeT83NHDS01gceqcVEXGSJiC1r+PF7dsA663UN8AArkL03dqM5IlceJUgLA0o
         t4TkWpwhzqXcNelGKjpVh1QWJiNDS0I+90wiR3PCNFaubAUp+wtmsLf9BkzzSBkCZC
         svNXGlDZC9uiA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable XUSB device mode driver for USB0 slot on Jetson TX1.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a7dc319..e0e67cd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1483,6 +1483,20 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	xudc@700d0000 {
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
+		phy-names = "usb2";
+		avddio-usb-supply = <&vdd_3v3_sys>;
+		hvdd-usb-supply = <&vdd_1v8>;
+		extcon = <&extcon_usb>;
+		status = "okay";
+	};
+
+	extcon_usb: extcon_vbus {
+		compatible = "linux,extcon-usb-gpio";
+		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.7.4

