Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AED523FE3
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348503AbiEKWDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348430AbiEKWDu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:50 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15F019C21
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306628; x=1683842628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/Kl5Fyt4JlW7jkL13zaiIBtSBypx1lqpL1N7Ta0oIk=;
  b=kjP2nosRIcqj3yxb1Z0eXhHca1a+diqc5hoYjSerq1x+i7hcaxwSB2l4
   MxrPNzmJzZVPiqDYSEVUkxyVlkjnlvCRw5z+aymChgBu+uVG4Rztjv4ej
   L7kSRAAirAoct7tQs8Dn2qdMVOV0Gzln4inEuZDONSlfiQT81T/mUn1em
   24NbLUGCsEl9wuFDNpi0BiM9fwHShIkuSo/MKXPqKKN1xY3cz4HwDp8F9
   rgjfxhbcDfEySE83mRvpa32HQhDi3kKUR3bn085+0gdmFllxpdagc1ADx
   O1nOAZ4LecMZN6o3wp/zXjyukvDS678Nv7hSyrTQt7+nzgufdFGkPgD1/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427458"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496242"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:46 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 6/9] xhci: use generic command timer for stop endpoint commands.
Date:   Thu, 12 May 2022 01:04:47 +0300
Message-Id: <20220511220450.85367-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
References: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The 'stop endpoint' command timer was started when a 'stop endpoint'
command was added to the command queue.
This can trigger unwanted timeouts if there are several pending commands
in the queue that xHC needs to handle first.

The generic command timer, which was added later than the 'stop endpoint'
timeout timer, times each command currently being handled by xHC hardware.

A timed out stop endpoint command was treated as a more severe issue than
other failed commands, so the separate stop endpoint timer was left
unchanged.

Use the generic command timer for stop endpoint commands. Identify if
the timed out command was a stop endpoint command in the generic handler,
and treat it with the same severity as earlier.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  |  12 +---
 drivers/usb/host/xhci-ring.c | 107 +++++++++++------------------------
 drivers/usb/host/xhci.c      |   7 +--
 drivers/usb/host/xhci.h      |   2 -
 4 files changed, 37 insertions(+), 91 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 50bf64dcb186..8c19e151a945 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -782,14 +782,6 @@ void xhci_free_stream_info(struct xhci_hcd *xhci,
 
 /***************** Device context manipulation *************************/
 
-static void xhci_init_endpoint_timer(struct xhci_hcd *xhci,
-		struct xhci_virt_ep *ep)
-{
-	timer_setup(&ep->stop_cmd_timer, xhci_stop_endpoint_command_watchdog,
-		    0);
-	ep->xhci = xhci;
-}
-
 static void xhci_free_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		int slot_id)
@@ -994,11 +986,11 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	xhci_dbg(xhci, "Slot %d input ctx = 0x%llx (dma)\n", slot_id,
 			(unsigned long long)dev->in_ctx->dma);
 
-	/* Initialize the cancellation list and watchdog timers for each ep */
+	/* Initialize the cancellation and bandwidth list for each ep */
 	for (i = 0; i < 31; i++) {
 		dev->eps[i].ep_index = i;
 		dev->eps[i].vdev = dev;
-		xhci_init_endpoint_timer(xhci, &dev->eps[i]);
+		dev->eps[i].xhci = xhci;
 		INIT_LIST_HEAD(&dev->eps[i].cancelled_td_list);
 		INIT_LIST_HEAD(&dev->eps[i].bw_endpoint_list);
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f9707997969d..373e0e152854 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -740,14 +740,6 @@ static void td_to_noop(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
 	}
 }
 
-static void xhci_stop_watchdog_timer_in_irq(struct xhci_hcd *xhci,
-		struct xhci_virt_ep *ep)
-{
-	ep->ep_state &= ~EP_STOP_CMD_PENDING;
-	/* Can't del_timer_sync in interrupt */
-	del_timer(&ep->stop_cmd_timer);
-}
-
 /*
  * Must be called with xhci->lock held in interrupt context,
  * releases and re-acquires xhci->lock
@@ -1122,18 +1114,17 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 							  reset_type);
 			if (err)
 				break;
-			xhci_stop_watchdog_timer_in_irq(xhci, ep);
+			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 			return;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
 			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
 
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
-			if (!command)
-				xhci_stop_watchdog_timer_in_irq(xhci, ep);
-
-			mod_timer(&ep->stop_cmd_timer,
-				  jiffies + XHCI_STOP_EP_CMD_TIMEOUT * HZ);
+			if (!command) {
+				ep->ep_state &= ~EP_STOP_CMD_PENDING;
+				return;
+			}
 			xhci_queue_stop_endpoint(xhci, command, slot_id, ep_index, 0);
 			xhci_ring_cmd_db(xhci);
 
@@ -1142,9 +1133,10 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			break;
 		}
 	}
+
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */
 	xhci_invalidate_cancelled_tds(ep);
-	xhci_stop_watchdog_timer_in_irq(xhci, ep);
+	ep->ep_state &= ~EP_STOP_CMD_PENDING;
 
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
 	xhci_giveback_invalidated_tds(ep);
@@ -1248,61 +1240,6 @@ void xhci_hc_died(struct xhci_hcd *xhci)
 		usb_hc_died(xhci_to_hcd(xhci));
 }
 
