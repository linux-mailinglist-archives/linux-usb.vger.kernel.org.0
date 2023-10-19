Return-Path: <linux-usb+bounces-1908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A97CF542
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB2591C20E41
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B756182C2;
	Thu, 19 Oct 2023 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDUWjRSO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4D1944E
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD36124
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711304; x=1729247304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jz0LfSu6Y9QzQBDl/gYoL2kfgjAbp3GRfjtYCoDskRw=;
  b=fDUWjRSOZxWnruoKbbDausuf5ya89XtrqDt5SMJBEVk8gR3MWxY3ORDc
   JCLnYWJ6MZS4TZxd57XGOFjvb+PuuEUlgv7uEidBH80gWEekCfE+8S8Le
   C4gojr5bJTa9erNA6K+DmCFLF97UG8P2ES5b/ZHO+HciIZzUnDQAraQUN
   4I7PhuzSY/yBWfZZrJoH3idNIw3mLSacUVfYkCn7fG9dc+UGESujo1AUQ
   ydQeLik9e+ckqkOZe9kwNF+qM/SYUyZoWaMGrJ9KGutVfeBJxSFI/mPWv
   NfFEev9REjx51MrOblBC8NOpP4001RCnM4wYmTLQwJSwKyytYoGqsliNF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075904"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075904"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557808"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557808"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:23 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/19] xhci: Simplify event ring dequeue pointer update for port change events
Date: Thu, 19 Oct 2023 13:29:18 +0300
Message-Id: <20231019102924.2797346-14-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the event ring dequeue pointer for port change events in the
same way as other event types. No need to handle it separately.

This only touches the driver side tracking of event ring dequeue.

Note: this does move forward the event ring dequeue increase for port
change events a bit.
Previously the dequeue was increased before temporarily dropping
the xhci lock while kicking roothub polling.
Now dequeue is increased after re-aquiring the lock.

This should not matter as event ring dequeue is not touched at all by
hub thread. It's only touched in xhci interrupt handler.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7aa6f132835b..73057f01e4aa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1879,7 +1879,6 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	if ((port_id <= 0) || (port_id > max_ports)) {
 		xhci_warn(xhci, "Port change event with invalid port ID %d\n",
 			  port_id);
-		inc_deq(xhci, ir->event_ring);
 		return;
 	}
 
@@ -2007,8 +2006,6 @@ static void handle_port_status(struct xhci_hcd *xhci,
 	}
 
 cleanup:
-	/* Update event ring dequeue pointer before dropping the lock */
-	inc_deq(xhci, ir->event_ring);
 
 	/* Don't make the USB core poll the roothub if we got a bad port status
 	 * change event.  Besides, at that point we can't tell which roothub
@@ -2915,7 +2912,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
 	union xhci_trb *event;
-	int update_ptrs = 1;
 	u32 trb_type;
 
 	/* Event ring hasn't been allocated yet. */
@@ -2946,7 +2942,6 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		break;
 	case TRB_PORT_STATUS:
 		handle_port_status(xhci, ir, event);
-		update_ptrs = 0;
 		break;
 	case TRB_TRANSFER:
 		handle_tx_event(xhci, ir, &event->trans_event);
@@ -2969,9 +2964,8 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		return 0;
 	}
 
-	if (update_ptrs)
-		/* Update SW event ring dequeue pointer */
-		inc_deq(xhci, ir->event_ring);
+	/* Update SW event ring dequeue pointer */
+	inc_deq(xhci, ir->event_ring);
 
 	/* Are there more items on the event ring?  Caller will call us again to
 	 * check.
-- 
2.25.1


