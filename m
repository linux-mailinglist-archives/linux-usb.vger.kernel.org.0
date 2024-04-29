Return-Path: <linux-usb+bounces-9906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E98B5ABD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6FB1C20D6A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE607C089;
	Mon, 29 Apr 2024 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5esrwhb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37ED7580B
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399280; cv=none; b=l1EKIs+9FlZL7yffTeO6mEAetC3dlzfifRZn3P+DfH7Me7+nyFz3usymbnD4VuOQBuV+OXv3ZGxxJHz6zLHUmiXEtwLhNs7eeyfB9LvKCbrk+oR462Jd57OKiUOYNQL+Xi7a4kFKbL5x1ZB569V3jEVkkwuF3wuB+50czsyH+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399280; c=relaxed/simple;
	bh=jammnbydRIvvkTFIneJHmsH8TaeqFT+5zvA808A9KOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOhZO7GSDzN+wpuRf0WCAADQVbOnRYwntMfe/D/eBqWkIj3yloKg5WjbpFmXQLsAFrd7Ym5xc0tP4JkpN4ut6Ydfc/tqVGhfr8qR9r8AV4PCSBq4zF+1OlBiwjzE1oUae9tsrSiAsO2Sn6/qqmmDud0oqICCtek7yEcYaZ9hFwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5esrwhb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399279; x=1745935279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jammnbydRIvvkTFIneJHmsH8TaeqFT+5zvA808A9KOE=;
  b=R5esrwhbcNR2GRUAOJMxI31c3gC1f+yWBmAQB/gD7mVj0D8JuG0MKtWR
   8lDx4RmKpL5/kB2IR0EkzEIWGL3HftqUXuYwLMqXFAIXze95u1vm9WCgk
   N15VZAqvtm67w9vLxv/d66x048k8AYWDJLRxVKasydGpoML7BtnBdIpPE
   h8OfVPHLQxD4H6gmeUsY6o7PuaRvebN6J6v2K/5bQY0bZmBB3yMT+wZ+Y
   EazxiHui+fuh+OCkHoqw9ZCC2Dj1qCUSCHFe4Yz5zV9mdqK+hJXydzo8o
   2CwOd21oh2TBRGaQ33K8ztq1VR792n80SY47nqxVA6nV+pwEIR+CCGYs9
   Q==;
X-CSE-ConnectionGUID: 3zq0DqJgT4+si6L6kKDPpg==
X-CSE-MsgGUID: BFrFAV70TPGKhjNQDQV8yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911499"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:18 -0700
X-CSE-ConnectionGUID: Fe56bhqbRxWW5aveqpOX9A==
X-CSE-MsgGUID: VDQ4Wj0bRJWcUl/AdCD84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521865"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:16 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/18] usb: xhci: remove goto 'cleanup' in handle_tx_event()
Date: Mon, 29 Apr 2024 17:02:40 +0300
Message-Id: <20240429140245.3955523-14-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

By removing the goto 'cleanup' statement, and replacing it with 'continue',
'break' and 'return', helps simplify the code and further showcase in which
case the while loop iterates.

This change prepares for the comprehensive handle_tx_event() rework.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 38 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0f48f9befc94..b395708c488c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2727,7 +2727,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					"still with TDs queued?\n",
 				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
 				 ep_index);
-		goto cleanup;
+		if (ep->skip)
+			break;
+		return 0;
 	case COMP_RING_OVERRUN:
 		xhci_dbg(xhci, "overrun event on endpoint\n");
 		if (!list_empty(&ep_ring->td_list))
@@ -2735,7 +2737,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					"still with TDs queued?\n",
 				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
 				 ep_index);
-		goto cleanup;
+		if (ep->skip)
+			break;
+		return 0;
 	case COMP_MISSED_SERVICE_ERROR:
 		/*
 		 * When encounter missed service error, one or more isoc tds
@@ -2770,7 +2774,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_warn(xhci,
 			  "ERROR Unknown event condition %u for slot %u ep %u , HC probably busted\n",
 			  trb_comp_code, slot_id, ep_index);
-		goto cleanup;
+		if (ep->skip)
+			break;
+		return 0;
 	}
 
 	do {
@@ -2834,14 +2840,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		if (!ep_seg && (trb_comp_code == COMP_STOPPED ||
 			   trb_comp_code == COMP_STOPPED_LENGTH_INVALID)) {
-			goto cleanup;
+			continue;
 		}
 
 		if (!ep_seg) {
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				skip_isoc_td(xhci, td, ep, status);
-				goto cleanup;
+				continue;
 			}
 
 			/*
@@ -2926,19 +2932,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 							      trb_comp_code))
 				xhci_handle_halted_endpoint(xhci, ep, td,
 							    EP_HARD_RESET);
-			goto cleanup;
-		}
-
-		td->status = status;
+		} else {
+			td->status = status;
 
-		/* update the urb's actual_length and give back to the core */
-		if (usb_endpoint_xfer_control(&td->urb->ep->desc))
-			process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
-		else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
-			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
-		else
-			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
-cleanup:;
+			/* update the urb's actual_length and give back to the core */
+			if (usb_endpoint_xfer_control(&td->urb->ep->desc))
+				process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
+			else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
+				process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
+			else
+				process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
+		}
 	/*
 	 * If ep->skip is set, it means there are missed tds on the
 	 * endpoint ring need to take care of.
-- 
2.25.1


