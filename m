Return-Path: <linux-usb+bounces-16366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5059A22FD
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658F21F230B4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1048F1DD88F;
	Thu, 17 Oct 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WF78O0FP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F261DD53C
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170445; cv=none; b=Ng2DkGj9Xs2Cos2EzrM9X9imZtaRTaWqfUDCsdAVSu7Cteu4p0lk/hNoLDPzPGTkfXymjqh3BPjRzMzCcPZUg/2LrAjYxTY/1JALLoUniDp7SXwEBtc5A6Qa1xJf5y78Hf+ALSYuIT+98Sodn0R3QVfXkBq7EbJmbxiGmOznsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170445; c=relaxed/simple;
	bh=GMw7ih1Zn2jgo6wMvT89vPPt0ZrbW/5+JmhGvc8ULdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGbzzJk8CAWjgqCfZGHOyvZgzizqspx1prArA522i7MAtwwNYPNfhct/rKD9NpqlYECd4zJt2GRNSlLE73aIlS45URkPpVzlhuYCauQjL7UomoNxOJA2URCasU1tKRE2CcUWrYmZIWfSfEw3GO35e/QmwTObLiH9iS7+Perpa6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WF78O0FP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170444; x=1760706444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GMw7ih1Zn2jgo6wMvT89vPPt0ZrbW/5+JmhGvc8ULdc=;
  b=WF78O0FPzFjpfVkrwmtWPbAN7rhpfe5PnB7Nw++Pv40oIepZZARvjOVW
   g/cAEqIZgkvAm/cnS/5N50Vd9OoxQVQzIh8ueRph8ZHohqIdzf6InhN4I
   akw/rEX09ijr4v9wYZ8fZK9d8Y4xdXP+Vr2TblYwhVEXIELvZJ6Rvr6OD
   R6dJT34S1VmXg4t+fEmMy8WJd6NoeGkFPQeKkg/tjwXveYPAnPmeN5drB
   ryYvZ4htMEnpNk/2gXpRBTj7bBah7YcJE0DQp/5Npr5DSzwJl9C6gD4nI
   oFsHWG2aNiXyrOSrEN8mddnCr+cC/bWOM9R0f8z51v6Z7sZ1XgNZ+3kTI
   A==;
X-CSE-ConnectionGUID: Jj+qHih0Seyjo07NOs7sPg==
X-CSE-MsgGUID: thuTI0QgSCGqQLMClrisxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39290392"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="39290392"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:23 -0700
X-CSE-ConnectionGUID: FSBfYJsjTEW2xaC7PDDaMw==
X-CSE-MsgGUID: XuHmYgdlQUKCDlNb7dN2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78882318"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2024 06:07:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 9F435297; Thu, 17 Oct 2024 16:07:21 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 5/8] usb: xhci: remove unused arguments from td_to_noop()
Date: Thu, 17 Oct 2024 16:05:05 +0300
Message-ID: <20241017130508.1293021-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function td_to_noop() does not utilize arguments 'xhci' and 'ep_ring'.
These unused arguments are removed to clean up the code.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a3e19fa4d2cc..e2e20ae424ad 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -740,8 +740,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
  * (The last TRB actually points to the ring enqueue pointer, which is not part
  * of this TD.)  This is used to remove partially enqueued isoc TDs from a ring.
  */
-static void td_to_noop(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
-		       struct xhci_td *td, bool flip_cycle)
+static void td_to_noop(struct xhci_td *td, bool flip_cycle)
 {
 	struct xhci_segment *seg	= td->start_seg;
 	union xhci_trb *trb		= td->start_trb;
@@ -1020,16 +1019,16 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 						  "Found multiple active URBs %p and %p in stream %u?\n",
 						  td->urb, cached_td->urb,
 						  td->urb->stream_id);
-					td_to_noop(xhci, ring, cached_td, false);
+					td_to_noop(cached_td, false);
 					cached_td->cancel_status = TD_CLEARED;
 				}
-				td_to_noop(xhci, ring, td, false);
+				td_to_noop(td, false);
 				td->cancel_status = TD_CLEARING_CACHE;
 				cached_td = td;
 				break;
 			}
 		} else {
-			td_to_noop(xhci, ring, td, false);
+			td_to_noop(td, false);
 			td->cancel_status = TD_CLEARED;
 		}
 	}
@@ -1054,7 +1053,7 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 				continue;
 			xhci_warn(xhci, "Failed to clear cancelled cached URB %p, mark clear anyway\n",
 				  td->urb);
-			td_to_noop(xhci, ring, td, false);
+			td_to_noop(td, false);
 			td->cancel_status = TD_CLEARED;
 		}
 	}
@@ -4178,7 +4177,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	urb_priv->td[0].end_trb = ep_ring->enqueue;
 	/* Every TRB except the first & last will have its cycle bit flipped. */
-	td_to_noop(xhci, ep_ring, &urb_priv->td[0], true);
+	td_to_noop(&urb_priv->td[0], true);
 
 	/* Reset the ring enqueue back to the first TRB and its cycle bit. */
 	ep_ring->enqueue = urb_priv->td[0].start_trb;
-- 
2.45.2


