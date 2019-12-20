Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94A5D127BD5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 14:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLTNjT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 08:39:19 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:43242 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfLTNjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 08:39:18 -0500
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EC570C093A;
        Fri, 20 Dec 2019 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576849157; bh=lMH5XqgvNFCQGuraVAopUHeQ/FOuLz90QI5Zl2GAUjk=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=EpTbYrOtVmpCex/7MuKAG2Mk67La1gNPHQkMJBr7SZ/kSLG941/sLC3TKvnmU/ltX
         HFo5PVJNF8OU9xSZE3+537Xi/U4DtU9NV+kcZk2tQYwRe9liWaJEi/l6HkZ0YlhyNg
         3pwh2BWIl8P3IobFYhblwg2/y20Z+LXRJOkwdDu1iTyDoCRxhhmgvqypZotl8baLPF
         HWXDYNN3F/ikEVtvFH1TMTc6UI63fC1MfjHS+uK3LE6e0D7Om0cFGiZabC41SriB5I
         fOPQLuynyH3S8CG6yrVYUqvOgaKAMmXvPB7hYUtHT/nWK7dhLuhXhp3v/WCExFiKEc
         JnjsJUKYJMF2w==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.144.133.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id E6D3AA0057;
        Fri, 20 Dec 2019 13:39:13 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 20 Dec 2019 19:09:11 +0530
Date:   Fri, 20 Dec 2019 19:09:11 +0530
Message-Id: <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
In-Reply-To: <cover.1576848504.git.joglekar@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

For every (TRB_CACHE_SIZE - 2) TRBs, we check the total buffer size of
the TRBs and if the chain continues and we don't make up at least 1 MPS,
we create a bounce buffer to consolidate up to the next (4 * MPS) TRBs
into the last TRB.

We check at (TRB_CACHE_SIZE - 2) because it is possible that there would
be a link and/or event data TRB that take up to 2 of the cache entries.
And we consolidate the next (4 * MPS) to improve performance.

We discovered this issue with devices on other platforms but have not
yet come across any device that triggers this on Linux. But it could be
a real problem now or in the future. All it takes is N number of small
chained TRBs. And other instances of the Synopsys IP may have smaller
values for the TRB_CACHE_SIZE which would exacerbate the problem.

We verified this patch using our internal driver and testing framework.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/host/xhci-ring.c | 278 +++++++++++++++++++++++++++++++++++++++++--
 drivers/usb/host/xhci.c      |   3 +
 drivers/usb/host/xhci.h      |  23 ++++
 3 files changed, 296 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d23f7408c81f..94e4ed5a17c0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -690,6 +690,65 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	seg->bounce_offs = 0;
 }
 
+static void xhci_unmap_consolidated_trbs(struct xhci_hcd *xhci,
+					 struct xhci_ring *ring,
+					 struct xhci_td *td)
+{
+	struct device *sysdev = xhci_to_hcd(xhci)->self.sysdev;
+	struct bounce_trb *bounce_trb;
+	struct bounce_trb *tmp;
+	struct urb *urb = td->urb;
+	size_t len;
+	unsigned long flags;
+	unsigned int max_pkt;
+	enum dma_data_direction direction;
+
+	if (!ring || !urb)
+		return;
+
+	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+
+	if (usb_urb_dir_out(urb))
+		direction = DMA_TO_DEVICE;
+	else
+		direction = DMA_FROM_DEVICE;
+
+	spin_lock_irqsave(&td->lock, flags);
+	list_for_each_entry_safe(bounce_trb, tmp,
+				 &td->bounce_trb_list,
+				 entry) {
+		if (bounce_trb->len > max_pkt)
+			dma_unmap_single(sysdev, bounce_trb->dma,
+					 ring->bounce_buf_len * 4,
+					 direction);
+		else
+			dma_unmap_single(sysdev, bounce_trb->dma,
+					 ring->bounce_buf_len,
+					 direction);
+
+		if (usb_urb_dir_in(urb)) {
+			/*
+			 * For IN direction we need to copy
+			 * the data from bounce to sg
+			 */
+			len = sg_pcopy_from_buffer(urb->sg,
+						   urb->num_sgs,
+						   bounce_trb->buf,
+						   bounce_trb->len,
+						   bounce_trb->offs);
+			if (len != bounce_trb->len)
+				xhci_warn(xhci,
+					  "WARN Wrong buffer read length: %zu != %d\n",
+					  len, bounce_trb->len);
+		}
+		list_del(&bounce_trb->entry);
+		kfree(bounce_trb->buf);
+		kfree(bounce_trb);
+	}
+
+	spin_unlock_irqrestore(&td->lock, flags);
+}
+
 /*
  * When we get a command completion for a Stop Endpoint Command, we need to
  * unlink any cancelled TDs from the ring.  There are two ways to do that:
@@ -821,6 +880,9 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 		 * just overwrite it (because the URB has been unlinked).
 		 */
 		ep_ring = xhci_urb_to_transfer_ring(xhci, cur_td->urb);
