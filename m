Return-Path: <linux-usb+bounces-11691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE591815B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558731F22035
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C3717E45B;
	Wed, 26 Jun 2024 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORbpjj9o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B6186E2F
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406032; cv=none; b=JQQO7hKq1n+N2D83+xtatcSBB4epmz9bBBNBQ3P+TgJAn/ZQFL9uySNMO1rQ8XqFeHVzs1FipZVp2iSUrmePhgnIVgWoVbhA8PWOlkrZtquJoEiE1LYLg91Y2gnL4d4/Oeca53uk5KxlCoW3NRp3x0TVonCiFbzyvffcVEFA2no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406032; c=relaxed/simple;
	bh=0KX1SWGKZPgHn9BKoc2/Di9yJ5BVdKiRXVmVIFawINE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzVDwrGtAIqDSPod2mwh3y739IiYNXoUI6dlParAPPOKS8Lbm/VkocH0vTTWl4KACTbQ/IvlkhxJmawnhgoZf+xsfI0ZzE6Xpxthty9r6AzvdollwBx85+/Ws3oWr7gSHV/8JA3Z+OqHyQxjbuIl73Ertibf/7JhF/EeouJ+3aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORbpjj9o; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406031; x=1750942031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0KX1SWGKZPgHn9BKoc2/Di9yJ5BVdKiRXVmVIFawINE=;
  b=ORbpjj9osT5lfJEpTyxea/MsbrMUQpHwH6ImCMFSRvf/bvuIoYC3AfDf
   2Mk1v/nzayjDUDU73RslTLaVuZLUvkbPIrQHfuArfUKVOtxC/HzzW8Dxq
   rfVOGUGvkqqWIlUdI+bqOyF8gExwwKLbgcKwdOSLKfDA0cAE4aDCu9I75
   /wgOL09xMUlpWYHsrEXqWViHxVShi0FgtWZyssuHm0P9lEtHm8E/Bns5p
   shnkc5q2Ah9jSfil1sek1md1TKjdDSRL7Yr6aNyBB57+oPwdlXvX/QZsB
   oakbCyQGaFssoF7SvCAolB4K/dBxVARW+ysRSevrayMneFioNXJwWLgok
   A==;
X-CSE-ConnectionGUID: qYaGZecXTHy6MxwrD+Wiqw==
X-CSE-MsgGUID: xeN7Q0gjTO2HP4qemT7M4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353424"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:10 -0700
X-CSE-ConnectionGUID: mrnxvpe2RtSOvIoTSEoU8A==
X-CSE-MsgGUID: ksXbhk3aT3iRHvTRYYvMtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442753"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:08 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/21] usb: xhci: move process TD code out of the while loop
Date: Wed, 26 Jun 2024 15:48:32 +0300
Message-Id: <20240626124835.1023046-19-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

This part is and should only performed once, so it's moved out of the
while loop to improve code readability.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 62 +++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7baa9dc706a1..d037d3bbc767 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2868,10 +2868,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				return -ESHUTDOWN;
 			}
 		}
-		if (trb_comp_code == COMP_SHORT_PACKET)
-			ep_ring->last_td_was_short = true;
-		else
-			ep_ring->last_td_was_short = false;
 
 		if (ep->skip) {
 			xhci_dbg(xhci,
@@ -2880,34 +2876,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			ep->skip = false;
 		}
 
-		ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) /
-						sizeof(*ep_trb)];
-
-		trace_xhci_handle_transfer(ep_ring,
-				(struct xhci_generic_trb *) ep_trb);
-
-		/*
-		 * No-op TRB could trigger interrupts in a case where
-		 * a URB was killed and a STALL_ERROR happens right
-		 * after the endpoint ring stopped. Reset the halted
-		 * endpoint. Otherwise, the endpoint remains stalled
-		 * indefinitely.
-		 */
-
-		if (trb_is_noop(ep_trb)) {
-			if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
-				xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
-		} else {
-			td->status = status;
-
-			/* update the urb's actual_length and give back to the core */
-			if (usb_endpoint_xfer_control(&td->urb->ep->desc))
-				process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
-			else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
-				process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
-			else
-				process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
-		}
 	/*
 	 * If ep->skip is set, it means there are missed tds on the
 	 * endpoint ring need to take care of.
@@ -2916,6 +2884,36 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	if (trb_comp_code == COMP_SHORT_PACKET)
+		ep_ring->last_td_was_short = true;
+	else
+		ep_ring->last_td_was_short = false;
+
+	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
+	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb);
+
+	/*
+	 * No-op TRB could trigger interrupts in a case where a URB was killed
+	 * and a STALL_ERROR happens right after the endpoint ring stopped.
+	 * Reset the halted endpoint. Otherwise, the endpoint remains stalled
+	 * indefinitely.
+	 */
+
+	if (trb_is_noop(ep_trb)) {
+		if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+			xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
+	} else {
+		td->status = status;
+
+		/* update the urb's actual_length and give back to the core */
+		if (usb_endpoint_xfer_control(&td->urb->ep->desc))
+			process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
+		else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
+			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
+		else
+			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
+	}
+
 	return 0;
 
 err_out:
-- 
2.25.1


