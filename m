Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08663122E3A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 15:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbfLQOMr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 09:12:47 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41134 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbfLQOMr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 09:12:47 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so7061847lfp.8
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ePTZT8w1yYKU+6XZIw1VRbjDByrT55QH4Bd608l9VoE=;
        b=mPMdDFNxfkvoL3lABqC3oWe3u054uDodPUHv0x86h7OcsQtn/2fAP24i/g11zmJsU9
         6a+/49hXnTEOPUMFdWVqc0a9ncPQW55SA/VDa77puyW0yoAsXDzem91ZYBkAPiunoGxJ
         M3jB5f0HbN/0GqLid7AGYsAub5wbXCK6MTJUG732MO+ybVx+H/kX7SONxTaSg2lsQRO3
         Ax4I4Ke4ZwPNjsi8sted3o/A2+89KFahiDtLrGYd++jxdIh8D9+mr7/rqg2abnheNs3e
         8gam1tgxPkYclzIn1KPpWu51PgByIncJiL+jVvdyDLMwcLEIHoLfPnlUc21I76ooWHWa
         gaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ePTZT8w1yYKU+6XZIw1VRbjDByrT55QH4Bd608l9VoE=;
        b=l3eep6ERJTI4a9cVd0DWcEyDpsQCk0UKmaXQ52dkUQEMFmTXTILeoLFk95FAL52q6c
         iOaCnJlm9gF+4wN99ye0CWWX9iUiMDKoeGPQqRc/df0OxIoX9z0wuujGCck8XCPWJzlk
         bPiwAblRhf1tjv/kK+v28Ub6pVA8RVO5Y+Lh1oTPt9inD2rzGVNbESO7QmMFLBjJq610
         lzj+535S5mn18SfiwLd7WW2+jkI8evwFTiCdmNuGyFPMpel9UIE/e0tj8Ks3N6C7Qhs9
         UBND3P8da8mVMe+MaCVl3tm3HP1HjZ5hcA8lDIKiuHn1ASNIoAfvmC1lSwcnN4pS6obz
         QAcQ==
X-Gm-Message-State: APjAAAW/0KnEcq8oxyodZTIpY5EyAw1nYZll/uoT00sc35Fy0PFIvsFG
        njKVG95daIBUOuDvuK6RE+vBgwX0MMM=
X-Google-Smtp-Source: APXvYqxaJAF2XNylDUNhZ9U3/i+GZ9q3XbHl8RCFn1EX8B8k1CMpkvOAb7m3xODNaQYBp8+KaJV6vQ==
X-Received: by 2002:ac2:544f:: with SMTP id d15mr3061840lfn.126.1576591965244;
        Tue, 17 Dec 2019 06:12:45 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y23sm12849736ljk.6.2019.12.17.06.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 06:12:43 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Switch to GPIO descriptor
Date:   Tue, 17 Dec 2019 15:12:41 +0100
Message-Id: <20191217141241.57639-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Renesas USBHS driver includes a bit of surplus headers
and uses the old GPIO API so let's switch it to use the
GPIO descriptor.

I noticed that the enable_gpio inside renesas_usbhs_driver_param
isn't really referenced anywhere, and it is also the wrong
type (u32) so let's just delete it and use a local variable
instead.

Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/renesas_usbhs/common.c | 22 +++++++++-------------
 drivers/usb/renesas_usbhs/rcar2.c  |  2 --
 include/linux/usb/renesas_usbhs.h  |  2 --
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index d438b7871446..3af91b2b8f76 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -8,11 +8,10 @@
  */
 #include <linux/clk.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -592,7 +591,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	struct usbhs_priv *priv;
 	struct resource *irq_res;
 	struct device *dev = &pdev->dev;
-	int ret, gpio;
+	struct gpio_desc *gpiod;
+	int ret;
 	u32 tmp;
 
 	/* check device node */
@@ -657,10 +657,9 @@ static int usbhs_probe(struct platform_device *pdev)
 		priv->dparam.pio_dma_border = 64; /* 64byte */
 	if (!of_property_read_u32(dev_of_node(dev), "renesas,buswait", &tmp))
 		priv->dparam.buswait_bwait = tmp;
-	gpio = of_get_named_gpio_flags(dev_of_node(dev), "renesas,enable-gpio",
-				       0, NULL);
-	if (gpio > 0)
-		priv->dparam.enable_gpio = gpio;
+	gpiod = devm_gpiod_get_optional(dev, "renesas,enable", GPIOD_IN);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
 
 	/* FIXME */
 	/* runtime power control ? */
@@ -708,13 +707,10 @@ static int usbhs_probe(struct platform_device *pdev)
 	usbhs_sys_clock_ctrl(priv, 0);
 
 	/* check GPIO determining if USB function should be enabled */
-	if (priv->dparam.enable_gpio) {
-		gpio_request_one(priv->dparam.enable_gpio, GPIOF_IN, NULL);
-		ret = !gpio_get_value(priv->dparam.enable_gpio);
-		gpio_free(priv->dparam.enable_gpio);
+	if (gpiod) {
+		ret = !gpiod_get_value(gpiod);
 		if (ret) {
-			dev_warn(dev, "USB function not selected (GPIO %d)\n",
-				 priv->dparam.enable_gpio);
+			dev_warn(dev, "USB function not selected (GPIO)\n");
 			ret = -ENOTSUPP;
 			goto probe_end_mod_exit;
 		}
diff --git a/drivers/usb/renesas_usbhs/rcar2.c b/drivers/usb/renesas_usbhs/rcar2.c
index 440d213e1749..7f2f06586ea5 100644
--- a/drivers/usb/renesas_usbhs/rcar2.c
+++ b/drivers/usb/renesas_usbhs/rcar2.c
@@ -6,8 +6,6 @@
  * Copyright (C) 2019 Renesas Electronics Corporation
  */
 
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include "common.h"
 #include "rcar2.h"
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 6914475bbc86..d418c55523a7 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -170,8 +170,6 @@ struct renesas_usbhs_driver_param {
 	 */
 	int pio_dma_border; /* default is 64byte */
 
-	u32 enable_gpio;
-
 	/*
 	 * option:
 	 */
-- 
2.23.0