+		if (xhci->quirks & XHCI_CONSOLIDATE_TRBS)
+			xhci_unmap_consolidated_trbs(xhci, ep_ring,
+						     cur_td);
 		xhci_unmap_td_bounce_buffer(xhci, ep_ring, cur_td);
 		inc_td_cnt(cur_td->urb);
 		if (last_td_in_urb(cur_td))
@@ -847,8 +909,10 @@ static void xhci_kill_ring_urbs(struct xhci_hcd *xhci, struct xhci_ring *ring)
 		if (!list_empty(&cur_td->cancelled_td_list))
 			list_del_init(&cur_td->cancelled_td_list);
 
+		if (xhci->quirks & XHCI_CONSOLIDATE_TRBS)
+			xhci_unmap_consolidated_trbs(xhci, ring,
+						     cur_td);
 		xhci_unmap_td_bounce_buffer(xhci, ring, cur_td);
-
 		inc_td_cnt(cur_td->urb);
 		if (last_td_in_urb(cur_td))
 			xhci_giveback_urb_in_irq(xhci, cur_td, -ESHUTDOWN);
@@ -1905,6 +1969,10 @@ static int xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 	/* Clean up the endpoint's TD list */
 	urb = td->urb;
 
+	/* If TRB consolidation has happened then unmap consolidated buffer */
+	if (xhci->quirks & XHCI_CONSOLIDATE_TRBS)
+		xhci_unmap_consolidated_trbs(xhci, ep_ring, td);
+
 	/* if a bounce buffer was used to align this td then unmap it */
 	xhci_unmap_td_bounce_buffer(xhci, ep_ring, td);
 
@@ -3008,6 +3076,7 @@ static int prepare_transfer(struct xhci_hcd *xhci,
 
 	INIT_LIST_HEAD(&td->td_list);
 	INIT_LIST_HEAD(&td->cancelled_td_list);
+	INIT_LIST_HEAD(&td->bounce_trb_list);
 
 	if (td_index == 0) {
 		ret = usb_hcd_link_urb_to_ep(bus_to_hcd(urb->dev->bus), urb);
@@ -3252,11 +3321,160 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	seg->bounce_len = new_buff_len;
 	seg->bounce_offs = enqd_len;
 
-	xhci_dbg(xhci, "Bounce align, new buff len %d\n", *trb_buff_len);
+	return 1;
+}
+
+/*
+ * This function performs TD alignment or is used to consolidate the TRBs up to
+ * 4 * MPS or remaining data size if remaining transfer size is less than 4 *
+ * MPS. We are consolidating (4 * MPS) data when the buffer sizes spread across
+ * the TRB cache is not at least MPS.
+ *
+ * @xhci: xHC driver pointer
+ * @urb: current URB
+ * @enqd_len: total transfer size enqueued in the TRBs
+ * @cache_enq_len: total buffer size spread across the trb cache
+ * @trb_buff_len: current trb buffer length
+ * @td: current transfer descriptor
+ * @align_td: do TD alignment
+ */
+static int xhci_consolidate_trbs(struct xhci_hcd *xhci, struct urb *urb,
+				 u32 enqd_len, u32 cache_enq_len,
+				 u32 *trb_buff_len, struct xhci_td *td,
+				 bool align_td)
+{
+	struct device *sysdev = xhci_to_hcd(xhci)->self.sysdev;
+	bool is_mps;
+	unsigned int unalign;
+	unsigned int max_pkt;
+	unsigned int buffer_length;
+	unsigned long flags;
+	u32 new_buff_len;
+	size_t len;
+	struct bounce_trb *bounce_trb;
+
+	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+
+	if (!align_td) {
+		is_mps = (cache_enq_len + *trb_buff_len) >= max_pkt;
+
+		/* TRB_CACHE_SIZE trbs has buffer size more than mps */
+		if (is_mps)
+			return 0;
+
+		/*
+		 * We consolidate 4 * MPS or the remaining data size
+		 * if buffers remaining are less than 4 * MPS size.
+		 * This 4 * MPS consolidation gives good performance
+		 * when the SG buffer sizes are of few bytes each.
+		 */
+		buffer_length = 4 * max_pkt;
+	} else {
+		unalign = (enqd_len + *trb_buff_len) % max_pkt;
+		/*
+		 * We got lucky, last normal TRB data on
+		 * segment is packet aligned
+		 *
+		 */
+		if (unalign == 0) {
+			xhci_dbg(xhci, "We got lucky\n");
+			return 0;
+		}
+		/* is the last normal TRB alignable by splitting it */
+		if (*trb_buff_len > unalign) {
+			*trb_buff_len -= unalign;
+			xhci_dbg(xhci, "split align, new buff len %d\n",
+				 *trb_buff_len);
+			return 0;
+		}
+		buffer_length = max_pkt;
+	}
+
+	bounce_trb = kzalloc_node(sizeof(*bounce_trb), GFP_ATOMIC,
+				  dev_to_node(sysdev));
+	if (!bounce_trb)
+		return 0;
+
+	bounce_trb->buf = kzalloc_node(buffer_length, GFP_ATOMIC,
+				       dev_to_node(sysdev));
+	if (!bounce_trb->buf) {
+		kfree(bounce_trb);
+		return 0;
+	}
+
+	/*
+	 * We want enqd_len + trb_buff_len to sum up to at least MPS when we are
+	 * doing TRB buffer consolidation.
+	 * When are aligning td  we want enqd_len + trb_buff_len to sum up to a
+	 * number aligned to number which is divisible by the endpoint's
+	 * wMaxPacketSize. IOW:
+	 * (size of currently enqueued TRBs + remainder) % wMaxPacketSize == 0.
+	 */
+	if (!align_td)
+		new_buff_len = buffer_length - (cache_enq_len % max_pkt);
+	else
+		new_buff_len = buffer_length - (enqd_len % max_pkt);
+
+	if (new_buff_len > (urb->transfer_buffer_length - enqd_len))
+		new_buff_len = (urb->transfer_buffer_length - enqd_len);
+
+	if (usb_urb_dir_out(urb)) {
+		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
+					 bounce_trb->buf, new_buff_len,
+					 enqd_len);
+		if (len != new_buff_len)
+			xhci_warn(xhci,
+				  "WARN Wrong TRB cache buffer write length: %zu != %d\n",
+				  len, new_buff_len);
+		bounce_trb->dma = dma_map_single(sysdev, bounce_trb->buf,
+						 buffer_length, DMA_TO_DEVICE);
+	} else {
+		bounce_trb->dma = dma_map_single(sysdev, bounce_trb->buf,
+						 buffer_length,
+						 DMA_FROM_DEVICE);
+	}
+
+	if (dma_mapping_error(sysdev, bounce_trb->dma)) {
+		/* try without MPS TRB cache data */
+		kfree(bounce_trb);
+		xhci_warn(xhci, "Failed mapping bounce TRB buffer\n");
+		return 0;
+	}
+
+	*trb_buff_len = new_buff_len;
+	bounce_trb->len = new_buff_len;
+	bounce_trb->offs = enqd_len;
+
+	spin_lock_irqsave(&td->lock, flags);
+	list_add_tail(&bounce_trb->entry, &td->bounce_trb_list);
+	spin_unlock_irqrestore(&td->lock, flags);
 
 	return 1;
 }
 
