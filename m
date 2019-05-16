Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA47D1FFAF
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 08:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbfEPGk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 02:40:29 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3386 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfEPGk2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 02:40:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd05b30000>; Wed, 15 May 2019 23:39:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 23:40:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 23:40:28 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:27 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 06:40:28 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd05d90001>; Wed, 15 May 2019 23:40:27 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 5/8] arm64: tegra: Add xudc node for Tegra210
Date:   Thu, 16 May 2019 12:09:29 +0530
Message-ID: <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557988787; bh=bt4zOjgEhJt+xgGFvq9k+5dsbGN/M20JwIFyq7eIdTY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MJSQbzrwz2sMEViYf2ibR1Y4i6HldMmYVzLyHzKeLoPnaP8U9JiBtbiRUJMgPugxG
         N5fnh4txwFkPtOtC+sQZS3Oij7+o9/Z9HuGG0QSf6/BpcxMe4yzgLd0eUn44emtkb8
         vRUKLuWclblaAP2hgiguWv+2r+GYUzWXUVMay3WAHKEMYTSkMWERxAndXVytIqt8aP
         HLjlEna33k2kpjLXhEzuVgyGcaN+ZC98Ko8bmzUGSg9LwTf6uw+A+VXXjqRHHM3VYV
         ZjJRNabm78qne0Fm18yNmSNuzmuScLwvrYVaXQao8+7xz/yHDu9QAaFR/ghL/8Yjdp
         HfA9jxBEiL/+A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra210 has one XUSB device mode controller, which can be operated
HS and SS modes. Add DT support for XUSB device mode controller.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a550c0a..edef00b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1184,6 +1184,25 @@
 		status = "disabled";
 	};
 
+	xudc@700d0000 {
+		compatible = "nvidia,tegra210-xudc";
+		reg = <0x0 0x700d0000 0x0 0x8000>,
+			<0x0 0x700d8000 0x0 0x1000>,
+			<0x0 0x700d9000 0x0 0x1000>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
+			<&tegra_car TEGRA210_CLK_XUSB_SS>,
+			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
+			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
+			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
+		clock-names = "dev", "ss", "ss_src",
+			      "hs_src", "fs_src";
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

