Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064C22433FD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgHMGZm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgHMGZm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:42 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3D47206B5;
        Thu, 13 Aug 2020 06:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299941;
        bh=SkbP4ZTX+OdxUjAQSgl4TfJe5CRXk0j/hLMKzcM4PMI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TapbqcMSkUQn+PHslfU3j7/aFNCYBCyV0nQRn+NVkUsavhuADlICBZboRFGSXvJvp
         pOKZoqfUXN6uAsufv74IJEQdqw5cvVbkjgjAoj+v/h+XlZYuuGPCWGt19tpPuJ13Sy
         PHBOTNAi7AwvJUMoXfhaVktu79VnagpMNeNkKMok=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 03/11] dwc3: meson: fix checkpatch errors and warnings
Date:   Thu, 13 Aug 2020 09:25:24 +0300
Message-Id: <20200813062532.829720-3-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 9c50a8f2929e..6522187a40cf 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -116,11 +116,11 @@ static struct clk_bulk_data meson_a1_clocks[] = {
 	{ .id = "xtal_usb_ctrl" },
 };
 
-static const char *meson_gxm_phy_names[] = {
+static const char * const meson_gxm_phy_names[] = {
 	"usb2-phy0", "usb2-phy1", "usb2-phy2",
 };
 
-static const char *meson_g12a_phy_names[] = {
+static const char * const meson_g12a_phy_names[] = {
 	"usb2-phy0", "usb2-phy1", "usb3-phy0",
 };
 
@@ -132,7 +132,7 @@ static const char *meson_g12a_phy_names[] = {
  * correctly when only the "usb2-phy1" phy is specified on-par with the
  * DT bindings.
  */
-static const char *meson_a1_phy_names[] = {
+static const char * const meson_a1_phy_names[] = {
 	"usb2-phy0", "usb2-phy1"
 };
 
@@ -143,7 +143,7 @@ struct dwc3_meson_g12a_drvdata {
 	bool otg_phy_host_port_disable;
 	struct clk_bulk_data *clks;
 	int num_clks;
-	const char **phy_names;
+	const char * const *phy_names;
 	int num_phys;
 	int (*setup_regmaps)(struct dwc3_meson_g12a *priv, void __iomem *base);
 	int (*usb2_init_phy)(struct dwc3_meson_g12a *priv, int i,
@@ -520,11 +520,7 @@ static int dwc3_meson_g12a_role_set(struct usb_role_switch *sw,
 		return 0;
 
 	if (priv->drvdata->otg_phy_host_port_disable)
-		dev_warn_once(priv->dev, "Manual OTG switch is broken on this "\
-					 "SoC, when manual switching from "\
-					 "Host to device, DWC3 controller "\
-					 "will need to be resetted in order "\
-					 "to recover usage of the Host port");
+		dev_warn_once(priv->dev, "Broken manual OTG switch\n");
 
 	return dwc3_meson_g12a_otg_mode_set(priv, mode);
 }
@@ -906,8 +902,8 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 			return ret;
 	}
 
-       if (priv->vbus && priv->otg_phy_mode == PHY_MODE_USB_HOST) {
-               ret = regulator_enable(priv->vbus);
+	if (priv->vbus && priv->otg_phy_mode == PHY_MODE_USB_HOST) {
+		ret = regulator_enable(priv->vbus);
 		if (ret)
 			return ret;
 	}
-- 
2.28.0

