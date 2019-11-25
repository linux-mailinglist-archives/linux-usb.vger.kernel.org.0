Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98056108DF9
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfKYMcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45947 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727637AbfKYMcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id z10so17719684wrs.12;
        Mon, 25 Nov 2019 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7nvRSeYdEHiiiK8kd3BX5ojZ7p/90dHMgcmHKqRHifs=;
        b=B6YICcxrBWaKYmbBYio30k9B2w3qneV9s9oHOqpSB98rVQXM1ddpgCMxVjigNoiwOa
         SiHeAzj3HH/STZNTLR3sq2jUxMxKrxtnVxahUOFrFu4PKs7jw7Y22ffGeucJv349xpkl
         /m8i/JFWHZgSWWcp+kvVVqD4NAcM5T0VxhM3LlNGOmoZqI5i01iJdeud4CIJzSpRkMQ4
         R1grDYak/7bGMAVtR0c1wRygsjHb9QNkr7t4hbE2qU6pjJjpdgK8EYKbizN2gqOUkqHa
         3BkoXOL/tdqT2ljvPyNPFm8S0Tf1VCdr8v80JidM4KeMX2NuHEg/rE7oUn/lLzxub/3G
         VeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7nvRSeYdEHiiiK8kd3BX5ojZ7p/90dHMgcmHKqRHifs=;
        b=Kz5hcQmQP5DsbXYZtRQLqJ4qEIOmSCjtznic8C0iVYrbNdrZWRETh8Arbyz/qn60LB
         UX/9+R6mfMBnyUhp5S8wxhLtVrF1EteuQfhbyMPs6CdTP9qW/1eCxaPneZL92bez178+
         ALuA/qbQrWYUZUngt7UTrzetnYNsx+JUfBFMBeAHExCOyrEkkWA76RYNJVr6JgLAwZCI
         SohA26bEe0FzJlZFEE3ehSlesmRaN3MC3X8eXPYPi4r868P0KXCEKIu7joR1byJFbkDU
         /ehGyJtfzkp2Uiee0bmZ3wOJgAJFRsmqqvB3XHMj1BHL77naFNkmem+NL0DyU/w/FELM
         1x4g==
X-Gm-Message-State: APjAAAW/aid6Z/CV6gQgfgjpAEaq5K2B3H/K0r/AVD7WEG/IGEaQI6WK
        8qtlECCZYx5gvWAmE9FcQyE=
X-Google-Smtp-Source: APXvYqwS4hvuz2OwRcPobZ91rJOT7Xab22ED4YHGODKy5UD+E3Ad4TcbKSHCTc9dRc/VDpepzttLjw==
X-Received: by 2002:a05:6000:10c5:: with SMTP id b5mr32330984wrx.121.1574685148539;
        Mon, 25 Nov 2019 04:32:28 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id x2sm8036638wmc.3.2019.11.25.04.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 08/10] usb: host: xhci-tegra: Add support for XUSB context save/restore
Date:   Mon, 25 Nov 2019 13:32:08 +0100
Message-Id: <20191125123210.1564323-9-thierry.reding@gmail.com>
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

The XUSB controller contains registers that need to be saved on suspend
and restored on resume in addition to the XHCI specific registers. Add
support for saving and restoring the XUSB specific context.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 102 +++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index f043aab7bf53..be1b47fadb3b 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -154,12 +154,25 @@ struct tegra_xusb_mbox_regs {
 	u16 owner;
 };
 
+struct tegra_xusb_context_soc {
+	struct {
+		const unsigned int *offsets;
+		unsigned int num_offsets;
+	} ipfs;
+
+	struct {
+		const unsigned int *offsets;
+		unsigned int num_offsets;
+	} fpci;
+};
+
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
 	unsigned int num_supplies;
 	const struct tegra_xusb_phy_type *phy_types;
 	unsigned int num_types;
