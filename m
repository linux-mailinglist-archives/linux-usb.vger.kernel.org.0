Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A90B2D27A4
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 10:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729002AbgLHJ3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 04:29:50 -0500
Received: from mga06.intel.com ([134.134.136.31]:9885 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgLHJ3u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 04:29:50 -0500
IronPort-SDR: FOwFAEK9AwQAzwZwPhZekZhPuZhjZOwj8r8jru7TSFa1aBcncSxK4QIxl1IiUyv+vTQvCOCUAh
 0mp4fhr6AJig==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235460685"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="235460685"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 01:28:02 -0800
IronPort-SDR: n3PAaqVZebDjQE26v4DLpiVnrYjZo2x7gpqyE5yl95303ON44aSmy+c9r6tN3+sOzUslvDpeeX
 +eDv/lzk8KUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="552165891"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2020 01:28:00 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Tejas Joglekar <joglekar@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/5] usb: xhci: Use temporary buffer to consolidate SG
Date:   Tue,  8 Dec 2020 11:29:09 +0200
Message-Id: <20201208092912.1773650-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
References: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tejas Joglekar <Tejas.Joglekar@synopsys.com>

The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
for HS. The controller loads and updates the TRB cache from the transfer
ring in system memory whenever the driver issues a start transfer or
update transfer command.

For chained TRBs, the Synopsys xHC requires that the total amount of
bytes for all TRBs loaded in the TRB cache be greater than or equal to 1
MPS. Or the chain ends within the TRB cache (with a last TRB).

If this requirement is not met, the controller will not be able to send
or receive a packet and it will hang causing a driver timeout and error.

This can be a problem if a class driver queues SG requests with many
small-buffer entries. The XHCI driver will create a chained TRB for each
entry which may trigger this issue.

This patch adds logic to the XHCI driver to detect and prevent this from
happening.

For every (TRB_CACHE_SIZE - 2), we check the total buffer size of
the SG list and if the last window of (TRB_CACHE_SIZE - 2) SG list length
and we don't make up at least 1 MPS, we create a temporary buffer to
consolidate full SG list into the buffer.

We check at (TRB_CACHE_SIZE - 2) window because it is possible that there
would be a link and/or event data TRB that take up to 2 of the cache
entries.

We discovered this issue with devices on other platforms but have not
yet come across any device that triggers this on Linux. But it could be
a real problem now or in the future. All it takes is N number of small
chained TRBs. And other instances of the Synopsys IP may have smaller
values for the TRB_CACHE_SIZE which would exacerbate the problem.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c |   2 +-
 drivers/usb/host/xhci.c      | 129 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |   4 ++
 3 files changed, 133 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 167dae117f73..6d4dae5e5f21 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3325,7 +3325,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	full_len = urb->transfer_buffer_length;
 	/* If we have scatter/gather list, we use it. */
