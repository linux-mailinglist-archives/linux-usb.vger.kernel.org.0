Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D439C2D6938
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 21:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393860AbgLJU5I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 15:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390160AbgLJU4z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 15:56:55 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCCBC061793
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 12:56:15 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id h4so1456408qkk.4
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 12:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2pQY5/oc++7Ys7PmnH7tWtOBFzCDoT4AkhPKs3hCv1Q=;
        b=iprpcK0vIk+92C4f6GYrv4VBLcE2LwdGqkLRomGbU0AAjZ29AtP//uKIDVrox4laZd
         UXznKfHtQ41iINtnq0MqxqFmWSGZncY1QT74mmV2JxuYKeYOANerXEvev+xa6thEervZ
         jtm99OfiKs577Brpd5QTNgy28uqIHHuF19WrvxzottAmM30Kzw6qJE3OnCDvemdw8Xvt
         dMTDIV/8Bk7elijvZQJfzpRPzPhRi8oBm4WB781HWjHu7XFN9mGBhkmj/C3Hs3sEhk3J
         6ChgaMum0iTzZ5OTUnTBmAWv6yAgQEBKiLKqeGy9ApxgH3UKGQ16kGsJyEKVAG9v87LL
         /xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2pQY5/oc++7Ys7PmnH7tWtOBFzCDoT4AkhPKs3hCv1Q=;
        b=nOjHSdT9owF/RwY6uVi5/uEs+qtdc8OwtiFKdRC50rYiQr5G1tSJaxOX6JnhuqqhWA
         32eczV+LdSG4oZ4Doo/goJ7HNqP0+XWjtPACdXhlWTQBWvCcHvi9ucUKx/W9uHS25tf+
         UQ/uAlHsgfLUuY7OoHF4vGt2h+NAb2XTg1hnyhEyEu2ZJv4AUPqR5ujwn+zwjn7NIK5n
         ol0i+t27tC7ZDJUleONuKLxG1EG47FerN705FMAKtOmAfxpQnzPIeBjWupwUgm3Hk+C4
         Z/rhv9VvMBsiZIAoKb1E0u2XKc5+81zy0Ge83tedSKQdgtjuWVaK1d1twP+ROrZI2xUa
         vmxg==
X-Gm-Message-State: AOAM531lPlFFH8SFdgAcA3Vt5Ua9ran9jLc4sriS76NIoVVGxumU/4Aa
        so5dIKFX3JHlf/zKuGawSo4=
X-Google-Smtp-Source: ABdhPJxFNoGvE3nXHw/08NAjGEcUN5rFI+sQ8IFWqJSOt4FMcYIzYnJ8+sxoqUutPUeVsgq+vls1cA==
X-Received: by 2002:a37:38f:: with SMTP id 137mr7016193qkd.436.1607633774396;
        Thu, 10 Dec 2020 12:56:14 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:6086:6f67:ecaf:b184])
        by smtp.gmail.com with ESMTPSA id p75sm4651687qka.72.2020.12.10.12.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 12:56:13 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        peter.chen@nxp.com, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] usb: gadget: fsl_mxc_udc: Remove the driver
Date:   Thu, 10 Dec 2020 17:55:38 -0300
Message-Id: <20201210205538.15025-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform, and this driver
was only unsed by the old non-DT i.MX devices.

Remove the driver as it has no users left.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/gadget/udc/Kconfig       |   2 +-
 drivers/usb/gadget/udc/Makefile      |   1 -
 drivers/usb/gadget/udc/fsl_mxc_udc.c | 122 ---------------------------
 3 files changed, 1 insertion(+), 124 deletions(-)
 delete mode 100644 drivers/usb/gadget/udc/fsl_mxc_udc.c

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 1a12aab208b4..8c614bb86c66 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -90,7 +90,7 @@ config USB_BCM63XX_UDC
 
 config USB_FSL_USB2
 	tristate "Freescale Highspeed USB DR Peripheral Controller"
-	depends on FSL_SOC || ARCH_MXC
+	depends on FSL_SOC
 	help
 	   Some of Freescale PowerPC and i.MX processors have a High Speed
 	   Dual-Role(DR) USB controller, which supports device mode.
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index f5a7ce28aecd..a21f2224e7eb 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_USB_ATMEL_USBA)	+= atmel_usba_udc.o
 obj-$(CONFIG_USB_BCM63XX_UDC)	+= bcm63xx_udc.o
 obj-$(CONFIG_USB_FSL_USB2)	+= fsl_usb2_udc.o
 fsl_usb2_udc-y			:= fsl_udc_core.o
-fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+= fsl_mxc_udc.o
 obj-$(CONFIG_USB_TEGRA_XUDC)	+= tegra-xudc.o
 obj-$(CONFIG_USB_M66592)	+= m66592-udc.o
 obj-$(CONFIG_USB_R8A66597)	+= r8a66597-udc.o
