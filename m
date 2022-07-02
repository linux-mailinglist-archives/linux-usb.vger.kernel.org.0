Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C775642CB
	for <lists+linux-usb@lfdr.de>; Sat,  2 Jul 2022 23:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiGBVET (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Jul 2022 17:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiGBVES (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Jul 2022 17:04:18 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FE4DE8F
        for <linux-usb@vger.kernel.org>; Sat,  2 Jul 2022 14:04:14 -0700 (PDT)
Received: from Cyrus.lan ([86.151.31.128]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.179]) with ESMTPA (Nemesis) id
 1Mqrjz-1nlpiW0UXx-00mqvZ; Sat, 02 Jul 2022 23:03:57 +0200
Date:   Sat, 2 Jul 2022 22:03:55 +0100
From:   Darren Stevens <darren@stevens-zone.net>
To:     linuxppc-dev@lists.ozlabs.org, oss@buserror.net,
        chzigotzky@xenosoft.de, robh@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com
Subject: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in host
 mode.
Message-ID: <20220702220355.63b36fb8@Cyrus.lan>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; powerpc-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7dP2sXcx+tU1+/TK79yzyTjl/O/pWtJa8WSayWZhp5S7eX3nEwZ
 afTpN6tXjGqRooJMr+bEZLB1jXf7XbtJdJUVXUK3CsI78xgvFzsAkIy1K/wSjWbMTKCOahn
 i1S+CpXI25tmplwOGpNqWt+lC6JWA5SSQ9ihdu+1dhKqHD8JAJPVhgT9caMizZkUGa+zGmc
 TsJ+CfUxgzkQtOoHvGbPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:waBTCM5aggM=:MYE3wOGLouHP+Ua+1kPWs1
 xz+CRH8yUyBTCC14DqB4UqTHr3lXxjr3MiMRUQIAJ7Gs7aPcJfvNPd3lsyJtti5sUsfR9leZW
 7W5wLeOsMYRDtGGWj+NMZkZFoXHptKpIonkGZrlYUD+8x+AZirWRqEDcC+0nLqr/7iOFi1My+
 WOcAB25IypiG8eW9haPNRqowIp7X4JtMiQIzIihApyVO+1HhChCES1SiYeoIYjCJqtWZzpEtZ
 qhgeTCgpEi2GNQp9KAdvHmleP/sCLUkSdI1QqYxdvVYaIZy9a+9NkdT0iQQ+LbMEk3dWGOIiK
 5FS8QOrvLyGRoP30dKla3wEdh+fNS6E5Ma8005xgv6VU5MCXiRtSDeY3mYooDIjhNeCdt9S2j
 d3dpYLs7a68d185C498TpxiNuaIR7oeb6Yn2OKo5qVL/BtQHRpmL0xI1pMciMUXsxbPulCvgU
 Ry5dgHWjCnLhvGoisU5/woug9pZGX5IzSCGO2eYYjhPTEMPTePtzyC6IDHA/UCk4rKSpQ1B8k
 y//+kL1orzxwmh1NhMAoW8q53cAIrN97p7MxAUaUbyJdtysQp+1RmOVET/YHnhxTFl2pYx4mx
 VBgcg1ERy6HprJK0a/njX2P0NyVb8t3oP8crBjTdnR01i7LwERDgCJ6lHBlnCuWb7ozqnEcfn
 3bJIPuvmDZS+f7Lvu4L0KJkQh/U25xtf2YekXraVVjxDm624lLmIOhLlT0qiDccUOKipn1bWP
 R7iMLdZYZOLPmqG1GWr7LVTFZeekypYkJJfPHnKuT+M1U8d0mXV3FHPgdHI=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
core) we stopped platform_get_resource() from returning the IRQ, as all
drivers were supposed to have switched to platform_get_irq()
Unfortunately the Freescale EHCI driver in host mode got missed. Fix
it.

Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Darren Stevens <darren@stevens-zone.net>
---
 v3 - Corrected resource allocation in fsl-mph-dr-of.c

 v2 - Fixed coding style, removed a couple of unneeded initializations,
      cc'd Layerscape maintainers.

Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring 
(in fsl-mph-dr-of.c)

diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
index 385be30..896c0d1 100644
--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -76,14 +76,9 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
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
diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 44a7e58..e5df175 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -112,6 +112,9 @@ static struct platform_device *fsl_usb2_device_register(
 			goto error;
 	}
 
+	pdev->dev.of_node = ofdev->dev.of_node;
+	pdev->dev.of_node_reused = true;
+
 	retval = platform_device_add(pdev);
 	if (retval)
 		goto error;
