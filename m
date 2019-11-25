Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBAB108DF8
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfKYMc3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:29 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35381 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfKYMc2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:28 -0500
Received: by mail-wm1-f67.google.com with SMTP id n5so5643024wmc.0;
        Mon, 25 Nov 2019 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+wGE7eGbER/uxhRZC0l8KVWxKSKWKBs7W4PgNx8ou4Y=;
        b=e8+3lxngSkt3c+e+uFoZXWAuDKeeqzXuBD4iYNZfImRJqLWPoikH2EPRsc5RDt3xYt
         kZebhyWcpMAYytvvvm14A7Corb5Lqgs+AuXc6ShxpJccaIOxAwEbpOb0039m/dDbP5ee
         Vxdsr6KYmNapzZ1eV8msIL6QJt9BJhi9C6tNwBnHMMu/Qy1Ao/TswdTuTzbNXcEKqA+t
         h2cvZxIavBooaNeC3PUJcBawPWacJqPYAcBVjbEfsOXUW4QaYiTIFSQLVm8Cg/3lyWJk
         TXRLKR+Yn6E5se/1bLg3K218OT9LWJKk/oLWUvMp2BFLUX71gQodeLEI2ZvaY2ZWV6vr
         7dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+wGE7eGbER/uxhRZC0l8KVWxKSKWKBs7W4PgNx8ou4Y=;
        b=fkf9sAQ9SkWZnZvN7FGTsTGXQkIwbbNwiuK2LXA9Br1+le76KwoxcJB6T+R+nyYgJv
         5jira0j08GHzx0XbdA+JmYHWjwtKeqV7LgWhpxwu3EAaVzO7xJqpTp3XLHiBv0mQNZbO
         66J30HaIVi91sD0xuRS/dbsdWIZtoVVkcmuspljc6nMYIUEMbj4miucmRWfinDXy74My
         ers8uopfBAWXVFOKDL9HKNovG466e+UdkwHCQPyZJN2+IAVUCFqjPK4EbUuR2qPRh1SA
         mf/NLx59mVcKjtEIl1Fhhz2s5Lb7tGXZ5OpnUc4GjhJMv96ponSWZScpKMUhAPU4HSax
         GShQ==
X-Gm-Message-State: APjAAAXdpjyS0+LrGI2KHaKW2Mk5ddEZOoAChG4hYNtgis2Z6xkiJ3wM
        6Fw4t40NB39Gs2glxj+t+UY=
X-Google-Smtp-Source: APXvYqwI7PlIUjhEeL3YuDFmoCQ13dFFykx4gkRSJOG3x3xqocJgT54vThpyAy+5qiz/zo84KW0Haw==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr27164770wmg.99.1574685146545;
        Mon, 25 Nov 2019 04:32:26 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 2sm10194209wrq.31.2019.11.25.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:25 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 07/10] usb: host: xhci-tegra: Enable runtime PM as late as possible
Date:   Mon, 25 Nov 2019 13:32:07 +0100
Message-Id: <20191125123210.1564323-8-thierry.reding@gmail.com>
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
index 5eca3ea0e8b2..f043aab7bf53 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1246,19 +1246,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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
@@ -1266,7 +1253,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	err = dma_set_mask_and_coherent(tegra->dev, DMA_BIT_MASK(40));
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
-		goto put_rpm;
+		goto disable_phy;
 	}
 
 	err = tegra_xusb_request_firmware(tegra);
@@ -1275,16 +1262,30 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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

