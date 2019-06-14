Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A437A456C0
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 09:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfFNHsn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 03:48:43 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16153 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfFNHsn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 03:48:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d03515a0000>; Fri, 14 Jun 2019 00:48:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 00:48:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Jun 2019 00:48:42 -0700
Received: from jckuo-lt.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 07:48:40 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 7/8] arm64: tegra: add Tegra210 XUSB PADCTL irq
Date:   Fri, 14 Jun 2019 15:48:23 +0800
Message-ID: <20190614074824.22023-3-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614074824.22023-1-jckuo@nvidia.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560498523; bh=6qKqRFd6GAuK0yLFJRTxGWM3uu9b0JXXYVOPAnyT3Lc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=BO4LxvBnZGBAWkkWcX2clkcCe7sK5EmVM7i/MGmnNtzL8OywLFrG8mSwwe9h2HHct
         iyipoemhOlHmA/g9rwrFImPnbpJDFdb8jhsQsxaQGpcp0UXgTdDkijw9KQDkdtq/f0
         9McLlNOCpcNC0WD5zjN+M9azs/i26bOzV9gMH3dlhcR/EZHB3W2ViYLtD7//ubC2SL
         C7MxX4p8WfHLf/+/ThcSpFvmpKGQhZderrCXKOs4g8BW+jo/B25rPIvv4M8t7Vq5Ly
         yH00mmJz5+n5J88LmqVoibF6t5qbxrGQbCk6OmbcB69YgT/d4waveKYrCxclP42aBg
         bwyOt/Euzat3Q==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

XUSB PADCTL interrupt will be raised when USB wake event happens.
This is required for supporting XUSB host controller ELPG.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a550c0a4d572..7496302a1a8a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -909,7 +909,8 @@
 		reg-names = "hcd", "fpci", "ipfs";
 
 		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 
 		clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>,
 			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
-- 
2.17.1

