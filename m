Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BB4553E56
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 00:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiFUWM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 18:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354580AbiFUWJ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 18:09:59 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7082ED5B
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 15:09:57 -0700 (PDT)
Received: from Cyrus.lan ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.163]) with ESMTPA (Nemesis) id
 1MjPYI-1nNbob2D6I-00kywU; Wed, 22 Jun 2022 00:09:43 +0200
Date:   Tue, 21 Jun 2022 23:09:41 +0100
From:   Darren Stevens <darren@stevens-zone.net>
To:     linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Subject: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host mode.
Message-ID: <20220621230941.381f9791@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ayh/DqLZxuxcGgHIen4KcjIrEaWKLYpKbbcFNXeXDHKnIN4LIhE
 LoPxWSqYHIBM+lXCwQnMGYrG9Cl2yX59H3BM0D3LNC26aEVlBB3y28DK/dYIwLgSdOYhBlf
 hARpHRQBBR4M9Vn6h0fJA8fZnK5FeGAm/aQONu9m1qtBGzA5SZK+kD65RZFqEgpAcycKPl8
 UOxfJCfE4DwFM5JaiscoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YODaKTTHoII=:G4NJ0iuBhkkTmrrugFCR4o
 s+4+7nbTpKAfjRstI5jgSwY5B1kMGmGN2bbXazwcjqBf6K4UqvZfQZzQPodsXSUzbQp7nF/wb
 YY0NR/S9n62enDkJHvnmJqMi5Dj3oTZfs3DHeINNlN+1hD0318oHR5Wpz1xEoMETkfQjpRMiL
 5ZDUVoCJntQcmU+lPOHJl5IslVB0IN/zFD2Y3riIpzSCDIcL+QKr5TUphdhdlOAT1/dfUok5J
 vWY/yLFqNy0kzLX7OgjQdFecxppH0TDup9bfuqJvIWMns5PhH09wZsHL7zIoeZqpOeizifGZR
 Z1KGCCP6wGiISIrS8C0b+fPl8QEjxX1eLk/vRoL7AuWaEg5Ur6vdGcKFIpEDp2vaqmBIQCaHa
 CfnKRaZze1rSqA2+7+5A+ntjVQvKFmUj+5xX6aG4vdEwwpbyEbqYZG+kwhinImsOlhskxgazc
 dqjT9pQ4jV7WiGlNEeeoBwd3lLC4h19l8Z4VevjBMsfnENfIHSCKvc7Itan7oX/6N+hx/9TN6
 D2EYBPnxhJZg/Yz95BeqUHS+eXrj8XR7R7vxmiVU78YhTyJyQZIs1fvREtadG99v0FQ1Tan4e
 L8hEvGTlGzlIvg74Kpz466N7zuc/gCNaAD1p7N5iYOGFzirWe0UTGNZT/3R1v0YizysnBtA8v
 QNch9lr0w7OoxsIFlHHlbf5aKbrHMLRhxTCOT93o4Or5orVXTJAeCN62b/grwYVbRkzuroLMj
 BGNbUJynY4gCrkxbwmJsKsqoz/epeFJ9KFJ668npHbdkuWcXchh4fthrnys=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
core) we stopped platform_get_resource() from returning the IRQ, as all
drivers were supposed to have switched to platform_get_irq()
Unfortunately the Freescale EHCI driver in host mode got missed. Fix
it. Also fix allocation of resources to work with current kernel.

Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)
Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by Darren Stevens <darren@stevens-zone.net>
---
Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 385be30..d0bf7fb 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
 #include <linux/io.h>
 
 #include "ehci.h"
@@ -46,9 +47,10 @@ static struct hc_driver __read_mostly
fsl_ehci_hc_driver; */
 static int fsl_ehci_drv_probe(struct platform_device *pdev)
 {
+	struct device_node *dn = pdev->dev.of_node;
 	struct fsl_usb2_platform_data *pdata;
 	struct usb_hcd *hcd;
-	struct resource *res;
+	struct resource res;
 	int irq;
 	int retval;
 	u32 tmp;
@@ -76,14 +78,10 @@ static int fsl_ehci_drv_probe(struct
platform_device *pdev) return -ENODEV;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev,
-			"Found HC with no IRQ. Check %s setup!\n",
-			dev_name(&pdev->dev));
-		return -ENODEV;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		return irq;
 	}
-	irq = res->start;
 
 	hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
 			       &pdev->dev, dev_name(&pdev->dev), NULL);
@@ -92,15 +90,21 @@ static int fsl_ehci_drv_probe(struct
platform_device *pdev) goto err1;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
+	platform_set_drvdata(pdev, hcd);
+	pdev->dev.platform_data = pdata;
+
+	tmp = of_address_to_resource(dn, 0, &res);
+	if (tmp)
+		return tmp;
+
+	hcd->regs = devm_ioremap_resource(&pdev->dev, &res);
 	if (IS_ERR(hcd->regs)) {
 		retval = PTR_ERR(hcd->regs);
 		goto err2;
 	}
 
-	hcd->rsrc_start = res->start;
-	hcd->rsrc_len = resource_size(res);
+	hcd->rsrc_start = res.start;
+	hcd->rsrc_len = resource_size(&res);
 
 	pdata->regs = hcd->regs;
 
diff --git a/drivers/usb/host/fsl-mph-dr-of.c
b/drivers/usb/host/fsl-mph-dr-of.c index 44a7e58..766e4ab 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -80,8 +80,6 @@ static struct platform_device
*fsl_usb2_device_register( const char *name, int id)
 {
 	struct platform_device *pdev;
-	const struct resource *res = ofdev->resource;
-	unsigned int num = ofdev->num_resources;
 	int retval;
 
 	pdev = platform_device_alloc(name, id);
@@ -106,11 +104,8 @@ static struct platform_device
*fsl_usb2_device_register( if (retval)
 		goto error;
 
-	if (num) {
-		retval = platform_device_add_resources(pdev, res, num);
-		if (retval)
-			goto error;
-	}
+	pdev->dev.of_node = ofdev->dev.of_node;
+	pdev->dev.of_node_reused = true;
 
 	retval = platform_device_add(pdev);
 	if (retval)
