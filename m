Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABAFE108DFB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfKYMcf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34930 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727637AbfKYMcf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id s5so17797309wrw.2;
        Mon, 25 Nov 2019 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+jOOCRfE+bWS3KrG9RY/sbrW7kMdvn2jIE5gERU04sk=;
        b=bzT/17ERU+eIKpfnDUiAhrtjoalu0y3R8MAro5b+2V7lqfBjT9Nbxo8pBbmtHlfHmc
         r+WAgO3iHaMHqqQJx4IK3xu/7nD/ZGnDTFiUvulZComB1w4W5oaEXz1pSClIKhcUEjdL
         FboqUf1ltlhgVzu72n1/k0VEyBXzYlMT/eVHMkbCwVJEgdo/jdnEaoMxhej69zx9opxK
         4GOjtHBDADiWuxmjObrxMMitGUoEKNOj/gUzrbo8kMQ+lfnHLsIlvo2Cpt6bz1MQC6ZG
         jJ/67UONQLCIMDtbA6wZz3uFIF+kWS/pWDDQCARVYMb95NpR2XzggbvyPeekwtbjlglN
         H6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+jOOCRfE+bWS3KrG9RY/sbrW7kMdvn2jIE5gERU04sk=;
        b=fyfMQBPsYeq/9Rk6fsqxOTOT+YnDVWcSD2+8nZsoCNsVpcgK/tYsN0hUb4iqHA5MPL
         wgfyeCxPQjgmUwcTLUrZrQfRwL5qAYnbTiechVs5XnAhspSsn1/YytkAEglKBa7SsE9d
         6LVLS2fGP45Efg37HewWp3VUUrUSyWLpDujo0HfiUB5vZyGgLfyk0xxN/lJtwDGc3JNE
         IsY5DVzHTic4y9GICyp6a+4Pi7mrtSzcbccdk26O7nwUZXmE/pSv/N5t09QPkxENJ/7N
         sNP56tSGQB5UTCa3ISjuvlljYuz3vDBPUqMA3EhHg4WZUjGXkwoRF/8bq6tT9dI2PKwk
         H3IA==
X-Gm-Message-State: APjAAAWdbZcKIZIOTw1KCJwBAM+AqlIrvZsrGVk5U2edMeBjwcQ6QYW/
        1wjngwosSY3NFGMHqk2jcLs=
X-Google-Smtp-Source: APXvYqxl6FZYbxmJXjta1wA6NoDLtggJZXERO4ll/JeE5LY8lz2f/7klu8dF1Pmie8xdVxhZWxr2fQ==
X-Received: by 2002:a05:6000:103:: with SMTP id o3mr33387320wrx.80.1574685150601;
        Mon, 25 Nov 2019 04:32:30 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id u14sm10414805wrm.51.2019.11.25.04.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:29 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/10] usb: host: xhci-tegra: Add XUSB controller context
Date:   Mon, 25 Nov 2019 13:32:09 +0100
Message-Id: <20191125123210.1564323-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125123210.1564323-1-thierry.reding@gmail.com>
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Define the offsets of the registers that need to be saved on suspend and
restored on resume for the various NVIDIA Tegra generations supported by
the XUSB driver.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 80 ++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index be1b47fadb3b..cd3afec408ea 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -38,7 +38,15 @@
 #define XUSB_CFG_4				0x010
 #define  XUSB_BASE_ADDR_SHIFT			15
 #define  XUSB_BASE_ADDR_MASK			0x1ffff
+#define XUSB_CFG_16				0x040
+#define XUSB_CFG_24				0x060
+#define XUSB_CFG_AXI_CFG			0x0f8
 #define XUSB_CFG_ARU_C11_CSBRANGE		0x41c
+#define XUSB_CFG_ARU_CONTEXT			0x43c
+#define XUSB_CFG_ARU_CONTEXT_HS_PLS		0x478
+#define XUSB_CFG_ARU_CONTEXT_FS_PLS		0x47c
+#define XUSB_CFG_ARU_CONTEXT_HSFS_SPEED		0x480
+#define XUSB_CFG_ARU_CONTEXT_HSFS_PP		0x484
 #define XUSB_CFG_CSB_BASE_ADDR			0x800
 
 /* FPCI mailbox registers */
