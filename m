Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199782B48FE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 16:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbgKPPTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 10:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgKPPTW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 10:19:22 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF02C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:22 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id y11so8889169qvu.10
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w34tgFsfoNSL9WZ/5ErfIg33MWZNf9bk46tXnv+A4zs=;
        b=Shq+sOAW4lgOPgBS5y9b0hdkqGvjhkRYMTvpIVckQyvqL4k6SOfTOZQGLiO6HIixU5
         GtByhu2Wav9gcY1forc0KxdAdHkMC6xyNiFSH8EHH+MV9gmLLPCFOnfpJIpnA2bpL6c9
         VbMoGQVzAdGpB0ER8/3/PR3g4LGAU0NeJq9tjqY/7PmFdcjb5EjpnsDg5kc13C8wZsE+
         DOg7JUxRhYNN45OTnzcCmHoJ8WwSP5/83G4l5qUmV9c8c58S2tCGbrN27THnQyEEs8nt
         n8ePpL7qyB3nZvJxRCdVy+QXJYX6CGUrQO2/z6gAYnCvUi16a5gLRYj2qhvrjeJxpUR3
         eyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w34tgFsfoNSL9WZ/5ErfIg33MWZNf9bk46tXnv+A4zs=;
        b=NkWZ6KBN9V3rL/wgzHSo50KldNO9XU5U+pUdDB1YHftveJJ6w8OdZ3KlBdjtqveDZr
         GFapotMiuiNVBm0VhCeKgPqxMZCjAUpcgjsPi0K/x4hJwkerw2rbSsDfqXhAxUOpu6R/
         c/USZKVHSv3N/z+qqFcZtlZQAgpVoD1KMF9PkYZEsF9m+R+wjQFmJGrbP/KOumW1bJ7q
         BSTmNkTmfzDcXSQdwXuQaIMn5uPlNQCn3q5VMpIh7yHHLXQTfY7fy+60sNLFUXBVe/Cy
         QLW6UBY1B9Um1R8qfhFz2w7FHwiYGwoaKrYHDFLrEXlxlovquu2sbt5KQ+CApycbVQ6A
         xPzg==
X-Gm-Message-State: AOAM530nSvdaLCtmx2BhGptoXR2wg0cze2MQ7uGJGbkbh1Dib5xhvprn
        dPxiIdmn+KzkCr7zTODc4S0=
X-Google-Smtp-Source: ABdhPJzR0XL0NJX31+OywaRPuQxtyQR1QdfhOmqO+/GGz2NIIr+GkJzf1aSvkVIcmho99HCQ8jH97w==
X-Received: by 2002:ad4:47b0:: with SMTP id a16mr15565115qvz.22.1605539961774;
        Mon, 16 Nov 2020 07:19:21 -0800 (PST)
Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:19:21 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, wulf@rock-chips.com,
        frank.wang@rock-chips.com, william.wu@rock-chips.com,
        zyw@rock-chips.com, kever.yang@rock-chips.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 2/4] usb: dwc3: add rockchip innosilicon usb3 glue layer
Date:   Mon, 16 Nov 2020 15:17:34 +0000
Message-Id: <20201116151735.178737-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
References: <20201116151735.178737-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds the handler glue for the rockchip usb3 innosilicon phy driver.
This driver attaches to the phy driver through the notification system.
When a usb2 disconnect event occurs this driver tears down the hcd and rebuilds it manually.
This is to work around the usb2 controller becoming wedged and not detecting any usb2 devices after a usb2 hub is removed.

It is based off work originally done by rockchip.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/usb/dwc3/Kconfig              |  10 +
 drivers/usb/dwc3/Makefile             |   1 +
 drivers/usb/dwc3/dwc3-rockchip-inno.c | 271 ++++++++++++++++++++++++++
 3 files changed, 282 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-rockchip-inno.c

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 7a2304565a73..2e33a45f55ff 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -139,4 +139,14 @@ config USB_DWC3_QCOM
 	  for peripheral mode support.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_ROCKCHIP_INNO
+	tristate "Rockchip Platforms with INNO PHY"
+	depends on OF && COMMON_CLK && ARCH_ROCKCHIP
+	depends on USB=y || USB=USB_DWC3
+	default USB_DWC3
+	help
+	  Support of USB2/3 functionality in Rockchip platforms
+	  with INNO USB 3.0 PHY IP inside.
+	  say 'Y' or 'M' if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index ae86da0dc5bd..f5eb7de10128 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -51,3 +51,4 @@ obj-$(CONFIG_USB_DWC3_MESON_G12A)	+= dwc3-meson-g12a.o
 obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
 obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
