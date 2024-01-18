Return-Path: <linux-usb+bounces-5223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CC831AE6
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48AF61F26A57
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 13:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46002560B;
	Thu, 18 Jan 2024 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g82f9ufi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75652250EF
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705586135; cv=none; b=Qekei1wtkeDyVPHsy09Nxth/WLFvf0YcK4r6yxNi+KtHTHxpmcIdD1XdhEJTaNtpED+NG3BS1gmvb6F2Hzw7Yj/m3P4SLMwhI6K6hELRW//yDkDddw2rN2n2RUJ9bGtzf56Ht52mhhZ2CxNb3T7yiwUlh18jw7M8wSmKfixoDZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705586135; c=relaxed/simple;
	bh=dW2O4YnTxAPszVBuYLSvwPlH05xzhDVrz2gKAE3SNCs=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=pUfpZEg+KxAO6X3BubP4wrZ93XOL/IJGjhhjFFlnX8k/3hBhu2Va/X93B2hefYDHufl81WLzr3JiKp2YAL6FLgp7kh+OIKSkqUVH4bXpGvJnEPQOWbi9BFEWUW7JMIOFH9x6rI8RilkZqlZ9GXuXnvOGV8QfkK3imDcu4zfqebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g82f9ufi; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705586133; x=1737122133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dW2O4YnTxAPszVBuYLSvwPlH05xzhDVrz2gKAE3SNCs=;
  b=g82f9ufiXIr/IYC/60isVikuVvjnZ0IM4bBrrzzUDBWTmpHewk6JqRBx
   tFmHB7M2twawIVUQS1Gd6bjX3kWLZDECkAaleBni18N2+RCrnB0jV9Wp1
   MF2ap/GMOtY34BFV/pVBGiAqaIHpA62MnO4dl6bPs9jzqwm52LlyoiBM0
   wTGaaeuD60gsqApCoj/Hj+3IiSv4TuMVOpSPS5AN3piAI4QlTT6zNPePo
   e6DQXODCRo7DdAVl+dAgztH8KmBxTfyZgb7QefVY5QtHgs+Zn3Al+5wKO
   eurAYboQAWrnSyk0t1lafH1yoCBtoBO6emyIQ17bNzyCbehGlG27tSA1H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431607249"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="431607249"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 05:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957818563"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="957818563"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2024 05:55:29 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: michal.pecio@gmail.com
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH v2] xhci: process isoc TD properly when there was an error mid TD.
Date: Thu, 18 Jan 2024 15:56:52 +0200
Message-Id: <20240118135652.2629101-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d9a72d01-0c8c-9dab-f405-268a66f47505@linux.intel.com>
References: <d9a72d01-0c8c-9dab-f405-268a66f47505@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The last TRB of a isoc TD might not trigger an event if there was
an error event for TRB mid TD. This is seen on a NEC Corporation
uPD720200 USB 3.0 Host

After an error mid a multi-TRB TD the xHC should according to xhci 4.9.1
generate events for passed TRBs with IOC flag set if it proceeds to the
next TD. This event is either a copy of the original error, or a
"success" transfer event.

If that event is missing then the driver and xHC host get out of sync
as driver is still expecting a transfer event for that first TD, while
xHC host is already sending events for the next TD in the list.
This leads to
"Transfer event TRB DMA ptr not part of current TD" messages.

As a solution we tag the isoc TDs that get error events mid TD.
If an event doesn't match the first TD, then check if the tag is
set, and event points to the next TD.
In that case give back the fist TD and process the next TD normally

Make sure TD status and tranferred length stay valid in all cases.

Reported-by: Michał Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
  v1 -> v2:
  - Check for empty TD list, suggested by Michał
  - Don't overwrite error status, suggested by Michał
  - Add a debug print for missed TD completion event, suggested by Michał
  - Reword commit message and code comments
  - Set correct TD transfer length in isoc error case

