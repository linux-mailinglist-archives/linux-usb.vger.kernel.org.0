Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77C11CA86
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 16:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfENOiQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 10:38:16 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49592 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfENOiO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 10:38:14 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 70AAE1A0130;
        Tue, 14 May 2019 16:38:11 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 63F431A012A;
        Tue, 14 May 2019 16:38:11 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C77E72061C;
        Tue, 14 May 2019 16:38:10 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [RFC PATCH v2 1/3] USB: use genalloc for USB HCs with local memory
Date:   Tue, 14 May 2019 17:38:05 +0300
Message-Id: <20190514143807.7745-2-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514143807.7745-1-laurentiu.tudor@nxp.com>
References: <20190514143807.7745-1-laurentiu.tudor@nxp.com>
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
 drivers/usb/core/buffer.c   | 12 +++++++++++-
 drivers/usb/host/ohci-hcd.c | 23 ++++++++++++++++++-----
 include/linux/usb/hcd.h     |  3 +++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index f641342cdec0..5729801e82e0 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/genalloc.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
@@ -136,6 +137,10 @@ void *hcd_buffer_alloc(
 		if (size <= pool_max[i])
 			return dma_pool_alloc(hcd->pool[i], mem_flags, dma);
 	}
+
+	if (hcd->driver->flags & HCD_LOCAL_MEM)
+		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
+
 	return dma_alloc_coherent(hcd->self.sysdev, size, dma, mem_flags);
 }
 
@@ -165,5 +170,10 @@ void hcd_buffer_free(
 			return;
 		}
 	}
-	dma_free_coherent(hcd->self.sysdev, size, addr, dma);
+
+	if (hcd->driver->flags & HCD_LOCAL_MEM)
+		gen_pool_free(hcd->localmem_pool, (unsigned long)addr,
+			      size);
+	else
+		dma_free_coherent(hcd->self.sysdev, size, addr, dma);
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
index 695931b03684..0fee81ef5d52 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -215,6 +215,9 @@ struct usb_hcd {
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

