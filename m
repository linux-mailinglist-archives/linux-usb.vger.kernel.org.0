Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B43A1151F9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfLFOHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:18 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46620 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfLFOHR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:17 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so7816680wrl.13;
        Fri, 06 Dec 2019 06:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cu6f2cKErOCRFVlUOJy3AEtKW/sIMubhhh915A0YWSk=;
        b=qAzZ2Ym7o0wgJT4YkciZjKNREDS/JIXNMtP6OUixuRsjyqzRBK2QrQI8BFgaOTlesE
         w+149Ewyc3DbywJbyeadgsHZGGLhlLK0oSIUbJHYgd09+WiFofFgKDMaDHosWMirbyVM
         BQXUCNBs0x7Vv7Y4QklcAyFw5Du5+P5ZCeh+BxNSOm4zAStjt/4Zwn7IokAU/LNL8zxR
         kp+cfOCaD9/iGZ32w8MjN+TdyacMV22jeyA8ucgJmxHcbou5NmKk86f6S32qUaegoy7Q
         TjwSyPZujgZ39o/iYVNDBNY/hrEXPWMPA8Kg0cOxqr7NLa/qPgVzT3tPtXwNcqc4vHap
         8JOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cu6f2cKErOCRFVlUOJy3AEtKW/sIMubhhh915A0YWSk=;
        b=qLdeJn/MchBc8NKtJpIVVAmWlDLKZH9KsDiVjSz9ozYNNWP1zMSlzoJ877E0Hc8MXr
         QSZgUqVPD52H/asl3qfTd4ZzzZIgLEe2GkgEbkE6twmQ5Xb7c5qSQMsJQEU2CK+JltaZ
         KxMQWRVRrY//9xDI0IVcaJ5Ly9JAN2yIxWkzXDTDFksFgfv7pJJN8BekeRZvOfpKsQ3+
         bI96gYeQaTkt4uAbGa2PqgHdpKnggWWNPH9R9jNqJiMgcXyNvDrf3sejZfrkifyX8RQX
         MxXzDUDzjhkVqnqkCju35xzRXysogklM0eVTb+LNjDsRHaQscBQarmwbqVteOj5h99OE
         AJow==
X-Gm-Message-State: APjAAAVcsxP3FgIJs1hXxslQGFyh6VbSnCg1iM1KWW/WyY9aJAEwXFFk
        Ia3kzLfuZMXWfhrc9iNBdaTG9z/tELA=
X-Google-Smtp-Source: APXvYqw0Wif7qlRMiftz+7Ya/g5VMwsibCbzmiUjRXr5GM9vED8ofstU6A+rxPjL6tUQoBonK/xXpQ==
X-Received: by 2002:a05:6000:cb:: with SMTP id q11mr15503208wrx.14.1575641234539;
        Fri, 06 Dec 2019 06:07:14 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id e8sm15969651wrt.7.2019.12.06.06.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 09/10] usb: host: xhci-tegra: Add XUSB controller context
Date:   Fri,  6 Dec 2019 15:06:52 +0100
Message-Id: <20191206140653.2085561-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206140653.2085561-1-thierry.reding@gmail.com>
References: <20191206140653.2085561-1-thierry.reding@gmail.com>
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
index 1b5e4ee313ce..7f6657ad5ce5 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -39,7 +39,15 @@
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
@@ -63,11 +71,20 @@
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
@@ -821,13 +838,6 @@ static int tegra_xusb_init_context(struct tegra_xusb *tegra)
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
@@ -1443,12 +1453,12 @@ static void tegra_xusb_save_context(struct tegra_xusb *tegra)
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
@@ -1460,12 +1470,12 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
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
@@ -1522,12 +1532,50 @@ static const struct tegra_xusb_phy_type tegra124_phy_types[] = {
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
@@ -1566,6 +1614,7 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	.num_supplies = ARRAY_SIZE(tegra210_supply_names),
 	.phy_types = tegra210_phy_types,
 	.num_types = ARRAY_SIZE(tegra210_phy_types),
+	.context = &tegra124_xusb_context,
 	.ports = {
 		.usb2 = { .offset = 4, .count = 4, },
 		.hsic = { .offset = 8, .count = 1, },
@@ -1591,12 +1640,20 @@ static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
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
@@ -1626,6 +1683,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
 	.phy_types = tegra194_phy_types,
 	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.context = &tegra186_xusb_context,
 	.ports = {
 		.usb3 = { .offset = 0, .count = 4, },
 		.usb2 = { .offset = 4, .count = 4, },
-- 
2.23.0