drivers/usb/host/xhci-ring.c | 81 +++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 33806ae966f9..9f0f694358cc 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2376,6 +2376,9 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	/* handle completion code */
 	switch (trb_comp_code) {
 	case COMP_SUCCESS:
+		/* Don't overwrite status if TD had an error, see xHCI 4.9.1 */
+		if (td->error_mid_td)
+			break;
 		if (remaining) {
 			frame->status = short_framestatus;
 			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
@@ -2401,9 +2404,20 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	case COMP_USB_TRANSACTION_ERROR:
 		frame->status = -EPROTO;
-		if (ep_trb != td->last_trb)
-			return 0;
-		break;
+		sum_trbs_for_length = true;
+
+		if (ep_trb == td->last_trb)
+			break;
+
+		/* Error mid TD, don't give TD back yet */
+		td->error_mid_td = true;
+		td->urb_length_set = true;
+
+		frame->actual_length = sum_trb_lengths(xhci, ep->ring, ep_trb) +
+			ep_trb_len - remaining;
+		td->urb->actual_length += frame->actual_length;
+		return 0;
+
 	case COMP_STOPPED:
 		sum_trbs_for_length = true;
 		break;
@@ -2422,6 +2436,9 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	}
 
+	if (td->urb_length_set)
+		goto finish_td;
+
 	if (sum_trbs_for_length)
 		frame->actual_length = sum_trb_lengths(xhci, ep->ring, ep_trb) +
 			ep_trb_len - remaining;
@@ -2430,6 +2447,7 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 
 	td->urb->actual_length += frame->actual_length;
 
+finish_td:
 	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
@@ -2808,17 +2826,51 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		if (!ep_seg) {
-			if (!ep->skip ||
-			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
-				/* Some host controllers give a spurious
-				 * successful event after a short transfer.
-				 * Ignore it.
-				 */
-				if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-						ep_ring->last_td_was_short) {
-					ep_ring->last_td_was_short = false;
-					goto cleanup;
+
+			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+				skip_isoc_td(xhci, td, ep, status);
+				goto cleanup;
+			}
+
+			/*
+			 * Some hosts give a spurious success event after a short
+			 * transfer. Ignore it.
+			 */
+			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
+			    ep_ring->last_td_was_short) {
+				ep_ring->last_td_was_short = false;
+				goto cleanup;
+			}
+
+			/*
+			 * xhci 4.10.2 states isoc endpoints should continue
+			 * processing the next TD if there was an error mid TD.
+			 * So host like NEC don't generate an event for the last
+			 * isoc TRB even if the IOC flag is set.
+			 * xhci 4.9.1 states that if there are errors in mult-TRB
+			 * TDs xHC should generate an error for that TRB, and if xHC
+			 * proceeds to the next TD it should genete an event for
+			 * any TRB with IOC flag on the way. Other host follow this.
+			 * So this event might be for the next TD.
+			 */
+			if (td->error_mid_td &&
+			    !list_is_last(&td->td_list, &ep_ring->td_list)) {
+				struct xhci_td *td_next = list_next_entry(td, td_list);
+
+				ep_seg = trb_in_td(xhci, td_next->start_seg, td_next->first_trb,
+						   td_next->last_trb, ep_trb_dma, false);
+				if (ep_seg) {
+					/* give back previous TD, start handling new */
+					xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
+					ep_ring->dequeue = td->last_trb;
+					ep_ring->deq_seg = td->last_trb_seg;
+					inc_deq(xhci, ep_ring);
+					xhci_td_cleanup(xhci, td, ep_ring, td->status);
+					td = td_next;
 				}
+			}
+
+			if (!ep_seg) {
 				/* HC is busted, give up! */
 				xhci_err(xhci,
 					"ERROR Transfer event TRB DMA ptr not "
@@ -2830,9 +2882,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					  ep_trb_dma, true);
 				return -ESHUTDOWN;
 			}
-
-			skip_isoc_td(xhci, td, ep, status);
-			goto cleanup;
 		}
 		if (trb_comp_code == COMP_SHORT_PACKET)
 			ep_ring->last_td_was_short = true;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a5c72a634e6a..6f82d404883f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1549,6 +1549,7 @@ struct xhci_td {
 	struct xhci_segment	*bounce_seg;
 	/* actual_length of the URB has already been set */
 	bool			urb_length_set;
+	bool			error_mid_td;
 	unsigned int		num_trbs;
 };
 
-- 
2.25.1


