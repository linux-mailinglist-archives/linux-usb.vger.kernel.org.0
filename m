Return-Path: <linux-usb+bounces-31961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB3CF9964
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 18:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A88309BC32
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 17:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DB5343D78;
	Tue,  6 Jan 2026 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DejvXBFS"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3DC322537
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719428; cv=none; b=JynxbXxSRQsBnvd4JBWt00r7CLcBFzzCzvD+mByQoJ5yUo1dGIKsr926PFSHQPCNJ8nQZgsBiTN+devt/fgg8e1LXTOyrZ/JSlHfI1dTZxwcSxsQ4IA5y68KOdcQunr/Gc/5/JVBOvYdWb7JHjH+gy4Xyc8TLAmtrakLGef4mLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719428; c=relaxed/simple;
	bh=pXcMRwGNrhoqzJwzW9ZhkypUyszann526HktTwY3rsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oBhdfVD7jlbLRracOBLl/2JtU301Q+1x/FVDaDkEYx1Z5Wy/lH9rgG2hvTzeVxzY7QFBflCqoqNIURcZA86BoWSvHVCw7B81+WbmHCXihTXcgetfWMerkLYhMJD/43xN19p2ON4erxlv27XMjw2JzNgaSt8M0bW4ySMHmoA+0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DejvXBFS; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767719424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0foqleVVh6h4kTqU19T/D6SwtRaVNVJmPDXw4dAESSk=;
	b=DejvXBFSIXP54ESNGLGAAe5B6FL0EVb07QFG1/C7v3YlDw072ceGVPXOC4XTg3qtMVxYs5
	n+UYwvFxtR5l+7ano0mL8gl1X+z3g3h4sY7oLJXYKcWucE9Zn5T00GVTaYx6qKjEO4Ff2B
	PGDQ+iB8ViQdYjsLQOB5MfrQJLIXITg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org (open list:DESIGNWARE USB3 DRD IP DRIVER)
Cc: Neal Frager <neal.frager@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	Philipp Zabel <p.zabel@pengutronix.de>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] usb: dwc3: Always deassert xilinx resets
Date: Tue,  6 Jan 2026 12:10:18 -0500
Message-Id: <20260106171018.501612-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

If we don't have a usb3 phy we don't need to assert the core resets.
Deassert them even if we didn't assert them to support booting when the
bootloader never released the core from reset.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

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


