Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 028AD85ECD
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 11:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389732AbfHHJig (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 05:38:36 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12559 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389695AbfHHJig (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 05:38:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4bed9d0000>; Thu, 08 Aug 2019 02:38:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 08 Aug 2019 02:38:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 08 Aug 2019 02:38:36 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 09:38:35 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 8 Aug 2019 09:38:35 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d4bed990003>; Thu, 08 Aug 2019 02:38:35 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V6 8/8] arm64: defconfig: Enable tegra XUDC driver
Date:   Thu, 8 Aug 2019 15:07:26 +0530
Message-ID: <1565257046-9890-9-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565257117; bh=Y7dv/l17/9K2BC6HYc8ggqHt57iuT9XIRs45v+k5w2I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=d4pb/EnStZ9LslC2p44IgFGn6zOu5cf/O5kfuWnJNEdYi0xWAdHiZlAXirgM1dK7H
         nJWVK/4lsaPJgl3bfCtqCqcsUftBQiJxtYE0NVFGC480DWoLYgbALjWwD0obwPfP72
         yEMEHYQ9Z2hyJp5Af/6pXwQVcDj+g94Szs+rXgi6eWkK3jHkeI2aD5EGUU4PZNv+gR
         AJLJ+T9DplkfoHSqWkYXsu1lND20pLBfqRqRCbp7aG4fxxNtE+FFN3LWu2LJP+ExHD
         dmv3neQmD4toiD1tes9wVtz0UbQi1NFfRxHhuhB0zBv/rGfcOWxtO7XdhTSFunpJeL
         PzI1wcy58ssDg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable support for Nvidia XUSB device mode controller driver.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 97c5078..89afd5c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -598,6 +598,7 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
+CONFIG_USB_TEGRA_XUDC=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
-- 
2.7.4

