Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3291151F6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfLFOHP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:15 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35324 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfLFOHP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:15 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so7932956wro.2;
        Fri, 06 Dec 2019 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fERhwWBhSRj4I9HeZFZXrlVYXpadgU0FNGh7dPnYH00=;
        b=uWWdggglxgZ/hQQFiJP1dvpIJ79vFrNQ/XwcXQ54P2syBIBv9D4WtwoRMkxV15FeFl
         +uY4GKFTLtXchxHqrpevTQ0QTVvXuPa9082cZ8K9qPQJ5WzJmT0IXwnAtiYWu15yf4ln
         lKs5UL5NwAwBaxTgMIRHxogluDge7uT4NzcEuQcyv2sIYmzoaRcRcWRF5J0rSV0dsQOZ
         ECKQF8l4vAgClp+tv0rRkBGEc6DI4oexXkdxF+nbKVLuICgA80mNcr3/x1tmTs/YyL2/
         y/OFVjjLo31J0FoVYJrKTIFHqeMJ+SpJgzTEiYKPJqmEWXEv7jdXM96tHmxlqR91alvV
         sWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fERhwWBhSRj4I9HeZFZXrlVYXpadgU0FNGh7dPnYH00=;
        b=AYprd6w8Awm+onZpLQjjrFctrf9ubAF0z8WMjBmAEsLYChDenpW/VW8xyb1wN1UyjR
         OB73wsIrjP8W+A5WtUhFJ6ZICVL/naZJ5yXRM2pemDjMe1Uz+zHLUeIfxFtYgSdAKmHJ
         lfgVQZ0Rx9LZfuKGWw4ZBhn+d1XEtF1oTEz2IGtCig4OKIHagQBcNUN8wy36BkUnWQh+
         E944e56N/Tftf0/momeQzrVEIZeCPv9oZRmmJL96M7mtiXilOvVRXV2Ybd0hwXXPbD53
         40hdBBd3PAy+zQJIzRTDZ0UFuEMJg4FIS1rvQX7BKH1GpSZzRMu0AKkNBf0f74DWpIZa
         z2BA==
X-Gm-Message-State: APjAAAXXRUR0ugUelxRp/Sal/CxO3CbxQ/erF4AgmNf7hRbAa4bSjqfS
        STPlFUK2+UKwQmI1+sPZBEA=
X-Google-Smtp-Source: APXvYqwKtaKneucGRNyZ/UT3IFZhaziP3VjIJLK8EFCq/zvXiCegCy3VK4h7oVld8uCCz6m3dcqXow==
X-Received: by 2002:a5d:6901:: with SMTP id t1mr15002723wru.94.1575641232178;
        Fri, 06 Dec 2019 06:07:12 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c2sm16408206wrp.46.2019.12.06.06.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:11 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 08/10] usb: host: xhci-tegra: Add support for XUSB context save/restore
Date:   Fri,  6 Dec 2019 15:06:51 +0100
Message-Id: <20191206140653.2085561-9-thierry.reding@gmail.com>
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

The XUSB controller contains registers that need to be saved on suspend
and restored on resume in addition to the XHCI specific registers. Add
support for saving and restoring the XUSB specific context.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 102 +++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 117e91b8ac6f..1b5e4ee313ce 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -155,12 +155,25 @@ struct tegra_xusb_mbox_regs {
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
@@ -175,6 +188,11 @@ struct tegra_xusb_soc {
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
@@ -221,6 +239,8 @@ struct tegra_xusb {
 		void *virt;
 		dma_addr_t phys;
 	} fw;
+
+	struct tegra_xusb_context context;
 };
 
 static struct hc_driver __read_mostly tegra_xhci_hc_driver;
@@ -796,6 +816,37 @@ static int tegra_xusb_runtime_resume(struct device *dev)
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
@@ -1039,6 +1090,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	mutex_init(&tegra->lock);
 	tegra->dev = &pdev->dev;
 
+	err = tegra_xusb_init_context(tegra);
+	if (err < 0)
+		return err;
+
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	tegra->regs = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(tegra->regs))
@@ -1382,14 +1437,55 @@ static int tegra_xusb_remove(struct platform_device *pdev)
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
@@ -1397,7 +1493,9 @@ static int tegra_xusb_resume(struct device *dev)
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

