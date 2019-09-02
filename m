Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9B2A517A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 10:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfIBIVd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 04:21:33 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1442 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbfIBIVc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Sep 2019 04:21:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6cd10d0000>; Mon, 02 Sep 2019 01:21:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 02 Sep 2019 01:21:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 02 Sep 2019 01:21:31 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Sep
 2019 08:21:30 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Sep 2019 08:21:30 +0000
Received: from jckuo-lt.nvidia.com (Not Verified[10.19.108.121]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d6cd1090003>; Mon, 02 Sep 2019 01:21:30 -0700
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] xhci: tegra: Parameterize mailbox register addresses
Date:   Mon, 2 Sep 2019 16:21:27 +0800
Message-ID: <20190902082127.17963-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567412494; bh=jb4+54HxpmGqxM4SwIJirMYfhHtbrN81XbTDtbZH8+0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=mcS2QHHydmx5YgNXbggzdtX+kLzszvgpQ8XVu0J5sg5ke5Sj1W/blrMcgewltmYvO
         bqZgSpBlnMTah+I+WSXlWZXChHrHfCNqV4OY5hKnQwJ+/qLtCIvuM4jw8Q0rjtqIkR
         EXasVYJXU6XBgw86sTdy4aWTyaZDyfndtexRyJbTSIan6xbaaM7oU7OLFfvUvTQ0qX
         KqbrR9W7TiFdol3ldPTfc6VSoDdBjpZ3D5yDU9oGnUveyLjFzWFPrBNFkOJIHVeK25
         6aFt3dTU53E63Dj7szlsIzDs4mDR6EQeARJR5VXCIG9fVAAo/lRKlRlc3Z0nGpfaXz
         qTl40M1AAbfuA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra194 XUSB host controller has rearranged mailbox registers. This
commit makes mailbox registers address a part of "soc" data so that
xhci-tegra driver can be used for Tegra194.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 58 +++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index dafc65911fc0..247b08ca49ee 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -42,19 +42,18 @@
 #define XUSB_CFG_CSB_BASE_ADDR			0x800
 
 /* FPCI mailbox registers */
-#define XUSB_CFG_ARU_MBOX_CMD			0x0e4
+/* XUSB_CFG_ARU_MBOX_CMD */
 #define  MBOX_DEST_FALC				BIT(27)
 #define  MBOX_DEST_PME				BIT(28)
 #define  MBOX_DEST_SMI				BIT(29)
 #define  MBOX_DEST_XHCI				BIT(30)
 #define  MBOX_INT_EN				BIT(31)
-#define XUSB_CFG_ARU_MBOX_DATA_IN		0x0e8
+/* XUSB_CFG_ARU_MBOX_DATA_IN and XUSB_CFG_ARU_MBOX_DATA_OUT */
 #define  CMD_DATA_SHIFT				0
 #define  CMD_DATA_MASK				0xffffff
 #define  CMD_TYPE_SHIFT				24
 #define  CMD_TYPE_MASK				0xff
-#define XUSB_CFG_ARU_MBOX_DATA_OUT		0x0ec
-#define XUSB_CFG_ARU_MBOX_OWNER			0x0f0
+/* XUSB_CFG_ARU_MBOX_OWNER */
 #define  MBOX_OWNER_NONE			0
 #define  MBOX_OWNER_FW				1
 #define  MBOX_OWNER_SW				2
@@ -146,6 +145,13 @@ struct tegra_xusb_phy_type {
 	unsigned int num;
 };
 
+struct tega_xusb_mbox_regs {
+	unsigned int cmd;
+	unsigned int data_in;
+	unsigned int data_out;
+	unsigned int owner;
+};
+
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -160,6 +166,8 @@ struct tegra_xusb_soc {
 		} usb2, ulpi, hsic, usb3;
 	} ports;
 
+	struct tega_xusb_mbox_regs mbox;
+
 	bool scale_ss_clock;
 	bool has_ipfs;
 };
@@ -395,15 +403,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
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
@@ -413,17 +421,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
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
 
@@ -431,7 +439,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 		}
 
 		if (time_after(jiffies, timeout))
-			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
+			value = fpci_readl(tegra, tegra->soc->mbox.owner);
 
 		if (value != MBOX_OWNER_NONE)
 			return -ETIMEDOUT;
@@ -598,16 +606,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 
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
 
@@ -1365,6 +1373,12 @@ static const struct tegra_xusb_soc tegra124_soc = {
 	},
 	.scale_ss_clock = true,
 	.has_ipfs = true,
+	.mbox = {
+		.cmd = 0xe4,
+		.data_in = 0xe8,
+		.data_out = 0xec,
+		.owner = 0xf0,
+	},
 };
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
 
@@ -1397,6 +1411,12 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	},
 	.scale_ss_clock = false,
 	.has_ipfs = true,
+	.mbox = {
+		.cmd = 0xe4,
+		.data_in = 0xe8,
+		.data_out = 0xec,
+		.owner = 0xf0,
+	},
 };
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
 
@@ -1422,6 +1442,12 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	},
 	.scale_ss_clock = false,
 	.has_ipfs = false,
+	.mbox = {
+		.cmd = 0xe4,
+		.data_in = 0xe8,
+		.data_out = 0xec,
+		.owner = 0xf0,
+	},
 };
 
 static const struct of_device_id tegra_xusb_of_match[] = {
-- 
2.17.1

