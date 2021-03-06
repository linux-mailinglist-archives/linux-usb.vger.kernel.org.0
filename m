Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847D732FB28
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 15:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhCFOWP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 09:22:15 -0500
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:34271 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhCFOVs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 09:21:48 -0500
Received: from localhost.localdomain ([90.126.17.6])
        by mwinf5d10 with ME
        id d2Mn2400207rLVE032Mnne; Sat, 06 Mar 2021 15:21:47 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Mar 2021 15:21:47 +0100
X-ME-IP: 90.126.17.6
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, krzk@kernel.org,
        nathan@kernel.org, gustavoars@kernel.org, arnd@arndb.de,
        ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2 v2] usb: gadget: s3c: Fix the error handling path in 's3c2410_udc_probe()'
Date:   Sat,  6 Mar 2021 15:21:45 +0100
Message-Id: <20210306142145.3490-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some 'clk_prepare_enable()' and 'clk_get()' must be undone in the error
handling path of the probe function, as already done in the remove
function.

Fixes: 3fc154b6b813 ("USB Gadget driver for Samsung s3c2410 ARM SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Fix a stupid error in the hash in Fixes:
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index 3fc436286bad..146250e93412 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -1750,7 +1750,8 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	udc_clock = clk_get(NULL, "usb-device");
 	if (IS_ERR(udc_clock)) {
 		dev_err(dev, "failed to get udc clock source\n");
-		return PTR_ERR(udc_clock);
+		retval = PTR_ERR(udc_clock);
+		goto err_usb_bus_clk;
 	}
 
 	clk_prepare_enable(udc_clock);
@@ -1773,7 +1774,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (!base_addr) {
 		retval = -ENOMEM;
-		goto err;
+		goto err_udc_clk;
 	}
 
 	the_controller = udc;
@@ -1791,7 +1792,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	if (retval != 0) {
 		dev_err(dev, "cannot get irq %i, err %d\n", irq_usbd, retval);
 		retval = -EBUSY;
-		goto err;
+		goto err_udc_clk;
 	}
 
 	dev_dbg(dev, "got irq %i\n", irq_usbd);
@@ -1862,7 +1863,14 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		gpio_free(udc_info->vbus_pin);
 err_int:
 	free_irq(irq_usbd, udc);
-err:
+err_udc_clk:
+	clk_disable_unprepare(udc_clock);
+	clk_put(udc_clock);
+	udc_clock = NULL;
+err_usb_bus_clk:
+	clk_disable_unprepare(usb_bus_clock);
+	clk_put(usb_bus_clock);
+	usb_bus_clock = NULL;
 
 	return retval;
 }
-- 
2.27.0

