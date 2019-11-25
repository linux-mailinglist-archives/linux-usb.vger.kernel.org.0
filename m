Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 607FE108DF6
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbfKYMc2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:28 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36671 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727568AbfKYMc2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:28 -0500
Received: by mail-wm1-f68.google.com with SMTP id n188so13801675wme.1;
        Mon, 25 Nov 2019 04:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fq4QUTXmofakE88LRqI1Nn/WRd5sQuZkre83p4oy/uk=;
        b=d7oqB39fFhkVy/jAkcoZ1DuIr/lzr4hJyUeD3L5Wg3rXC5HzrzMnJMonOng786bWRj
         yeoXT6zrkS5WdBy9AtiY2Ph6NrHzNuWxX9NjM8d4Tut4q1x1x5op05a7W9RPgR7jlkcX
         j6MaOFWDRcKXwjSqvOgzGlSpz5lTJybu0f1tlYMNcbrHzo6g8SFXln2VDE4DVcZqMAVm
         8Y6xIhamGe6EFOhxDUmobftD89UnqakNrmSGhfsdxGhWh9w5HknQSCweM2kagV8lqkL7
         XSRB38dKqAQpjT/hwbIK2y0jEdXsOcbWWxzvA6Pl8P8odIkTHTNhLZ8/ZfM4A1enPF5H
         XT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fq4QUTXmofakE88LRqI1Nn/WRd5sQuZkre83p4oy/uk=;
        b=D0rlfFlSMti+a5p+zrJdFhXpE8IMWVkfE7od5j1c54iryIWJ9+c8RAiZSmNotoKIA4
         COsO4JXDdy8CivK6DpzSYlV5L8SBZrW5YONf4Hi6kEvIG+roA8d1by23lQemUtiBYrke
         qNkoLBWnRS0YpeVGF0UnGeUxENhhnjgsbXu90MvGWT5uMhbs/yK0DtgNxv3de3e6LEEd
         zzsIFRFvZY/YjBhaK2ZGwgkoYJXEuSy8ZvhKcFMaB3RSNhX242YNOVMgHgzM/qAZSUJ+
         Ek4ktl8hm12gVT2ZYL5Lij965LW42KwiRawSYFapApSbaVbLlgsLHD9nZjFeUjLmzDxN
         SKXQ==
X-Gm-Message-State: APjAAAWyYx72aZGzFmDJJ/fK9u0uVVK29Tac+gv3RkCs4SmTZA7A1tHq
        ZBKDkW6Uh+styb8OT7R3hYQ=
X-Google-Smtp-Source: APXvYqxPTm9H4SuowQQSUCdYN4gh+yo+/waYRspzg8FJktNhGSxx6+qEgsL4lOCSdzxxaTB9PFjBog==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr21980943wmo.12.1574685144504;
        Mon, 25 Nov 2019 04:32:24 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id j11sm10201204wrq.26.2019.11.25.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:23 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 06/10] usb: host: xhci-tegra: Reuse stored register base address
Date:   Mon, 25 Nov 2019 13:32:06 +0100
Message-Id: <20191125123210.1564323-7-thierry.reding@gmail.com>
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
index 4244367d3573..5eca3ea0e8b2 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -625,9 +625,9 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void tegra_xusb_config(struct tegra_xusb *tegra,
-			      struct resource *regs)
+static void tegra_xusb_config(struct tegra_xusb *tegra)
 {
+	u32 regs = tegra->hcd->rsrc_start;
 	u32 value;
 
 	if (tegra->soc->has_ipfs) {
@@ -641,7 +641,7 @@ static void tegra_xusb_config(struct tegra_xusb *tegra,
 	/* Program BAR0 space */
 	value = fpci_readl(tegra, XUSB_CFG_4);
 	value &= ~(XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
-	value |= regs->start & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
+	value |= regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
 	fpci_writel(tegra, value, XUSB_CFG_4);
 
 	usleep_range(100, 200);
@@ -1230,6 +1230,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_powerdomains;
 	}
 
+	tegra->hcd->regs = tegra->regs;
+	tegra->hcd->rsrc_start = regs->start;
+	tegra->hcd->rsrc_len = resource_size(regs);
+
 	/*
 	 * This must happen after usb_create_hcd(), because usb_create_hcd()
 	 * will overwrite the drvdata of the device with the hcd it creates.
@@ -1253,7 +1257,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	tegra_xusb_config(tegra, regs);
+	tegra_xusb_config(tegra);
 
 	/*
 	 * The XUSB Falcon microcontroller can only address 40 bits, so set
@@ -1277,10 +1281,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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

