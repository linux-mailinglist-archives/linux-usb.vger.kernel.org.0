Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD3D108DFD
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfKYMch (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:37 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39826 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfKYMch (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:37 -0500
Received: by mail-wm1-f66.google.com with SMTP id t26so15760470wmi.4;
        Mon, 25 Nov 2019 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AINif2l3EZIoo9A9eiwFeniJKiJMmJbQiKcEichJ514=;
        b=AB5LSoPIVt5slL3oECQCvtOPKlXnYr8FPvNSfyMHFecCgtJlEWX00pYo+MREV0ZXdN
         q6DHYmoserduv9SV/CLQbTqaGjWyWvfpzKEL7vQAErIzVRmXPyMwFmKdOkava6/YD510
         0ruZZ6xpw+P7kSwpxspnFV9s1SBV4aBcb7IpNkQs70hWkNCV39EDDK3iezlbIUm78wuQ
         uOqyy9pfInUEz1p1PfsD2kEJ12aLhjprTsV29QPpOZ65mct4/lmnkciq8kb4ntBmyM3H
         d/HnJol8e8CJXx5yGmyII4IJMQ7x2F+gDwDpyf2o34ZKd3h3unjRG0hQ3UXT9X2p4c2s
         KW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AINif2l3EZIoo9A9eiwFeniJKiJMmJbQiKcEichJ514=;
        b=pf1trgM02MpLfAwQbc/pxqiwW8GjsbkPloI+OzMrOo7w9nSllUG6pz/KbGnnh39Usm
         882/vYyoIc+U5GwVva06ojAOxIiFIuJenIsBgz9EkoB929HdHCtO87XCGpfoQIhXtuqS
         pWvVE2+ve4FGN3Rq1+BRpXAySvENUndjv8nVK5CGwlb/S0kfcR6gnw+bkUFbcOUnKVXQ
         aYmNHBAHmeAyG7ubH6Dz/Cr3z3QPyrzMcD1ZaZm+Gp8fVb15NP/Xa4/yFgCza+yx4oxP
         Kn60qUMpBfnNZMFEx/GAc9y1vCphso6uW731upkXNnp7Og0p+5vF0RMgIVXvKcDh8fKP
         RRQw==
X-Gm-Message-State: APjAAAVLo+o4yuMg2o4JqZhA3iuyPyAt7M4yPBr0u4gV865JgLMQ2Ryh
        xsVJKky22AylR1sCCcmb8AQ=
X-Google-Smtp-Source: APXvYqw7oa3Rh0iApOSk9HQ/fJAfHhedAyf/EQQIA3QAe81vPknondb0wR8C5qGpHhPLXmYmQIXq1Q==
X-Received: by 2002:a05:600c:54c:: with SMTP id k12mr14853240wmc.124.1574685152888;
        Mon, 25 Nov 2019 04:32:32 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id u18sm10450346wrp.14.2019.11.25.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 10/10] usb: host: xhci-tegra: Implement basic ELPG support
Date:   Mon, 25 Nov 2019 13:32:10 +0100
Message-Id: <20191125123210.1564323-11-thierry.reding@gmail.com>
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

This implements basic engine-level powergate support which allows the
XUSB controller to be put into a low power mode on system sleep and get
it out of that low power mode again on resume.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 137 ++++++++++++++++++++++++++++++++--
 1 file changed, 129 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index cd3afec408ea..d0e30927a73f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1451,6 +1451,45 @@ static int tegra_xusb_remove(struct platform_device *pdev)
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
@@ -1485,31 +1524,113 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
 	}
 }
 
-static int tegra_xusb_suspend(struct device *dev)
+static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool wakeup)
 {
-	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
-	bool wakeup = device_may_wakeup(dev);
+	u32 value;
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
+	u32 value;
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
+
+	err = tegra_xusb_enter_elpg(tegra, wakeup);
+	if (err < 0)
+		goto unlock;
+
+unlock:
+	mutex_unlock(&tegra->lock);
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
+
+	err = tegra_xusb_exit_elpg(tegra, wakeup);
+	if (err < 0)
+		goto unlock;
+
+unlock:
+	mutex_unlock(&tegra->lock);
+	return err;
 }
 #endif
 
-- 
2.23.0