-/* Watchdog timer function for when a stop endpoint command fails to complete.
- * In this case, we assume the host controller is broken or dying or dead.  The
- * host may still be completing some other events, so we have to be careful to
- * let the event ring handler and the URB dequeueing/enqueueing functions know
- * through xhci->state.
- *
- * The timer may also fire if the host takes a very long time to respond to the
- * command, and the stop endpoint command completion handler cannot delete the
- * timer before the timer function is called.  Another endpoint cancellation may
- * sneak in before the timer function can grab the lock, and that may queue
- * another stop endpoint command and add the timer back.  So we cannot use a
- * simple flag to say whether there is a pending stop endpoint command for a
- * particular endpoint.
- *
- * Instead we use a combination of that flag and checking if a new timer is
- * pending.
- */
-void xhci_stop_endpoint_command_watchdog(struct timer_list *t)
-{
-	struct xhci_virt_ep *ep = from_timer(ep, t, stop_cmd_timer);
-	struct xhci_hcd *xhci = ep->xhci;
-	unsigned long flags;
-	u32 usbsts;
-	char str[XHCI_MSG_MAX];
-
-	spin_lock_irqsave(&xhci->lock, flags);
-
-	/* bail out if cmd completed but raced with stop ep watchdog timer.*/
-	if (!(ep->ep_state & EP_STOP_CMD_PENDING) ||
-	    timer_pending(&ep->stop_cmd_timer)) {
-		spin_unlock_irqrestore(&xhci->lock, flags);
-		xhci_dbg(xhci, "Stop EP timer raced with cmd completion, exit");
-		return;
-	}
-	usbsts = readl(&xhci->op_regs->status);
-
-	xhci_warn(xhci, "xHCI host not responding to stop endpoint command.\n");
-	xhci_warn(xhci, "USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
-
-	ep->ep_state &= ~EP_STOP_CMD_PENDING;
-
-	xhci_halt(xhci);
-
-	/*
-	 * handle a stop endpoint cmd timeout as if host died (-ENODEV).
-	 * In the future we could distinguish between -ENODEV and -ETIMEDOUT
-	 * and try to recover a -ETIMEDOUT with a host controller reset
-	 */
-	xhci_hc_died(xhci);
-
-	spin_unlock_irqrestore(&xhci->lock, flags);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-			"xHCI host controller is dead.");
-}
-
 static void update_ring_for_set_deq_completion(struct xhci_hcd *xhci,
 		struct xhci_virt_device *dev,
 		struct xhci_ring *ep_ring,
@@ -1650,9 +1587,12 @@ void xhci_cleanup_command_queue(struct xhci_hcd *xhci)
 
 void xhci_handle_command_timeout(struct work_struct *work)
 {
-	struct xhci_hcd *xhci;
-	unsigned long flags;
-	u64 hw_ring_state;
+	struct xhci_hcd	*xhci;
+	unsigned long	flags;
+	char		str[XHCI_MSG_MAX];
+	u64		hw_ring_state;
+	u32		cmd_field3;
+	u32		usbsts;
 
 	xhci = container_of(to_delayed_work(work), struct xhci_hcd, cmd_timer);
 
@@ -1666,6 +1606,27 @@ void xhci_handle_command_timeout(struct work_struct *work)
 		spin_unlock_irqrestore(&xhci->lock, flags);
 		return;
 	}
+
+	cmd_field3 = le32_to_cpu(xhci->current_cmd->command_trb->generic.field[3]);
+	usbsts = readl(&xhci->op_regs->status);
+	xhci_dbg(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
+
+	/* Bail out and tear down xhci if a stop endpoint command failed */
+	if (TRB_FIELD_TO_TYPE(cmd_field3) == TRB_STOP_RING) {
+		struct xhci_virt_ep	*ep;
+
+		xhci_warn(xhci, "xHCI host not responding to stop endpoint command\n");
+
+		ep = xhci_get_virt_ep(xhci, TRB_TO_SLOT_ID(cmd_field3),
+				      TRB_TO_EP_INDEX(cmd_field3));
+		if (ep)
+			ep->ep_state &= ~EP_STOP_CMD_PENDING;
+
+		xhci_halt(xhci);
+		xhci_hc_died(xhci);
+		goto time_out_completed;
+	}
+
 	/* mark this command to be cancelled */
 	xhci->current_cmd->status = COMP_COMMAND_ABORTED;
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5d4955ed4074..19363f542d19 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1872,9 +1872,6 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 			goto done;
 		}
 		ep->ep_state |= EP_STOP_CMD_PENDING;
-		ep->stop_cmd_timer.expires = jiffies +
-			XHCI_STOP_EP_CMD_TIMEOUT * HZ;
-		add_timer(&ep->stop_cmd_timer);
 		xhci_queue_stop_endpoint(xhci, command, urb->dev->slot_id,
 					 ep_index, 0);
 		xhci_ring_cmd_db(xhci);
@@ -3984,10 +3981,8 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	trace_xhci_free_dev(slot_ctx);
 
 	/* Stop any wayward timer functions (which may grab the lock) */
-	for (i = 0; i < 31; i++) {
+	for (i = 0; i < 31; i++)
 		virt_dev->eps[i].ep_state &= ~EP_STOP_CMD_PENDING;
-		del_timer_sync(&virt_dev->eps[i].stop_cmd_timer);
-	}
 	virt_dev->udev = NULL;
 	xhci_disable_slot(xhci, udev->slot_id);
 	xhci_free_virt_device(xhci, udev->slot_id);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c792a3148e49..1e3ef8d01567 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -948,8 +948,6 @@ struct xhci_virt_ep {
 #define EP_CLEARING_TT		(1 << 8)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
-	/* Watchdog timer for stop endpoint command to cancel URBs */
-	struct timer_list	stop_cmd_timer;
 	struct xhci_hcd		*xhci;
 	/* Dequeue pointer and dequeue segment for a submitted Set TR Dequeue
 	 * command.  We'll need to update the ring's dequeue segment and dequeue
-- 
2.25.1

