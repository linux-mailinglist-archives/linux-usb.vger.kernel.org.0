Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8BA10DE55
	for <lists+linux-usb@lfdr.de>; Sat, 30 Nov 2019 18:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfK3Q7D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Nov 2019 11:59:03 -0500
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:36196 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfK3Q7D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Nov 2019 11:59:03 -0500
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Nov 2019 11:59:02 EST
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CE7E93F387;
        Sat, 30 Nov 2019 17:50:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pmZ0-gJSoEzq; Sat, 30 Nov 2019 17:50:56 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E077F3F360;
        Sat, 30 Nov 2019 17:50:55 +0100 (CET)
Date:   Sat, 30 Nov 2019 17:50:55 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191130165055.GA46622@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix commit 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of
guestimating DMA capabilities") where local memory USB drivers
erroneously allocate DMA memory instead of pool memory, causing

	OHCI Unrecoverable Error, disabled
	HC died; cleaning up

The order between hcd_uses_dma() and hcd->localmem_pool is now
arranged as in hcd_buffer_alloc() and hcd_buffer_free(), with the
test for hcd->localmem_pool placed first.

As an alternative, one might consider adjusting hcd_uses_dma() with

 static inline bool hcd_uses_dma(struct usb_hcd *hcd)
 {
-	return IS_ENABLED(CONFIG_HAS_DMA) && (hcd->driver->flags & HCD_DMA);
+	return IS_ENABLED(CONFIG_HAS_DMA) &&
+		(hcd->driver->flags & HCD_DMA) &&
+		(hcd->localmem_pool == NULL);
 }

One can also consider unsetting HCD_DMA for local memory pool drivers.

Fixes: 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities") where local memory USB drivers
Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/usb/core/hcd.c         | 42 +++++++++++++++++-----------------
 drivers/usb/storage/scsiglue.c |  3 ++-
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index f225eaa98ff8..d0f45600b669 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1409,7 +1409,17 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 	if (usb_endpoint_xfer_control(&urb->ep->desc)) {
 		if (hcd->self.uses_pio_for_control)
 			return ret;
-		if (hcd_uses_dma(hcd)) {
+		if (hcd->localmem_pool) {
+			ret = hcd_alloc_coherent(
+					urb->dev->bus, mem_flags,
+					&urb->setup_dma,
+					(void **)&urb->setup_packet,
+					sizeof(struct usb_ctrlrequest),
+					DMA_TO_DEVICE);
+			if (ret)
+				return ret;
+			urb->transfer_flags |= URB_SETUP_MAP_LOCAL;
+		} else if (hcd_uses_dma(hcd)) {
 			if (is_vmalloc_addr(urb->setup_packet)) {
 				WARN_ONCE(1, "setup packet is not dma capable\n");
 				return -EAGAIN;
@@ -1427,23 +1437,22 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 						urb->setup_dma))
 				return -EAGAIN;
 			urb->transfer_flags |= URB_SETUP_MAP_SINGLE;
-		} else if (hcd->localmem_pool) {
-			ret = hcd_alloc_coherent(
-					urb->dev->bus, mem_flags,
-					&urb->setup_dma,
-					(void **)&urb->setup_packet,
-					sizeof(struct usb_ctrlrequest),
-					DMA_TO_DEVICE);
-			if (ret)
-				return ret;
-			urb->transfer_flags |= URB_SETUP_MAP_LOCAL;
 		}
 	}
 
 	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 	if (urb->transfer_buffer_length != 0
 	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
-		if (hcd_uses_dma(hcd)) {
+		if (hcd->localmem_pool) {
+			ret = hcd_alloc_coherent(
+					urb->dev->bus, mem_flags,
+					&urb->transfer_dma,
+					&urb->transfer_buffer,
+					urb->transfer_buffer_length,
+					dir);
+			if (ret == 0)
+				urb->transfer_flags |= URB_MAP_LOCAL;
+		} else if (hcd_uses_dma(hcd)) {
 			if (urb->num_sgs) {
 				int n;
 
@@ -1497,15 +1506,6 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 				else
 					urb->transfer_flags |= URB_DMA_MAP_SINGLE;
 			}
-		} else if (hcd->localmem_pool) {
-			ret = hcd_alloc_coherent(
-					urb->dev->bus, mem_flags,
-					&urb->transfer_dma,
-					&urb->transfer_buffer,
-					urb->transfer_buffer_length,
-					dir);
-			if (ret == 0)
-				urb->transfer_flags |= URB_MAP_LOCAL;
 		}
 		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
 				URB_SETUP_MAP_LOCAL)))
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 54a3c8195c96..2adcabe060c5 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -135,7 +135,8 @@ static int slave_configure(struct scsi_device *sdev)
 	 * For such controllers we need to make sure the block layer sets
 	 * up bounce buffers in addressable memory.
 	 */
-	if (!hcd_uses_dma(bus_to_hcd(us->pusb_dev->bus)))
+	if (!hcd_uses_dma(bus_to_hcd(us->pusb_dev->bus)) ||
+			(bus_to_hcd(us->pusb_dev->bus)->localmem_pool != NULL))
 		blk_queue_bounce_limit(sdev->request_queue, BLK_BOUNCE_HIGH);
 
 	/*
-- 
2.23.0

