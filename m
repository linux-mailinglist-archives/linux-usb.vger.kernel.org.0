Return-Path: <linux-usb+bounces-21448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC81A54E39
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E793A9FAE
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383B51FF7CC;
	Thu,  6 Mar 2025 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnTEl5c6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF81188713
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272592; cv=none; b=Ugp543wXcrbYoAgWVFvOpiixBd9LVz8zMDHy7Fk5LJD6yzgv8dY/OAuMLUNwyJGsnlJvRcAad6wmQZ3SWMlLigccg7/sJGek+0YfpdWDsIHejTeitY9vmf5oZqK9Ge5UqeHjOPr2tgXt01QQrasYL7wNh3mhRbwdKBk7KL3q388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272592; c=relaxed/simple;
	bh=h0jmkNPs0kBm6EOeKCEag0WU4dJUWsRvAIz2E3r2iVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGKKouJmLug43E7unkk2wH/uXSrbeQy/GGiOH3YQgEX3b3MbQhm+S53lqI9s6fxOGd1X+husZw5m92Xv5/MukrLEGbpJUwRiCN7JzTInYnF2DvkSqGnwFL2D8+07XJ29ZSAP2+f5Iqgx+akqWdHzYBAL/GREWWOiOZw0U+OtG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnTEl5c6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272591; x=1772808591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h0jmkNPs0kBm6EOeKCEag0WU4dJUWsRvAIz2E3r2iVI=;
  b=BnTEl5c6yceW8WFBh+WsW2jLOZ8PsrKHoNRPezsM7mW61JJodes3bZHS
   xTnIiVYUsRTH+ONZ1cczRYo5lokSmfG/FiPwKx9aWoYonCCe/wDu4PbbY
   Lrky0AfVfPUsN6ciUcukATPRMgfDkQraSZNrz4H2SAuo9Mc3McDvu4s88
   e2gMrbe03CmXrhS5/CTROyflYSvKGAryCk0WLgQ+/VzlID7Rrjm9yPCfX
   1CH7Lgx+CMspSGAZQq1q1WBS4l1y6q5NOAXhI4+jb+e6GwKNHjA2hNmWX
   4+Tv49/1EvIdPeCY4F3DbZvYCLq1B+M5MYhmPy6CtjfeCJ3k4vK3fqR1I
   A==;
X-CSE-ConnectionGUID: 225sBlAbRwybuw82m6Tl1g==
X-CSE-MsgGUID: 6T2zbr53QT6qlpbiCYBxTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657152"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657152"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:51 -0800
X-CSE-ConnectionGUID: KKsl0be6QC6MKR7JW4juQA==
X-CSE-MsgGUID: LVUEjJOqSneGyGggd2z21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954873"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:49 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Kuangyi Chiang <ki.chiang65@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH 15/15] xhci: Handle spurious events on Etron host isoc enpoints
Date: Thu,  6 Mar 2025 16:49:54 +0200
Message-ID: <20250306144954.3507700-16-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unplugging a USB3.0 webcam from Etron hosts while streaming results
in errors like this:

[ 2.646387] xhci_hcd 0000:03:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 18 comp_code 13
[ 2.646446] xhci_hcd 0000:03:00.0: Looking for event-dma 000000002fdf8630 trb-start 000000002fdf8640 trb-end 000000002fdf8650
[ 2.646560] xhci_hcd 0000:03:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 18 comp_code 13
[ 2.646568] xhci_hcd 0000:03:00.0: Looking for event-dma 000000002fdf8660 trb-start 000000002fdf8670 trb-end 000000002fdf8670

Etron xHC generates two transfer events for the TRB if an error is
detected while processing the last TRB of an isoc TD.

The first event can be any sort of error (like USB Transaction or
Babble Detected, etc), and the final event is Success.

The xHCI driver will handle the TD after the first event and remove it
from its internal list, and then print an "Transfer event TRB DMA ptr
not part of current TD" error message after the final event.

