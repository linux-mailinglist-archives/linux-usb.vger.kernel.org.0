Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C012D3EFD7E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 09:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239110AbhHRHM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 03:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239008AbhHRHMU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 03:12:20 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0B9C06179A;
        Wed, 18 Aug 2021 00:11:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so1138900wma.0;
        Wed, 18 Aug 2021 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iP1sY4zKZKkpzS0YFqbxUkihkmno+uaoyU4zOzOrhio=;
        b=pzOe6yQdw9jcL0eLRVzinu7ymW6+ObbJ5b49qa2ah5uzjwCyx+KA5xu7F0YuLAJ6sI
         IaGZxzSnDR9NMFfaCHLXt81lBby6JEfWD+pSCTc7VLnWozRs3MeYo1jDLhlHgm82OkU3
         evcviyKqcC32mJwFg2Xpxh59u8311FyUFU4WDSTqXngbRlVQ0G0byL2CME8ees3yQiT1
         JnexYtbIRIh2XoEmPJENMViuxU62LW7Iunids+bbsiSaGOB5r64JaWQWNbUbUuzeyDlC
         nIUXrMPyRBFEsPYDQ2e9LQ0z3R0BkpDnoFXel4XuoEXCkQdnYzDejBzuwOIr9Y2RhJ6p
         6rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iP1sY4zKZKkpzS0YFqbxUkihkmno+uaoyU4zOzOrhio=;
        b=UrbOYfIIlI8nhtqGRfKef0Ln6lF3M07kMvamMxpRMEcWBBns3QWXd01xinTYOAkCnk
         xCwiJ9ML8i+mHCAo03Xcpa7DGSeIintOM4ZfCEEAgJabNSdx2HQMDWgIsL5WZPc/VOn9
         JTNiwDCAtrWWPX5aOCzr4LzTxOYq9qYNEuijOkWu5ucBDCPM+OPgSORr0XSE2g+W0nKX
         Huz1ZMHXQletK1QdH3IO9CVoyHJenKHwbTbL5iK4wx/TcbFDGZ6ntxNiPqyy1CgOm4Ba
         Y2a5cNQcoZRJgBeFTUC/E4XKZJ6Jt//4Pszn7Yt4BZIDpnsOa9+ZV8JyniP/y6K0XCkW
         BcKw==
X-Gm-Message-State: AOAM531TAB7rn5jR0Kum2O2ra4msVZI8a/7nJcM4hCdLy82Q+rejSLzv
        Ni5xYE7CxYD+67uYwm/eCcc=
X-Google-Smtp-Source: ABdhPJwBZxuDkzFn9M3tLKSHxq4ZsyBhAgP9rCLyNHYGJhLO8GLnUBjw/KCcJL0EFDGWCkBM8BbMUQ==
X-Received: by 2002:a1c:a988:: with SMTP id s130mr6754712wme.182.1629270704284;
        Wed, 18 Aug 2021 00:11:44 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id r10sm4925729wrp.28.2021.08.18.00.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:11:43 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 1/3] usb: host: remove dead EHCI support for on-chip PMC MSP71xx USB controller
Date:   Wed, 18 Aug 2021 09:11:35 +0200
Message-Id: <20210818071137.22711-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
References: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 1b00767fd8e1 ("MIPS: Remove PMC MSP71xx platform") deletes
./arch/mips/pmcs-msp71xx/Kconfig, including its config  MSP_HAS_USB.

Hence, since then, the corresponding EHCI support for on-chip PMC MSP71xx
USB controller is dead code. Remove this dead driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/usb/host/Kconfig       |   9 -
 drivers/usb/host/ehci-hcd.c    |   5 -
 drivers/usb/host/ehci-pmcmsp.c | 328 ---------------------------------
 3 files changed, 342 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-pmcmsp.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index df9428f1dc5e..c4736d1d020c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -187,15 +187,6 @@ config USB_EHCI_PCI
 	depends on USB_PCI
 	default y
 
