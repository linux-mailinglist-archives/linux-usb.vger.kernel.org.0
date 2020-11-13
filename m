Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D812B21A4
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 18:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgKMRMf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 12:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgKMRMf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 12:12:35 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384E9C0617A6
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 09:12:49 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id v11so7138812qtq.12
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UZh/zTRV5qkAJLnAEnhWsnMr0sMy2Rrcq4an5daG5/w=;
        b=h9I/Tf838qRMHV+i6HFF/FKpO9iYVjyiDwu48C0J3QQcRFQTJWJ4JboeCI1N9JX6tY
         Xf68Exz3J0cjQ98I+h1QYEFYdGtKY1NONVw7n8FJBuEKgmNjlPxQwI2Dxz3kDgRmLf80
         JMt4m+KG3pwJm7EMzX0RETyUTptPUZ8UMOQEcyFWO4dG7T6mV5miWNjf4gOtNZBPoC8/
         QQZoKaWLPbkpRpFjBpEB3MGs3nW31WQfeZu/KxHVzBf+t4NEODugtcfyYpX9Ai5cdUO1
         Eqc0Ju/z53lxGo7g5pB+PCgGOjVKt61Mu9lKOkP6RzrHrDTbhE6wABZM1LFF6gfb8gs6
         mDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UZh/zTRV5qkAJLnAEnhWsnMr0sMy2Rrcq4an5daG5/w=;
        b=r41EkaT47od2ySV2ZaZ7vUSHeDOIiwU4zYCIF+cA5iH4KswTPIb7zC/FIBxplrdwFV
         d4BakOhotYoBelyrFPJ5xhsGZBMrt0queZjLSdl3wkDu6TH782J9+uFtTJnTtu+q2HYy
         8VrkbK0k+pBc5+P4b1wzjd6Yw5rePN/Kw6iyqFDsLRKf/Bajs2AAJtNIS7guvFculPAt
         /jiS7AVdgXi+YuqIdbr8tvHRLbcwY75XB/bg4iODnGtExklDm30HVucWs8U/1dhjFfS/
         WRzo9DllNl/TGcGXs+7Psbkk24XOM11oZoUDvoIZbSYx+SZdawWc/plexY7mVTbUhH5b
         FKSQ==
X-Gm-Message-State: AOAM531SjTCSZaRTVHHTg5isqPzgTCZNIDvOlT8nDNff9xi1q1Y7Bvbe
        yUBMao+PMC9VHPAHYPOls6c=
X-Google-Smtp-Source: ABdhPJwS/7ySAt0gmOiOGvMVRvG/7d+AF+6KJNp2eQwyvwLOa4HLg7pJ/KORR1PC/s+rDGCt10OW1g==
X-Received: by 2002:ac8:5b94:: with SMTP id a20mr2909780qta.223.1605287562979;
        Fri, 13 Nov 2020 09:12:42 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997::1000])
        by smtp.gmail.com with ESMTPSA id p1sm7188724qkc.100.2020.11.13.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:12:42 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, peter.chen@nxp.com,
        s.hauer@pengutronix.de, linux-usb@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: host: ehci-mxc: Remove the driver
Date:   Fri, 13 Nov 2020 14:12:31 -0300
Message-Id: <20201113171231.2205-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ehci-mxc driver was only used by i.MX non-DT platforms.

Since 5.10-rc1, i.MX has been converted to a DT-only platform and all
board files are gone.

Remove the ehci-mxc driver as there are no more users at all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/Kconfig                   |   7 -
 drivers/usb/host/Makefile                  |   1 -
 drivers/usb/host/ehci-mxc.c                | 213 ---------------------
 include/linux/platform_data/usb-ehci-mxc.h |  14 --
 4 files changed, 235 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-mxc.c
 delete mode 100644 include/linux/platform_data/usb-ehci-mxc.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index a633e9c15f7e..31e59309da1f 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -213,13 +213,6 @@ config USB_EHCI_FSL
 	help
 	  Variation of ARC USB block used in some Freescale chips.
 