Commit 5372c65e1311 ("xhci: process isoc TD properly when there was a
transaction error mid TD.") is designed to address isoc transaction
errors, but unfortunately it doesn't account for this scenario.

This issue is similar to the XHCI_SPURIOUS_SUCCESS case where a success
event follows a 'short transfer' event, but the TD the event points to
is already given back.

Expand the spurious success 'short transfer' event handling to cover
the spurious success after error on Etron hosts.

Kuangyi Chiang reported this issue and submitted a different solution
based on using error_mid_td. This commit message is mostly taken
from that patch.

Reported-by: Kuangyi Chiang <ki.chiang65@gmail.com>
Closes: https://lore.kernel.org/linux-usb/20241028025337.6372-6-ki.chiang65@gmail.com/
Tested-by: Kuangyi Chiang <ki.chiang65@gmail.com>
Tested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 38 ++++++++++++++++++++++++------------
 drivers/usb/host/xhci.h      |  2 +-
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2df94ed3152c..0f8acbb9cd21 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2611,6 +2611,22 @@ static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_
 	return 0;
 }
 
+static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
+					   struct xhci_ring *ring)
+{
+	switch (ring->old_trb_comp_code) {
+	case COMP_SHORT_PACKET:
+		return xhci->quirks & XHCI_SPURIOUS_SUCCESS;
+	case COMP_USB_TRANSACTION_ERROR:
+	case COMP_BABBLE_DETECTED_ERROR:
+	case COMP_ISOCH_BUFFER_OVERRUN:
+		return xhci->quirks & XHCI_ETRON_HOST &&
+			ring->type == TYPE_ISOC;
+	default:
+		return false;
+	}
+}
+
 /*
  * If this function returns an error condition, it means it got a Transfer
  * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
@@ -2665,8 +2681,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	case COMP_SUCCESS:
 		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0) {
 			trb_comp_code = COMP_SHORT_PACKET;
-			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td short %d\n",
-				 slot_id, ep_index, ep_ring->last_td_was_short);
+			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td comp code %d\n",
+				 slot_id, ep_index, ep_ring->old_trb_comp_code);
 		}
 		break;
 	case COMP_SHORT_PACKET:
@@ -2817,7 +2833,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		if (trb_comp_code != COMP_STOPPED &&
 		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
 		    !ring_xrun_event &&
-		    !ep_ring->last_td_was_short) {
+		    !xhci_spurious_success_tx_event(xhci, ep_ring)) {
 			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
 				  slot_id, ep_index);
 		}
@@ -2882,11 +2898,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 			/*
 			 * Some hosts give a spurious success event after a short
-			 * transfer. Ignore it.
+			 * transfer or error on last TRB. Ignore it.
 			 */
-			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-			    ep_ring->last_td_was_short) {
-				ep_ring->last_td_was_short = false;
+			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
+				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
+					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
+				ep_ring->old_trb_comp_code = trb_comp_code;
 				return 0;
 			}
 
@@ -2909,15 +2926,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	ep_ring->old_trb_comp_code = trb_comp_code;
+
 	/* Get out if a TD was queued at enqueue after the xrun occurred */
 	if (ring_xrun_event)
 		return 0;
 
-	if (trb_comp_code == COMP_SHORT_PACKET)
-		ep_ring->last_td_was_short = true;
-	else
-		ep_ring->last_td_was_short = false;
-
 	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d9d7cd1906f3..6c00062a9acc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1375,7 +1375,7 @@ struct xhci_ring {
 	unsigned int		num_trbs_free; /* used only by xhci DbC */
 	unsigned int		bounce_buf_len;
 	enum xhci_ring_type	type;
-	bool			last_td_was_short;
+	u32			old_trb_comp_code;
 	struct radix_tree_root	*trb_address_map;
 };
 
-- 
2.43.0


