Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E692064F
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 13:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbfEPLt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 07:49:58 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44390 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbfEPLt6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 May 2019 07:49:58 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 177252001D3;
        Thu, 16 May 2019 13:49:56 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 09552200061;
        Thu, 16 May 2019 13:49:56 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D9BF205CD;
        Thu, 16 May 2019 13:49:55 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v4 2/3] usb: host: ohci-sm501: init genalloc for local memory
Date:   Thu, 16 May 2019 14:47:20 +0300
Message-Id: <20190516114721.27694-3-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516114721.27694-1-laurentiu.tudor@nxp.com>
References: <20190516114721.27694-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

In preparation for dropping the existing "coherent" dma mem declaration
APIs, replace the current dma_declare_coherent_memory() based mechanism
with the creation of a genalloc pool that will be used in the OHCI
subsystem as replacement for the DMA APIs.

For context, see thread here: https://lkml.org/lkml/2019/4/22/357

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/usb/host/ohci-sm501.c | 68 +++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
index c26228c25f99..1a25f5396e3e 100644
--- a/drivers/usb/host/ohci-sm501.c
+++ b/drivers/usb/host/ohci-sm501.c
@@ -16,6 +16,7 @@
 #include <linux/jiffies.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
+#include <linux/genalloc.h>
 #include <linux/sm501.h>
 #include <linux/sm501-regs.h>
 
@@ -92,6 +93,7 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 	struct resource	*res, *mem;
 	int retval, irq;
 	struct usb_hcd *hcd = NULL;
+	void __iomem *local_mem;
 
 	irq = retval = platform_get_irq(pdev, 0);
 	if (retval < 0)
@@ -110,40 +112,18 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 		goto err0;
 	}
 
-	/* The sm501 chip is equipped with local memory that may be used
-	 * by on-chip devices such as the video controller and the usb host.
-	 * This driver uses dma_declare_coherent_memory() to make sure
-	 * usb allocations with dma_alloc_coherent() allocate from
-	 * this local memory. The dma_handle returned by dma_alloc_coherent()
-	 * will be an offset starting from 0 for the first local memory byte.
-	 *
-	 * So as long as data is allocated using dma_alloc_coherent() all is
-	 * fine. This is however not always the case - buffers may be allocated
-	 * using kmalloc() - so the usb core needs to be told that it must copy
-	 * data into our local memory if the buffers happen to be placed in
-	 * regular memory. The HCD_LOCAL_MEM flag does just that.
-	 */
-
-	retval = dma_declare_coherent_memory(dev, mem->start,
-					 mem->start - mem->parent->start,
-					 resource_size(mem));
-	if (retval) {
-		dev_err(dev, "cannot declare coherent memory\n");
-		goto err1;
-	}
-
 	/* allocate, reserve and remap resources for registers */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
 		dev_err(dev, "no resource definition for registers\n");
 		retval = -ENOENT;
-		goto err2;
+		goto err1;
 	}
 
 	hcd = usb_create_hcd(driver, &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
 		retval = -ENOMEM;
-		goto err2;
+		goto err1;
 	}
 
 	hcd->rsrc_start = res->start;
@@ -164,6 +144,43 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 
 	ohci_hcd_init(hcd_to_ohci(hcd));
 
+	/* The sm501 chip is equipped with local memory that may be used
+	 * by on-chip devices such as the video controller and the usb host.
+	 * This driver uses genalloc so that usb allocations with
+	 * gen_pool_dma_alloc() allocate from this local memory. The dma_handle
+	 * returned by gen_pool_dma_alloc() will be an offset starting from 0
+	 * for the first local memory byte.
+	 *
+	 * So as long as data is allocated using gen_pool_dma_alloc() all is
+	 * fine. This is however not always the case - buffers may be allocated
+	 * using kmalloc() - so the usb core needs to be told that it must copy
+	 * data into our local memory if the buffers happen to be placed in
+	 * regular memory. The HCD_LOCAL_MEM flag does just that.
+	 */
+
+	hcd->localmem_pool = devm_gen_pool_create(dev, PAGE_SHIFT,
+						  dev_to_node(dev),
+						  "ohci-sm501");
+	if (IS_ERR(hcd->localmem_pool)) {
+		retval = PTR_ERR(hcd->localmem_pool);
+		goto err5;
+	}
+
+	local_mem = devm_ioremap(dev, mem->start, resource_size(mem));
+	if (!local_mem) {
+		retval = -ENOMEM;
+		goto err5;
+	}
+
+	retval = gen_pool_add_virt(hcd->localmem_pool,
+				   (unsigned long)local_mem,
+				   mem->start - mem->parent->start,
+				   resource_size(mem),
+				   dev_to_node(dev));
+	if (retval < 0) {
+		dev_err(dev, "failed to add to pool: %d\n", retval);
+		goto err5;
+	}
 	retval = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (retval)
 		goto err5;
@@ -181,8 +198,6 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 err3:
 	usb_put_hcd(hcd);
-err2:
-	dma_release_declared_memory(dev);
 err1:
 	release_mem_region(mem->start, resource_size(mem));
 err0:
@@ -197,7 +212,6 @@ static int ohci_hcd_sm501_drv_remove(struct platform_device *pdev)
 	usb_remove_hcd(hcd);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	usb_put_hcd(hcd);
-	dma_release_declared_memory(&pdev->dev);
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (mem)
 		release_mem_region(mem->start, resource_size(mem));
-- 
2.17.1

