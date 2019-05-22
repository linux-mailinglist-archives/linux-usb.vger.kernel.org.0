Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33BDC262FD
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 13:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfEVLbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 07:31:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:39534 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728335AbfEVLbp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 07:31:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 04:31:44 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2019 04:31:43 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 4/5] xhci: Fix immediate data transfer if buffer is already DMA mapped
Date:   Wed, 22 May 2019 14:34:00 +0300
Message-Id: <1558524841-25397-5-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci immediate data transfer (IDT) support in 5.2-rc1 caused regression
on various Samsung Exynos boards with ASIX USB 2.0 ethernet dongle.

If the transfer buffer in the URB is already DMA mapped then IDT should
not be used. urb->transfer_dma will already contain a valid dma address,
and there is no guarantee the data in urb->transfer_buffer is valid.

The IDT support patch used urb->transfer_dma as a temporary storage,
copying data from urb->transfer_buffer into it.

Issue was solved by preventing IDT if transfer buffer is already dma
mapped, and by not using urb->transfer_dma as temporary storage.

Fixes: 33e39350ebd2 ("usb: xhci: add Immediate Data Transfer support")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 9 ++++++---
 drivers/usb/host/xhci.h      | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ef7c869..88392aa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3432,11 +3432,14 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	if (urb->transfer_buffer_length > 0) {
 		u32 length_field, remainder;
+		u64 addr;
 
 		if (xhci_urb_suitable_for_idt(urb)) {
-			memcpy(&urb->transfer_dma, urb->transfer_buffer,
+			memcpy(&addr, urb->transfer_buffer,
 			       urb->transfer_buffer_length);
 			field |= TRB_IDT;
+		} else {
+			addr = (u64) urb->transfer_dma;
 		}
 
 		remainder = xhci_td_remainder(xhci, 0,
@@ -3449,8 +3452,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
-				lower_32_bits(urb->transfer_dma),
-				upper_32_bits(urb->transfer_dma),
+				lower_32_bits(addr),
+				upper_32_bits(addr),
 				length_field,
 				field | ep_ring->cycle_state);
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a450a99..7f8b950 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2160,7 +2160,8 @@ static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
 {
 	if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
 	    usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
-	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
+	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
+	    !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
 		return true;
 
 	return false;
-- 
2.7.4

