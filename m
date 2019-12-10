Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F09118EFD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 18:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfLJR3K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 12:29:10 -0500
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:42878 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLJR3J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 12:29:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 1E1C240F6E;
        Tue, 10 Dec 2019 18:29:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mJTN02ncIR5s; Tue, 10 Dec 2019 18:29:06 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 19CD240F6D;
        Tue, 10 Dec 2019 18:29:05 +0100 (CET)
Date:   Tue, 10 Dec 2019 18:29:05 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org
Subject: [PATCH v2] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191210172905.GA52526@sx9>
References: <20191130165055.GA46622@sx9>
 <20191210112210.GA3774386@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191210112210.GA3774386@kroah.com>
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

Fixes: 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
Hi Greg,

> This patch doesn't apply against 5.5-rc1, can you refresh it and resend?

Sure, please find updated patch v2 attached below.

Changes in v2:
- Update to v5.5-rc1 resolving conflict with commit b3d53f5fce5d ("usb: core: Remove redundant vmap checks")
- Fix "Fixes:" line
- Add "Cc: stable <stable@vger.kernel.org>"
---
 drivers/usb/core/hcd.c         | 42 +++++++++++++++++-----------------
 drivers/usb/storage/scsiglue.c |  3 ++-
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 281568d464f9..aa45840d8273 100644
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
 			if (object_is_on_stack(urb->setup_packet)) {
 				WARN_ONCE(1, "setup packet is on stack\n");
 				return -EAGAIN;
@@ -1424,23 +1434,22 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
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
 
@@ -1491,15 +1500,6 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
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
index 66a4dcbbb1fc..f4c2359abb1b 100644
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

