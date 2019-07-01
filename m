Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E57512064E
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 13:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfEPLt6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 07:49:58 -0400
Received: from inva020.nxp.com ([92.121.34.13]:46092 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbfEPLt6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 May 2019 07:49:58 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7ACD91A00A9;
        Thu, 16 May 2019 13:49:55 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6DD4C1A001D;
        Thu, 16 May 2019 13:49:55 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id E1B02205CD;
        Thu, 16 May 2019 13:49:54 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v4 1/3] USB: use genalloc for USB HCs with local memory
Date:   Thu, 16 May 2019 14:47:19 +0300
Message-Id: <20190516114721.27694-2-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516114721.27694-1-laurentiu.tudor@nxp.com>
References: <20190516114721.27694-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

For HCs that have local memory, replace the current DMA API usage
with a genalloc generic allocator to manage the mappings for these
devices.
This is in preparation for dropping the existing "coherent" dma
mem declaration APIs. Current implementation was relying on a short
circuit in the DMA API that in the end, was acting as an allocator
for these type of devices.

For context, see thread here: https://lkml.org/lkml/2019/4/22/357

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/usb/core/buffer.c   | 15 +++++++++++----
 drivers/usb/host/ohci-hcd.c | 23 ++++++++++++++++++-----
 include/linux/usb/hcd.h     |  3 +++
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index f641342cdec0..22a8f3f5679b 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/genalloc.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
@@ -124,10 +125,12 @@ void *hcd_buffer_alloc(
 	if (size == 0)
 		return NULL;
 
+	if (hcd->driver->flags & HCD_LOCAL_MEM)
+		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
+
 	/* some USB hosts just use PIO */
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
-	    (!is_device_dma_capable(bus->sysdev) &&
-	     !(hcd->driver->flags & HCD_LOCAL_MEM))) {
+	    !is_device_dma_capable(bus->sysdev)) {
 		*dma = ~(dma_addr_t) 0;
 		return kmalloc(size, mem_flags);
 	}
@@ -152,9 +155,13 @@ void hcd_buffer_free(
 	if (!addr)
 		return;
 
+	if (hcd->driver->flags & HCD_LOCAL_MEM) {
+		gen_pool_free(hcd->localmem_pool, (unsigned long)addr, size);
+		return;
+	}
+
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
-	    (!is_device_dma_capable(bus->sysdev) &&
-	     !(hcd->driver->flags & HCD_LOCAL_MEM))) {
+	    !is_device_dma_capable(bus->sysdev)) {
 		kfree(addr);
 		return;
 	}
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 210181fd98d2..f9462c372943 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -40,6 +40,7 @@
 #include <linux/dmapool.h>
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
+#include <linux/genalloc.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -505,8 +506,15 @@ static int ohci_init (struct ohci_hcd *ohci)
 	timer_setup(&ohci->io_watchdog, io_watchdog_func, 0);
 	ohci->prev_frame_no = IO_WATCHDOG_OFF;
 
-	ohci->hcca = dma_alloc_coherent (hcd->self.controller,
-			sizeof(*ohci->hcca), &ohci->hcca_dma, GFP_KERNEL);
+	if (hcd->driver->flags & HCD_LOCAL_MEM)
+		ohci->hcca = gen_pool_dma_alloc(hcd->localmem_pool,
+						sizeof(*ohci->hcca),
+						&ohci->hcca_dma);
+	else
+		ohci->hcca = dma_alloc_coherent(hcd->self.controller,
+						sizeof(*ohci->hcca),
+						&ohci->hcca_dma,
+						GFP_KERNEL);
 	if (!ohci->hcca)
 		return -ENOMEM;
 
@@ -990,9 +998,14 @@ static void ohci_stop (struct usb_hcd *hcd)
 	remove_debug_files (ohci);
 	ohci_mem_cleanup (ohci);
 	if (ohci->hcca) {
-		dma_free_coherent (hcd->self.controller,
-				sizeof *ohci->hcca,
-				ohci->hcca, ohci->hcca_dma);
+		if (hcd->driver->flags & HCD_LOCAL_MEM)
+			gen_pool_free(hcd->localmem_pool,
+				      (unsigned long)ohci->hcca,
+				      sizeof(*ohci->hcca));
+		else
+			dma_free_coherent(hcd->self.controller,
+					  sizeof(*ohci->hcca),
+					  ohci->hcca, ohci->hcca_dma);
 		ohci->hcca = NULL;
 		ohci->hcca_dma = 0;
 	}
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index bb57b5af4700..1b0fc3cebc08 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -216,6 +216,9 @@ struct usb_hcd {
 #define	HC_IS_RUNNING(state) ((state) & __ACTIVE)
 #define	HC_IS_SUSPENDED(state) ((state) & __SUSPEND)
 
+	/* allocator for HCs having local memory */
+	struct gen_pool         *localmem_pool;
+
 	/* more shared queuing code would be good; it should support
 	 * smarter scheduling, handle transaction translators, etc;
 	 * input size of periodic table to an interrupt scheduler.
-- 
2.17.1

