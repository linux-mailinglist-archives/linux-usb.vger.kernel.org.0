Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617E11CF836
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 17:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730464AbgELPAt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 11:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730457AbgELPAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 11:00:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53F9C061A0C;
        Tue, 12 May 2020 08:00:48 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x13so585869pfn.11;
        Tue, 12 May 2020 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xEP8AipPcdZ46McAdhBOEcCxclFIgcXJdZxwPLlUqq4=;
        b=D/qgUM4LlT1IqXxzMUNN2vhnyUBdPKAFVAudvSYRw04RClJQeC1nOE5//ZFfTmOU4M
         15yVGj3HfRZglwqplOt7WMqSCSjXT1PkxTpceQ1ROfKdmmHgOfdRyI81MYhwAl3W5dvc
         Q0FaDt+Zfg29QQENrEuXt6QjRNTW/fvTT7JlMVa2moCAyzZVQXKkOCCxw9oCLf8v3Q/6
         hOBpMxQEIosDKSAP9STN1lqi3RuliWzKtnW4UYXoOzlrYTdok+hFLAfEeVEwY5UlXjg0
         TzGep3hErW76pDJOl4IB+bSjh01SRRd3VV0n1ekP1hWVFLIKkp0iPxTTb6gWqGtnbAHb
         LmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xEP8AipPcdZ46McAdhBOEcCxclFIgcXJdZxwPLlUqq4=;
        b=Q/KG3rS2dtVqnRtQBEuCEZXiSRq91xbQLKFjk2TQQDsKqzn5dh4KwFrVz5qLlfEuMk
         mfC7A5k6Q+YcXLmgVa8bG0XLFkGZUj5B8IrVQFrDfqmpwK0g0xVcAzEfkVrboguDr81I
         h4kt0mOH+/Smu1qRY4xx+gnU6APHvkgvU1nBJgb6B0xne/YWv3P25MldgQOdwz4KS1S0
         zSUawkeV+tp6BAYwy1At08dvRAaN8w4zxqfyfmejm8kajCATI3Si/yYpRJrPR6mu7ygN
         ignMO9QZHWHqAuaxs0nw16SYEID5ijZ7jS0WQjOJp/coXA2MxeriRaiEo6A5TK3Hwgtn
         lbkg==
X-Gm-Message-State: AGi0PubkPgjsciDC5mlQxpwWRoRQBiDMgH4njTPfDpN0rjxeAelPkPQB
        x+V5AMuJcIvZAHxD4eaxOrM1Teoh2m4=
X-Google-Smtp-Source: APiQypLFob/XnL7eyUsxbtMxR2eTA4sh4yxPbl7Utf58/bV7ulCB2JkOAUvKh3zXL0HJwYhuCbDNcA==
X-Received: by 2002:a63:e60a:: with SMTP id g10mr19381719pgh.51.1589295647736;
        Tue, 12 May 2020 08:00:47 -0700 (PDT)