@@ -62,11 +70,20 @@
 #define  MBOX_SMI_INTR_EN			BIT(3)
 
 /* IPFS registers */
+#define IPFS_XUSB_HOST_MSI_BAR_SZ_0		0x0c0
+#define IPFS_XUSB_HOST_MSI_AXI_BAR_ST_0		0x0c4
+#define IPFS_XUSB_HOST_MSI_FPCI_BAR_ST_0	0x0c8
+#define IPFS_XUSB_HOST_MSI_VEC0_0		0x100
+#define IPFS_XUSB_HOST_MSI_EN_VEC0_0		0x140
 #define IPFS_XUSB_HOST_CONFIGURATION_0		0x180
 #define  IPFS_EN_FPCI				BIT(0)
+#define IPFS_XUSB_HOST_FPCI_ERROR_MASKS_0	0x184
 #define IPFS_XUSB_HOST_INTR_MASK_0		0x188
 #define  IPFS_IP_INT_MASK			BIT(16)
+#define IPFS_XUSB_HOST_INTR_ENABLE_0		0x198
+#define IPFS_XUSB_HOST_UFPCI_CONFIG_0		0x19c
 #define IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0	0x1bc
+#define IPFS_XUSB_HOST_MCCIF_FIFOCTRL_0		0x1dc
 
 #define CSB_PAGE_SELECT_MASK			0x7fffff
 #define CSB_PAGE_SELECT_SHIFT			9
