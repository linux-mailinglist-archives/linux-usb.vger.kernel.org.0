Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E0E1FFB5
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 08:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfEPGkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 02:40:39 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4938 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfEPGki (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 02:40:38 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd05ec0000>; Wed, 15 May 2019 23:40:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 23:40:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 15 May 2019 23:40:37 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 06:40:36 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 May 2019 06:40:37 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cdd05e2000b>; Wed, 15 May 2019 23:40:37 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 8/8] arm64: defconfig: Enable tegra XUDC driver
Date:   Thu, 16 May 2019 12:09:32 +0530
Message-ID: <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557988844; bh=SJ9GL3oTbSiq7TpUURiON93iiOObqYKhQkoJJ6rnBVI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=lJ7GdhG3qX/g0l6DYv3gOYiwIJCQ3AJ9lEUIFOkRwlaS9Yl00Jh0IL05xVWq9lhOE
         GlMllGCSVtBE76R9m6DVv0v0Otpe4eCR2UvjWR5RkBg1btmAfzBHt0njbYrpeJQHhO
         2SraorU1SMoDvV3sZ8NE5FYZp+j6gnv9yxu+QhlOYNlhII12sMqZYU3vGYa66PnTCU
         6YqA3tpuuD+dcNurDZNGgBexUKjE0gOSAjOzohosWU6HeOk1GLmGsNW0zMJDsnGNU7
         qtEVp6A3F2Zqeccu3ogr69bDzRAY07oFO721rpWhal95Wy7t23RAtiT2x5bQFsz9S5
         TGUEv0CO1IQjQ==
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
index b605b7f..bf1437c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -575,6 +575,7 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
+CONFIG_USB_TEGRA_XUDC=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.7.4

