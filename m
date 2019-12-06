Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA0671151F3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfLFOHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41452 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfLFOHJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:09 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so7895090wrw.8;
        Fri, 06 Dec 2019 06:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kh+NvAHIuLaskgHhQ30Dq+xfYXMn71deaL+NXn7hou0=;
        b=Ulby/W12mRuN9YQCzGr/2hYNtO59waSS9kOPMlAiKcnhRfgF1azOQcG30XZ+6UrjZC
         R7FgaciJHDc4ZHILq2ABp4nmwoK2ZMsoeGP9A1e4+COgsA9hxSNKa0IjYo1QOzYtFfA8
         CT4vXjTUK/wyAFpNGkX35JOA0LswVL6H2z5sH2vROXOMBBDrwZzteDV/xi1vJurHiIed
         klIKabxm2ywefMshBfUOPbv7mo21lNR0CffwPeowkb1QLRyfuSNITLUU8SJLYDP3Lp0H
         bxaSnp3aj4WwTNljSHVLrhXhXEDvobkHJ7D1Gw6SLelUcDZ5/EZLUYBAKoLNMQZlazHf
         hO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kh+NvAHIuLaskgHhQ30Dq+xfYXMn71deaL+NXn7hou0=;
        b=R8pjkQ/Y1RGtrL1vj70jyX1aa0u9KUWHP3AX9pkfme3xXXFXkEd7b1NI6B4eFS7wTQ
         6utTX8J3BzteqYOrb6ITzzJkFKyNcUYtPgvP6W/xlS4IXDiwE0LMm4kUv8YZvk8ywLZh
         JuYDs/MOuPGmZ/qTcMjg/lZRSA+z2Rg+jLYAasrDZjExSNasMz6kA0rg5qQcrgs59iOS
         6ovppSM6H8IuI+Gc9uEsJgRhajPcLe255UUGU5MuAE4AjprLap0NlJzWsSUDtxr4hevs
         E/f4bmJiEkKQvG2/tDyo1jI5PB1M90YNXor2Tme405ogI0OyzbM89aR9jMwKh4pQzH58
         xegg==
X-Gm-Message-State: APjAAAXoEZSdmn6vXFv8uRKmmJe6J8AEofFJm8vhDzy8dEarC4a2hvKA
        RTIyz79xMHQNq3kKVnZSQAU=
X-Google-Smtp-Source: APXvYqxb5htIDG9DplYlR2/uaJ1U5HmtSk6bPNJOZem0JTmL+s7jvE7ocfnNkFl8mHY4xWqce23g2g==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr16808059wrp.323.1575641227789;
        Fri, 06 Dec 2019 06:07:07 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c15sm15918932wrt.1.2019.12.06.06.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 06/10] usb: host: xhci-tegra: Reuse stored register base address
Date:   Fri,  6 Dec 2019 15:06:49 +0100
Message-Id: <20191206140653.2085561-7-thierry.reding@gmail.com>
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

The base address of the XUSB controller's registers is already stored in
the HCD. Move assignment to the HCD fields to an earlier point so that
they can be reused in the tegra_xusb_config() function. This avoids the
need to pass the base address as an extra parameter, which in turn comes
in handy in subsequent patches that need to call this function from the
suspend/resume paths where these values are no longer readily available.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 499104c05668..31411f85e742 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -626,9 +626,9 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void tegra_xusb_config(struct tegra_xusb *tegra,
-			      struct resource *regs)
+static void tegra_xusb_config(struct tegra_xusb *tegra)
 {
+	u32 regs = tegra->hcd->rsrc_start;
 	u32 value;
 
 	if (tegra->soc->has_ipfs) {
@@ -642,7 +642,7 @@ static void tegra_xusb_config(struct tegra_xusb *tegra,
 	/* Program BAR0 space */
 	value = fpci_readl(tegra, XUSB_CFG_4);
 	value &= ~(XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
-	value |= regs->start & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
+	value |= regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
 	fpci_writel(tegra, value, XUSB_CFG_4);
 
 	usleep_range(100, 200);
@@ -1226,6 +1226,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_powerdomains;
 	}
 
+	tegra->hcd->regs = tegra->regs;
+	tegra->hcd->rsrc_start = regs->start;
+	tegra->hcd->rsrc_len = resource_size(regs);
+
 	/*
 	 * This must happen after usb_create_hcd(), because usb_create_hcd()
 	 * will overwrite the drvdata of the device with the hcd it creates.
@@ -1249,7 +1253,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	tegra_xusb_config(tegra, regs);
+	tegra_xusb_config(tegra);
 
 	/*
 	 * The XUSB Falcon microcontroller can only address 40 bits, so set
@@ -1273,10 +1277,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto free_firmware;
 	}
 
-	tegra->hcd->regs = tegra->regs;
-	tegra->hcd->rsrc_start = regs->start;
-	tegra->hcd->rsrc_len = resource_size(regs);
-
 	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-- 
2.23.0