-config USB_EHCI_HCD_PMC_MSP
-	tristate "EHCI support for on-chip PMC MSP71xx USB controller"
-	depends on MSP_HAS_USB
-	select USB_EHCI_BIG_ENDIAN_DESC
-	select USB_EHCI_BIG_ENDIAN_MMIO
-	help
-		Enables support for the onchip USB controller on the PMC_MSP7100 Family SoC's.
-		If unsure, say N.
-
 config XPS_USB_HCD_XILINX
 	bool "Use Xilinx usb host EHCI controller core"
 	depends on (PPC32 || MICROBLAZE)
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 10b0365f3439..6bdc6d6bf74d 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1296,11 +1296,6 @@ MODULE_LICENSE ("GPL");
 #define XILINX_OF_PLATFORM_DRIVER	ehci_hcd_xilinx_of_driver
 #endif
 
-#ifdef CONFIG_USB_EHCI_HCD_PMC_MSP
-#include "ehci-pmcmsp.c"
-#define	PLATFORM_DRIVER		ehci_hcd_msp_driver
-#endif
-
 #ifdef CONFIG_SPARC_LEON
 #include "ehci-grlib.c"
 #define PLATFORM_DRIVER		ehci_grlib_driver
diff --git a/drivers/usb/host/ehci-pmcmsp.c b/drivers/usb/host/ehci-pmcmsp.c
deleted file mode 100644
index 5fb92b956cc7..000000000000
--- a/drivers/usb/host/ehci-pmcmsp.c
+++ /dev/null
@@ -1,328 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * PMC MSP EHCI (Host Controller Driver) for USB.
- *
- * (C) Copyright 2006-2010 PMC-Sierra Inc
- */
-
-/* includes */
-#include <linux/platform_device.h>
-#include <linux/gpio.h>
-#include <linux/usb.h>
-#include <msp_usb.h>
-
-/* stream disable*/
-#define USB_CTRL_MODE_STREAM_DISABLE	0x10
-
-/* threshold */
-#define USB_CTRL_FIFO_THRESH		0x00300000
-
-/* register offset for usb_mode */
-#define USB_EHCI_REG_USB_MODE		0x68
-
-/* register offset for usb fifo */
-#define USB_EHCI_REG_USB_FIFO		0x24
-
-/* register offset for usb status */
-#define USB_EHCI_REG_USB_STATUS		0x44
-
-/* serial/parallel transceiver */
-#define USB_EHCI_REG_BIT_STAT_STS	(1<<29)
-
-/* TWI USB0 host device pin */
-#define MSP_PIN_USB0_HOST_DEV		49
-
-/* TWI USB1 host device pin */
-#define MSP_PIN_USB1_HOST_DEV		50
-
-
-static void usb_hcd_tdi_set_mode(struct ehci_hcd *ehci)
-{
-	u8 *base;
-	u8 *statreg;
-	u8 *fiforeg;
-	u32 val;
-	struct ehci_regs *reg_base = ehci->regs;
-
-	/* get register base */
-	base = (u8 *)reg_base + USB_EHCI_REG_USB_MODE;
-	statreg = (u8 *)reg_base + USB_EHCI_REG_USB_STATUS;
-	fiforeg = (u8 *)reg_base + USB_EHCI_REG_USB_FIFO;
-
-	/* Disable controller mode stream */
-	val = ehci_readl(ehci, (u32 *)base);
-	ehci_writel(ehci, (val | USB_CTRL_MODE_STREAM_DISABLE),
-			(u32 *)base);
-
-	/* clear STS to select parallel transceiver interface */
-	val = ehci_readl(ehci, (u32 *)statreg);
-	val = val & ~USB_EHCI_REG_BIT_STAT_STS;
-	ehci_writel(ehci, val, (u32 *)statreg);
-
-	/* write to set the proper fifo threshold */
-	ehci_writel(ehci, USB_CTRL_FIFO_THRESH, (u32 *)fiforeg);
-
-	/* set TWI GPIO USB_HOST_DEV pin high */
-	gpio_direction_output(MSP_PIN_USB0_HOST_DEV, 1);
-}
-
-/* called during probe() after chip reset completes */
-static int ehci_msp_setup(struct usb_hcd *hcd)
-{
-	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
-	int			retval;
-
-	ehci->big_endian_mmio = 1;
-	ehci->big_endian_desc = 1;
-
-	ehci->caps = hcd->regs;
-	hcd->has_tt = 1;
-
-	retval = ehci_setup(hcd);
-	if (retval)
-		return retval;
-
-	usb_hcd_tdi_set_mode(ehci);
-
-	return retval;
-}
-
-
-/* configure so an HC device and id are always provided
- * always called with process context; sleeping is OK
- */
-
-static int usb_hcd_msp_map_regs(struct mspusb_device *dev)
-{
-	struct resource *res;
-	struct platform_device *pdev = &dev->dev;
-	u32 res_len;
-	int retval;
-
-	/* MAB register space */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res == NULL)
-		return -ENOMEM;
-	res_len = resource_size(res);
-	if (!request_mem_region(res->start, res_len, "mab regs"))
-		return -EBUSY;
-
-	dev->mab_regs = ioremap(res->start, res_len);
-	if (dev->mab_regs == NULL) {
-		retval = -ENOMEM;
-		goto err1;
-	}
-
-	/* MSP USB register space */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	if (res == NULL) {
-		retval = -ENOMEM;
-		goto err2;
-	}
-	res_len = resource_size(res);
-	if (!request_mem_region(res->start, res_len, "usbid regs")) {
-		retval = -EBUSY;
-		goto err2;
-	}
-	dev->usbid_regs = ioremap(res->start, res_len);
-	if (dev->usbid_regs == NULL) {
-		retval = -ENOMEM;
-		goto err3;
-	}
-
-	return 0;
-err3:
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	res_len = resource_size(res);
-	release_mem_region(res->start, res_len);
-err2:
-	iounmap(dev->mab_regs);
-err1:
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	res_len = resource_size(res);
-	release_mem_region(res->start, res_len);
-	dev_err(&pdev->dev, "Failed to map non-EHCI regs.\n");
-	return retval;
-}
-
-/**
- * usb_hcd_msp_probe - initialize PMC MSP-based HCDs
- * @driver:	Pointer to hc driver instance
- * @dev:	USB controller to probe
- *
- * Context: task context, might sleep
- *
- * Allocates basic resources for this USB host controller, and
- * then invokes the start() method for the HCD associated with it
- * through the hotplug entry's driver_data.
- */
-int usb_hcd_msp_probe(const struct hc_driver *driver,
-			  struct platform_device *dev)
-{
-	int retval;
-	struct usb_hcd *hcd;
-	struct resource *res;
-	struct ehci_hcd		*ehci ;
-
-	hcd = usb_create_hcd(driver, &dev->dev, "pmcmsp");
-	if (!hcd)
-		return -ENOMEM;
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		pr_debug("No IOMEM resource info for %s.\n", dev->name);
-		retval = -ENOMEM;
-		goto err1;
-	}
-	hcd->rsrc_start = res->start;
-	hcd->rsrc_len = resource_size(res);
-	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, dev->name)) {
-		retval = -EBUSY;
-		goto err1;
-	}
-	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
-	if (!hcd->regs) {
-		pr_debug("ioremap failed");
-		retval = -ENOMEM;
-		goto err2;
-	}
-
-	res = platform_get_resource(dev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&dev->dev, "No IRQ resource info for %s.\n", dev->name);
-		retval = -ENOMEM;
-		goto err3;
-	}
-
-	/* Map non-EHCI register spaces */
-	retval = usb_hcd_msp_map_regs(to_mspusb_device(dev));
-	if (retval != 0)
-		goto err3;
-
-	ehci = hcd_to_ehci(hcd);
-	ehci->big_endian_mmio = 1;
-	ehci->big_endian_desc = 1;
-
-
-	retval = usb_add_hcd(hcd, res->start, IRQF_SHARED);
-	if (retval == 0) {
-		device_wakeup_enable(hcd->self.controller);
-		return 0;
-	}
-
-	usb_remove_hcd(hcd);
-err3:
-	iounmap(hcd->regs);
-err2:
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-err1:
-	usb_put_hcd(hcd);
-
-	return retval;
-}
-
-
-
-/**
- * usb_hcd_msp_remove - shutdown processing for PMC MSP-based HCDs
- * @hcd: USB Host Controller being removed
- *
- * Context: task context, might sleep
- *
- * Reverses the effect of usb_hcd_msp_probe(), first invoking
- * the HCD's stop() method.  It is always called from a thread
- * context, normally "rmmod", "apmd", or something similar.
- *
- * may be called without controller electrically present
- * may be called with controller, bus, and devices active
- */
-static void usb_hcd_msp_remove(struct usb_hcd *hcd)
-{
-	usb_remove_hcd(hcd);
-	iounmap(hcd->regs);
-	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-	usb_put_hcd(hcd);
-}
-
-static const struct hc_driver ehci_msp_hc_driver = {
-	.description =		hcd_name,
-	.product_desc =		"PMC MSP EHCI",
-	.hcd_priv_size =	sizeof(struct ehci_hcd),
-
-	/*
-	 * generic hardware linkage
-	 */
-	.irq =			ehci_irq,
-	.flags =		HCD_MEMORY | HCD_DMA | HCD_USB2 | HCD_BH,
-
-	/*
-	 * basic lifecycle operations
-	 */
-	.reset			= ehci_msp_setup,
-	.shutdown		= ehci_shutdown,
-	.start			= ehci_run,
-	.stop			= ehci_stop,
-
-	/*
-	 * managing i/o requests and associated device resources
-	 */
-	.urb_enqueue		= ehci_urb_enqueue,
-	.urb_dequeue		= ehci_urb_dequeue,
-	.endpoint_disable	= ehci_endpoint_disable,
-	.endpoint_reset		= ehci_endpoint_reset,
-
-	/*
-	 * scheduling support
-	 */
-	.get_frame_number	= ehci_get_frame,
-
-	/*
-	 * root hub support
-	 */
-	.hub_status_data	= ehci_hub_status_data,
-	.hub_control		= ehci_hub_control,
-	.bus_suspend		= ehci_bus_suspend,
-	.bus_resume		= ehci_bus_resume,
-	.relinquish_port	= ehci_relinquish_port,
-	.port_handed_over	= ehci_port_handed_over,
-
-	.clear_tt_buffer_complete	= ehci_clear_tt_buffer_complete,
-};
-
-static int ehci_hcd_msp_drv_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	pr_debug("In ehci_hcd_msp_drv_probe");
-
-	if (usb_disabled())
-		return -ENODEV;
-
-	gpio_request(MSP_PIN_USB0_HOST_DEV, "USB0_HOST_DEV_GPIO");
-
-	ret = usb_hcd_msp_probe(&ehci_msp_hc_driver, pdev);
-
-	return ret;
-}
-
-static int ehci_hcd_msp_drv_remove(struct platform_device *pdev)
-{
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-
-	usb_hcd_msp_remove(hcd);
-
-	/* free TWI GPIO USB_HOST_DEV pin */
-	gpio_free(MSP_PIN_USB0_HOST_DEV);
-
-	return 0;
-}
-
-MODULE_ALIAS("pmcmsp-ehci");
-
-static struct platform_driver ehci_hcd_msp_driver = {
-	.probe		= ehci_hcd_msp_drv_probe,
-	.remove		= ehci_hcd_msp_drv_remove,
-	.driver		= {
-		.name	= "pmcmsp-ehci",
-	},
-};
-- 
2.26.2

