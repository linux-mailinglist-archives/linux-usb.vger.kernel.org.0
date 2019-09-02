Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845BAA4DF4
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 05:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbfIBDy6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Sep 2019 23:54:58 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10807 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbfIBDy6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Sep 2019 23:54:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6c92910000>; Sun, 01 Sep 2019 20:54:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 01 Sep 2019 20:54:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 01 Sep 2019 20:54:56 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Sep
 2019 03:54:56 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Sep 2019 03:54:56 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.121]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d6c928f0001>; Sun, 01 Sep 2019 20:54:56 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] xhci: tegra: mbox registers address in"soc" data
Date:   Mon, 2 Sep 2019 11:54:45 +0800
Message-ID: <20190902035445.32046-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567396497; bh=mlQz4dVcVde63JhrwDNVZvwBVImD48gjliha2oH6Drg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=HZ28Rmccu+6qSaAHvpONP2cZQBEoknn4rY3uPf4KWxd51NamgcVaReKQxBgG8RnDv
         TKjAISZ5s7f5Wqt4qr/tOczf1rxDfturMIksAJrIaYhlljy84tnNtdI5FwWb4AEFfD
         QA3qBOXRr4eVKWjGDxQRMNM/3XnSXSDicLDVmrKRWRPyRKM1Ig4xfHyEBx2cTNEhVo
         2i77prt/i+CIavIIP+5bvLuJJTZi7B/ACSpntRlZe0JZKdT2gVmYeQqY0PK07fZiK6
         R/7RAfMbdqXo7xEz53o0IlEuqj+49jOMRFgzzVKFP/989lgbcopFd5WbdMig57geP2
         LyPg2HRii+yCQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra194 XUSB host controller has rearranged mailbox registers. This
commit makes mailbox registers address a part of "soc" data so that
xhci-tegra driver can be used for Tegra194.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 51 ++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index dafc65911fc0..b92a03bbbd2c 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -146,6 +146,13 @@ struct tegra_xusb_phy_type {
 	unsigned int num;
 };
 
+struct tega_xusb_mbox_regs {
+	u32 cmd;
+	u32 data_in;
+	u32 data_out;
+	u32 owner;
+};
+
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -160,6 +167,8 @@ struct tegra_xusb_soc {
 		} usb2, ulpi, hsic, usb3;
 	} ports;
 
+	struct tega_xusb_mbox_regs mbox;
+
 	bool scale_ss_clock;
 	bool has_ipfs;
 };
@@ -395,15 +404,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 	 * ACK/NAK messages.
 	 */
 	if (!(msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)) {
-		value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
+		value = fpci_readl(tegra, tegra->soc->mbox.owner);
 		if (value != MBOX_OWNER_NONE) {
 			dev_err(tegra->dev, "mailbox is busy\n");
 			return -EBUSY;
 		}
 
-		fpci_writel(tegra, MBOX_OWNER_SW, XUSB_CFG_ARU_MBOX_OWNER);
+		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
 
-		value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
+		value = fpci_readl(tegra, tegra->soc->mbox.owner);
 		if (value != MBOX_OWNER_SW) {
 			dev_err(tegra->dev, "failed to acquire mailbox\n");
 			return -EBUSY;
@@ -413,17 +422,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 	}
 
 	value = tegra_xusb_mbox_pack(msg);
-	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_DATA_IN);
+	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
 
-	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
+	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
 	value |= MBOX_INT_EN | MBOX_DEST_FALC;
-	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
+	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
 
 	if (wait_for_idle) {
 		unsigned long timeout = jiffies + msecs_to_jiffies(250);
 
 		while (time_before(jiffies, timeout)) {
-			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
+			value = fpci_readl(tegra, tegra->soc->mbox.owner);
 			if (value == MBOX_OWNER_NONE)
 				break;
 
@@ -431,7 +440,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 		}
 
 		if (time_after(jiffies, timeout))
-			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
+			value = fpci_readl(tegra, tegra->soc->mbox.owner);
 
 		if (value != MBOX_OWNER_NONE)
 			return -ETIMEDOUT;
@@ -598,16 +607,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 
 	mutex_lock(&tegra->lock);
 
-	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_DATA_OUT);
+	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
 	tegra_xusb_mbox_unpack(&msg, value);
 
-	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
+	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
 	value &= ~MBOX_DEST_SMI;
-	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
+	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
 
 	/* clear mailbox owner if no ACK/NAK is required */
 	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
-		fpci_writel(tegra, MBOX_OWNER_NONE, XUSB_CFG_ARU_MBOX_OWNER);
+		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
 
 	tegra_xusb_mbox_handle(tegra, &msg);
 
@@ -1365,6 +1374,12 @@ static const struct tegra_xusb_soc tegra124_soc = {
 	},
 	.scale_ss_clock = true,
 	.has_ipfs = true,
+	.mbox = {
+		.cmd = XUSB_CFG_ARU_MBOX_CMD,
+		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_CFG_ARU_MBOX_OWNER,
+	},
 };
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
 
@@ -1397,6 +1412,12 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	},
 	.scale_ss_clock = false,
 	.has_ipfs = true,
+	.mbox = {
+		.cmd = XUSB_CFG_ARU_MBOX_CMD,
+		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_CFG_ARU_MBOX_OWNER,
+	},
 };
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
 
@@ -1422,6 +1443,12 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	},
 	.scale_ss_clock = false,
 	.has_ipfs = false,
+	.mbox = {
+		.cmd = XUSB_CFG_ARU_MBOX_CMD,
+		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_CFG_ARU_MBOX_OWNER,
+	},
 };
 
 static const struct of_device_id tegra_xusb_of_match[] = {
-- 
2.17.1

