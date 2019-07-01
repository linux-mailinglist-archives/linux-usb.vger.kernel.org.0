Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 140C125187
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 16:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbfEUOIH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 10:08:07 -0400
Received: from inva020.nxp.com ([92.121.34.13]:47268 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727812AbfEUOH6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 10:07:58 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 63CD71A00F8;
        Tue, 21 May 2019 16:07:55 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 56B041A003B;
        Tue, 21 May 2019 16:07:55 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id CAE9120612;
        Tue, 21 May 2019 16:07:54 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v5 2/5] USB: use genalloc for USB HCs with local memory
Date:   Tue, 21 May 2019 17:07:45 +0300
Message-Id: <20190521140748.20012-3-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521140748.20012-1-laurentiu.tudor@nxp.com>
References: <20190521140748.20012-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

For HCs that have local memory, replace the current DMA API usage
with a genalloc generic allocator to manage the mappings for these
devices. To help users, introduce a new HCD API,
usb_hcd_setup_local_mem() that will setup up the genalloc backing
up the device local memory. It will be used in subsequent patches.
This is in preparation for dropping the existing "coherent" dma
mem declaration APIs. Current implementation was relying on a short
circuit in the DMA API that in the end, was acting as an allocator
for these type of devices.

For context, see thread here: https://lkml.org/lkml/2019/4/22/357

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/usb/core/buffer.c   |  9 +++++++++
 drivers/usb/core/hcd.c      | 36 ++++++++++++++++++++++++++++++++++++
 drivers/usb/host/ohci-hcd.c | 23 ++++++++++++++++++-----
 drivers/usb/host/ohci-mem.c | 34 ++++++++++++++++++++++++++++++----
 include/linux/usb/hcd.h     |  5 +++++
 5 files changed, 98 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index f641342cdec0..d2064ad7ad14 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/genalloc.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
