Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8668549274A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 14:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242453AbiARNd6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 08:33:58 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37052 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242325AbiARNd4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 08:33:56 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 276141F43EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1642512835;
        bh=dyzC6UDmMXDPgDAbF5EHytgo8xi3QjCJwOmX3JXKm64=;
        h=From:To:Cc:Subject:Date:From;
        b=eNT0A23wVjHpGk/5uTLMZb/Z5SEaGBovtyUKak0cbUjmQaoRa+JHGaytB3jNQf98l
         V4s3OoxyFz0EBHnK8+9tBXLY7LOleKZGV38LiHMoZciuXbaJFw6XJmk6iLtyeukKY8
         hlzQDxF7zBpcGhm7HWNjY1DE3dr9wPVZhLJ6Dn41eZ8u7YYvgqeI+xUWQT7XGce/fi
         LOguWwYGY36i4OKW2syBzyNQbSbXAtYEOz1WKZUotbvtN+v6GG2uEqoEt13Ocj7G8h
         Y28t5/nzv1CEHdFC6pGozlab8NYL69ArYOZMtQQlgR5aHjXjJ8Mv4LAhQYD7ITgqsI
         FKeDu/gV/2j3A==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     chunfeng.yun@mediatek.com
Cc:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] usb: host: xhci-mtk: Simplify supplies handling with regulator_bulk
Date:   Tue, 18 Jan 2022 14:33:48 +0100
Message-Id: <20220118133348.111860-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove the custom functions xhci_mtk_ldos_{enable,disable}() by
switching to using regulator_bulk to perform the very same thing,
as the regulators are always either both enabled or both disabled.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/usb/host/xhci-mtk.c | 56 ++++++++++++-------------------------
 drivers/usb/host/xhci-mtk.h |  4 +--
 2 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 62c835d446be..3b81931e5b77 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -395,31 +395,6 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM, clks);
 }
 
-static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
-{
-	int ret;
-
-	ret = regulator_enable(mtk->vbus);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable vbus\n");
-		return ret;
-	}
-
-	ret = regulator_enable(mtk->vusb33);
-	if (ret) {
-		dev_err(mtk->dev, "failed to enable vusb33\n");
-		regulator_disable(mtk->vbus);
-		return ret;
-	}
-	return 0;
-}
-
-static void xhci_mtk_ldos_disable(struct xhci_hcd_mtk *mtk)
-{
-	regulator_disable(mtk->vbus);
-	regulator_disable(mtk->vusb33);
-}
-
 static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
@@ -475,6 +450,10 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 	return ret;
 }
 
+static const char * const xhci_mtk_supply_names[] = {
+	"vusb33", "vbus",
+};
+
 static const struct xhci_driver_overrides xhci_mtk_overrides __initconst = {
 	.reset = xhci_mtk_setup,
 	.add_endpoint = xhci_mtk_add_ep,
@@ -507,17 +486,18 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk->dev = dev;
-	mtk->vbus = devm_regulator_get(dev, "vbus");
-	if (IS_ERR(mtk->vbus)) {
-		dev_err(dev, "fail to get vbus\n");
-		return PTR_ERR(mtk->vbus);
-	}
+	mtk->num_supplies = ARRAY_SIZE(xhci_mtk_supply_names);
+	mtk->supplies = devm_kcalloc(dev, mtk->num_supplies,
+				     sizeof(*mtk->supplies), GFP_KERNEL);
+	if (!mtk->supplies)
+		return -ENOMEM;
 
-	mtk->vusb33 = devm_regulator_get(dev, "vusb33");
-	if (IS_ERR(mtk->vusb33)) {
-		dev_err(dev, "fail to get vusb33\n");
-		return PTR_ERR(mtk->vusb33);
-	}
+	regulator_bulk_set_supply_names(mtk->supplies, xhci_mtk_supply_names,
+					mtk->num_supplies);
+
+	ret = devm_regulator_bulk_get(dev, mtk->num_supplies, mtk->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
 	ret = xhci_mtk_clks_get(mtk);
 	if (ret)
@@ -558,7 +538,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	ret = xhci_mtk_ldos_enable(mtk);
+	ret = regulator_bulk_enable(mtk->num_supplies, mtk->supplies);
 	if (ret)
 		goto disable_pm;
 
@@ -667,7 +647,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
 
 disable_ldos:
-	xhci_mtk_ldos_disable(mtk);
+	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
 
 disable_pm:
 	pm_runtime_put_noidle(dev);
@@ -695,7 +675,7 @@ static int xhci_mtk_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 	xhci_mtk_sch_exit(mtk);
 	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
-	xhci_mtk_ldos_disable(mtk);
+	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 4b1ea89f959a..9b78cd2ba0ac 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -150,9 +150,9 @@ struct xhci_hcd_mtk {
 	int num_u3_ports;
 	int u2p_dis_msk;
 	int u3p_dis_msk;
-	struct regulator *vusb33;
-	struct regulator *vbus;
 	struct clk_bulk_data clks[BULK_CLKS_NUM];
+	struct regulator_bulk_data *supplies;
+	u8 num_supplies;
 	unsigned int has_ippc:1;
 	unsigned int lpm_support:1;
 	unsigned int u2_lpm_disable:1;
-- 
2.33.1

