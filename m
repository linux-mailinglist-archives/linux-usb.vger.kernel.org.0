Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777992957C2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 07:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507857AbgJVFP7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 01:15:59 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42644 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2444222AbgJVFP6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 01:15:58 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 28BE2C026E;
        Thu, 22 Oct 2020 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603343758; bh=mA8mzYo4FB+fHWAZgoo8gR+DdWm2HtkHd6jl27S2P7Y=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dmFJ0lS/GirO5F6G80fMJnFkQF4DU0+xPrYmmsvfIvxACdSiWcJy+Lx18WFMPLf1j
         uQS17rgoIDO4zD6fE5kBkHU/MD9gmVteYfyR/VhwFcViqk6XzuE/gNgm58kSTvyVZB
         zsHdRGF+FpT4YZZKadeFEMOZNcfy2Oosk/xBy4Qzs4yZJD2d6DES8pTgtQMWxHSCqB
         Ho+ieNKqgpIqyKq3UPVjAhXsbFYexRI6tv276mgrVMqLeQiglMtXOnQVkSOpeEeJqd
         Mmp9Xv8vjh3LCzFBq7Jl9ByS+Bz60mqoi1Tq54ZdE6odS1HgZn9fTxuovbu+mikcQ/
         YLJRpJjnOW0qA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id ACBAEA0072;
        Thu, 22 Oct 2020 05:15:56 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 21 Oct 2020 22:15:56 -0700
Date:   Wed, 21 Oct 2020 22:15:56 -0700
Message-Id: <f8ccfd3d52a309019ee564ff395491a8f2dc8537.1603343705.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
References: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 3/3] usb: xhci: Check for blocked disconnection
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there is a device with active enhanced super-speed (eSS) isoc IN
endpoint(s) behind one or more eSS hubs, DWC_usb3x host controller will
not detect the device disconnection until no more isoc URB is submitted.
If there's a device disconnection, internally the wait for
tHostTransactionTimeout (USB 3.2 spec 8.13) blocks the other endpoints
from being scheduled. So, it blocks the interrupt endpoint of the eSS hub
indicating the port change status.

This can be an issue for applications that continuously submitting isoc
URBs to the xHCI. To work around this, if new isoc transfers are queued
after the device is disconnected, the host will respond with USB
transaction error. After 3 consecutive USB transaction errors, the
driver can wait a period of time (at least 2 * largest periodic inteval
of the topology) to detect the port change status. If there is no
disconnection detected, ring the endpoint doorbell to resume isoc
transfers.

This workaround tracks the max eSS periodic interval every time there's
an endpoint added or dropped, which happens when there's bandwidth
check. So, scan the topology and update the xhci->max_ess_interval
whenever there's a bandwidth check. Introduced a new flag
VDEV_DISCONN_CHECK_PENDING to prevent ringing the doorbell while waiting
for a disconnection status. After 2 * max_ess_interval time, a delayed
work will ring the doorbell to resume active isoc transfers.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci-mem.c  |  3 ++
 drivers/usb/host/xhci-plat.c |  3 ++
 drivers/usb/host/xhci-ring.c | 70 ++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c      | 49 +++++++++++++++++++++++++
 drivers/usb/host/xhci.h      | 11 ++++++
 5 files changed, 136 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fe405cd38dbc..cb04384e2187 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1010,6 +1010,8 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	xhci_dbg(xhci, "Slot %d input ctx = 0x%llx (dma)\n", slot_id,
 			(unsigned long long)dev->in_ctx->dma);
 