-config USB_EHCI_MXC
-	tristate "Support for Freescale i.MX on-chip EHCI USB controller"
-	depends on ARCH_MXC || COMPILE_TEST
-	select USB_EHCI_ROOT_HUB_TT
-	help
-	  Variation of ARC USB block used in some Freescale chips.
-
 config USB_EHCI_HCD_NPCM7XX
 	tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
 	depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index d03f6f0764d2..c1b08703af10 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -40,7 +40,6 @@ obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
 obj-$(CONFIG_USB_EHCI_PCI)	+= ehci-pci.o
 obj-$(CONFIG_USB_EHCI_HCD_PLATFORM)	+= ehci-platform.o
-obj-$(CONFIG_USB_EHCI_MXC)	+= ehci-mxc.o
 obj-$(CONFIG_USB_EHCI_HCD_NPCM7XX)	+= ehci-npcm7xx.o
 obj-$(CONFIG_USB_EHCI_HCD_OMAP)	+= ehci-omap.o
 obj-$(CONFIG_USB_EHCI_HCD_ORION)	+= ehci-orion.o
diff --git a/drivers/usb/host/ehci-mxc.c b/drivers/usb/host/ehci-mxc.c
deleted file mode 100644
index dc2676320527..000000000000
--- a/drivers/usb/host/ehci-mxc.c
+++ /dev/null
@@ -1,213 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
- * Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/usb/otg.h>
-#include <linux/usb/ulpi.h>
-#include <linux/slab.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
-#include <linux/platform_data/usb-ehci-mxc.h>
-#include "ehci.h"
-
-#define DRIVER_DESC "Freescale On-Chip EHCI Host driver"
-
-static const char hcd_name[] = "ehci-mxc";
-
-#define ULPI_VIEWPORT_OFFSET	0x170
-
-struct ehci_mxc_priv {
-	struct clk *usbclk, *ahbclk, *phyclk;
-};
-
-static struct hc_driver __read_mostly ehci_mxc_hc_driver;
-
-static const struct ehci_driver_overrides ehci_mxc_overrides __initconst = {
-	.extra_priv_size =	sizeof(struct ehci_mxc_priv),
-};
-
-static int ehci_mxc_drv_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct mxc_usbh_platform_data *pdata = dev_get_platdata(dev);
-	struct usb_hcd *hcd;
-	struct resource *res;
-	int irq, ret;
-	struct ehci_mxc_priv *priv;
-	struct ehci_hcd *ehci;
-
-	if (!pdata) {
-		dev_err(dev, "No platform data given, bailing out.\n");
-		return -EINVAL;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	hcd = usb_create_hcd(&ehci_mxc_hc_driver, dev, dev_name(dev));
-	if (!hcd)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(hcd->regs)) {
-		ret = PTR_ERR(hcd->regs);
-		goto err_alloc;
-	}
-	hcd->rsrc_start = res->start;
-	hcd->rsrc_len = resource_size(res);
-
-	hcd->has_tt = 1;
-	ehci = hcd_to_ehci(hcd);
-	priv = (struct ehci_mxc_priv *) ehci->priv;
-
-	/* enable clocks */
-	priv->usbclk = devm_clk_get(dev, "ipg");
-	if (IS_ERR(priv->usbclk)) {
-		ret = PTR_ERR(priv->usbclk);
-		goto err_alloc;
-	}
-	clk_prepare_enable(priv->usbclk);
-
-	priv->ahbclk = devm_clk_get(dev, "ahb");
-	if (IS_ERR(priv->ahbclk)) {
-		ret = PTR_ERR(priv->ahbclk);
-		goto err_clk_ahb;
-	}
-	clk_prepare_enable(priv->ahbclk);
-
-	/* "dr" device has its own clock on i.MX51 */
-	priv->phyclk = devm_clk_get(dev, "phy");
-	if (IS_ERR(priv->phyclk))
-		priv->phyclk = NULL;
-	if (priv->phyclk)
-		clk_prepare_enable(priv->phyclk);
-
-	/* call platform specific init function */
-	if (pdata->init) {
-		ret = pdata->init(pdev);
-		if (ret) {
-			dev_err(dev, "platform init failed\n");
-			goto err_init;
-		}
-		/* platforms need some time to settle changed IO settings */
-		mdelay(10);
-	}
-
-	/* EHCI registers start at offset 0x100 */
-	ehci->caps = hcd->regs + 0x100;
-	ehci->regs = hcd->regs + 0x100 +
-		HC_LENGTH(ehci, ehci_readl(ehci, &ehci->caps->hc_capbase));
-
-	/* set up the PORTSCx register */
-	ehci_writel(ehci, pdata->portsc, &ehci->regs->port_status[0]);
-
-	/* is this really needed? */
-	msleep(10);
-
-	/* Initialize the transceiver */
-	if (pdata->otg) {
-		pdata->otg->io_priv = hcd->regs + ULPI_VIEWPORT_OFFSET;
-		ret = usb_phy_init(pdata->otg);
-		if (ret) {
-			dev_err(dev, "unable to init transceiver, probably missing\n");
-			ret = -ENODEV;
-			goto err_add;
-		}
-		ret = otg_set_vbus(pdata->otg->otg, 1);
-		if (ret) {
-			dev_err(dev, "unable to enable vbus on transceiver\n");
-			goto err_add;
-		}
-	}
-
-	platform_set_drvdata(pdev, hcd);
-
-	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto err_add;
-
-	device_wakeup_enable(hcd->self.controller);
-	return 0;
-
-err_add:
-	if (pdata && pdata->exit)
-		pdata->exit(pdev);
-err_init:
-	if (priv->phyclk)
-		clk_disable_unprepare(priv->phyclk);
-
-	clk_disable_unprepare(priv->ahbclk);
-err_clk_ahb:
-	clk_disable_unprepare(priv->usbclk);
-err_alloc:
-	usb_put_hcd(hcd);
-	return ret;
-}
-
-static int ehci_mxc_drv_remove(struct platform_device *pdev)
-{
-	struct mxc_usbh_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-	struct ehci_mxc_priv *priv = (struct ehci_mxc_priv *) ehci->priv;
-
-	usb_remove_hcd(hcd);
-
-	if (pdata && pdata->exit)
-		pdata->exit(pdev);
-
-	if (pdata && pdata->otg)
-		usb_phy_shutdown(pdata->otg);
-
-	clk_disable_unprepare(priv->usbclk);
-	clk_disable_unprepare(priv->ahbclk);
-
-	if (priv->phyclk)
-		clk_disable_unprepare(priv->phyclk);
-
-	usb_put_hcd(hcd);
-	return 0;
-}
-
-MODULE_ALIAS("platform:mxc-ehci");
-
-static struct platform_driver ehci_mxc_driver = {
-	.probe = ehci_mxc_drv_probe,
-	.remove = ehci_mxc_drv_remove,
-	.shutdown = usb_hcd_platform_shutdown,
-	.driver = {
-		   .name = "mxc-ehci",
-	},
-};
-
-static int __init ehci_mxc_init(void)
-{
-	if (usb_disabled())
-		return -ENODEV;
-
-	pr_info("%s: " DRIVER_DESC "\n", hcd_name);
-
-	ehci_init_driver(&ehci_mxc_hc_driver, &ehci_mxc_overrides);
-	return platform_driver_register(&ehci_mxc_driver);
-}
-module_init(ehci_mxc_init);
-
-static void __exit ehci_mxc_cleanup(void)
-{
-	platform_driver_unregister(&ehci_mxc_driver);
-}
-module_exit(ehci_mxc_cleanup);
-
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_AUTHOR("Sascha Hauer");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/usb-ehci-mxc.h b/include/linux/platform_data/usb-ehci-mxc.h
deleted file mode 100644
index ad9794d09bc8..000000000000
--- a/include/linux/platform_data/usb-ehci-mxc.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __INCLUDE_ASM_ARCH_MXC_EHCI_H
-#define __INCLUDE_ASM_ARCH_MXC_EHCI_H
-
-struct mxc_usbh_platform_data {
-	int (*init)(struct platform_device *pdev);
-	int (*exit)(struct platform_device *pdev);
-
-	unsigned int		 portsc;
-	struct usb_phy		*otg;
-};
-
-#endif /* __INCLUDE_ASM_ARCH_MXC_EHCI_H */
-
-- 
2.17.1