+static void xhci_handle_consolidated_trbs(struct xhci_hcd *xhci,
+					  struct urb *urb,
+					  unsigned int enqd_len,
+					  unsigned int cache_enq_len,
+					  unsigned int *trb_buff_len,
+					  struct xhci_td *td,
+					  u64 *send_addr, bool align_td)
+{
+	struct bounce_trb *bounce_trb;
+	unsigned long flags;
+
+	if (xhci_consolidate_trbs(xhci, urb, enqd_len, cache_enq_len,
+				  trb_buff_len, td, align_td)) {
+		spin_lock_irqsave(&td->lock, flags);
+		bounce_trb = list_last_entry(&td->bounce_trb_list,
+					     struct bounce_trb, entry);
+		spin_unlock_irqrestore(&td->lock, flags);
+		if (bounce_trb->dma)
+			*send_addr = bounce_trb->dma;
+		return;
+	}
+}
+
 /* This is very similar to what ehci-q.c qtd_fill() does */
 int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
@@ -3269,12 +3487,21 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	bool more_trbs_coming = true;
 	bool need_zero_pkt = false;
 	bool first_trb = true;
-	unsigned int num_trbs;
+	bool align_td = false;
+	unsigned int num_trbs, max_pkt, trb_cache_size;
 	unsigned int start_cycle, num_sgs = 0;
-	unsigned int enqd_len, block_len, trb_buff_len, full_len;
+	unsigned int enqd_len, block_len, trb_buff_len, full_len, cache_enq_len;
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	int trb_count = 0;
+	u64 count = 0;
+
+	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
+	if (urb->dev->speed >= USB_SPEED_SUPER)
+		trb_cache_size = xhci->trb_cache_size_ss;
+	else
+		trb_cache_size = xhci->trb_cache_size_hs;
 
 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3315,10 +3542,10 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
-
+	cache_enq_len = 0;
 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
