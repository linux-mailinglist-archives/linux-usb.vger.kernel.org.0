Return-Path: <linux-usb+bounces-3565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2772800DF9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61F21C21166
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C8D4AF78;
	Fri,  1 Dec 2023 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDk20rmn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D122B9
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443173; x=1732979173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I8wroRXQOENA6wPsoXEwixvABOTuLLSLJrj/mbXxnYM=;
  b=RDk20rmnMebJWflxjj6P4GOFyy/Z/WnmDAAU5+H91bsDCD0Zzn8deijO
   6Dw01+9oOmNcGrSLvbshQDfhfmc7zWalJeNuhickgXSQehwhsSc5DSBVQ
   rJBj8CAdrv+lXxHD2LJT55Fz9itfEMzPggDJJd8Aqgh0rW/jliDrinjfj
   Fync7aocOD6mXsweu+s+pafJ9ZKUbpsmcsQvRhscKHf8MnQiPitgpM5g5
   GBs0eViWJUrTAmvT+ikt8zNbCrnOjHO4UauPlWmuY0OF0toOt8BoY2mRh
   KipF+qfdbgXa/60Q8B6nt4YF/XZxk4Kq7K/+7ewKKusckX4w2rku7OV3U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309777"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309777"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112667"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112667"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:06:11 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/19] xhci: Reconfigure endpoint 0 max packet size only during endpoint reset
Date: Fri,  1 Dec 2023 17:06:46 +0200
Message-Id: <20231201150647.1307406-19-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The max packet size for full speed control endpoint 0 may vary. It is
defined in the device descriptor, which is read using the same endpoint.
Usb core sets a temporary max packet size value until the real value is
read.

xhci driver needs to reconfigure the endpoint context seen by the
controller if the max packet size changes.
It makes more sense to do this reconfiguration in xhci_endpoint_reset()
instead of urb enqueue as usb core will call endpoint reset during
enumeration if the max packet values differ.
Max packet size adjustment for endpoint 0 can only happen once per
device enumeration.

Previously the max packet size was checked during every urb enqueue.
This is an additional check for every enqueued urb, and also turned out
to have locking issues as urbs may be queued in any context while xhci
max packet size reconfiguration requires memory allocation, locking, and
sleeping.

Tested with a full speed device using both old and new scheme enumeration
and an intentionally incorrect preliminary max packet size value.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---

Change since RFT patch:
  Fix typos in commit message pointed out by Kuen-Han Tsai

 drivers/usb/host/xhci.c | 85 ++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 43 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 884b0898d9c9..df31d44498d6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1438,10 +1438,8 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
  * descriptor.  If the usb_device's max packet size changes after that point,
  * we need to issue an evaluate context command and wait on it.
  */
