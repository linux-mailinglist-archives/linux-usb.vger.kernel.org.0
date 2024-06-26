Return-Path: <linux-usb+bounces-11692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D991815C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA02B288CCE
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00E4186E3A;
	Wed, 26 Jun 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMb0S3UU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566E1862BB
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406033; cv=none; b=N2GxFQqt8VTClRUDUu44TJV3WWZkjUOXqqR6bX0d0/dLT4Ft0kulePF06UsaihEAF7gxm7upmpuKRB0IuUyBXN+f/J4QEQHofy0Ha6qVyV+yGW1/XBDUz61efRDj6CR9eoHs+Se3SHTsOp0v9erNmvIk4ec+t3k0kH2aZw02+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406033; c=relaxed/simple;
	bh=hrd9w+sxQQLra8j3AHrj+5T3GehonSb9FUtvqUpbx+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u2WtVrWLiI/xK6WsEB4Bmdr+yEbN4OUviwDC/E3xidnR6YU545mOfRcRlQD5/GavAYznBu4kJNuywkkl6/HKUrtYN73BA30m78WXrYOdrqhzYjx2Kx8ZHltd7/IkIfu6YHkO+jtX3LuMlbSMnUrvX+4wMKFLZv13d1NVdIcz/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMb0S3UU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406032; x=1750942032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hrd9w+sxQQLra8j3AHrj+5T3GehonSb9FUtvqUpbx+U=;
  b=CMb0S3UUxGwbK6ci0Qa5dUDCrzJWiI6tfU+lTJBtsLEqpkR7CgVmqlPB
   0qE7vvG9/hGJZSYgg5DflAy970oyYf9xciFLRmOyxoCQtN8U+ntfkORzf
   +/K/9/Ku3OyOKeaB4uFOMhQjKKzV8WJKD7sEqi94w9hGdWU9uWjru0k8O
   4ciDPGr2L3NL+ddiEA6PVvZGzbgIjW+B7mFrSZMxEKnv9XLdESW2y9sH2
   6/nxkyYcv0klTgY+2v8v5PAfE7JIjp9qomNq+5o/nURD/uMDu2t14jM6M
   EjAxWnxb3yYD8NXVaJwPmTQ9gKngxkuWCIhnKXwpN+jlrLQqeXfOM3apU
   Q==;
X-CSE-ConnectionGUID: /Xsw8qFhQz6z3+3KbQ0Qrg==
X-CSE-MsgGUID: KAn43+q3QguzSr0LzbLjPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353429"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353429"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:12 -0700
X-CSE-ConnectionGUID: XVsWRc7nQ3+bFasuJALxgA==
X-CSE-MsgGUID: MnRyrbpBS1eS5cjwigOKqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442761"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:10 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 19/21] usb: xhci: add 'goto' for halted endpoint check in handle_tx_event()
Date: Wed, 26 Jun 2024 15:48:33 +0300
Message-Id: <20240626124835.1023046-20-mathias.nyman@linux.intel.com>
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

Add 'goto' statement for a halted endpoint, streamlining the error
handling process. In future handle_tx_event() changes this 'goto'
statement will have more uses.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d037d3bbc767..49f8f980776b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2788,10 +2788,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
 					 slot_id, ep_index);
 			}
-			if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
-				xhci_handle_halted_endpoint(xhci, ep, NULL, EP_HARD_RESET);
 
-			return 0;
+			td = NULL;
+			goto check_endpoint_halted;
 		}
 
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
@@ -2899,20 +2898,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * indefinitely.
 	 */
 
-	if (trb_is_noop(ep_trb)) {
-		if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
-			xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
-	} else {
-		td->status = status;
+	if (trb_is_noop(ep_trb))
+		goto check_endpoint_halted;
 
-		/* update the urb's actual_length and give back to the core */
-		if (usb_endpoint_xfer_control(&td->urb->ep->desc))
-			process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
-		else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
-			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
-		else
-			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
-	}
+	td->status = status;
+
+	/* update the urb's actual_length and give back to the core */
+	if (usb_endpoint_xfer_control(&td->urb->ep->desc))
+		process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
+	else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
+		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
+	else
+		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
+
+check_endpoint_halted:
+	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 	return 0;
 
-- 
2.25.1