@@ -124,6 +125,9 @@ void *hcd_buffer_alloc(
 	if (size == 0)
 		return NULL;
 
+	if (hcd->localmem_pool)
+		return gen_pool_dma_alloc(hcd->localmem_pool, size, dma);
+
 	/* some USB hosts just use PIO */
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
 	    (!is_device_dma_capable(bus->sysdev) &&
@@ -152,6 +156,11 @@ void hcd_buffer_free(
 	if (!addr)
 		return;
 
+	if (hcd->localmem_pool) {
+		gen_pool_free(hcd->localmem_pool, (unsigned long)addr, size);
+		return;
+	}
+
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
 	    (!is_device_dma_capable(bus->sysdev) &&
 	     !(hcd->driver->flags & HCD_LOCAL_MEM))) {
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 94d22551fc1b..a1aa54f2db20 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -29,6 +29,8 @@
 #include <linux/workqueue.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
+#include <linux/genalloc.h>
+#include <linux/io.h>
 
 #include <linux/phy/phy.h>
 #include <linux/usb.h>
@@ -3039,6 +3041,40 @@ usb_hcd_platform_shutdown(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_hcd_platform_shutdown);
 
+int usb_hcd_setup_local_mem(struct usb_hcd *hcd, phys_addr_t phys_addr,
+			    dma_addr_t dma, size_t size)
+{
+	int err;
+	void __iomem *local_mem;
+
+	hcd->localmem_pool = devm_gen_pool_create(hcd->self.sysdev, PAGE_SHIFT,
+						  dev_to_node(hcd->self.sysdev),
+						  "ohci-hcd");
+	if (IS_ERR(hcd->localmem_pool))
+		return PTR_ERR(hcd->localmem_pool);
+
+	local_mem = devm_memremap(hcd->self.sysdev, phys_addr,
+				  size, MEMREMAP_WC);
+	if (!local_mem)
+		return -ENOMEM;
+
+	/*
+	 * Here we pass a dma_addr_t but the arg type is a phys_addr_t.
+	 * It's not backed by system memory and thus there's no kernel mapping
+	 * for it.
+	 */
+	err = gen_pool_add_virt(hcd->localmem_pool, (unsigned long)local_mem,
+				dma, size, dev_to_node(hcd->self.sysdev));
+	if (err < 0) {
+		dev_err(hcd->self.sysdev, "gen_pool_add_virt failed with %d\n",
+			err);
+		return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_hcd_setup_local_mem);
+
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_USB_MON)
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 210181fd98d2..b200b19b44fa 100644
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
+	if (hcd->localmem_pool)
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
+		if (hcd->localmem_pool)
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
diff --git a/drivers/usb/host/ohci-mem.c b/drivers/usb/host/ohci-mem.c
index 3965ac0341eb..1805f934ee97 100644
--- a/drivers/usb/host/ohci-mem.c
+++ b/drivers/usb/host/ohci-mem.c
@@ -36,6 +36,12 @@ static void ohci_hcd_init (struct ohci_hcd *ohci)
 
 static int ohci_mem_init (struct ohci_hcd *ohci)
 {
+	if (ohci_to_hcd(ohci)->localmem_pool) {
+		ohci->td_cache = NULL;
+		ohci->ed_cache = NULL;
+		return 0;
+	}
+
 	ohci->td_cache = dma_pool_create ("ohci_td",
 		ohci_to_hcd(ohci)->self.controller,
 		sizeof (struct td),
@@ -84,8 +90,12 @@ td_alloc (struct ohci_hcd *hc, gfp_t mem_flags)
 {
 	dma_addr_t	dma;
 	struct td	*td;
+	struct usb_hcd	*hcd = ohci_to_hcd(hc);
 
-	td = dma_pool_zalloc (hc->td_cache, mem_flags, &dma);
+	if (hcd->localmem_pool)
+		td = gen_pool_dma_zalloc(hcd->localmem_pool, sizeof(*td), &dma);
+	else
+		td = dma_pool_zalloc(hc->td_cache, mem_flags, &dma);
 	if (td) {
 		/* in case hc fetches it, make it look dead */
 		td->hwNextTD = cpu_to_hc32 (hc, dma);
@@ -99,6 +109,7 @@ static void
 td_free (struct ohci_hcd *hc, struct td *td)
 {
 	struct td	**prev = &hc->td_hash [TD_HASH_FUNC (td->td_dma)];
+	struct usb_hcd	*hcd = ohci_to_hcd(hc);
 
 	while (*prev && *prev != td)
 		prev = &(*prev)->td_hash;
@@ -106,7 +117,12 @@ td_free (struct ohci_hcd *hc, struct td *td)
 		*prev = td->td_hash;
 	else if ((td->hwINFO & cpu_to_hc32(hc, TD_DONE)) != 0)
 		ohci_dbg (hc, "no hash for td %p\n", td);
-	dma_pool_free (hc->td_cache, td, td->td_dma);
+
+	if (hcd->localmem_pool)
+		gen_pool_free(hcd->localmem_pool, (unsigned long)td,
+			      sizeof(*td));
+	else
+		dma_pool_free(hc->td_cache, td, td->td_dma);
 }
 
 /*-------------------------------------------------------------------------*/
@@ -117,8 +133,12 @@ ed_alloc (struct ohci_hcd *hc, gfp_t mem_flags)
 {
 	dma_addr_t	dma;
 	struct ed	*ed;
+	struct usb_hcd	*hcd = ohci_to_hcd(hc);
 
-	ed = dma_pool_zalloc (hc->ed_cache, mem_flags, &dma);
+	if (hcd->localmem_pool)
+		ed = gen_pool_dma_zalloc(hcd->localmem_pool, sizeof(*ed), &dma);
+	else
+		ed = dma_pool_zalloc(hc->ed_cache, mem_flags, &dma);
 	if (ed) {
 		INIT_LIST_HEAD (&ed->td_list);
 		ed->dma = dma;
@@ -129,6 +149,12 @@ ed_alloc (struct ohci_hcd *hc, gfp_t mem_flags)
 static void
 ed_free (struct ohci_hcd *hc, struct ed *ed)
 {
-	dma_pool_free (hc->ed_cache, ed, ed->dma);
+	struct usb_hcd	*hcd = ohci_to_hcd(hc);
+
+	if (hcd->localmem_pool)
+		gen_pool_free(hcd->localmem_pool, (unsigned long)ed,
+			      sizeof(*ed));
+	else
+		dma_pool_free(hc->ed_cache, ed, ed->dma);
 }
 
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index bb57b5af4700..292016553760 100644
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
@@ -461,6 +464,8 @@ extern int usb_add_hcd(struct usb_hcd *hcd,
 		unsigned int irqnum, unsigned long irqflags);
 extern void usb_remove_hcd(struct usb_hcd *hcd);
 extern int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1);
+int usb_hcd_setup_local_mem(struct usb_hcd *hcd, phys_addr_t phys_addr,
+			    dma_addr_t dma, size_t size);
 
 struct platform_device;
 extern void usb_hcd_platform_shutdown(struct platform_device *dev);
-- 
2.17.1