+	INIT_DELAYED_WORK(&dev->resume_isoc, xhci_resume_isoc);
+
 	/* Initialize the cancellation list and watchdog timers for each ep */
 	for (i = 0; i < 31; i++) {
 		xhci_init_endpoint_timer(xhci, &dev->eps[i]);
@@ -1023,6 +1025,7 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 		goto fail;
 
 	dev->udev = udev;
+	dev->xhci = xhci;
 
 	/* Point to output device context in dcbaa. */
 	xhci->dcbaa->dev_context_ptrs[slot_id] = cpu_to_le64(dev->out_ctx->dma);
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index aa2d35f98200..1675fb21dc82 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -312,6 +312,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "blocked-disconnection"))
+			xhci->quirks |= XHCI_BLOCKED_DISCONNECT;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 167dae117f73..0c698b3b5271 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -395,6 +395,14 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
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
@@ -2144,6 +2152,8 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	union xhci_trb *ep_trb, struct xhci_transfer_event *event,
 	struct xhci_virt_ep *ep, int *status)
 {
+	struct usb_device *udev;
+	struct xhci_virt_device *vdev;
 	struct xhci_ring *ep_ring;
 	struct urb_priv *urb_priv;
 	int idx;
@@ -2163,10 +2173,13 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 	ep_trb_len = TRB_LEN(le32_to_cpu(ep_trb->generic.field[2]));
 	short_framestatus = td->urb->transfer_flags & URB_SHORT_NOT_OK ?
 		-EREMOTEIO : 0;
+	udev = td->urb->dev;
+	vdev = xhci->devs[udev->slot_id];
 
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
+		ep_ring->err_count = 0;
 		if (remaining) {
 			frame->status = short_framestatus;
 			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
@@ -2191,6 +2204,24 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_td *td,
 		frame->status = -EPROTO;
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
+		if ((xhci->quirks & XHCI_BLOCKED_DISCONNECT) &&
+		    usb_urb_dir_in(td->urb) &&
+		    udev->parent && udev->parent->parent &&
+		    udev->speed >= USB_SPEED_SUPER) {
+			ep_ring->err_count++;
+			if (!(vdev->flags & VDEV_DISCONN_CHECK_PENDING) &&
+			    ep_ring->err_count++ >= 3) {
+				unsigned long timeout;
+
+				/* Wait for max eSS interval x 2 */
+				timeout = (1 << xhci->max_ess_interval) * 256;
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
@@ -3969,6 +4000,9 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	for (i = 0; i < num_tds; i++)
 		num_trbs += count_isoc_trbs_needed(urb, i);
 
+	if ((xdev->flags & VDEV_DISCONN_CHECK_PENDING) && usb_urb_dir_in(urb))
+		return -EINVAL;
+
 	/* Check the ring to guarantee there is enough room for the whole urb.
 	 * Do not insert any td of the urb to the ring if the check failed.
 	 */
@@ -4222,3 +4256,39 @@ int xhci_queue_reset_ep(struct xhci_hcd *xhci, struct xhci_command *cmd,
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
+	slot_id = vdev->udev->slot_id;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+
+	vdev->flags &= ~VDEV_DISCONN_CHECK_PENDING;
+
+	/* Resume isoc transfers if the device is still connected */
+	if (xhci->devs[slot_id] && vdev->udev) {
+		int i;
+
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
+	spin_unlock_irqrestore(&xhci->lock, flags);
+}
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 482fe8c5e3b4..f19448731d8c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2851,6 +2851,44 @@ static void xhci_check_bw_drop_ep_streams(struct xhci_hcd *xhci,
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
@@ -2925,6 +2963,17 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 		/* Callee should call reset_bandwidth() */
 		goto command_cleanup;
 
+	if (xhci->quirks & XHCI_BLOCKED_DISCONNECT) {
+		xhci_update_ess_max_interval(xhci);
+
+		/* Change of context detected, stop disconnect check */
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
index 8be88379c0fb..d416f6c47d13 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -995,6 +995,7 @@ struct xhci_interval_bw_table {
 
 
 struct xhci_virt_device {
+	struct xhci_hcd			*xhci;
 	struct usb_device		*udev;
 	/*
 	 * Commands to the hardware are passed an "input context" that
@@ -1020,11 +1021,15 @@ struct xhci_virt_device {
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
@@ -1877,6 +1882,7 @@ struct xhci_hcd {
 #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
 #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
 #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
+#define XHCI_BLOCKED_DISCONNECT	BIT_ULL(38)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
@@ -1900,6 +1906,9 @@ struct xhci_hcd {
 /* Compliance Mode Timer Triggered every 2 seconds */
 #define COMP_MODE_RCVRY_MSECS 2000
 
+	/* Track max periodic eSS interval for XHCI_BLOCKED_DISCONNECT quirk */
+	unsigned int		max_ess_interval;
+
 	struct dentry		*debugfs_root;
 	struct dentry		*debugfs_slots;
 	struct list_head	regset_list;
@@ -1978,6 +1987,8 @@ char *xhci_get_slot_state(struct xhci_hcd *xhci,
 void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 			const char *fmt, ...);
 
+void xhci_resume_isoc(struct work_struct *work);
+
 /* xHCI memory management */
 void xhci_mem_cleanup(struct xhci_hcd *xhci);
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags);
-- 
2.28.0

