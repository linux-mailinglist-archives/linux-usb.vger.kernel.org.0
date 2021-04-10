Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018D035A9AC
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbhDJArR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:47:17 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46934 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235312AbhDJArQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:47:16 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF5D0C00CB;
        Sat, 10 Apr 2021 00:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015622; bh=kCQj7VfovKDSTD3qr4qVt/ENZ7Kcmdsxrciiw0PT99Y=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=jG7GbIjDlX3yo+4HUI7dKIR4nZgUfOZzoutwlAm+vRjNkZXGnqzPO15EvnqyQ7Awx
         cB82WKEcnLs/sbXY3PTInhKPRqhXfBU8XsjMILZsJjEfuq2f1VHLICQyIv+0nAShqS
         OPy41+NR2o8CPm03ddrjyjsYaJR+QVJJv659sTwYatw2GogMOSWWJ/zSYVbxELPQvF
         Wocpai4uXF2Oqltns2BlBG5KI1HzhsTSWgTHknf7eZHsj0CuQYDsVijuJPFPllk3Uk
         iVAVHESG2NQSVgaZNS7EGvC80poIrV4yewMzLpqtMQgld2Q9YUIMz342U1Cj+nDvvp
         mlgM/i7WNdV/Q==
Received: from lab-vbox (unknown [10.205.130.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3D0E9A007C;
        Sat, 10 Apr 2021 00:47:00 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Fri, 09 Apr 2021 17:47:00 -0700
Date:   Fri, 09 Apr 2021 17:47:00 -0700
Message-Id: <07196754c6de290bb46cc235ce6e96c5df304150.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 3/7] usb: xhci: Check for blocked disconnection
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there is a device with active enhanced super-speed (eSS) isoc IN
endpoint(s) behind one or more eSS hubs, DWC_usb31 (v1.90a and prior)
host controller will not detect the device disconnection until no more
isoc URB is submitted. If there's a device disconnection, internally
the wait for tHostTransactionTimeout (USB 3.2 spec 8.13) blocks the
other endpoints from being scheduled. So, it blocks the interrupt
endpoint of the eSS hub indicating the port change status.

This can be an issue for applications that continuously submitting isoc
URBs to the xHCI. To work around this, stop processing new URBs after 3
consecutive isoc transaction errors. If new isoc transfers are queued
after the device is disconnected, the host will respond with USB
transaction error. After 3 consecutive USB transaction errors, the
driver can wait a period of time (at least 2 * largest periodic interval
of the topology) without ringing isoc endpoint doorbell to detect the
port change status. If there is no disconnection detected, ring the
endpoint doorbell to resume isoc transfers.

This workaround tracks the max eSS periodic interval every time there's
an endpoint added or dropped, which happens when there's bandwidth
check. So, scan the topology and update the xhci->max_ess_interval
whenever there's a bandwidth check. Introduced a new flag
VDEV_DISCONN_CHECK_PENDING to prevent ringing the doorbell while waiting
for a disconnection status. After 2 * max_ess_interval time and no
disconnection detected, a delayed work will ring the doorbell to resume
the active isoc transfers.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/host/xhci-mem.c     |  3 ++
 drivers/usb/host/xhci-ring.c    | 76 +++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c         | 49 +++++++++++++++++++++
 drivers/usb/host/xhci.h         | 10 +++++
 include/linux/usb/xhci-quirks.h |  1 +
 5 files changed, 139 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f66815fe8482..1053b43008e4 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -995,6 +995,8 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	xhci_dbg(xhci, "Slot %d input ctx = 0x%llx (dma)\n", slot_id,
 			(unsigned long long)dev->in_ctx->dma);
 
+	INIT_DELAYED_WORK(&dev->resume_isoc, xhci_resume_isoc);
+
 	/* Initialize the cancellation list and watchdog timers for each ep */
 	for (i = 0; i < 31; i++) {
 		dev->eps[i].ep_index = i;
@@ -1010,6 +1012,7 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 		goto fail;
 
 	dev->udev = udev;
+	dev->xhci = xhci;
 
 	/* Point to output device context in dcbaa. */
 	xhci->dcbaa->dev_context_ptrs[slot_id] = cpu_to_le64(dev->out_ctx->dma);
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 05c38dd3ee36..a434a4b3609f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -419,6 +419,14 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 	struct xhci_virt_ep *ep = &xhci->devs[slot_id]->eps[ep_index];
 	unsigned int ep_state = ep->ep_state;
 
+	/*
+	 * Don't ring the doorbell for isoc IN endpoint while checking for
+	 * device disconnection.
+	 */
+	if (ep->ring && ep->ring->type == TYPE_ISOC && !(ep_index % 2) &&
+	    (xhci->devs[slot_id]->flags & VDEV_DISCONN_CHECK_PENDING))
+		return;
+
 	/* Don't ring the doorbell for this endpoint if there are pending
 	 * cancellations because we don't want to interrupt processing.
 	 * We don't want to restart any stream rings if there's a set dequeue
@@ -2330,6 +2338,8 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		struct xhci_ring *ep_ring, struct xhci_td *td,
 		union xhci_trb *ep_trb, struct xhci_transfer_event *event)
 {
+	struct usb_device *udev;
+	struct xhci_virt_device *vdev;
 	struct urb_priv *urb_priv;
 	int idx;
 	struct usb_iso_packet_descriptor *frame;
@@ -2347,10 +2357,13 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	ep_trb_len = TRB_LEN(le32_to_cpu(ep_trb->generic.field[2]));
 	short_framestatus = td->urb->transfer_flags & URB_SHORT_NOT_OK ?
 		-EREMOTEIO : 0;
+	udev = td->urb->dev;
+	vdev = xhci->devs[udev->slot_id];
 
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
+		ep->ring->err_count = 0;
 		if (remaining) {
 			frame->status = short_framestatus;
 			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
@@ -2375,6 +2388,23 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		frame->status = -EPROTO;
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
+		if ((xhci->quirks & XHCI_ISOC_BLOCKED_DISCONNECT) &&
+		    usb_urb_dir_in(td->urb) &&
+		    udev->parent && udev->parent->parent &&
+		    udev->speed >= USB_SPEED_SUPER) {
+			if (!(vdev->flags & VDEV_DISCONN_CHECK_PENDING) &&
+			    ep->ring->err_count++ >= 3) {
+				unsigned long timeout;
+
+				/* Wait for at least max interval x 2 x 125us */
+				timeout = (1 << xhci->max_ess_interval) * 250;
+				vdev->flags |= VDEV_DISCONN_CHECK_PENDING;
+				queue_delayed_work(system_wq,
+						   &vdev->resume_isoc,
+						   usecs_to_jiffies(timeout));
+			}
+		}
+
 		frame->status = -EPROTO;
 		if (ep_trb != td->last_trb)
 			return 0;