+obj-$(CONFIG_USB_DWC3_ROCKCHIP_INNO)	+= dwc3-rockchip-inno.o
diff --git a/drivers/usb/dwc3/dwc3-rockchip-inno.c b/drivers/usb/dwc3/dwc3-rockchip-inno.c
new file mode 100644
index 000000000000..7007ddbcbdae
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-rockchip-inno.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-rockchip-inno.c - DWC3 glue layer for Rockchip devices with Innosilicon based PHY
+ *
+ * Based on dwc3-of-simple.c
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/clk.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <linux/workqueue.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/phy.h>
+
+#include "core.h"
+#include "../host/xhci.h"
+
+
+struct dwc3_rk_inno {
+	struct device		*dev;
+	struct clk_bulk_data	*clks;
+	struct dwc3		*dwc;
+	struct usb_phy		*phy;
+	struct notifier_block	reset_nb;
+	struct work_struct	reset_work;
+	struct mutex		lock;
+	int			num_clocks;
+	struct reset_control	*resets;
+};
+
+static int dwc3_rk_inno_host_reset_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct dwc3_rk_inno	*rk_inno = container_of(nb, struct dwc3_rk_inno, reset_nb);
+
+	schedule_work(&rk_inno->reset_work);
+
+	return NOTIFY_DONE;
+}
+
+static void dwc3_rk_inno_host_reset_work(struct work_struct *work)
+{
+	struct dwc3_rk_inno	*rk_inno = container_of(work, struct dwc3_rk_inno, reset_work);
+	struct usb_hcd		*hcd = dev_get_drvdata(&rk_inno->dwc->xhci->dev);
+	struct usb_hcd		*shared_hcd = hcd->shared_hcd;
+	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
+	unsigned int		count = 0;
+
+	mutex_lock(&rk_inno->lock);
+
+	if (hcd->state != HC_STATE_HALT) {
+		usb_remove_hcd(shared_hcd);
+		usb_remove_hcd(hcd);
+	}
+
+	if (rk_inno->phy)
+		usb_phy_shutdown(rk_inno->phy);
+
+	while (hcd->state != HC_STATE_HALT) {
+		if (++count > 1000) {
+			dev_err(rk_inno->dev, "wait for HCD remove 1s timeout!\n");
+			break;
+		}
+		usleep_range(1000, 1100);
+	}
+
+	if (hcd->state == HC_STATE_HALT) {
+		xhci->shared_hcd = shared_hcd;
+		usb_add_hcd(hcd, hcd->irq, IRQF_SHARED);
+		usb_add_hcd(shared_hcd, hcd->irq, IRQF_SHARED);
+	}
+
+	if (rk_inno->phy)
+		usb_phy_init(rk_inno->phy);
+
+	mutex_unlock(&rk_inno->lock);
+	dev_dbg(rk_inno->dev, "host reset complete\n");
+}
+
+static int dwc3_rk_inno_probe(struct platform_device *pdev)
+{
+	struct dwc3_rk_inno	*rk_inno;
+	struct device		*dev = &pdev->dev;
+	struct device_node	*np = dev->of_node, *child, *node;
+	struct platform_device	*child_pdev;
+
+	int			ret;
+
+	rk_inno = devm_kzalloc(dev, sizeof(*rk_inno), GFP_KERNEL);
+	if (!rk_inno)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rk_inno);
+	rk_inno->dev = dev;
+
+	rk_inno->resets = of_reset_control_array_get(np, false, true,
+						    true);
+	if (IS_ERR(rk_inno->resets)) {
+		ret = PTR_ERR(rk_inno->resets);
+		dev_err(dev, "failed to get device resets, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_deassert(rk_inno->resets);
+	if (ret)
+		goto err_resetc_put;
+
+	ret = clk_bulk_get_all(rk_inno->dev, &rk_inno->clks);
+	if (ret < 0)
+		goto err_resetc_assert;
+
+	rk_inno->num_clocks = ret;
+	ret = clk_bulk_prepare_enable(rk_inno->num_clocks, rk_inno->clks);
+	if (ret)
+		goto err_resetc_assert;
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret)
+		goto err_clk_put;
+
+	child = of_get_child_by_name(np, "dwc3");
+	if (!child) {
+		dev_err(dev, "failed to find dwc3 core node\n");
+		ret = -ENODEV;
+		goto err_plat_depopulate;
+	}
+
+	child_pdev = of_find_device_by_node(child);
+	if (!child_pdev) {
+		dev_err(dev, "failed to get dwc3 core device\n");
+		ret = -ENODEV;
+		goto err_plat_depopulate;
+	}
+
+	rk_inno->dwc = platform_get_drvdata(child_pdev);
+	if (!rk_inno->dwc || !rk_inno->dwc->xhci) {
+		ret = -EPROBE_DEFER;
+		goto err_plat_depopulate;
+	}
+
+	node = of_parse_phandle(child, "usb-phy", 0);
+	INIT_WORK(&rk_inno->reset_work, dwc3_rk_inno_host_reset_work);
+	rk_inno->reset_nb.notifier_call = dwc3_rk_inno_host_reset_notifier;
+	rk_inno->phy = devm_usb_get_phy_by_node(dev, node, &rk_inno->reset_nb);
+	of_node_put(node);
+	mutex_init(&rk_inno->lock);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	return 0;
+
+err_plat_depopulate:
+	of_platform_depopulate(dev);
+
+err_clk_put:
+	clk_bulk_disable_unprepare(rk_inno->num_clocks, rk_inno->clks);
+	clk_bulk_put_all(rk_inno->num_clocks, rk_inno->clks);
+
+err_resetc_assert:
+	reset_control_assert(rk_inno->resets);
+
+err_resetc_put:
+	reset_control_put(rk_inno->resets);
+	return ret;
+}
+
+static void __dwc3_rk_inno_teardown(struct dwc3_rk_inno *rk_inno)
+{
+	of_platform_depopulate(rk_inno->dev);
+
+	clk_bulk_disable_unprepare(rk_inno->num_clocks, rk_inno->clks);
+	clk_bulk_put_all(rk_inno->num_clocks, rk_inno->clks);
+	rk_inno->num_clocks = 0;
+
+	reset_control_assert(rk_inno->resets);
+
+	reset_control_put(rk_inno->resets);
+
+	pm_runtime_disable(rk_inno->dev);
+	pm_runtime_put_noidle(rk_inno->dev);
+	pm_runtime_set_suspended(rk_inno->dev);
+}
+
+static int dwc3_rk_inno_remove(struct platform_device *pdev)
+{
+	struct dwc3_rk_inno	*rk_inno = platform_get_drvdata(pdev);
+
+	__dwc3_rk_inno_teardown(rk_inno);
+
+	return 0;
+}
+
+static void dwc3_rk_inno_shutdown(struct platform_device *pdev)
+{
+	struct dwc3_rk_inno	*rk_inno = platform_get_drvdata(pdev);
+
+	__dwc3_rk_inno_teardown(rk_inno);
+}
+
+static int __maybe_unused dwc3_rk_inno_runtime_suspend(struct device *dev)
+{
+	struct dwc3_rk_inno	*rk_inno = dev_get_drvdata(dev);
+
+	clk_bulk_disable(rk_inno->num_clocks, rk_inno->clks);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_rk_inno_runtime_resume(struct device *dev)
+{
+	struct dwc3_rk_inno	*rk_inno = dev_get_drvdata(dev);
+
+	return clk_bulk_enable(rk_inno->num_clocks, rk_inno->clks);
+}
+
+static int __maybe_unused dwc3_rk_inno_suspend(struct device *dev)
+{
+	struct dwc3_rk_inno *rk_inno = dev_get_drvdata(dev);
+
+	reset_control_assert(rk_inno->resets);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_rk_inno_resume(struct device *dev)
+{
+	struct dwc3_rk_inno *rk_inno = dev_get_drvdata(dev);
+
+	reset_control_deassert(rk_inno->resets);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dwc3_rk_inno_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rk_inno_suspend, dwc3_rk_inno_resume)
+	SET_RUNTIME_PM_OPS(dwc3_rk_inno_runtime_suspend,
+			dwc3_rk_inno_runtime_resume, NULL)
+};
+
+static const struct of_device_id of_dwc3_rk_inno_match[] = {
+	{ .compatible = "rockchip,rk3328-dwc3" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_dwc3_rk_inno_match);
+
+static struct platform_driver dwc3_rk_inno_driver = {
+	.probe		= dwc3_rk_inno_probe,
+	.remove		= dwc3_rk_inno_remove,
+	.shutdown	= dwc3_rk_inno_shutdown,
+	.driver		= {
+		.name	= "dwc3-rk-inno",
+		.of_match_table = of_dwc3_rk_inno_match,
+		.pm	= &dwc3_rk_inno_dev_pm_ops,
+	},
+};
+
+module_platform_driver(dwc3_rk_inno_driver);
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare USB3 Rockchip Innosilicon Glue Layer");
+MODULE_AUTHOR("Peter Geis <pgwipeout@gmail.com>");
-- 
2.25.1

