Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7DB11427B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 15:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbfLEOWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 09:22:08 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46293 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729426AbfLEOWI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 09:22:08 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so1801633lfl.13
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 06:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tQIFDJRFLRyxoBEPViCKQZ/AcK1w0EhJA5jasAaAPXI=;
        b=Z/OnbNrH5nKlrEINsGce4d5PnduNPQ8So29H84mbPuGI4pnIie7USQRfYbSTby0ETR
         e6Fyxx8CTrHFp9wycL++iQpjiDcu/V9j662e6hwzcpradQA+QhjqAHt3+Wy3Sm/0gCIq
         Pq3UW1PfVzY+/z7ock55pB2sRLMs6GIsYj9Qn0+11jQgcDOIk9XdSO/3Mgu8fHdWoyoU
         r8St2kFSwiaAYlEUfxob6QaxVgIGVuYo79zijSNR25PEOkkhGssYcoCknbeJQ9viDr7G
         Y9IZcUjicU4fjOf/8trguy7emHA9lfHBA3xdudlXsYOtlcATi9JqybrL6oQzoe1gupWw
         VzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tQIFDJRFLRyxoBEPViCKQZ/AcK1w0EhJA5jasAaAPXI=;
        b=YNqagDvx0daeo45tgYRiqgNJUPH5K3YRqjTBKQKU8jzviMM0KjubDw77g5EHdb2XAZ
         NWaP9SqLJHjXWmZzGoQFSgFDeYndt55tzZWEJmXc6jn67HEf/+t0y8qSEMJKgAAbpnho
         ny3fMfsflYL3xmQf+OAGs4mI01OYeQLOxuFuJenmzj6LySKjQxCfWm/2otamAc7C22cn
         YW+zDZnulWyT0AEIFOLN8u67HKDVw+fgH5IdWSBeTGYNm8SZepFskIA4jGL+VrXP+tyw
         ZIH8SlNSOzsrZNvnkxA9Hfg7xJnc4+u53sxMGq+2We3UVRE7Tq9vpVdFs3tftr0LuBUd
         MLnQ==
X-Gm-Message-State: APjAAAXkRl3aw/hfMedyZFe8myoPSidLh3xrUuP8pdXuFgEm7PP8Ynfs
        AxLUQgdcC3mp1nA81B4pfnmtoQ==
X-Google-Smtp-Source: APXvYqyoSj7VRR9pqPk8P81DV5oEOT9OCI03+8aTFFuanzq1AftS73zlWUzzrio7kDFKFDgXWW9bcw==
X-Received: by 2002:ac2:43af:: with SMTP id t15mr5491710lfl.154.1575555725253;
        Thu, 05 Dec 2019 06:22:05 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id t1sm5034009lji.98.2019.12.05.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:22:04 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH] musb: davinci: Convert to use GPIO descriptor
Date:   Thu,  5 Dec 2019 15:22:00 +0100
Message-Id: <20191205142200.145252-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DaVinci MUSB glue contains an optional GPIO line to
control VBUS power, convert this to use a GPIO descriptor
and augment the EVM board file to provide this descriptor.

I can't get this driver to compile properly and it depends
on broken but when I didn get it to compile brokenly, it
did at least not complain about THIS code being broken so
I don't think I broke the driver any more than what it
already is.

I did away with the ifdefs that do not work with
multiplatform anyway so the day someone decides to
resurrect the code, the path to get it working should be
easier as well since DaVinci is now multiplatform.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-davinci/board-dm644x-evm.c | 12 ++++++
 drivers/usb/musb/davinci.c               | 55 ++++++++++++++----------
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index 9d87d4e440ea..040c949414fa 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -823,6 +823,17 @@ static int davinci_phy_fixup(struct phy_device *phydev)
 
 #define HAS_NAND	IS_ENABLED(CONFIG_MTD_NAND_DAVINCI)
 