-static int xhci_check_maxpacket(struct xhci_hcd *xhci, unsigned int slot_id,
-		unsigned int ep_index, struct urb *urb, gfp_t mem_flags)
+static int xhci_check_ep0_maxpacket(struct xhci_hcd *xhci, struct xhci_virt_device *vdev)
 {
-	struct xhci_container_ctx *out_ctx;
 	struct xhci_input_control_ctx *ctrl_ctx;
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_command *command;
@@ -1449,11 +1447,15 @@ static int xhci_check_maxpacket(struct xhci_hcd *xhci, unsigned int slot_id,
 	int hw_max_packet_size;
 	int ret = 0;
 
-	out_ctx = xhci->devs[slot_id]->out_ctx;
-	ep_ctx = xhci_get_ep_ctx(xhci, out_ctx, ep_index);
+	ep_ctx = xhci_get_ep_ctx(xhci, vdev->out_ctx, 0);
 	hw_max_packet_size = MAX_PACKET_DECODED(le32_to_cpu(ep_ctx->ep_info2));
-	max_packet_size = usb_endpoint_maxp(&urb->dev->ep0.desc);
-	if (hw_max_packet_size != max_packet_size) {
+	max_packet_size = usb_endpoint_maxp(&vdev->udev->ep0.desc);
+
+	if (hw_max_packet_size == max_packet_size)
+		return 0;
+
+	switch (max_packet_size) {
+	case 8: case 16: case 32: case 64: case 9:
 		xhci_dbg_trace(xhci,  trace_xhci_dbg_context_change,
 				"Max Packet Size for ep 0 changed.");
 		xhci_dbg_trace(xhci,  trace_xhci_dbg_context_change,
@@ -1465,28 +1467,22 @@ static int xhci_check_maxpacket(struct xhci_hcd *xhci, unsigned int slot_id,
 		xhci_dbg_trace(xhci,  trace_xhci_dbg_context_change,
 				"Issuing evaluate context command.");
 
-		/* Set up the input context flags for the command */
-		/* FIXME: This won't work if a non-default control endpoint
-		 * changes max packet sizes.
-		 */
-
-		command = xhci_alloc_command(xhci, true, mem_flags);
+		command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 		if (!command)
 			return -ENOMEM;
 
-		command->in_ctx = xhci->devs[slot_id]->in_ctx;
+		command->in_ctx = vdev->in_ctx;
 		ctrl_ctx = xhci_get_input_control_ctx(command->in_ctx);
 		if (!ctrl_ctx) {
 			xhci_warn(xhci, "%s: Could not get input context, bad type.\n",
 					__func__);
 			ret = -ENOMEM;
-			goto command_cleanup;
+			break;
 		}
 		/* Set up the modified control endpoint 0 */
-		xhci_endpoint_copy(xhci, xhci->devs[slot_id]->in_ctx,
-				xhci->devs[slot_id]->out_ctx, ep_index);
+		xhci_endpoint_copy(xhci, vdev->in_ctx, vdev->out_ctx, 0);
 
-		ep_ctx = xhci_get_ep_ctx(xhci, command->in_ctx, ep_index);
+		ep_ctx = xhci_get_ep_ctx(xhci, command->in_ctx, 0);
 		ep_ctx->ep_info &= cpu_to_le32(~EP_STATE_MASK);/* must clear */
 		ep_ctx->ep_info2 &= cpu_to_le32(~MAX_PACKET_MASK);
 		ep_ctx->ep_info2 |= cpu_to_le32(MAX_PACKET(max_packet_size));
@@ -1494,17 +1490,20 @@ static int xhci_check_maxpacket(struct xhci_hcd *xhci, unsigned int slot_id,
 		ctrl_ctx->add_flags = cpu_to_le32(EP0_FLAG);
 		ctrl_ctx->drop_flags = 0;
 
-		ret = xhci_configure_endpoint(xhci, urb->dev, command,
-				true, false);
-
-		/* Clean up the input context for later use by bandwidth
-		 * functions.
-		 */
+		ret = xhci_configure_endpoint(xhci, vdev->udev, command,
+					      true, false);
+		/* Clean up the input context for later use by bandwidth functions */
 		ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG);
-command_cleanup:
-		kfree(command->completion);
-		kfree(command);
+		break;
+	default:
+		dev_dbg(&vdev->udev->dev, "incorrect max packet size %d for ep0\n",
+			max_packet_size);
+		return -EINVAL;
 	}
+
+	kfree(command->completion);
+	kfree(command);
+
 	return ret;
 }
 
@@ -1561,21 +1560,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	trace_xhci_urb_enqueue(urb);
 
-	if (usb_endpoint_xfer_control(&urb->ep->desc)) {
-		/* Check to see if the max packet size for the default control
-		 * endpoint changed during FS device enumeration
-		 */
-		if (urb->dev->speed == USB_SPEED_FULL) {
-			ret = xhci_check_maxpacket(xhci, slot_id,
-					ep_index, urb, mem_flags);
-			if (ret < 0) {
-				xhci_urb_free_priv(urb_priv);
-				urb->hcpriv = NULL;
-				return ret;
-			}
-		}
-	}
-
 	spin_lock_irqsave(&xhci->lock, flags);
 
 	if (xhci->xhc_state & XHCI_STATE_DYING) {
@@ -3104,6 +3088,21 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	int err;
 
 	xhci = hcd_to_xhci(hcd);
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+
+	/*
+	 * Usb core assumes a max packet value for ep0 on FS devices until the
+	 * real value is read from the descriptor. Core resets Ep0 if values
+	 * mismatch. Reconfigure the xhci ep0 endpoint context here in that case
+	 */
+	if (usb_endpoint_xfer_control(&host_ep->desc) && ep_index == 0) {
+		udev = container_of(host_ep, struct usb_device, ep0);
+		if (udev->speed == USB_SPEED_FULL)
+			xhci_check_ep0_maxpacket(xhci, xhci->devs[udev->slot_id]);
+		/* Nothing else should be done here for ep0 during ep reset */
+		return;
+	}
+
 	if (!host_ep->hcpriv)
 		return;
 	udev = (struct usb_device *) host_ep->hcpriv;
@@ -3116,7 +3115,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	 */
 	if (!udev->slot_id || !vdev)
 		return;
-	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+
 	ep = &vdev->eps[ep_index];
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
-- 
2.25.1