@@ -820,13 +837,6 @@ static int tegra_xusb_init_context(struct tegra_xusb *tegra)
 {
 	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
 
-	/*
-	 * Skip support for context save/restore if the SoC doesn't have any
-	 * XUSB specific context that needs to be saved/restored.
-	 */
-	if (!soc)
-		return 0;
-
 	tegra->context.ipfs = devm_kcalloc(tegra->dev, soc->ipfs.num_offsets,
 					   sizeof(u32), GFP_KERNEL);
 	if (!tegra->context.ipfs)
@@ -1447,12 +1457,12 @@ static void tegra_xusb_save_context(struct tegra_xusb *tegra)
 	struct tegra_xusb_context *ctx = &tegra->context;
 	unsigned int i;
 
-	if (soc && soc->ipfs.num_offsets > 0) {
+	if (soc->ipfs.num_offsets > 0) {
 		for (i = 0; i < soc->ipfs.num_offsets; i++)
 			ctx->ipfs[i] = ipfs_readl(tegra, soc->ipfs.offsets[i]);
 	}
 
-	if (soc && soc->fpci.num_offsets > 0) {
+	if (soc->fpci.num_offsets > 0) {
 		for (i = 0; i < soc->fpci.num_offsets; i++)
 			ctx->fpci[i] = fpci_readl(tegra, soc->fpci.offsets[i]);
 	}
@@ -1464,12 +1474,12 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
 	struct tegra_xusb_context *ctx = &tegra->context;
 	unsigned int i;
 
-	if (soc && soc->fpci.num_offsets > 0) {
+	if (soc->fpci.num_offsets > 0) {
 		for (i = 0; i < soc->fpci.num_offsets; i++)
 			fpci_writel(tegra, ctx->fpci[i], soc->fpci.offsets[i]);
 	}
 
-	if (soc && soc->ipfs.num_offsets > 0) {
+	if (soc->ipfs.num_offsets > 0) {
 		for (i = 0; i < soc->ipfs.num_offsets; i++)
 			ipfs_writel(tegra, ctx->ipfs[i], soc->ipfs.offsets[i]);
 	}
@@ -1526,12 +1536,50 @@ static const struct tegra_xusb_phy_type tegra124_phy_types[] = {
 	{ .name = "hsic", .num = 2, },
 };
 
+static const unsigned int tegra124_xusb_context_ipfs[] = {
+	IPFS_XUSB_HOST_MSI_BAR_SZ_0,
+	IPFS_XUSB_HOST_MSI_BAR_SZ_0,
+	IPFS_XUSB_HOST_MSI_AXI_BAR_ST_0,
+	IPFS_XUSB_HOST_MSI_FPCI_BAR_ST_0,
+	IPFS_XUSB_HOST_MSI_VEC0_0,
+	IPFS_XUSB_HOST_MSI_EN_VEC0_0,
+	IPFS_XUSB_HOST_FPCI_ERROR_MASKS_0,
+	IPFS_XUSB_HOST_INTR_MASK_0,
+	IPFS_XUSB_HOST_INTR_ENABLE_0,
+	IPFS_XUSB_HOST_UFPCI_CONFIG_0,
+	IPFS_XUSB_HOST_CLKGATE_HYSTERESIS_0,
+	IPFS_XUSB_HOST_MCCIF_FIFOCTRL_0,
+};
+
+static const unsigned int tegra124_xusb_context_fpci[] = {
+	XUSB_CFG_ARU_CONTEXT_HS_PLS,
+	XUSB_CFG_ARU_CONTEXT_FS_PLS,
+	XUSB_CFG_ARU_CONTEXT_HSFS_SPEED,
+	XUSB_CFG_ARU_CONTEXT_HSFS_PP,
+	XUSB_CFG_ARU_CONTEXT,
+	XUSB_CFG_AXI_CFG,
+	XUSB_CFG_24,
+	XUSB_CFG_16,
+};
+
+static const struct tegra_xusb_context_soc tegra124_xusb_context = {
+	.ipfs = {
+		.num_offsets = ARRAY_SIZE(tegra124_xusb_context_ipfs),
+		.offsets = tegra124_xusb_context_ipfs,
+	},
+	.fpci = {
+		.num_offsets = ARRAY_SIZE(tegra124_xusb_context_fpci),
+		.offsets = tegra124_xusb_context_fpci,
+	},
+};
+
 static const struct tegra_xusb_soc tegra124_soc = {
 	.firmware = "nvidia/tegra124/xusb.bin",
 	.supply_names = tegra124_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra124_supply_names),
 	.phy_types = tegra124_phy_types,
 	.num_types = ARRAY_SIZE(tegra124_phy_types),
+	.context = &tegra124_xusb_context,
 	.ports = {
 		.usb2 = { .offset = 4, .count = 4, },
 		.hsic = { .offset = 6, .count = 2, },
@@ -1570,6 +1618,7 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	.num_supplies = ARRAY_SIZE(tegra210_supply_names),
 	.phy_types = tegra210_phy_types,
 	.num_types = ARRAY_SIZE(tegra210_phy_types),
+	.context = &tegra124_xusb_context,
 	.ports = {
 		.usb2 = { .offset = 4, .count = 4, },
 		.hsic = { .offset = 8, .count = 1, },
@@ -1595,12 +1644,20 @@ static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
 	{ .name = "hsic", .num = 1, },
 };
 
+static const struct tegra_xusb_context_soc tegra186_xusb_context = {
+	.fpci = {
+		.num_offsets = ARRAY_SIZE(tegra124_xusb_context_fpci),
+		.offsets = tegra124_xusb_context_fpci,
+	},
+};
+
 static const struct tegra_xusb_soc tegra186_soc = {
 	.firmware = "nvidia/tegra186/xusb.bin",
 	.supply_names = tegra186_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra186_supply_names),
 	.phy_types = tegra186_phy_types,
 	.num_types = ARRAY_SIZE(tegra186_phy_types),
+	.context = &tegra186_xusb_context,
 	.ports = {
 		.usb3 = { .offset = 0, .count = 3, },
 		.usb2 = { .offset = 3, .count = 3, },
@@ -1630,6 +1687,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
 	.phy_types = tegra194_phy_types,
 	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.context = &tegra186_xusb_context,
 	.ports = {
 		.usb3 = { .offset = 0, .count = 4, },
 		.usb2 = { .offset = 4, .count = 4, },
-- 
2.23.0