+#define GPIO_nVBUS_DRV		160
+
+static struct gpiod_lookup_table dm644evm_usb_gpio_table = {
+	.dev_id = "musb-davinci",
+	.table = {
+		GPIO_LOOKUP("davinci_gpio", GPIO_nVBUS_DRV, NULL,
+			    GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static __init void davinci_evm_init(void)
 {
 	int ret;
@@ -875,6 +886,7 @@ static __init void davinci_evm_init(void)
 	dm644x_init_asp();
 
 	/* irlml6401 switches over 1A, in under 8 msec */
+	gpiod_add_lookup_table(&dm644evm_usb_gpio_table);
 	davinci_setup_usb(1000, 8);
 
 	if (IS_BUILTIN(CONFIG_PHYLIB)) {
diff --git a/drivers/usb/musb/davinci.c b/drivers/usb/musb/davinci.c
index fb6bbd254ab7..546ffaac6ebf 100644
--- a/drivers/usb/musb/davinci.c
+++ b/drivers/usb/musb/davinci.c
@@ -13,7 +13,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb/usb_phy_generic.h>
@@ -25,10 +25,6 @@
 
 #include "musb_core.h"
 
-#ifdef CONFIG_MACH_DAVINCI_EVM
-#define GPIO_nVBUS_DRV		160
-#endif
-
 #include "davinci.h"
 #include "cppi_dma.h"
 
@@ -40,6 +36,9 @@ struct davinci_glue {
 	struct device		*dev;
 	struct platform_device	*musb;
 	struct clk		*clk;
+	bool			vbus_state;
+	struct gpio_desc	*vbus;
+	struct work_struct	vbus_work;
 };
 
 /* REVISIT (PM) we should be able to keep the PHY in low power mode most
@@ -135,43 +134,44 @@ static void davinci_musb_disable(struct musb *musb)
  * when J10 is out, and TI documents it as handling OTG.
  */
 
-#ifdef CONFIG_MACH_DAVINCI_EVM
-
-static int vbus_state = -1;
-
 /* I2C operations are always synchronous, and require a task context.
  * With unloaded systems, using the shared workqueue seems to suffice
  * to satisfy the 100msec A_WAIT_VRISE timeout...
  */
-static void evm_deferred_drvvbus(struct work_struct *ignored)
+static void evm_deferred_drvvbus(struct work_struct *work)
 {
-	gpio_set_value_cansleep(GPIO_nVBUS_DRV, vbus_state);
-	vbus_state = !vbus_state;
-}
+	struct davinci_glue *glue = container_of(work, struct davinci_glue,
+						 vbus_work);
 
-#endif	/* EVM */
+	gpiod_set_value_cansleep(glue->vbus, glue->vbus_state);
+	glue->vbus_state = !glue->vbus_state;
+}
 
-static void davinci_musb_source_power(struct musb *musb, int is_on, int immediate)
+static void davinci_musb_source_power(struct musb *musb, int is_on,
+				      int immediate)
 {
-#ifdef CONFIG_MACH_DAVINCI_EVM
+	struct davinci_glue *glue = dev_get_drvdata(musb->controller->parent);
+
+	/* This GPIO handling is entirely optional */
+	if (!glue->vbus)
+		return;
+
 	if (is_on)
 		is_on = 1;
 
 	if (vbus_state == is_on)
 		return;
-	vbus_state = !is_on;		/* 0/1 vs "-1 == unknown/init" */
+	/* 0/1 vs "-1 == unknown/init" */
+	glue->vbus_state = !is_on;
 
 	if (machine_is_davinci_evm()) {
-		static DECLARE_WORK(evm_vbus_work, evm_deferred_drvvbus);
-
 		if (immediate)
-			gpio_set_value_cansleep(GPIO_nVBUS_DRV, vbus_state);
+			gpiod_set_value_cansleep(glue->vbus, glue->vbus_state);
 		else
-			schedule_work(&evm_vbus_work);
+			schedule_work(&glue->vbus_work);
 	}
 	if (immediate)
-		vbus_state = is_on;
-#endif
+		glue->vbus_state = is_on;
 }
 
 static void davinci_musb_set_vbus(struct musb *musb, int is_on)
@@ -524,6 +524,15 @@ static int davinci_probe(struct platform_device *pdev)
 
 	pdata->platform_ops		= &davinci_ops;
 
+	glue->vbus = devm_gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
+	if (IS_ERR(glue->vbus)) {
+		ret = PTR_ERR(glue->vbus);
+		goto err0;
+	} else {
+		glue->vbus_state = -1;
+		INIT_WORK(&glue->vbus_work, evm_deferred_drvvbus);
+	}
+
 	usb_phy_generic_register();
 	platform_set_drvdata(pdev, glue);
 
-- 
2.23.0

