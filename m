Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C2B1151F4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfLFOHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:12 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36770 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfLFOHM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:12 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so7473208wma.1;
        Fri, 06 Dec 2019 06:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YNu/4ywKxVv3kR8Xacc3PWSXrivLFb5NgyV45IDDumI=;
        b=urXOq47mjhvio339+yyX4agWorIAlWaHrl0IR97c89TwO7qTCKltperPNza69i93I2
         xR3ne1MBefis2HVMyEqGwXQboc7mnByxFCiAC7Rfv3EwG8czh2Z7aYLDFPWlb8m9aLxX
         oJqe2X/2shD8GW2HYrGtM/uenKaNkdl7QHDg48oHLlMy7YV78undCZ6qSiRCcvYa0aVq
         E31GUWArkqyDUpvAZf5nqs/wgTed+I2xuhUWdqrQu8sWCr0Fx6NkLZptdL5wGnbxsqPk
         Q6egLyBWQy4UEWzyYBAD3Rq830WoMNfBEPSe0AMgpNGAgnOQKUbZTfjsqRh/e5i05lww
         nc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNu/4ywKxVv3kR8Xacc3PWSXrivLFb5NgyV45IDDumI=;
        b=XXUg4PrTjYiW/ksQvDr31R/8ZGQLDU/nYCg1RAsjzb0Ho0QllKU0h3o5i/2iV3jOJ8
         TplPkQKEnmvAvdjCp2c37deirvfGWxBOjR5ginUl/ZR9ePmQ2aHhIx3oqtrHR26DqIJC
         K58B+fNs7suyJZrR3XELLS6AcZ8RmkGyc0kPox18E4mTYym+Ry1/6I8uZBKpL7/PSCvK
         BOtuJi6I+CCUJPk/179UQRMXs4Hbh+jFPDhl6tTMfAZERIUPu1rLLAIECIs7atb06az6
         /umWoMpeFyuD74bzPbfk7HTT7pmX5eIxgk5/Zb576VeG9fNPxssXUKXkdg4nkOBV+TNv
         9AMA==
X-Gm-Message-State: APjAAAXP4msLxiyydNuKlBHIE4twd30EaQOoosBLHhvZdlp20o1QuoMG
        LGxxLVAWwkhQU6GUr5Xp9AY=
X-Google-Smtp-Source: APXvYqxOQkva4hIGUU71MXuYn4KBRAQGb6azCBaX7yau5IJF34sth08WBT8sfc5vdiZpXEAFvLTogQ==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr10684715wmc.129.1575641230141;
        Fri, 06 Dec 2019 06:07:10 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id h17sm16901847wrs.18.2019.12.06.06.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 07/10] usb: host: xhci-tegra: Enable runtime PM as late as possible
Date:   Fri,  6 Dec 2019 15:06:50 +0100
Message-Id: <20191206140653.2085561-8-thierry.reding@gmail.com>
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

A number of things can currently go wrong after the XUSB controller has
been enabled, which means that it might need to be disabled again before
it has ever been used.

Avoid this by delaying runtime PM enablement until it's really required
right before registers are accessed for the first time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 31411f85e742..117e91b8ac6f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1242,19 +1242,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_hcd;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	if (pm_runtime_enabled(&pdev->dev))
-		err = pm_runtime_get_sync(&pdev->dev);
-	else
-		err = tegra_xusb_runtime_resume(&pdev->dev);
-
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
-		goto disable_phy;
-	}
-
-	tegra_xusb_config(tegra);
-
 	/*
 	 * The XUSB Falcon microcontroller can only address 40 bits, so set
 	 * the DMA mask accordingly.
@@ -1262,7 +1249,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	err = dma_set_mask_and_coherent(tegra->dev, DMA_BIT_MASK(40));
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
-		goto put_rpm;
+		goto disable_phy;
 	}
 
 	err = tegra_xusb_request_firmware(tegra);
@@ -1271,16 +1258,30 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	if (!pm_runtime_enabled(&pdev->dev))
+		err = tegra_xusb_runtime_resume(&pdev->dev);
+	else
+		err = pm_runtime_get_sync(&pdev->dev);
+
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
+		goto free_firmware;
+	}
+
+	tegra_xusb_config(tegra);
+
 	err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
-		goto free_firmware;
+		goto put_rpm;
 	}
 
 	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto free_firmware;
+		goto put_rpm;
 	}
 
 	device_wakeup_enable(tegra->hcd->self.controller);
-- 
2.23.0

