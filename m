Return-Path: <linux-usb+bounces-32394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7EBD25175
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 15:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 544FC3028DA9
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A452D350A03;
	Thu, 15 Jan 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xrENCad4"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF3527E076
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488750; cv=none; b=In7h/8K1M4yktK79LhiZcC3JUphCfOa4USqpWVrqg7em1T6+ar97n8UNf1ar6h9eT1oGAzEYPO2s/vJxuSNtM9qRwYOV3ZYOQCe38V+FK26WxIJA0myCJL5ggQOZGOIn2SkVuhc/sOylMyfBUxybDOWJHFAb7UBQyzSzLgeYC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488750; c=relaxed/simple;
	bh=3mGTmt7q51USQSWbL7vHggUS96PKjkh7P6USlUtbMsE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZHycbRusBKC1or4MgY6M+++OycPUzJ+PDaXy00Wm4tVAtIKGUI055cuH2XUD64aOj2Kb6JgbizT89DFCRitO2EHprGaGhHETaZZlB1oKEtzDT+Z1w8D1Uscz+aKkPkitE621guqn3vW46JvvZSn06rqr2mpS6JUs1k9kk0KOwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xrENCad4; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768488745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cl/D6Y5XRR/X0rVkaamOrKMkHf4HUkXbmNOec8DxBHw=;
	b=xrENCad4vW3ND5AXKrKq00Hm/S2mXOTqE3I5/NOiiGCGlsmgflNe55U+hMK51pjBwGf/gT
	v1ZTeg4J6zWWOIf+ZDeO8fV8R2vMNWtn7VaBd9Y89Y90FFibiglAttnkl79Aa1Nv4dhtjv
	ABZjA8gRuKfqnOQx4nXtRZbiwCGINQE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Neal Frager <neal.frager@amd.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2] usb: dwc3: Always deassert xilinx resets
Date: Thu, 15 Jan 2026 09:51:53 -0500
Message-Id: <20260115145153.3332570-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I am working on moving serdes initialization to the phy (and consumer)
drivers to improve flexibility and boot times (depending on configuration).
Currently, core resets are released in the bootloader by init_serdes() in
psu_init_gpl.c. In order to remove init_serdes, we need to handle the case
where the bootloader never released the core resets. If we don't have a
usb3 phy we don't need to assert the core resets, but deassert them anyway
to handle this case.

We could assert all resets every boot, but I believe the existing procedure
is an optimization to reduce boot time when the bootloader has already
initialized USB. So this patch preserves the separate code paths.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---

Changes in v2:
- Update commit message

 drivers/usb/dwc3/dwc3-xilinx.c | 67 ++++++++++++++++------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 0a8c47876ff9..f41b0da5e89d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -132,21 +132,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	/*
-	 * The following core resets are not required unless a USB3 PHY
-	 * is used, and the subsequent register settings are not required
-	 * unless a core reset is performed (they should be set properly
-	 * by the first-stage boot loader, but may be reverted by a core
-	 * reset). They may also break the configuration if USB3 is actually
-	 * in use but the usb3-phy entry is missing from the device tree.
-	 * Therefore, skip these operations in this case.
-	 */
-	if (!priv_data->usb3_phy) {
-		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
-		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
-		goto skip_usb3_phy;
-	}
-
 	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
 	if (IS_ERR(crst)) {
 		ret = PTR_ERR(crst);
@@ -171,22 +156,31 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	ret = reset_control_assert(crst);
-	if (ret < 0) {
-		dev_err(dev, "Failed to assert core reset\n");
-		goto err;
-	}
+	/*
+	 * Asserting the core resets is not required unless a USB3 PHY is used.
+	 * They may also break the configuration if USB3 is actually in use but
+	 * the usb3-phy entry is missing from the device tree. Therefore, skip
+	 * a full reset cycle and just deassert the resets if the phy is
+	 * absent.
+	 */
+	if (priv_data->usb3_phy) {
+		ret = reset_control_assert(crst);
+		if (ret < 0) {
+			dev_err(dev, "Failed to assert core reset\n");
+			goto err;
+		}
 
-	ret = reset_control_assert(hibrst);
-	if (ret < 0) {
-		dev_err(dev, "Failed to assert hibernation reset\n");
-		goto err;
-	}
+		ret = reset_control_assert(hibrst);
+		if (ret < 0) {
+			dev_err(dev, "Failed to assert hibernation reset\n");
+			goto err;
+		}
 
-	ret = reset_control_assert(apbrst);
-	if (ret < 0) {
-		dev_err(dev, "Failed to assert APB reset\n");
-		goto err;
+		ret = reset_control_assert(apbrst);
+		if (ret < 0) {
+			dev_err(dev, "Failed to assert APB reset\n");
+			goto err;
+		}
 	}
 
 	ret = phy_init(priv_data->usb3_phy);
@@ -201,11 +195,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	/* Set PIPE Power Present signal in FPD Power Present Register*/
-	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
-
-	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
-	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	if (priv_data->usb3_phy) {
+		/* Set PIPE Power Present signal in FPD Power Present Register*/
+		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
+		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
+		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	} else {
+		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
+		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
+	}
 
 	ret = reset_control_deassert(crst);
 	if (ret < 0) {
@@ -225,7 +223,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-skip_usb3_phy:
 	/* ulpi reset via gpio-modepin or gpio-framework driver */
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset_gpio)) {
-- 
2.35.1.1320.gc452695387.dirty


