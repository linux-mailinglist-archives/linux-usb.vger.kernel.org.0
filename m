Return-Path: <linux-usb+bounces-30560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 836ECC63E9A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01C923AA8BD
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E52A329381;
	Mon, 17 Nov 2025 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fc3X+ISd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7471223DED
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379818; cv=none; b=doMBFORr7E5rfqx1CHZuqzL4J9TmyuRpr6pBCfUrOEk8MBR9xVy9A69SVC2JXaCKpDP2D5RUj0qeTkhL99YqpuQn2+8wfjZIOb9ZYE6GosB0qBS/2S/riJZUiYsLVGAbWtDa1d2U21Egs7iln44wQgDUOoU9JvkHALBkppylRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379818; c=relaxed/simple;
	bh=A0jE211fBuW/emrqK2Vv8LxSpHdjVQeKo1pFSp6yQnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mjokb1R33A1WgCTnnQLYsV6VS7GwVg8RLOeUkyevQnoA5l/Wb1+XwxAUQ8aFuCD/YBZ1f/M+8uMrZTHbpUSl14c6Qx8YRrc2l/28yxaGYVEPnVwZmGCLw3AnPHECP68LxOb4jDEak7rmgKCcjuQu03N4BOddMvrVPinEOqHREaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fc3X+ISd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379817; x=1794915817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A0jE211fBuW/emrqK2Vv8LxSpHdjVQeKo1pFSp6yQnc=;
  b=Fc3X+ISd1PUt7Hyb6craD0MOXySjos7aznNj4HIu9rqxY8QYiwoaeRTM
   MQIJkcXK4iOXW9A6twicbk9z/msPqFA9jrjpAedeq2MrW1ptAkR/J7OMx
   4zp04v08Bua7Aolg9u1/+ttd7o6Hsj/IAJvh8odV77zOPBhEJYzQmESpu
   IdSEp0bBBQ7bcGh6IEdDzUxvgR+2qFAVhe4B8x5UZS9KyaZyyLX2K59W+
   uoNerEjN+meLNuW2F9w/n2fitHcTDa29tR2LPoXJPBIorJPRjWl3Ap5JI
   TEsrPGZbRXaO/cnIAJ5unNTSchLxlrhnq4SU/vE24zoHId7rEq76MGYkD
   A==;
X-CSE-ConnectionGUID: 8ScgK+TNSdeyCDpsHTl+NQ==
X-CSE-MsgGUID: KJuLZ/loTyK6aEd+DgKuqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76726915"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76726915"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:34 -0800
X-CSE-ConnectionGUID: T3QitwEITqyRLT2TI+7F7A==
X-CSE-MsgGUID: lAZkWBduSmyulyeYLCnTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189729264"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 03:43:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0FD2296; Mon, 17 Nov 2025 12:43:32 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/9] usb: xhci: remove redundant function wrapper
Date: Mon, 17 Nov 2025 12:42:33 +0100
Message-ID: <20251117114242.3507856-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
References: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ring_doorbell_for_active_rings() rings the doorbell
for any rings with pending URBs. It has a trivial wrapper,
xhci_ring_doorbell_for_active_rings(), which takes the same
arguments and simply calls the former.

Since the wrapper adds no functionality, remove it and rename
ring_doorbell_for_active_rings() to xhci_ring_doorbell_for_active_rings().

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8e209aa33ea7..5294f7bd3eab 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -572,9 +572,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 }
 
 /* Ring the doorbell for any rings with pending URBs */
-static void ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
-		unsigned int slot_id,
-		unsigned int ep_index)
+void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci, unsigned int slot_id,
+					 unsigned int ep_index)
 {
 	unsigned int stream_id;
 	struct xhci_virt_ep *ep;
@@ -597,13 +596,6 @@ static void ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 	}
 }
 
-void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
-		unsigned int slot_id,
-		unsigned int ep_index)
-{
-	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
-}
-
 static struct xhci_virt_ep *xhci_get_virt_ep(struct xhci_hcd *xhci,
 					     unsigned int slot_id,
 					     unsigned int ep_index)
@@ -1294,7 +1286,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
 	xhci_giveback_invalidated_tds(ep);
-	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+	xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
 static void xhci_kill_ring_urbs(struct xhci_hcd *xhci, struct xhci_ring *ring)
@@ -1537,13 +1529,13 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			 __func__);
 		xhci_invalidate_cancelled_tds(ep);
 		/* Try to restart the endpoint if all is done */
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 		/* Start giving back any TDs invalidated above */
 		xhci_giveback_invalidated_tds(ep);
 	} else {
 		/* Restart any rings with pending URBs */
 		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
 }
 
@@ -1578,7 +1570,7 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
 
 	/* if this was a soft reset, then restart */
 	if ((le32_to_cpu(trb->generic.field[3])) & TRB_TSP)
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
 static void xhci_handle_cmd_enable_slot(int slot_id, struct xhci_command *command,
-- 
2.50.1


