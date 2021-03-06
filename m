Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0EB32FB22
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 15:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhCFOVg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 09:21:36 -0500
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:57176 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhCFOVT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 09:21:19 -0500
Received: from localhost.localdomain ([90.126.17.6])
        by mwinf5d10 with ME
        id d2MA2400207rLVE032MAlN; Sat, 06 Mar 2021 15:21:17 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 06 Mar 2021 15:21:17 +0100
X-ME-IP: 90.126.17.6
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, krzk@kernel.org,
        nathan@kernel.org, gustavoars@kernel.org, arnd@arndb.de,
        ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2 V2] usb: gadget: s3c: Fix incorrect resources releasing
Date:   Sat,  6 Mar 2021 15:21:08 +0100
Message-Id: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 188db4435ac6 ("usb: gadget: s3c: use platform resources"),
'request_mem_region()' and 'ioremap()' are no more used, so they don't need
to be undone in the error handling path of the probe and in the removre
function.

Remove these calls and the unneeded 'rsrc_start' and 'rsrc_len' global
variables.

Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
the 'err' label is used only to reduce the diff size of this patch. It is
removed in the following patch.

v2: Fix a stupid error in the hash in Fixes:
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index f1ea51476add..3fc436286bad 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -54,8 +54,6 @@ static struct clk		*udc_clock;
 static struct clk		*usb_bus_clock;
 static void __iomem		*base_addr;
 static int			irq_usbd;
-static u64			rsrc_start;
-static u64			rsrc_len;
 static struct dentry		*s3c2410_udc_debugfs_root;
 
 static inline u32 udc_read(u32 reg)
@@ -1775,7 +1773,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (!base_addr) {
 		retval = -ENOMEM;
-		goto err_mem;
+		goto err;
 	}
 
 	the_controller = udc;
@@ -1793,7 +1791,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	if (retval != 0) {
 		dev_err(dev, "cannot get irq %i, err %d\n", irq_usbd, retval);
 		retval = -EBUSY;
-		goto err_map;
+		goto err;
 	}
 
 	dev_dbg(dev, "got irq %i\n", irq_usbd);
@@ -1864,10 +1862,7 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 		gpio_free(udc_info->vbus_pin);
 err_int:
 	free_irq(irq_usbd, udc);
-err_map:
-	iounmap(base_addr);
-err_mem:
-	release_mem_region(rsrc_start, rsrc_len);
+err:
 
 	return retval;
 }
@@ -1899,9 +1894,6 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 
 	free_irq(irq_usbd, udc);
 
-	iounmap(base_addr);
-	release_mem_region(rsrc_start, rsrc_len);
-
 	if (!IS_ERR(udc_clock) && udc_clock != NULL) {
 		clk_disable_unprepare(udc_clock);
 		clk_put(udc_clock);
-- 
2.27.0