@@ -4171,6 +4201,9 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	for (i = 0; i < num_tds; i++)
 		num_trbs += count_isoc_trbs_needed(urb, i);
 
+	if ((xdev->flags & VDEV_DISCONN_CHECK_PENDING) && usb_urb_dir_in(urb))
+		return -EINVAL;
+
 	/* Check the ring to guarantee there is enough room for the whole urb.
 	 * Do not insert any td of the urb to the ring if the check failed.
 	 */
@@ -4359,3 +4392,46 @@ int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
 	return queue_command(xhci, cmd, 0, 0, 0,
 			trb_slot_id | trb_ep_index | type, false);
 }
+
+void xhci_resume_isoc(struct work_struct *work)
+{
+	struct xhci_hcd *xhci;
+	struct xhci_virt_device *vdev;
+	unsigned int slot_id;
+	unsigned long flags;
+
+	vdev = container_of(to_delayed_work(work),
+			    struct xhci_virt_device, resume_isoc);
+	xhci = vdev->xhci;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+
+	/* Check if the device is dropped before this work takes place */
+	if (!vdev->udev)
+		goto out;
+
+	slot_id = vdev->udev->slot_id;
+
+	vdev->flags &= ~VDEV_DISCONN_CHECK_PENDING;
+
+	/* Resume isoc transfers if the device is still connected */
+	if (xhci->devs[slot_id]) {
+		int i;
+
+		/* Ring doorbell for IN isoc endpoints only */
+		for (i = 2; i < 31; i += 2) {
+			struct xhci_virt_ep *ep = &vdev->eps[i];
+
+			if (!ep)
+				break;
+
+			if (ep->ring && ep->ring->type == TYPE_ISOC) {
+				ep->ring->err_count = 0;
+				ring_doorbell_for_active_rings(xhci, slot_id, i);
+			}
+		}
+	}
+
+out:
+	spin_unlock_irqrestore(&xhci->lock, flags);
+}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ca9385d22f68..e1136a6b9372 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2973,6 +2973,44 @@ static void xhci_check_bw_drop_ep_streams(struct xhci_hcd *xhci,
 	}
 }
 