-			enqd_len += trb_buff_len) {
+	     enqd_len += trb_buff_len) {
 		field = TRB_TYPE(TRB_NORMAL);
 
 		/* TRB buffer should not cross 64KB boundaries */
@@ -3341,16 +3568,39 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		 */
 		if (enqd_len + trb_buff_len < full_len) {
 			field |= TRB_CHAIN;
-			if (trb_is_link(ring->enqueue + 1)) {
+
+			if (trb_is_link(ring->enqueue + 1))
+				align_td = true;
+			else
+				align_td = false;
+
+			/*
+			 * Check for data size in TRB cache per
+			 * TRB_CACHE_SIZE - 3.
+			 * 3 is to take one status TRB and
+			 * one link TRB into account.
+			 */
+			if ((!(xhci->quirks & XHCI_CONSOLIDATE_TRBS) ||
+			     urb->stream_id) && align_td) {
 				if (xhci_align_td(xhci, urb, enqd_len,
 						  &trb_buff_len,
 						  ring->enq_seg)) {
 					send_addr = ring->enq_seg->bounce_dma;
-					/* assuming TD won't span 2 segs */
 					td->bounce_seg = ring->enq_seg;
 				}
+			} else if ((count == trb_cache_size - 3 &&
+				    cache_enq_len < max_pkt) || align_td) {
+				xhci_handle_consolidated_trbs(xhci,
+							      urb,
+							      enqd_len,
+							      cache_enq_len,
+							      &trb_buff_len,
+							      td,
+							      &send_addr,
+							      align_td);
 			}
 		}
+
 		if (enqd_len + trb_buff_len >= full_len) {
 			field &= ~TRB_CHAIN;
 			field |= TRB_IOC;
@@ -3383,9 +3633,21 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				length_field,
 				field);
 
+		trb_count++;
 		addr += trb_buff_len;
 		sent_len = trb_buff_len;
 
+		if ((xhci->quirks & XHCI_CONSOLIDATE_TRBS) &&
+		    !urb->stream_id) {
+			count++;
+			cache_enq_len += trb_buff_len;
+			if (count == trb_cache_size - 2 || align_td) {
+				count = 0;
+				cache_enq_len = 0;
+				align_td = false;
+			}
+		}
+
 		while (sg && sent_len >= block_len) {
 			/* New sg entry */
 			--num_sgs;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dbac0fa9748d..c9e2181f68c8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -596,6 +596,9 @@ static int xhci_init(struct usb_hcd *hcd)
 		compliance_mode_recovery_timer_init(xhci);
 	}
 
+	xhci->trb_cache_size_hs = TRB_CACHE_SIZE_HS;
+	xhci->trb_cache_size_ss = TRB_CACHE_SIZE_SS;
+
 	return retval;
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 13d8838cd552..1882389ca4ad 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -30,6 +30,10 @@
 /* Section 5.3.3 - MaxPorts */
 #define MAX_HC_PORTS		127
 
+/* Default TRB Cache size for SNPS xHC */
+#define TRB_CACHE_SIZE_HS	8
+#define TRB_CACHE_SIZE_SS	16
+
 /*
  * xHCI register interface.
  * This corresponds to the eXtensible Host Controller Interface (xHCI)
@@ -1519,6 +1523,14 @@ static inline const char *xhci_trb_type_string(u8 type)
 					(addr & (TRB_MAX_BUFF_SIZE - 1)))
 #define MAX_SOFT_RETRY		3
 
+struct bounce_trb {
+	dma_addr_t		dma;
+	void			*buf;
+	unsigned int		offs;
+	unsigned int		len;
+	struct list_head	entry;
+};
+
 struct xhci_segment {
 	union xhci_trb		*trbs;
 	/* private to HCD */
@@ -1534,7 +1546,10 @@ struct xhci_segment {
 struct xhci_td {
 	struct list_head	td_list;
 	struct list_head	cancelled_td_list;
+	struct list_head	bounce_trb_list;
 	struct urb		*urb;
+	/* TD spinlock for list access */
+	spinlock_t		lock;
 	struct xhci_segment	*start_seg;
 	union xhci_trb		*first_trb;
 	union xhci_trb		*last_trb;
@@ -1867,6 +1882,7 @@ struct xhci_hcd {
 #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
 #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
+#define XHCI_CONSOLIDATE_TRBS	BIT_ULL(36)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
@@ -1894,6 +1910,13 @@ struct xhci_hcd {
 	void			*dbc;
 	/* platform-specific data -- must come last */
 	unsigned long		priv[0] __aligned(sizeof(s64));
+	/*
+	 * TRB cache size
+	 * These are set to reflect the TRB cache size.
+	 * Currently they are set to defaults.
+	 */
+	u8			trb_cache_size_ss;
+	u8			trb_cache_size_hs;
 };
 
 /* Platform specific overrides to generic XHCI hc_driver ops */
-- 
2.11.0