-	if (urb->num_sgs) {
+	if (urb->num_sgs && !(urb->transfer_flags & URB_DMA_MAP_SINGLE)) {
 		num_sgs = urb->num_mapped_sgs;
 		sg = urb->sg;
 		addr = (u64) sg_dma_address(sg);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d4a8d0efbbc4..5b0b5f1bb40d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1259,6 +1259,108 @@ EXPORT_SYMBOL_GPL(xhci_resume);
 
 /*-------------------------------------------------------------------------*/
 
+static int xhci_map_temp_buffer(struct usb_hcd *hcd, struct urb *urb)
+{
+	void *temp;
+	int ret = 0;
+	unsigned int buf_len;
+	enum dma_data_direction dir;
+
+	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	buf_len = urb->transfer_buffer_length;
+
+	temp = kzalloc_node(buf_len, GFP_ATOMIC,
+			    dev_to_node(hcd->self.sysdev));
+
+	if (usb_urb_dir_out(urb))
+		sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
+				   temp, buf_len, 0);
+
+	urb->transfer_buffer = temp;
+	urb->transfer_dma = dma_map_single(hcd->self.sysdev,
+					   urb->transfer_buffer,
+					   urb->transfer_buffer_length,
+					   dir);
+
+	if (dma_mapping_error(hcd->self.sysdev,
+			      urb->transfer_dma)) {
+		ret = -EAGAIN;
+		kfree(temp);
+	} else {
+		urb->transfer_flags |= URB_DMA_MAP_SINGLE;
+	}
+
+	return ret;
+}
+
+static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
+					  struct urb *urb)
+{
+	bool ret = false;
+	unsigned int i;
+	unsigned int len = 0;
+	unsigned int trb_size;
+	unsigned int max_pkt;
+	struct scatterlist *sg;
+	struct scatterlist *tail_sg;
+
+	tail_sg = urb->sg;
+	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+
+	if (!urb->num_sgs)
+		return ret;
+
+	if (urb->dev->speed >= USB_SPEED_SUPER)
+		trb_size = TRB_CACHE_SIZE_SS;
+	else
+		trb_size = TRB_CACHE_SIZE_HS;
+
+	if (urb->transfer_buffer_length != 0 &&
+	    !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
+		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
+			len = len + sg->length;
+			if (i > trb_size - 2) {
+				len = len - tail_sg->length;
+				if (len < max_pkt) {
+					ret = true;
+					break;
+				}
+
+				tail_sg = sg_next(tail_sg);
+			}
+		}
+	}
+	return ret;
+}
+
+static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
+{
+	unsigned int len;
+	unsigned int buf_len;
+	enum dma_data_direction dir;
+
+	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+	buf_len = urb->transfer_buffer_length;
+
+	if (IS_ENABLED(CONFIG_HAS_DMA) &&
+	    (urb->transfer_flags & URB_DMA_MAP_SINGLE))
+		dma_unmap_single(hcd->self.sysdev,
+				 urb->transfer_dma,
+				 urb->transfer_buffer_length,
+				 dir);
+
+	if (usb_urb_dir_in(urb))
+		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
+					   urb->transfer_buffer,
+					   buf_len,
+					   0);
+
+	urb->transfer_flags &= ~URB_DMA_MAP_SINGLE;
+	kfree(urb->transfer_buffer);
+	urb->transfer_buffer = NULL;
+}
+
 /*
  * Bypass the DMA mapping if URB is suitable for Immediate Transfer (IDT),
  * we'll copy the actual data into the TRB address register. This is limited to
@@ -1268,13 +1370,37 @@ EXPORT_SYMBOL_GPL(xhci_resume);
 static int xhci_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 				gfp_t mem_flags)
 {
+	struct xhci_hcd *xhci;
+
+	xhci = hcd_to_xhci(hcd);
+
 	if (xhci_urb_suitable_for_idt(urb))
 		return 0;
 
+	if (xhci->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK) {
+		if (xhci_urb_temp_buffer_required(hcd, urb))
+			return xhci_map_temp_buffer(hcd, urb);
+	}
 	return usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
 }
 
-/*
+static void xhci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
+{
+	struct xhci_hcd *xhci;
+	bool unmap_temp_buf = false;
+
+	xhci = hcd_to_xhci(hcd);
+
+	if (urb->num_sgs && (urb->transfer_flags & URB_DMA_MAP_SINGLE))
+		unmap_temp_buf = true;
+
+	if ((xhci->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK) && unmap_temp_buf)
+		xhci_unmap_temp_buf(hcd, urb);
+	else
+		usb_hcd_unmap_urb_for_dma(hcd, urb);
+}
+
+/**
  * xhci_get_endpoint_index - Used for passing endpoint bitmasks between the core and
  * HCDs.  Find the index for an endpoint given its descriptor.  Use the return
  * value to right shift 1 for the bitmask.
@@ -5329,6 +5455,7 @@ static const struct hc_driver xhci_hc_driver = {
 	 * managing i/o requests and associated device resources
 	 */
 	.map_urb_for_dma =      xhci_map_urb_for_dma,
+	.unmap_urb_for_dma =    xhci_unmap_urb_for_dma,
 	.urb_enqueue =		xhci_urb_enqueue,
 	.urb_dequeue =		xhci_urb_dequeue,
 	.alloc_dev =		xhci_alloc_dev,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d90c0d5df3b3..25e57bc9c3cc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1330,6 +1330,10 @@ enum xhci_setup_dev {
 #define TRB_SIA			(1<<31)
 #define TRB_FRAME_ID(p)		(((p) & 0x7ff) << 20)
 
+/* TRB cache size for xHC with TRB cache */
+#define TRB_CACHE_SIZE_HS	8
+#define TRB_CACHE_SIZE_SS	16
+
 struct xhci_generic_trb {
 	__le32 field[4];
 };
-- 
2.25.1

