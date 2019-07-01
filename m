Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5A1F2517F
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 16:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfEUOID (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 10:08:03 -0400
Received: from inva020.nxp.com ([92.121.34.13]:47334 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728240AbfEUOH7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 10:07:59 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2E6B91A003B;
        Tue, 21 May 2019 16:07:57 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 213C51A01A2;
        Tue, 21 May 2019 16:07:57 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 956FB20612;
        Tue, 21 May 2019 16:07:56 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v5 5/5] USB: drop HCD_LOCAL_MEM flag
Date:   Tue, 21 May 2019 17:07:48 +0300
Message-Id: <20190521140748.20012-6-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521140748.20012-1-laurentiu.tudor@nxp.com>
References: <20190521140748.20012-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

With the addition of the local memory allocator, the HCD_LOCAL_MEM
flag can be dropped and the checks against it replaced with a check
for the localmem_pool ptr being initialized.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/usb/core/buffer.c      |  8 +++-----
 drivers/usb/core/hcd.c         | 15 ++++++---------
 drivers/usb/host/ehci-hcd.c    |  2 +-
 drivers/usb/host/fotg210-hcd.c |  2 +-
 drivers/usb/host/ohci-hcd.c    |  2 +-
 drivers/usb/host/ohci-sm501.c  |  5 +++--
 drivers/usb/host/ohci-tmio.c   |  2 +-
 drivers/usb/host/uhci-hcd.c    |  2 +-
 include/linux/usb/hcd.h        |  1 -
 9 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/core/buffer.c b/drivers/usb/core/buffer.c
index d2064ad7ad14..1359b78a624e 100644
--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -68,7 +68,7 @@ int hcd_buffer_create(struct usb_hcd *hcd)
 
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
 	    (!is_device_dma_capable(hcd->self.sysdev) &&
-	     !(hcd->driver->flags & HCD_LOCAL_MEM)))
+	     !hcd->localmem_pool))
 		return 0;
 
 	for (i = 0; i < HCD_BUFFER_POOLS; i++) {
@@ -130,8 +130,7 @@ void *hcd_buffer_alloc(
 
 	/* some USB hosts just use PIO */
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
-	    (!is_device_dma_capable(bus->sysdev) &&
-	     !(hcd->driver->flags & HCD_LOCAL_MEM))) {
+	    !is_device_dma_capable(bus->sysdev)) {
 		*dma = ~(dma_addr_t) 0;
 		return kmalloc(size, mem_flags);
 	}
@@ -162,8 +161,7 @@ void hcd_buffer_free(
 	}
 
 	if (!IS_ENABLED(CONFIG_HAS_DMA) ||
-	    (!is_device_dma_capable(bus->sysdev) &&
-	     !(hcd->driver->flags & HCD_LOCAL_MEM))) {
+	    !is_device_dma_capable(bus->sysdev)) {
 		kfree(addr);
 		return;
 	}
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a1aa54f2db20..95b8b7483c3d 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1347,14 +1347,14 @@ EXPORT_SYMBOL_GPL(usb_hcd_unlink_urb_from_ep);
  * using regular system memory - like pci devices doing bus mastering.
  *
  * To support host controllers with limited dma capabilities we provide dma
- * bounce buffers. This feature can be enabled using the HCD_LOCAL_MEM flag.
+ * bounce buffers. This feature can be enabled by initializing
+ * hcd->localmem_pool using usb_hcd_setup_local_mem().
  * For this to work properly the host controller code must first use the
  * function dma_declare_coherent_memory() to point out which memory area
  * that should be used for dma allocations.
  *
- * The HCD_LOCAL_MEM flag then tells the usb code to allocate all data for
- * dma using dma_alloc_coherent() which in turn allocates from the memory
- * area pointed out with dma_declare_coherent_memory().
+ * The initialized hcd->localmem_pool then tells the usb code to allocate all
+ * data for dma using the genalloc API.
  *
  * So, to summarize...
  *
@@ -1364,9 +1364,6 @@ EXPORT_SYMBOL_GPL(usb_hcd_unlink_urb_from_ep);
  *   (a) "normal" kernel memory is no good, and
  *   (b) there's not enough to share
  *
- * - The only *portable* hook for such stuff in the
- *   DMA framework is dma_declare_coherent_memory()
- *
  * - So we use that, even though the primary requirement
  *   is that the memory be "local" (hence addressable
  *   by that device), not "coherent".
@@ -1533,7 +1530,7 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 						urb->setup_dma))
 				return -EAGAIN;
 			urb->transfer_flags |= URB_SETUP_MAP_SINGLE;
