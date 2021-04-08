Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DD6357F56
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhDHJfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:35:44 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:35107 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231205AbhDHJfg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 05:35:36 -0400
X-UUID: 2f88323170a14e92a687d528a4ccfb6e-20210408
X-UUID: 2f88323170a14e92a687d528a4ccfb6e-20210408
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1644224419; Thu, 08 Apr 2021 17:35:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 17:35:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Apr 2021 17:35:20 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 4/6] usb: xhci-mtk: add support runtime PM
Date:   Thu, 8 Apr 2021 17:35:12 +0800
Message-ID: <1617874514-12282-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A dedicated wakeup irq will be used to handle runtime suspend/resume,
we use dev_pm_set_dedicated_wake_irq API to take care of requesting
and attaching wakeup irq, then the suspend/resume framework will help
to enable/disable wakeup irq.

The runtime PM is default off since some platforms may not support it.
users can enable it via power/control (set "auto") in sysfs.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 140 +++++++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index a74764ab914a..30927f4064d4 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -358,7 +359,6 @@ static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
 			mtk->uwk_reg_base, mtk->uwk_vers);
 
 	return PTR_ERR_OR_ZERO(mtk->uwk);
-
 }
 
 static void usb_wakeup_set(struct xhci_hcd_mtk *mtk, bool enable)
@@ -458,6 +458,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct usb_hcd *hcd;
 	int ret = -ENODEV;
+	int wakeup_irq;
 	int irq;
 
 	if (usb_disabled())
@@ -485,6 +486,21 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq_byname_optional(pdev, "host");
+	if (irq < 0) {
+		if (irq == -EPROBE_DEFER)
+			return irq;
+
+		/* for backward compatibility */
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
+	}
+
+	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
+	if (wakeup_irq == -EPROBE_DEFER)
+		return wakeup_irq;
+
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
@@ -496,9 +512,11 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 4000);
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-	device_enable_async_suspend(dev);
 
 	ret = xhci_mtk_ldos_enable(mtk);
 	if (ret)
@@ -508,12 +526,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_ldos;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto disable_clk;
-	}
-
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
 		ret = -ENOMEM;
@@ -579,8 +591,26 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto dealloc_usb2_hcd;
 
+	if (wakeup_irq > 0) {
+		ret = dev_pm_set_dedicated_wake_irq(dev, wakeup_irq);
+		if (ret) {
+			dev_err(dev, "set wakeup irq %d failed\n", wakeup_irq);
+			goto dealloc_usb3_hcd;
+		}
+		dev_info(dev, "wakeup irq %d\n", wakeup_irq);
+	}
+
+	device_enable_async_suspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+	pm_runtime_forbid(dev);
+
 	return 0;
 
+dealloc_usb3_hcd:
+	usb_remove_hcd(xhci->shared_hcd);
+	xhci->shared_hcd = NULL;
+
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
@@ -601,25 +631,26 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci_mtk_ldos_disable(mtk);
 
 disable_pm:
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 	pm_runtime_disable(dev);
 	return ret;
 }
 
-static int xhci_mtk_remove(struct platform_device *dev)
+static int xhci_mtk_remove(struct platform_device *pdev)
 {
-	struct xhci_hcd_mtk *mtk = platform_get_drvdata(dev);
+	struct xhci_hcd_mtk *mtk = platform_get_drvdata(pdev);
 	struct usb_hcd	*hcd = mtk->hcd;
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
+	struct device *dev = &pdev->dev;
 
-	pm_runtime_put_noidle(&dev->dev);
-	pm_runtime_disable(&dev->dev);
+	pm_runtime_get_sync(dev);
+	xhci->xhc_state |= XHCI_STATE_REMOVING;
+	dev_pm_clear_wake_irq(dev);
+	device_init_wakeup(dev, false);
 
 	usb_remove_hcd(shared_hcd);
 	xhci->shared_hcd = NULL;
-	device_init_wakeup(&dev->dev, false);
-
 	usb_remove_hcd(hcd);
 	usb_put_hcd(shared_hcd);
 	usb_put_hcd(hcd);
@@ -627,6 +658,10 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	xhci_mtk_clks_disable(mtk);
 	xhci_mtk_ldos_disable(mtk);
 
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+
 	return 0;
 }
 
@@ -690,10 +725,83 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	return ret;
 }
 
+static int check_rhub_status(struct xhci_hcd *xhci, struct xhci_hub *rhub)
+{
+	u32 suspended_ports;
+	u32 status;
+	int num_ports;
+	int i;
+
+	num_ports = rhub->num_ports;
+	suspended_ports = rhub->bus_state.suspended_ports;
+	for (i = 0; i < num_ports; i++) {
+		if (!(suspended_ports & BIT(i))) {
+			status = readl(rhub->ports[i]->addr);
+			if (status & PORT_CONNECT)
+				return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * check the bus whether it could suspend or not
+ * the bus will suspend if the downstream ports are already suspended,
+ * or no devices connected.
+ */
+static int check_bus_status(struct xhci_hcd *xhci)
+{
+	int ret;
+
+	ret = check_rhub_status(xhci, &xhci->usb3_rhub);
+	if (ret)
+		return ret;
+
+	return check_rhub_status(xhci, &xhci->usb2_rhub);
+}
+
+static int __maybe_unused xhci_mtk_runtime_suspend(struct device *dev)
+{
+	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
+	int ret = 0;
+
+	if (xhci->xhc_state)
+		return -ESHUTDOWN;
+
+	if (device_may_wakeup(dev)) {
+		ret = check_bus_status(xhci);
+		if (!ret)
+			ret = xhci_mtk_suspend(dev);
+	}
+
+	/* -EBUSY: let PM automatically reschedule another autosuspend */
+	return ret ? -EBUSY : 0;
+}
+
+static int __maybe_unused xhci_mtk_runtime_resume(struct device *dev)
+{
+	struct xhci_hcd_mtk  *mtk = dev_get_drvdata(dev);
+	struct xhci_hcd *xhci = hcd_to_xhci(mtk->hcd);
+	int ret = 0;
+
+	if (xhci->xhc_state)
+		return -ESHUTDOWN;
+
+	if (device_may_wakeup(dev))
+		ret = xhci_mtk_resume(dev);
+
+	return ret;
+}
+
 static const struct dev_pm_ops xhci_mtk_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xhci_mtk_suspend, xhci_mtk_resume)
+	SET_RUNTIME_PM_OPS(xhci_mtk_runtime_suspend,
+			   xhci_mtk_runtime_resume, NULL)
 };
-#define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
+
+#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL)
 
 static const struct of_device_id mtk_xhci_of_match[] = {
 	{ .compatible = "mediatek,mt8173-xhci"},
-- 
2.18.0

