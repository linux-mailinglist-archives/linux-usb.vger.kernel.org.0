Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F4655ACA2
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 22:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbiFYUmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jun 2022 16:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiFYUmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jun 2022 16:42:14 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29AE13F3D
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 13:42:12 -0700 (PDT)
Received: from Cyrus.lan ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.179]) with ESMTPA (Nemesis) id
 1MfHIb-1nT6cq3OcV-00grLW; Sat, 25 Jun 2022 22:41:56 +0200
Date:   Sat, 25 Jun 2022 21:41:51 +0100
From:   Darren Stevens <darren@stevens-zone.net>
To:     linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com
Subject: [PATCH v2 RFC] drivers/usb/host/ehci-fsl: Fix interrupt setup in
 host mode.
Message-ID: <20220625214151.547b3570@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:B16Y/Qez7m1NJOC3FAa/ivJ01TlYQP4wgq+TPKy6fg8yCxoCBP+
 GA9saqxlT1Yn+QeEI55Dn5hnFDszUJDqQSb5VTMas7sIOJg6kGgf7IDGBdnUSPXJyWVoZt3
 9pQJ6qZDVKKB5mQMPCmpywJkp9Hji6/s/tbK0Kytc2vnLvC4RbNdDIHwO2hwsePGUfKkoR5
 T8Vb4ReP8QRexTOZP1baw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:87XENR4Z308=:Lo3ybVcgmUO1omDMiP8j4o
 Twz24r0v/a8kbtH4pA15QGdSiL/BNJwA2oCBELrzoPJThF4HVYhDkSrg7w6F1rhCm0Ucm6yMR
 ujwRmqawIitk+b+0tfyrDMb9XWQLnPA65Uj8M2zHE5pAJfCmfnuyLCl46IfWSOQjX5ytNYgVp
 foAvwf8Q3zwxW+rcGGykEnzQZRpBsIayh/t8zdk7XdP4+hW/aMi3yRS72llvx/6d3VH7Kl7e/
 HmxcuHpYbE14YxN/RoYGtbUs7NicyHmt2VswaX5nf10QYSEfqx27FQL0puIYfl2gatOC5TjmO
 iVPlqREZdwbNT167zhYdl1tbQpkTPlaUhKGH83VApvZi7CEeQ0+XW5FUsM99i1N3ZsH28fAsq
 5bgEMZdJ5ZnPB9kmuMzFBtUO5iUaM4jakXMop+QAKWUXInOAaZ4eBaP84pQxv+hKnIaRo/1OV
 E8FvCds/765hpZGzjtLVSRBojz45FAsFUyPF8RCEm7Twu94Iuj+6A32p/T4QiBI5FiyxKGOQL
 c4AsJQLLDqYlcj9MlNjlC5K61rd1zXPDAqvmR5uGG2oAgkIVcOkK3j/IMRJlMvLfTPuiw3DbV
 f/XP3t8RTnrGWJyOBAmp9+KQcvTAN9UUOhSZs0Ph5BZVS1uRnfo7anHaYU4b11L+wyo9TPCXl
 j+0f7igfzV8gQ50V9LGdEgLOBA3NXJJmR8A8eALVCoVLSfyas1yxI135lNCx6xOv38rAimlm+
 Okz2+CQOZHsjDpI01ymzVqtAWyt0CYXkgXrq94vOalVsZT9PNCIlP1juerg=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
core) we stopped platform_get_resource() from returning the IRQ, as all
drivers were supposed to have switched to platform_get_irq()
Unfortunately the Freescale EHCI driver in host mode got missed. Fix
it. Also fix allocation of resources to work with current kernel.

Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by Darren Stevens <darren@stevens-zone.net>
---
 v2 - Fixed coding style, removed a couple of unneeded initializations,
      cc'd Layerscape maintainers.

Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 385be30..8bd258a 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/fsl_devices.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
 #include <linux/io.h>
 
 #include "ehci.h"
@@ -46,9 +47,10 @@ static struct hc_driver __read_mostly fsl_ehci_hc_driver;
  */
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
@@ -76,14 +78,9 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev,
-			"Found HC with no IRQ. Check %s setup!\n",
-			dev_name(&pdev->dev));
-		return -ENODEV;
-	}
-	irq = res->start;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
 			       &pdev->dev, dev_name(&pdev->dev), NULL);
@@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
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
 
diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 44a7e58..766e4ab 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
 					const char *name, int id)
 {
 	struct platform_device *pdev;
-	const struct resource *res = ofdev->resource;
-	unsigned int num = ofdev->num_resources;
 	int retval;
 
 	pdev = platform_device_alloc(name, id);
@@ -106,11 +104,8 @@ static struct platform_device *fsl_usb2_device_register(
 	if (retval)
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
