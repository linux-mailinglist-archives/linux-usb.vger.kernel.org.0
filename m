Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B69A8108DEE
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfKYMcT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44345 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfKYMcS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:18 -0500
Received: by mail-wr1-f65.google.com with SMTP id i12so17767665wrn.11;
        Mon, 25 Nov 2019 04:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+qw/KtpSnFUlLnEiXkCoitlkbC2ot04gXVHUo3aq5g=;
        b=mR3LPOGzcP9HUCJ340ZXIZXULHUqvPJv9fFGr3xSzH2zRr2BQhJJ2nWwboFjz1O8V8
         fR8jSM7gQMOEgRG/ChYwUYptRDZ8oe1JE+i+phPi8TnTP+sWQzhjilAMMm4v9fxmYAIz
         U0kLyg4Se5CILRcOxFehfG/e81M+4b48yFZF9ISGIKNgXIZAi+JJifAXYmgt0s+S0gIJ
         DMriYk16zxO2mx2Z+ccLTaVLEOrXf1G/gioq0mxgobLMGrVP+P2419YAlO+j3c0Gvo35
         A4WTJww7GEa99eT3dRi0MwLHXuBoVx2cO0eZPohzbAW+DM2E9EuxJn2R5G8pMOI4r3pn
         weUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+qw/KtpSnFUlLnEiXkCoitlkbC2ot04gXVHUo3aq5g=;
        b=D63L8AMiEPtaM+0gTSfb5c2hHzsN+SoFSdk9Su/Nd6yEa0quyiTafNGSuTTr5qWJ74
         8lfVjlyGDCpTgcem5OevkYCmdpA6cyO22UgZLq++RjnXCbi6M5KxIz3AaaK+7lkXDDNh
         nbhYP1/fP/KbZdeiyFJeF23qhgcjp7u+NLTeKwK45eM3kIDx4CZI3hY+dHb1gWgRtlAv
         SzhUdd+dPVAP+4MSgN/Xui6cZxQLH1BVK3GKr3Vj2v3KOadBH0EsoADIYhCUekdu6Bpw
         6+h3IJ3fSdq9PItyDOStVnWvjapasqXNBsJDIMKtUbXt9EAwjxfdbifsaXNopyxuv/IJ
         6Hjg==
X-Gm-Message-State: APjAAAXdRlAVCZe8AH6svHlq3IYkDXl52gJA1ddNOdCCA0rddg50aGiJ
        ljZhY/6R8XluHsVP1jk9PNM=
X-Google-Smtp-Source: APXvYqwF7ZczL8SLi03RMHfGEv078O7+GKL3SxU5vw58+zwKgnT93M+WikQfmRAyV2X9haF6kBxF1w==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr32255757wri.378.1574685136182;
        Mon, 25 Nov 2019 04:32:16 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id e16sm7560107wme.35.2019.11.25.04.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 02/10] usb: host: xhci-tegra: Separate firmware request and load
Date:   Mon, 25 Nov 2019 13:32:02 +0100
Message-Id: <20191125123210.1564323-3-thierry.reding@gmail.com>
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

Subsequent patches for system suspend/resume support will need to reload
the firmware on resume. Since the firmware remains in system memory, the
driver doesn't need to reload it from the filesystem. However, the XUSB
controller will be reset across suspend/resume, so it needs to load the
firmware into its microcontroller on resume.

Split the firmware request and the firmware load code into two separate
functions so that the driver can reuse the firmware in system memory to
reload the microcontroller on resume.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 40 ++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index aa1c4e5fd750..5cfd54862670 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -793,17 +793,10 @@ static int tegra_xusb_runtime_resume(struct device *dev)
 	return err;
 }
 
-static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
+static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
 {
-	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
 	struct tegra_xusb_fw_header *header;
-	struct device *dev = tegra->dev;
 	const struct firmware *fw;
-	unsigned long timeout;
-	time64_t timestamp;
-	struct tm time;
-	u64 address;
-	u32 value;
 	int err;
 
 	err = request_firmware(&fw, tegra->soc->firmware, tegra->dev);
@@ -828,6 +821,24 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	memcpy(tegra->fw.virt, fw->data, tegra->fw.size);
 	release_firmware(fw);
 
+	return 0;
+}
+
+static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
+{
+	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
+	struct tegra_xusb_fw_header *header;
+	struct xhci_cap_regs __iomem *cap;
+	struct xhci_op_regs __iomem *op;
+	struct device *dev = tegra->dev;
+	unsigned long timeout;
+	time64_t timestamp;
+	struct tm time;
+	u64 address;
+	u32 value;
+
+	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
+
 	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
 		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
 			 csb_readl(tegra, XUSB_FALC_CPUCTL));
@@ -1208,10 +1219,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_rpm;
 	}
 
+	err = tegra_xusb_request_firmware(tegra);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to request firmware: %d\n", err);
+		goto disable_phy;
+	}
+
 	err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
-		goto put_rpm;
+		goto free_firmware;
 	}
 
 	tegra->hcd->regs = tegra->regs;
@@ -1221,7 +1238,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto put_rpm;
+		goto free_firmware;
 	}
 
 	device_wakeup_enable(tegra->hcd->self.controller);
@@ -1281,6 +1298,9 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		tegra_xusb_runtime_suspend(&pdev->dev);
 put_hcd:
 	usb_put_hcd(tegra->hcd);
+free_firmware:
+	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
+			  tegra->fw.phys);
 disable_phy:
 	tegra_xusb_phy_disable(tegra);
 	pm_runtime_disable(&pdev->dev);
-- 
2.23.0

