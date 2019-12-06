Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF20F1151FB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfLFOHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:20 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34122 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfLFOHT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:19 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so7934048wrr.1;
        Fri, 06 Dec 2019 06:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dxp7s5isx1ZTkRUQG5v0oHxEQeRot+4BIs9vmxVAg4c=;
        b=m9MqkxV8cwuXyPTH7gX5RfHk/ShNVSUNc5izABrZ/VNIBlIMdGsfwbQRfxWdu4j7Up
         Au0wAdT9uRTHSjJcUvHcQ08/sr7WF4xvJIdJpvTjTQYkE2buPF+M0gjrrYW0oGIgSIML
         NQnk3bIRBHSpmXaHVbe3Fn783Ua9KRt7OAC/REXLFUajrd6LJWj/utoD3rKDX5RiYUc0
         urPXmhgR94QeyOq4zkBdYIPiXeXVfDcqdvHyoHCH4VSxxWBCWFNXvAowufXghTTEBf/P
         GVWX3PZxbt5CGw+L5ls9PwHpsNRWQptGXDEJDwLT96yFZJYx2G7oxC26s8qAnYEyINMN
         covA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dxp7s5isx1ZTkRUQG5v0oHxEQeRot+4BIs9vmxVAg4c=;
        b=VzDCdGOWdUThKLScGG54ck6wiCeWprtMRz+1NMdF7mAo0kqOENRjJzxcJ5XxC3ilck
         HyNjVtj74zIoGUVck2sXcWD+DyxTyqDUF6USBCGRDNZ1bCkrcKXEC5Rn9rlcH/oRRAR3
         R3+d2D1kZ7Ge9LP84fdkRy55ysXMs2c9hiz+vdWdmEqUidESQlz45qVBKfZqhh5QZKVr
         nJIt/0ashG5MMrPT5AYQM9xQzx1a0HoCVEvUipWdXN1aOb0TRbsew9smZZvnNZGY0+1P
         gpMP4p5h/rHSnlLUezVUwqwxql4pUbTev3ecyfkIH0c+8mCg23tDOUdzuPLA4IlNXM6m
         ke3w==
X-Gm-Message-State: APjAAAWE0R5MSdO6xPptdBU7+IdLQ0BYWl3j6bbA4clYlngU03QgRUrb
        vIJA1hHEyRQeEyzoqMSmltE=
X-Google-Smtp-Source: APXvYqzLzPM0WuIUIcz3b1rl9C415xzhgDQr9RHb2hAqqINB1xZq7G/S/LlwJkMO0+jWJeFkvB9lwA==
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr4153943wrx.39.1575641236830;
        Fri, 06 Dec 2019 06:07:16 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id g17sm3440222wmc.37.2019.12.06.06.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 10/10] usb: host: xhci-tegra: Implement basic ELPG support
Date:   Fri,  6 Dec 2019 15:06:53 +0100
Message-Id: <20191206140653.2085561-11-thierry.reding@gmail.com>
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

This implements basic engine-level powergate support which allows the
XUSB controller to be put into a low power mode on system sleep and get
it out of that low power mode again on resume.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- remove useless gotos
---
 drivers/usb/host/xhci-tegra.c | 127 +++++++++++++++++++++++++++++++---
 1 file changed, 119 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 7f6657ad5ce5..0b58ef3a7f7f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1447,6 +1447,45 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
+{
+	struct device *dev = hub->hcd->self.controller;
+	bool status = true;
+	unsigned int i;
+	u32 value;
+
+	for (i = 0; i < hub->num_ports; i++) {
+		value = readl(hub->ports[i]->addr);
+		if ((value & PORT_PE) == 0)
+			continue;
+
+		if ((value & PORT_PLS_MASK) != XDEV_U3) {
+			dev_info(dev, "%u-%u isn't suspended: %#010x\n",
+				 hub->hcd->self.busnum, i + 1, value);
+			status = false;
+		}
+	}
+
+	return status;
+}
+
+static int tegra_xusb_check_ports(struct tegra_xusb *tegra)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	unsigned long flags;
+	int err = 0;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+
+	if (!xhci_hub_ports_suspended(&xhci->usb2_rhub) ||
+	    !xhci_hub_ports_suspended(&xhci->usb3_rhub))
+		err = -EBUSY;
+
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	return err;
+}
+
 static void tegra_xusb_save_context(struct tegra_xusb *tegra)
 {
 	const struct tegra_xusb_context_soc *soc = tegra->soc->context;
@@ -1481,31 +1520,103 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
 	}
 }
 
-static int tegra_xusb_suspend(struct device *dev)
+static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool wakeup)
 {
-	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
-	bool wakeup = device_may_wakeup(dev);
 	int err;
 
-	/* TODO: Powergate controller across suspend/resume. */
+	err = tegra_xusb_check_ports(tegra);
+	if (err < 0) {
+		dev_err(tegra->dev, "not all ports suspended: %d\n", err);
+		return err;
+	}
+
 	err = xhci_suspend(xhci, wakeup);
-	if (err < 0)
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
 		return err;
+	}
 
 	tegra_xusb_save_context(tegra);
+	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_clk_disable(tegra);
 
 	return 0;
 }
 
-static int tegra_xusb_resume(struct device *dev)
+static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool wakeup)
 {
-	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	int err;
 
+	err = tegra_xusb_clk_enable(tegra);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
+		return err;
+	}
+
+	err = tegra_xusb_phy_enable(tegra);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to enable PHYs: %d\n", err);
+		goto disable_clk;
+	}
+
+	tegra_xusb_config(tegra);
 	tegra_xusb_restore_context(tegra);
 
-	return xhci_resume(xhci, false);
+	err = tegra_xusb_load_firmware(tegra);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to load firmware: %d\n", err);
+		goto disable_phy;
+	}
+
+	err = __tegra_xusb_enable_firmware_messages(tegra);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to enable messages: %d\n", err);
+		goto disable_phy;
+	}
+
+	err = xhci_resume(xhci, true);
+	if (err < 0) {
+		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
+		goto disable_phy;
+	}
+
+	return 0;
+
+disable_phy:
+	tegra_xusb_phy_disable(tegra);
+disable_clk:
+	tegra_xusb_clk_disable(tegra);
+	return err;
+}
+
+static int tegra_xusb_suspend(struct device *dev)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+	bool wakeup = device_may_wakeup(dev);
+	int err;
+
+	synchronize_irq(tegra->mbox_irq);
+
+	mutex_lock(&tegra->lock);
+	err = tegra_xusb_enter_elpg(tegra, wakeup);
+	mutex_unlock(&tegra->lock);
+
+	return err;
+}
+
+static int tegra_xusb_resume(struct device *dev)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+	bool wakeup = device_may_wakeup(dev);
+	int err;
+
+	mutex_lock(&tegra->lock);
+	err = tegra_xusb_exit_elpg(tegra, wakeup);
+	mutex_unlock(&tegra->lock);
+
+	return err;
 }
 #endif
 
-- 
2.23.0

