Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B031CB601
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 10:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388021AbfJDITy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 04:19:54 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9853 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387913AbfJDITx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 04:19:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9700a80000>; Fri, 04 Oct 2019 01:19:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 04 Oct 2019 01:19:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 04 Oct 2019 01:19:52 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Oct
 2019 08:19:52 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 4 Oct 2019 08:19:52 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.105]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d9700a60000>; Fri, 04 Oct 2019 01:19:51 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, <skomatineni@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v2 2/7] usb: host: xhci-tegra: Add Tegra194 XHCI support
Date:   Fri, 4 Oct 2019 16:19:36 +0800
Message-ID: <20191004081941.4831-3-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004081941.4831-1-jckuo@nvidia.com>
References: <20191004081941.4831-1-jckuo@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570177192; bh=w8t9puLKTTif/ZtbLM6Pd69XMc6h1g6hTRIsID24Rok=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=h3hg/MhMZOfhvjivkWUvRem8ujLPO6vGtdldno2d8OL1T0HfV5Hto6D44lx1Z9EM2
         jCAMFJPKUO1LW7Kj6s9avaAmiRfS6giZTlNDNsbq7wVWKCntDHA5bQN3vw4ZhFsGnI
         ccYazqUJwzLu6wvfUXPtr41Lt3dStuAw6cQpxJ8gCzsOOWBytSdJO23uWWcIn6TAIR
         xWs5/4LJ+6HrvZP1iYkxmzMLdk/Cwm3PuAB11pHb0AgKsVJ3m44XqrTaUHF3PiymfQ
         00r9N5ETfTfQ7TFhwvK/zzTgsbZdnHNDtp3uzdUKAlgq4xAk/kh5ubILsY9+zaSL/Q
         +zOjzxVKfkbkg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds Tegra194 XUSB host mode controller support. This is
very similar to the existing Tegra124/Tegra210/Tegra186 XHCI, except
  1. the number of ports and PHYs differs
  2. the IPFS wrapper being removed
  3. mailbox registers address changes

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index add6b8fb40e1..f19d39874a3b 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1460,10 +1460,40 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	},
 };
 
+static const char * const tegra194_supply_names[] = {
+};
+
+static const struct tegra_xusb_phy_type tegra194_phy_types[] = {
+	{ .name = "usb3", .num = 4, },
+	{ .name = "usb2", .num = 4, },
+};
+
+static const struct tegra_xusb_soc tegra194_soc = {
+	.firmware = "nvidia/tegra194/xusb.bin",
+	.supply_names = tegra194_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
+	.phy_types = tegra194_phy_types,
+	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.ports = {
+		.usb3 = { .offset = 0, .count = 4, },
+		.usb2 = { .offset = 4, .count = 4, },
+	},
+	.scale_ss_clock = false,
+	.has_ipfs = false,
+	.mbox = {
+		.cmd = 0x68,
+		.data_in = 0x6c,
+		.data_out = 0x70,
+		.owner = 0x74,
+	},
+};
+MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
 	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
 	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
+	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
-- 
2.17.1

