Return-Path: <linux-usb+bounces-35873-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAPrCqluzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35873-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8704389B2F
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6469313AACC
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34D12DCF4C;
	Thu,  2 Apr 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/XzT9vS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509EA2E0412
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135845; cv=none; b=M9FjRJGyz79jMMdkQvhQ8sZt3LxJp3jk3HULXgmrhwcD33rRTTIMYBi+z1mc/XAltkfbhciDuzH7DBobJvIW+HfPOsmchUgN+ldVvKmYes5WsE+lY27XJ2vrncwX6syEXffpbsAXSoZ/ZOZu66RCYBCezr+NcBi00DnYgRuqI3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135845; c=relaxed/simple;
	bh=rFzDqLj+b9lLV8suVc4IY3QCUHBE+KO8bqv/s7LtDps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijKAj0oxeCwC7szi2mrGr6Uwz0FaMl+mgwypfbXBlySWY7DgsH5whp91DasQGYWvzBu1r3XSwknd9bKKfb4Ba7KsA0LY1Mg0OpKIwvPn+ZBOmrpwZhTI8w29hFqci41Oq3GAwxDHK77EUMLrsGakL4EhkbcIw6N0gIYk6OWssoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/XzT9vS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135845; x=1806671845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rFzDqLj+b9lLV8suVc4IY3QCUHBE+KO8bqv/s7LtDps=;
  b=e/XzT9vSbIk18cEVMpfQVrLvQh6Qq0kakHUUdcSmKZvvBBhNNIoYV57x
   RNLPzAqUC/c/9W/hsJKY7zuv4lGc59bIXjHtQ7gjzTc3QIxeZ6XFBzDyb
   GhHlLzdn72o792weiDlJoxTno4PvZZEx+DPkDAsNAzyIVcYibDLDlrVkU
   UbPUZZjRL7H/hgfDnBztAGUox65JUVd78+WtrKdfWXgT+ZabvwmLneXWe
   68O+4nyphNELXB4iN0nu660AYwpL+eoFFI9g0t1gaev9NS27ke9BOFrcb
   Vof4C3f508iIkRL47lmGWtdD2Mt5aqfjUf97rEMA1Z06vNz/COHv59T2E
   Q==;
X-CSE-ConnectionGUID: XnvNkNTUTr+q4Hs93nF6eg==
X-CSE-MsgGUID: pkQNimokTmapdEoVVA9u1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650842"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:24 -0700
X-CSE-ConnectionGUID: MiFmH0UJRIaJJfLzWJkw7Q==
X-CSE-MsgGUID: I2OuM3tiSwGLhjn+TGhCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241518"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:23 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/25] usb: xhci: move ring initialization
Date: Thu,  2 Apr 2026 16:13:25 +0300
Message-ID: <20260402131342.2628648-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35873-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: B8704389B2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 19 ++++++++++++++-----
 drivers/usb/host/xhci.c     |  3 +++
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 45638ab13635..ca4463eebc49 100644
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
@@ -2370,6 +2379,8 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 	if (!ir)
 		return NULL;
 
+	xhci_ring_init(xhci, ir->event_ring);
+
 	spin_lock_irq(&xhci->lock);
 	if (!intr_num) {
 		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
@@ -2482,8 +2493,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto fail;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocated command ring at %p", xhci->cmd_ring);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
-		       &xhci->cmd_ring->first_seg->dma);
 
 	/* Allocate and set up primary interrupter 0 with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating primary event ring");
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b9fa941425c5..dd495dc740c3 100644
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
index 1bef4301e2b4..06f6da4d982f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1824,6 +1824,7 @@ void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring);
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_trbs, gfp_t flags);
 void xhci_initialize_ring_info(struct xhci_ring *ring);
+void xhci_ring_init(struct xhci_hcd *xhci, struct xhci_ring *ring);
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index);
-- 
2.43.0


