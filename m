Return-Path: <linux-usb+bounces-34100-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKfuNqOZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34100-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BE213F44
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FFBC3129848
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4D23A7F56;
	Thu,  5 Mar 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg8O2rPD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73C039903E
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722138; cv=none; b=afdzE6UPpJV7uh7uDjkZ55XsgctDc95byQCM8gu4iHkPWwV8yJUpwFy+ArkWeOX99DjTOTwk4yoUyV5wHFdw4piUrW27tP+VUteSv6uSIGry0/TGtO3k3ay/frJrfKIzjebPO02lgwnregHE2uopyeSIIlNsTDDJ25LQvz86ENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722138; c=relaxed/simple;
	bh=PZitRoYnEDDy0ZW+/MG+oR/KO/1gSD+hhW0/JFXesGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USd82JD1isWTUjXbTRReFxqrle5dLXBY+ZSOassBuqbmWbAiPVN8jHNS6hB/3XruXUhemIUORavfrMohtjQPtog+7dm2pJtEFiIkOjYXxJzTgtscOYQabVKjIx98qXULE1FZZJwtaOk16RC9lHDda57r/4qZJu+P+bkWq2GEoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg8O2rPD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722137; x=1804258137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PZitRoYnEDDy0ZW+/MG+oR/KO/1gSD+hhW0/JFXesGI=;
  b=gg8O2rPDXpT5WF5MLPkIkMsmoBIC5lGMPq1Xq0f25t/QLbXgIlzOVlsA
   BoA0+K1vdQg5+0CyKIcx9itcO4ICKX+X36IpjXgAXtrB7lkXTEKGCnxgF
   40vos+ZkAlpWmhGpvfZogzFMY8M8nyJ0w1iR6uz1jLyho9ejTi26YquCg
   eRTJwAjho0kzERowf7OdFlrjmGOzLrNnCMfSAKxtXX3RecRD4FQrqwSGX
   IjT6c2ygKQb1qModFJv4q7zZhaV/TsW4sd0W89VhZPoaj4cSKfOsW45lk
   XWZS/zQ8kv9U/WYYn/MhzdMcWkqkL2TPp010i7W3iQCt35d0lts5ynLau
   Q==;
X-CSE-ConnectionGUID: R9JjJWBLQC6D3JTvhSWFkw==
X-CSE-MsgGUID: f0SxAOIeSOmpHVZUSfoa5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73857692"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73857692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:56 -0800
X-CSE-ConnectionGUID: W2XB5nVLQvSTqp6Z1n/HEA==
X-CSE-MsgGUID: piYHAklmTUKEZQdmLu++yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249163765"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 06:48:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id DF83C98; Thu, 05 Mar 2026 15:48:53 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 05/12] usb: xhci: move ring initialization
Date: Thu,  5 Mar 2026 15:48:17 +0100
Message-ID: <20260305144824.3264408-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 747BE213F44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34100-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Move ring initialization from xhci_ring_alloc() to xhci_ring_init().
Call xhci_ring_init() after xhci_ring_alloc(); in the future,
it can also be used to re-initialize the ring during resume.

Additionally, remove xhci_dbg_trace() from xhci_mem_init(). The command
ring's first segment DMA address is now printed during the trace call in
xhci_ring_init().

This refactoring lays also the groundwork for eventually replacing:
* xhci_dbc_ring_init()
* xhci_clear_command_ring()

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 19 ++++++++++++++-----
 drivers/usb/host/xhci.c     |  3 +++
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2e6c5fe11940..005b7bc1bfda 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -129,6 +129,13 @@ static void xhci_initialize_ring_segments(struct xhci_hcd *xhci, struct xhci_rin
 	ring->last_seg->trbs[TRBS_PER_SEGMENT - 1].link.control |= cpu_to_le32(LINK_TOGGLE);
 }
 
+void xhci_ring_init(struct xhci_hcd *xhci, struct xhci_ring *ring)
+{
+	xhci_initialize_ring_segments(xhci, ring);
+	xhci_initialize_ring_info(ring);
+	trace_xhci_ring_alloc(ring);
+}
+
 /*
  * Link the src ring segments to the dst ring.
  * Set Toggle Cycle for the new ring if needed.
@@ -389,9 +396,6 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int num_segs,
 	if (ret)
 		goto fail;
 
-	xhci_initialize_ring_segments(xhci, ring);
-	xhci_initialize_ring_info(ring);
-	trace_xhci_ring_alloc(ring);
 	return ring;
 
 fail:
@@ -668,6 +672,8 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 		cur_ring = stream_info->stream_rings[cur_stream];
 		if (!cur_ring)
 			goto cleanup_rings;
+
+		xhci_ring_init(xhci, cur_ring);
 		cur_ring->stream_id = cur_stream;
 		cur_ring->trb_address_map = &stream_info->trb_address_map;
 		/* Set deq ptr, cycle bit, and stream context type */
@@ -1011,6 +1017,8 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	if (!dev->eps[0].ring)
 		goto fail;
 
+	xhci_ring_init(xhci, dev->eps[0].ring);
+
 	dev->udev = udev;
 
 	/* Point to output device context in dcbaa. */
@@ -1492,6 +1500,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	virt_dev->eps[ep_index].skip = false;
 	ep_ring = virt_dev->eps[ep_index].new_ring;
+	xhci_ring_init(xhci, ep_ring);
 
 	/* Fill the endpoint context */
 	ep_ctx->ep_info = cpu_to_le32(EP_MAX_ESIT_PAYLOAD_HI(max_esit_payload) |
@@ -2362,6 +2371,8 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	if (!ir)
 		return NULL;
 
+	xhci_ring_init(xhci, ir->event_ring);
+
 	spin_lock_irq(&xhci->lock);
 	if (!intr_num) {
 		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
@@ -2474,8 +2485,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
-		       &xhci->cmd_ring->first_seg->dma);
 
 	/* Allocate and set up primary interrupter 0 with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating primary event ring");
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e8366aa479ab..d9519a9e9e17 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -564,6 +564,8 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set the Number of Device Slots Enabled to the maximum supported value */
 	xhci_enable_max_dev_slots(xhci);
 
+	/* Initialize the Command ring */
+	xhci_ring_init(xhci, xhci->cmd_ring);
 	/*
 	 * Reserve one command ring TRB for disabling LPM.
 	 * Since the USB core grabs the shared usb_bus bandwidth mutex before
@@ -583,6 +585,7 @@ static int xhci_init(struct usb_hcd *hcd)
 	xhci_set_dev_notifications(xhci);
 
 	/* Initialize the Primary interrupter */
+	xhci_ring_init(xhci, xhci->interrupters[0]->event_ring);
 	xhci_add_interrupter(xhci, 0);
 	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b0796f6d00e..ade0198bf9ea 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1823,6 +1823,7 @@ void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring);
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_trbs, gfp_t flags);
 void xhci_initialize_ring_info(struct xhci_ring *ring);
+void xhci_ring_init(struct xhci_hcd *xhci, struct xhci_ring *ring);
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index);
-- 
2.50.1