+static void xhci_update_ess_max_interval(struct xhci_hcd *xhci)
+{
+	unsigned int max_ess_interval = 0;
+	int j;
+
+	for (j = 1; j < HCS_MAX_SLOTS(xhci->hcs_params1); j++) {
+		struct xhci_virt_device	*virt_dev;
+		int i;
+
+		virt_dev = xhci->devs[j];
+		if (!virt_dev)
+			continue;
+
+		/* Only update for eSS devices */
+		if (virt_dev->udev &&
+		    virt_dev->udev->speed < USB_SPEED_SUPER)
+			continue;
+
+		for (i = 0; i < 31; i++) {
+			struct xhci_ep_ctx *ep_ctx;
+			unsigned int ep_type;
+			unsigned int interval;
+
+			ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->out_ctx, i);
+			ep_type = CTX_TO_EP_TYPE(le32_to_cpu(ep_ctx->ep_info2));
+
+			if (xhci_is_async_ep(ep_type))
+				continue;
+
+			interval = CTX_TO_EP_INTERVAL(le32_to_cpu(ep_ctx->ep_info));
+			if (interval > max_ess_interval)
+				max_ess_interval = interval;
+		}
+	}
+
+	xhci->max_ess_interval = max_ess_interval;
+}
+
 /* Called after one or more calls to xhci_add_endpoint() or
  * xhci_drop_endpoint().  If this call fails, the USB core is expected
  * to call xhci_reset_bandwidth().
@@ -3047,6 +3085,17 @@ int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		/* Callee should call reset_bandwidth() */
 		goto command_cleanup;
 
+	if (xhci->quirks & XHCI_ISOC_BLOCKED_DISCONNECT) {
+		xhci_update_ess_max_interval(xhci);
+
+		/* Cancel disconnection check on change of context */
+		if (delayed_work_pending(&virt_dev->resume_isoc) &&
+		    ctrl_ctx->drop_flags) {
+			cancel_delayed_work(&virt_dev->resume_isoc);
+			virt_dev->flags &= ~VDEV_DISCONN_CHECK_PENDING;
+		}
+	}
+
 	/* Free any rings that were dropped, but not changed. */
 	for (i = 1; i < 31; i++) {
 		if ((le32_to_cpu(ctrl_ctx->drop_flags) & (1 << (i + 1))) &&
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 9a4e2808668b..27d2c1176dd1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1000,6 +1000,7 @@ struct xhci_interval_bw_table {
 
 struct xhci_virt_device {
 	int				slot_id;
+	struct xhci_hcd			*xhci;
 	struct usb_device		*udev;
 	/*
 	 * Commands to the hardware are passed an "input context" that
@@ -1025,11 +1026,15 @@ struct xhci_virt_device {
 	 */
 	unsigned long			flags;
 #define VDEV_PORT_ERROR			BIT(0) /* Port error, link inactive */
+#define VDEV_DISCONN_CHECK_PENDING	BIT(1) /* Disconnection check */
 
 	/* The current max exit latency for the enabled USB3 link states. */
 	u16				current_mel;
 	/* Used for the debugfs interfaces. */
 	void				*debugfs_private;
+
+	/* For undetected disconnection quirk */
+	struct delayed_work		resume_isoc;
 };
 
 /*
@@ -1864,6 +1869,9 @@ struct xhci_hcd {
 /* Compliance Mode Timer Triggered every 2 seconds */
 #define COMP_MODE_RCVRY_MSECS 2000
 
+	/* Track max eSS interval for XHCI_ISOC_BLOCKED_DISCONNECT */
+	unsigned int		max_ess_interval;
+
 	struct dentry		*debugfs_root;
 	struct dentry		*debugfs_slots;
 	struct list_head	regset_list;
@@ -1948,6 +1956,8 @@ char *xhci_get_slot_state(struct xhci_hcd *xhci,
 void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 			const char *fmt, ...);
 
+void xhci_resume_isoc(struct work_struct *work);
+
 /* xHCI memory management */
 void xhci_mem_cleanup(struct xhci_hcd *xhci);
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags);
diff --git a/include/linux/usb/xhci-quirks.h b/include/linux/usb/xhci-quirks.h
index 4001b10b418a..65bb62d3d31d 100644
--- a/include/linux/usb/xhci-quirks.h
+++ b/include/linux/usb/xhci-quirks.h
@@ -58,5 +58,6 @@
 #define XHCI_DISABLE_SPARSE		BIT_ULL(38)
 #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
 #define XHCI_NO_SOFT_RETRY		BIT_ULL(40)
+#define XHCI_ISOC_BLOCKED_DISCONNECT	BIT_ULL(41)
 
 #endif /* __LINUX_USB_XHCI_QUIRKS_H */
-- 
2.28.0