Received: from stbsrv-and-01.and.broadcom.net ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id c2sm8359779pgj.93.2020.05.12.08.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:00:47 -0700 (PDT)
From:   Al Cooper <alcooperx@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Al Cooper <alcooperx@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v10 4/5] usb: ehci: Add new EHCI driver for Broadcom STB SoC's
Date:   Tue, 12 May 2020 11:00:18 -0400
Message-Id: <20200512150019.25903-5-alcooperx@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512150019.25903-1-alcooperx@gmail.com>
References: <20200512150019.25903-1-alcooperx@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new EHCI driver for Broadcom STB SoC's. A new EHCI driver
was created instead of adding support to the existing ehci platform
driver because of the code required to work around bugs in the EHCI
controller. The primary workaround is for a bug where the Core
violates the SOF interval between the first two SOFs transmitted after
resume. This only happens if the resume occurs near the end of a
microframe. The fix is to intercept the ehci-hcd request to complete
RESUME and align it to the start of the next microframe.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/host/ehci-brcm.c | 280 +++++++++++++++++++++++++++++++++++
 1 file changed, 280 insertions(+)
 create mode 100644 drivers/usb/host/ehci-brcm.c

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
new file mode 100644
index 000000000000..3e0ebe8cc649
--- /dev/null
+++ b/drivers/usb/host/ehci-brcm.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2020, Broadcom */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/iopoll.h>
+
+#include "ehci.h"
+
+#define hcd_to_ehci_priv(h) ((struct brcm_priv *)hcd_to_ehci(h)->priv)
+
+struct brcm_priv {
+	struct clk *clk;
+};
+
+/*
+ * ehci_brcm_wait_for_sof
+ * Wait for start of next microframe, then wait extra delay microseconds
+ */
+static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
+{
+	u32 frame_idx = ehci_readl(ehci, &ehci->regs->frame_index);
+	u32 val;
+	int res;
+
+	/* Wait for next microframe (every 125 usecs) */
+	res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
+					 val != frame_idx, 1, 130);
+	if (res)
+		ehci_err(ehci, "Error waiting for SOF\n");
+	udelay(delay);
+}
+
+/*
+ * ehci_brcm_hub_control
+ * The EHCI controller has a bug where it can violate the SOF
+ * interval between the first two SOF's transmitted after resume
+ * if the resume occurs near the end of the microframe. This causees
+ * the controller to detect babble on the suspended port and
+ * will eventually cause the controller to reset the port.
+ * The fix is to Intercept the echi-hcd request to complete RESUME and
+ * align it to the start of the next microframe.
+ * See SWLINUX-1909 for more details
+ */
+static int ehci_brcm_hub_control(
+	struct usb_hcd	*hcd,
+	u16		typeReq,
+	u16		wValue,
+	u16		wIndex,
+	char		*buf,
+	u16		wLength)
+{
+	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
+	int		ports = HCS_N_PORTS(ehci->hcs_params);
+	u32 __iomem	*status_reg;
+	unsigned long flags;
+	int retval, irq_disabled = 0;
+
+	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+
+	/*
+	 * RESUME is cleared when GetPortStatus() is called 20ms after start
+	 * of RESUME
+	 */
+	if ((typeReq == GetPortStatus) &&
+	    (wIndex && wIndex <= ports) &&
+	    ehci->reset_done[wIndex-1] &&
+	    time_after_eq(jiffies, ehci->reset_done[wIndex-1]) &&
+	    (ehci_readl(ehci, status_reg) & PORT_RESUME)) {
+
+		/*
+		 * to make sure we are not interrupted until RESUME bit
+		 * is cleared, disable interrupts on current CPU
+		 */
+		ehci_dbg(ehci, "SOF alignment workaround\n");
+		irq_disabled = 1;
+		local_irq_save(flags);
+		ehci_brcm_wait_for_sof(ehci, 5);
+	}
+	retval = ehci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
+	if (irq_disabled)
+		local_irq_restore(flags);
+	return retval;
+}
+
+static int ehci_brcm_reset(struct usb_hcd *hcd)
+{
+	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
+	int len;
+
+	ehci->big_endian_mmio = 1;
+
+	ehci->caps = (void __iomem *)hcd->regs;
+	len = HC_LENGTH(ehci, ehci_readl(ehci, &ehci->caps->hc_capbase));
+	ehci->regs = (void __iomem *)(hcd->regs + len);
+
+	/* This fixes the lockup during reboot due to prior interrupts */
+	ehci_writel(ehci, CMD_RESET, &ehci->regs->command);
+	mdelay(10);
+
+	/*
+	 * SWLINUX-1705: Avoid OUT packet underflows during high memory
+	 *   bus usage
+	 * port_status[0x0f] = Broadcom-proprietary USB_EHCI_INSNREG00 @ 0x90
+	 */
+	ehci_writel(ehci, 0x00800040, &ehci->regs->port_status[0x10]);
+	ehci_writel(ehci, 0x00000001, &ehci->regs->port_status[0x12]);
+
+	return ehci_setup(hcd);
+}
+
+static struct hc_driver __read_mostly ehci_brcm_hc_driver;
+
+static const struct ehci_driver_overrides brcm_overrides __initconst = {
+	.reset = ehci_brcm_reset,
+	.extra_priv_size = sizeof(struct brcm_priv),
+};
+
+static int ehci_brcm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res_mem;
+	struct brcm_priv *priv;
+	struct usb_hcd *hcd;
+	int irq;
+	int err;
+
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (err)
+		return err;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0)
+		return irq ? irq : -EINVAL;
+
+	/* Hook the hub control routine to work around a bug */
+	ehci_brcm_hc_driver.hub_control = ehci_brcm_hub_control;
+
+	/* initialize hcd */
+	hcd = usb_create_hcd(&ehci_brcm_hc_driver, dev, dev_name(dev));
+	if (!hcd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, hcd);
+	priv = hcd_to_ehci_priv(hcd);
+
+	priv->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		err = PTR_ERR(priv->clk);
+		goto err_hcd;
+	}
+
+	err = clk_prepare_enable(priv->clk);
+	if (err)
+		goto err_hcd;
+
+	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res_mem);
+	if (IS_ERR(hcd->regs)) {
+		err = PTR_ERR(hcd->regs);
+		goto err_clk;
+	}
+	hcd->rsrc_start = res_mem->start;
+	hcd->rsrc_len = resource_size(res_mem);
+	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
+	if (err)
+		goto err_clk;
+
+	device_wakeup_enable(hcd->self.controller);
+	device_enable_async_suspend(hcd->self.controller);
+
+	return 0;
+
+err_clk:
+	clk_disable_unprepare(priv->clk);
+err_hcd:
+	usb_put_hcd(hcd);
+
+	return err;
+}
+
+static int ehci_brcm_remove(struct platform_device *dev)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(dev);
+	struct brcm_priv *priv = hcd_to_ehci_priv(hcd);
+
+	usb_remove_hcd(hcd);
+	clk_disable_unprepare(priv->clk);
+	usb_put_hcd(hcd);
+	return 0;
+}
+
+static int __maybe_unused ehci_brcm_suspend(struct device *dev)
+{
+	int ret;
+	struct usb_hcd *hcd = dev_get_drvdata(dev);
+	struct brcm_priv *priv = hcd_to_ehci_priv(hcd);
+	bool do_wakeup = device_may_wakeup(dev);
+
+	ret = ehci_suspend(hcd, do_wakeup);
+	if (ret)
+		return ret;
+	clk_disable_unprepare(priv->clk);
+	return 0;
+}
+
+static int __maybe_unused ehci_brcm_resume(struct device *dev)
+{
+	struct usb_hcd *hcd = dev_get_drvdata(dev);
+	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
+	struct brcm_priv *priv = hcd_to_ehci_priv(hcd);
+	int err;
+
+	err = clk_prepare_enable(priv->clk);
+	if (err)
+		return err;
+	/*
+	 * SWLINUX-1705: Avoid OUT packet underflows during high memory
+	 *   bus usage
+	 * port_status[0x0f] = Broadcom-proprietary USB_EHCI_INSNREG00
+	 * @ 0x90
+	 */
+	ehci_writel(ehci, 0x00800040, &ehci->regs->port_status[0x10]);
+	ehci_writel(ehci, 0x00000001, &ehci->regs->port_status[0x12]);
+
+	ehci_resume(hcd, false);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(ehci_brcm_pm_ops, ehci_brcm_suspend,
+		ehci_brcm_resume);
+
+static const struct of_device_id brcm_ehci_of_match[] = {
+	{ .compatible = "brcm,ehci-brcm-v2", },
+	{ .compatible = "brcm,bcm7445-ehci", },
+	{}
+};
+
+static struct platform_driver ehci_brcm_driver = {
+	.probe		= ehci_brcm_probe,
+	.remove		= ehci_brcm_remove,
+	.shutdown	= usb_hcd_platform_shutdown,
+	.driver		= {
+		.name	= "ehci-brcm",
+		.pm	= &ehci_brcm_pm_ops,
+		.of_match_table = brcm_ehci_of_match,
+	}
+};
+
+static int __init ehci_brcm_init(void)
+{
+	if (usb_disabled())
+		return -ENODEV;
+
+	ehci_init_driver(&ehci_brcm_hc_driver, &brcm_overrides);
+	return platform_driver_register(&ehci_brcm_driver);
+}
+module_init(ehci_brcm_init);
+
+static void __exit ehci_brcm_exit(void)
+{
+	platform_driver_unregister(&ehci_brcm_driver);
+}
+module_exit(ehci_brcm_exit);
+
+MODULE_ALIAS("platform:ehci-brcm");
+MODULE_DESCRIPTION("EHCI Broadcom STB driver");
+MODULE_AUTHOR("Al Cooper");
+MODULE_LICENSE("GPL");
-- 
2.17.1

