Return-Path: <linux-usb+bounces-37828-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCNDLuW8DmrXBwYAu9opvQ
	(envelope-from <linux-usb+bounces-37828-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:05:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E805A0A49
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E666303422B
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B2E22D4C3;
	Thu, 21 May 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/4DvlvI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229439EB7C
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350733; cv=none; b=jyJAoJp+85vtICu6qdwH6Ko6Zyl1QVG40l6NvA4E0ZSSkWfWJ6rts2Ny5UBAdKX9sqG8VXEGxjIwJMN8okRA2WjMbPpFiWK/zWYdQqETEpIBffWOP6q7f6zLgp5VbE9PXs/dTdOtAuAGFHBF/dpyqZtjoi+UzziBmeVPreZcdhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350733; c=relaxed/simple;
	bh=J8cxFNByLTM/wgFYLAP+/4m0ceLMD2B2QqxGmKIB2ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MycPELwQbjFxJsiSRLu5x6GW1GifUS5L6T9P1BVMFQpYtrI4+5tjvdheAEhqPAO11XS7Y3LliB9MTTq94RSAy5vMkJeJEr9mVBBA3b1jUVGvCE8Mu/seZMwNWH09v7o0YKzSlOhVS8PV2DE5ZevwPN5KazysjxqzqlvtrmclNJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/4DvlvI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779350731; x=1810886731;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J8cxFNByLTM/wgFYLAP+/4m0ceLMD2B2QqxGmKIB2ss=;
  b=H/4DvlvIN2b420TYF0lHOqC/GTNoWSg8IXaWEBOolcqpyVRGD+9wTaUf
   6MyCXMsab3qpwR/z4FxM5q6uWW5JNlLYnOUMcjCwRVnULWzNaUWJ9RaYN
   noBvBETYn9mZz5o8ouHxzo92zMjvMAnKYSl+sPV+ICKFzRcmFDRdQvTN0
   /m0nd4QbXD4tfqnivEuE7X+nBhYSXb4gu9lmRMg2RCYgz3/8s84LRYqpK
   frCWt5vcFLG8HimRXN785rMBoMpn2DlbOgAUevXxpxlm1hTis79ll/NDJ
   6Sm3vtBndBZMhQP6r4ec4kBK0HUY8f75F8bufD2g/9srHuM2o8vee/UUN
   w==;
X-CSE-ConnectionGUID: xABOarM2RP6/1L45bDKmOw==
X-CSE-MsgGUID: WLnqDsjAQ/anOF/QdRY77g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79292191"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79292191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:05:31 -0700
X-CSE-ConnectionGUID: MpuORh1JRT62TqzNu8f2gQ==
X-CSE-MsgGUID: jHA06ReZRGyWYxFHbYYhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244757045"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 01:05:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E59FD95; Thu, 21 May 2026 10:05:27 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH] usb: xhci: remove legacy 'num_trbs_free' tracking
Date: Thu, 21 May 2026 10:04:25 +0200
Message-ID: <20260521080426.258909-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37828-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A8E805A0A49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Keeping track of free TRBs in a ring by adding and subtracting each time
a enqueue or dequeue pointer is modified has proven to be buggy and
complicated, especially over long periods of time.
The xhci driver has already moved to calculating free TRBs dynamically
based on ring size and the enqueue/dequeue positions.

The DbC path is the last user of 'num_trbs_free'. Rather than maintaining
two separate accounting mechanisms, remove the field entirely and switch
DbC to use xhci_num_trbs_free(). Since 'num_trbs_free' undercounts by one,
and xhci_num_trbs_free() does not, the check for sufficient free TRBs is
adjusted.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 5 +----
 drivers/usb/host/xhci-mem.c    | 6 ------
 drivers/usb/host/xhci-ring.c   | 2 +-
 drivers/usb/host/xhci.h        | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 7e6f7d72f03e..6a9f73fecb73 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -275,7 +275,6 @@ xhci_dbc_queue_trb(struct xhci_ring *ring, u32 field1,
 	trace_xhci_dbc_gadget_ep_queue(ring, &trb->generic,
 				       xhci_trb_virt_to_dma(ring->enq_seg,
 							    ring->enqueue));
-	ring->num_trbs_free--;
 	next = ++(ring->enqueue);
 	if (TRB_TYPE_LINK_LE32(next->link.control)) {
 		next->link.control ^= cpu_to_le32(TRB_CYCLE);
@@ -296,7 +295,7 @@ static int xhci_dbc_queue_bulk_tx(struct dbc_ep *dep,
 
 	num_trbs = count_trbs(req->dma, req->length);
 	WARN_ON(num_trbs != 1);
-	if (ring->num_trbs_free < num_trbs)
+	if (xhci_num_trbs_free(ring) <= num_trbs)
 		return -EBUSY;
 
 	addr	= req->dma;
@@ -796,7 +795,6 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		}
 		if (r->status == -COMP_STALL_ERROR) {
 			dev_warn(dbc->dev, "Give back stale stalled req\n");
-			ring->num_trbs_free++;
 			xhci_dbc_giveback(r, 0);
 		}
 	}
@@ -861,7 +859,6 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		break;
 	}
 
-	ring->num_trbs_free++;
 	req->actual = req->length - remain_length;
 	xhci_dbc_giveback(req, status);
 }
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..289461c06bf9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -324,12 +324,6 @@ void xhci_initialize_ring_info(struct xhci_ring *ring)
 	 * handling ring expansion, set the cycle state equal to the old ring.
 	 */
 	ring->cycle_state = 1;
-
-	/*
-	 * Each segment has a link TRB, and leave an extra TRB for SW
-	 * accounting purpose
-	 */
-	ring->num_trbs_free = ring->num_segs * (TRBS_PER_SEGMENT - 1) - 1;
 }
 EXPORT_SYMBOL_GPL(xhci_initialize_ring_info);
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..f62db238276d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -340,7 +340,7 @@ static bool trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
  * Only for transfer and command rings where driver is the producer, not for
  * event rings.
  */
-static unsigned int xhci_num_trbs_free(struct xhci_ring *ring)
+unsigned int xhci_num_trbs_free(struct xhci_ring *ring)
 {
 	struct xhci_segment *enq_seg = ring->enq_seg;
 	union xhci_trb *enq = ring->enqueue;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..e73c498449e8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1376,7 +1376,6 @@ struct xhci_ring {
 	u32			cycle_state;
 	unsigned int		stream_id;
 	unsigned int		num_segs;
-	unsigned int		num_trbs_free; /* used only by xhci DbC */
 	unsigned int		bounce_buf_len;
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
@@ -1955,6 +1954,7 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+unsigned int xhci_num_trbs_free(struct xhci_ring *ring);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
-- 
2.50.1


