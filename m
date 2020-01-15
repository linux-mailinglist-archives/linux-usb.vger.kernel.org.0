Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6051C13C2A4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgAONZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:53 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49160 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPouL069018;
        Wed, 15 Jan 2020 07:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=4GNsoyd8uuZtA3OYKGb7rQmg0MuT7RXDTbV0HtZH4gc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HcN3vC980p0wukjXvw+7r7m2mbz7EhD+KXrec0y4alPthdpAH2CiKzMOU5vJW5qHf
         /YlZFzpjM7mp2jew+EudFsIx9dWNG0ghdPAnRVhL8rVepdP65r42cMkYlNpJy2gqcL
         TyZ8skdBLliGGcdvyTugEHIkvlMR9VRurbBHBkyU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPout086476
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3M066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 24/25] usb: musb: davinci: Convert to use GPIO descriptor
Date:   Wed, 15 Jan 2020 07:25:46 -0600
Message-ID: <20200115132547.364-25-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

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
[b-liu@ti.com: fixed one instance still ref to global variable vbus_state]
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 arch/arm/mach-davinci/board-dm644x-evm.c | 12 +++++
 drivers/usb/musb/davinci.c               | 57 ++++++++++++++----------
 2 files changed, 45 insertions(+), 24 deletions(-)

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
index fb6bbd254ab7..704435526394 100644
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
 
-	if (vbus_state == is_on)
+	if (glue->vbus_state == is_on)
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
2.17.1

