Return-Path: <linux-usb+bounces-17202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E69BE3F5
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F841C20FFE
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BE91DE8B2;
	Wed,  6 Nov 2024 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwzdA8HD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EED1DDC0A
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888010; cv=none; b=XyOsbUVRKBDsmp9oSOtPC+XSuVkKEl/m0aneiReo+uTeT51ANEHYsTR+4tnBO6DAURBkHpEQzmokD/usU+Ca6ZyoDmrR1z+xEdpnkOmnmPJfWqb669IZGk2NnFSri9dIMbf7FHhVYH7X+R+AqZZwQdU/6J5oggNPV8V0Vq21W9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888010; c=relaxed/simple;
	bh=XttzDm5E0W6RN/87pwXVykI0SULiUFkL+YmK+Kl9mj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uV1I1KybLUMkHQIC9H7XH0rzRbVgCX/eoNyI/GRIPro6XMEX3mq0ubdaz9ddkC0je6vzgIcID3jnX6U9ggzhPUQqEotjoeVWPw0EpAvcd13ryMngVbGx8djQJZ8fmBDj3BtLAGP+uo7OPKwwEiQKtix9sgKu4q5Wmha/p6cqTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwzdA8HD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730888008; x=1762424008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XttzDm5E0W6RN/87pwXVykI0SULiUFkL+YmK+Kl9mj4=;
  b=gwzdA8HDHxlSlwCtBLaQnVCP2vgLAlf3tx8gorDhTz8YF5U/rF1qkt1r
   MBu7AXbYk1/dR6HkOGx3vWt7CuviDKtTsr089Ev3y++VqFe6oH02uPAyT
   1+tUNJYzl1JA1baVQpmiQAP6kiKJMQtgsltxBUyuwzTjqdY+BDXFAIhFi
   xDt8K3/FiPGuxFM5bTFynMXIbSkFZCy2YraT75LWQ9N45IFyNWW4eualn
   0kAhOIekEqcAMAXcaKI2DAzpr4PVCothHw1DgyVUDHbYCUKnm6pX4i+ZS
   WteJvVoXiB2qWgDQr/la2xjtJDK0Koxed5sMC3UnhSCRj0DZHOqdK5uDm
   A==;
X-CSE-ConnectionGUID: wWan8mQAQo++b2Cm8BU2oA==
X-CSE-MsgGUID: leyVeFReQ2iCuPGSPLmS8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059473"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:13:28 -0800
X-CSE-ConnectionGUID: fr9hWpt8SSyKVk0J0co1fA==
X-CSE-MsgGUID: RIy8/rjqQnG+8v87QEho7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813409"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:13:27 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 27/33] usb: xhci: remove unused arguments from td_to_noop()
Date: Wed,  6 Nov 2024 12:14:53 +0200
Message-Id: <20241106101459.775897-28-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Function td_to_noop() does not utilize arguments 'xhci' and 'ep_ring'.
These unused arguments are removed to clean up the code.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1b4c785c8dad..5fb3d771c429 100644
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
@@ -4192,7 +4191,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	urb_priv->td[0].end_trb = ep_ring->enqueue;
 	/* Every TRB except the first & last will have its cycle bit flipped. */
-	td_to_noop(xhci, ep_ring, &urb_priv->td[0], true);
+	td_to_noop(&urb_priv->td[0], true);
 
 	/* Reset the ring enqueue back to the first TRB and its cycle bit. */
 	ep_ring->enqueue = urb_priv->td[0].start_trb;
-- 
2.25.1