+	const struct tegra_xusb_context_soc *context;
 
 	struct {
 		struct {
@@ -174,6 +187,11 @@ struct tegra_xusb_soc {
 	bool has_ipfs;
 };
 
+struct tegra_xusb_context {
+	u32 *ipfs;
+	u32 *fpci;
+};
+
 struct tegra_xusb {
 	struct device *dev;
 	void __iomem *regs;
@@ -220,6 +238,8 @@ struct tegra_xusb {
 		void *virt;
 		dma_addr_t phys;
 	} fw;
+
+	struct tegra_xusb_context context;
 };
 
 static struct hc_driver __read_mostly tegra_xhci_hc_driver;
@@ -795,6 +815,37 @@ static int tegra_xusb_runtime_resume(struct device *dev)
 	return err;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int tegra_xusb_init_context(struct tegra_xusb *tegra)
+{
+	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
+
+	/*
+	 * Skip support for context save/restore if the SoC doesn't have any
+	 * XUSB specific context that needs to be saved/restored.
+	 */
+	if (!soc)
+		return 0;
+
+	tegra->context.ipfs = devm_kcalloc(tegra->dev, soc->ipfs.num_offsets,
+					   sizeof(u32), GFP_KERNEL);
+	if (!tegra->context.ipfs)
+		return -ENOMEM;
+
+	tegra->context.fpci = devm_kcalloc(tegra->dev, soc->ipfs.num_offsets,
+					   sizeof(u32), GFP_KERNEL);
+	if (!tegra->context.fpci)
+		return -ENOMEM;
+
+	return 0;
+}
+#else
+static inline int tegra_xusb_init_context(struct tegra_xusb *tegra)
+{
+	return 0;
+}
+#endif
+
 static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
 {
 	struct tegra_xusb_fw_header *header;
@@ -1043,6 +1094,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	mutex_init(&tegra->lock);
 	tegra->dev = &pdev->dev;
 
+	err = tegra_xusb_init_context(tegra);
+	if (err < 0)
+		return err;
+
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	tegra->regs = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(tegra->regs))
@@ -1386,14 +1441,55 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static void tegra_xusb_save_context(struct tegra_xusb *tegra)
+{
+	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
+	struct tegra_xusb_context *ctx = &tegra->context;
+	unsigned int i;
+
+	if (soc && soc->ipfs.num_offsets > 0) {
+		for (i = 0; i < soc->ipfs.num_offsets; i++)
+			ctx->ipfs[i] = ipfs_readl(tegra, soc->ipfs.offsets[i]);
+	}
+
+	if (soc && soc->fpci.num_offsets > 0) {
+		for (i = 0; i < soc->fpci.num_offsets; i++)
+			ctx->fpci[i] = fpci_readl(tegra, soc->fpci.offsets[i]);
+	}
+}
+
+static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
+{
+	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
+	struct tegra_xusb_context *ctx = &tegra->context;
+	unsigned int i;
+
+	if (soc && soc->fpci.num_offsets > 0) {
+		for (i = 0; i < soc->fpci.num_offsets; i++)
+			fpci_writel(tegra, ctx->fpci[i], soc->fpci.offsets[i]);
+	}
+
+	if (soc && soc->ipfs.num_offsets > 0) {
+		for (i = 0; i < soc->ipfs.num_offsets; i++)
+			ipfs_writel(tegra, ctx->ipfs[i], soc->ipfs.offsets[i]);
+	}
+}
+
 static int tegra_xusb_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
 	bool wakeup = device_may_wakeup(dev);
+	int err;
 
 	/* TODO: Powergate controller across suspend/resume. */
-	return xhci_suspend(xhci, wakeup);
+	err = xhci_suspend(xhci, wakeup);
+	if (err < 0)
+		return err;
+
+	tegra_xusb_save_context(tegra);
+
+	return 0;
 }
 
 static int tegra_xusb_resume(struct device *dev)
@@ -1401,7 +1497,9 @@ static int tegra_xusb_resume(struct device *dev)
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
 
-	return xhci_resume(xhci, 0);
+	tegra_xusb_restore_context(tegra);
+
+	return xhci_resume(xhci, false);
 }
 #endif
 
-- 
2.23.0