diff --git a/drivers/usb/gadget/udc/fsl_mxc_udc.c b/drivers/usb/gadget/udc/fsl_mxc_udc.c
deleted file mode 100644
index 5a321992decc..000000000000
--- a/drivers/usb/gadget/udc/fsl_mxc_udc.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2009
- * Guennadi Liakhovetski, DENX Software Engineering, <lg@denx.de>
- *
- * Description:
- * Helper routines for i.MX3x SoCs from Freescale, needed by the fsl_usb2_udc.c
- * driver to function correctly on these systems.
- */
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/fsl_devices.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-
-#include "fsl_usb2_udc.h"
-
-static struct clk *mxc_ahb_clk;
-static struct clk *mxc_per_clk;
-static struct clk *mxc_ipg_clk;
-
-/* workaround ENGcm09152 for i.MX35 */
-#define MX35_USBPHYCTRL_OFFSET		0x600
-#define USBPHYCTRL_OTGBASE_OFFSET	0x8
-#define USBPHYCTRL_EVDO			(1 << 23)
-
-int fsl_udc_clk_init(struct platform_device *pdev)
-{
-	struct fsl_usb2_platform_data *pdata;
-	unsigned long freq;
-	int ret;
-
-	pdata = dev_get_platdata(&pdev->dev);
-
-	mxc_ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(mxc_ipg_clk)) {
-		dev_err(&pdev->dev, "clk_get(\"ipg\") failed\n");
-		return PTR_ERR(mxc_ipg_clk);
-	}
-
-	mxc_ahb_clk = devm_clk_get(&pdev->dev, "ahb");
-	if (IS_ERR(mxc_ahb_clk)) {
-		dev_err(&pdev->dev, "clk_get(\"ahb\") failed\n");
-		return PTR_ERR(mxc_ahb_clk);
-	}
-
-	mxc_per_clk = devm_clk_get(&pdev->dev, "per");
-	if (IS_ERR(mxc_per_clk)) {
-		dev_err(&pdev->dev, "clk_get(\"per\") failed\n");
-		return PTR_ERR(mxc_per_clk);
-	}
-
-	clk_prepare_enable(mxc_ipg_clk);
-	clk_prepare_enable(mxc_ahb_clk);
-	clk_prepare_enable(mxc_per_clk);
-
-	/* make sure USB_CLK is running at 60 MHz +/- 1000 Hz */
-	if (!strcmp(pdev->id_entry->name, "imx-udc-mx27")) {
-		freq = clk_get_rate(mxc_per_clk);
-		if (pdata->phy_mode != FSL_USB2_PHY_ULPI &&
-		    (freq < 59999000 || freq > 60001000)) {
-			dev_err(&pdev->dev, "USB_CLK=%lu, should be 60MHz\n", freq);
-			ret = -EINVAL;
-			goto eclkrate;
-		}
-	}
-
-	return 0;
-
-eclkrate:
-	clk_disable_unprepare(mxc_ipg_clk);
-	clk_disable_unprepare(mxc_ahb_clk);
-	clk_disable_unprepare(mxc_per_clk);
-	mxc_per_clk = NULL;
-	return ret;
-}
-
-int fsl_udc_clk_finalize(struct platform_device *pdev)
-{
-	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	int ret = 0;
-
-	/* workaround ENGcm09152 for i.MX35 */
-	if (pdata->workaround & FLS_USB2_WORKAROUND_ENGCM09152) {
-		unsigned int v;
-		struct resource *res = platform_get_resource
-			(pdev, IORESOURCE_MEM, 0);
-		void __iomem *phy_regs = ioremap(res->start +
-						MX35_USBPHYCTRL_OFFSET, 512);
-		if (!phy_regs) {
-			dev_err(&pdev->dev, "ioremap for phy address fails\n");
-			ret = -EINVAL;
-			goto ioremap_err;
-		}
-
-		v = readl(phy_regs + USBPHYCTRL_OTGBASE_OFFSET);
-		writel(v | USBPHYCTRL_EVDO,
-			phy_regs + USBPHYCTRL_OTGBASE_OFFSET);
-
-		iounmap(phy_regs);
-	}
-
-
-ioremap_err:
-	/* ULPI transceivers don't need usbpll */
-	if (pdata->phy_mode == FSL_USB2_PHY_ULPI) {
-		clk_disable_unprepare(mxc_per_clk);
-		mxc_per_clk = NULL;
-	}
-
-	return ret;
-}
-
-void fsl_udc_clk_release(void)
-{
-	if (mxc_per_clk)
-		clk_disable_unprepare(mxc_per_clk);
-	clk_disable_unprepare(mxc_ahb_clk);
-	clk_disable_unprepare(mxc_ipg_clk);
-}
-- 
2.17.1