-		} else if (hcd->driver->flags & HCD_LOCAL_MEM) {
+		} else if (hcd->localmem_pool) {
 			ret = hcd_alloc_coherent(
 					urb->dev->bus, mem_flags,
 					&urb->setup_dma,
@@ -1603,7 +1600,7 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 				else
 					urb->transfer_flags |= URB_DMA_MAP_SINGLE;
 			}
-		} else if (hcd->driver->flags & HCD_LOCAL_MEM) {
+		} else if (hcd->localmem_pool) {
 			ret = hcd_alloc_coherent(
 					urb->dev->bus, mem_flags,
 					&urb->transfer_dma,
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index cdafa97f632d..9da7e22848c9 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -559,7 +559,7 @@ static int ehci_init(struct usb_hcd *hcd)
 	ehci->command = temp;
 
 	/* Accept arbitrarily long scatter-gather lists */
-	if (!(hcd->driver->flags & HCD_LOCAL_MEM))
+	if (!hcd->localmem_pool)
 		hcd->self.sg_tablesize = ~0;
 
 	/* Prepare for unlinking active QHs */
diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 0da68df259c8..5d74ff61fa4c 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -4995,7 +4995,7 @@ static int hcd_fotg210_init(struct usb_hcd *hcd)
 	fotg210->command = temp;
 
 	/* Accept arbitrarily long scatter-gather lists */
-	if (!(hcd->driver->flags & HCD_LOCAL_MEM))
+	if (!hcd->localmem_pool)
 		hcd->self.sg_tablesize = ~0;
 	return 0;
 }
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index b200b19b44fa..5801858d867e 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -448,7 +448,7 @@ static int ohci_init (struct ohci_hcd *ohci)
 	struct usb_hcd *hcd = ohci_to_hcd(ohci);
 
 	/* Accept arbitrarily long scatter-gather lists */
-	if (!(hcd->driver->flags & HCD_LOCAL_MEM))
+	if (!hcd->localmem_pool)
 		hcd->self.sg_tablesize = ~0;
 
 	if (distrust_firmware)
diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
index b710e100aec9..c158cda9e4b9 100644
--- a/drivers/usb/host/ohci-sm501.c
+++ b/drivers/usb/host/ohci-sm501.c
@@ -49,7 +49,7 @@ static const struct hc_driver ohci_sm501_hc_driver = {
 	 * generic hardware linkage
 	 */
 	.irq =			ohci_irq,
-	.flags =		HCD_USB11 | HCD_MEMORY | HCD_LOCAL_MEM,
+	.flags =		HCD_USB11 | HCD_MEMORY,
 
 	/*
 	 * basic lifecycle operations
@@ -153,7 +153,8 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
 	 * fine. This is however not always the case - buffers may be allocated
 	 * using kmalloc() - so the usb core needs to be told that it must copy
 	 * data into our local memory if the buffers happen to be placed in
-	 * regular memory. The HCD_LOCAL_MEM flag does just that.
+	 * regular memory. A non-null hcd->localmem_pool initialized by the
+	 * the call to usb_hcd_setup_local_mem() below does just that.
 	 */
 
 	if (usb_hcd_setup_local_mem(hcd, mem->start,
diff --git a/drivers/usb/host/ohci-tmio.c b/drivers/usb/host/ohci-tmio.c
index 3b84ce0c3f29..d5a293a707b6 100644
--- a/drivers/usb/host/ohci-tmio.c
+++ b/drivers/usb/host/ohci-tmio.c
@@ -153,7 +153,7 @@ static const struct hc_driver ohci_tmio_hc_driver = {
 
 	/* generic hardware linkage */
 	.irq =			ohci_irq,
-	.flags =		HCD_USB11 | HCD_MEMORY | HCD_LOCAL_MEM,
+	.flags =		HCD_USB11 | HCD_MEMORY,
 
 	/* basic lifecycle operations */
 	.start =		ohci_tmio_start,
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index 98deb5f64268..03bc59755123 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -581,7 +581,7 @@ static int uhci_start(struct usb_hcd *hcd)
 
 	hcd->uses_new_polling = 1;
 	/* Accept arbitrarily long scatter-gather lists */
-	if (!(hcd->driver->flags & HCD_LOCAL_MEM))
+	if (!hcd->localmem_pool)
 		hcd->self.sg_tablesize = ~0;
 
 	spin_lock_init(&uhci->lock);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 292016553760..8f1cca9b660f 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -256,7 +256,6 @@ struct hc_driver {
 
 	int	flags;
 #define	HCD_MEMORY	0x0001		/* HC regs use memory (else I/O) */
-#define	HCD_LOCAL_MEM	0x0002		/* HC needs local memory */
 #define	HCD_SHARED	0x0004		/* Two (or more) usb_hcds share HW */
 #define	HCD_USB11	0x0010		/* USB 1.1 */
 #define	HCD_USB2	0x0020		/* USB 2.0 */
-- 
2.17.1

