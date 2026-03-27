Return-Path: <linux-usb+bounces-35556-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPQQKR57xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35556-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4650344780
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3078303BEA6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4213F349B16;
	Fri, 27 Mar 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwnl5oP7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CECF30C35C
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615280; cv=none; b=LBfpRxDLp1z+HWPNlHIxrf9Ztd4gdYfHt2g7qcZxJg4dGy9BLYW5kKtW4SYV0HjtcpHP+38JPs775GXMSmz/0y2otn1wDpOJIb3n8bej/yqrX/qc5t4vfalOXlR7nRjyBL3Ehf61WSFHrzddOUW9qg8bapSd3HAcMXlcWLT20+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615280; c=relaxed/simple;
	bh=O+4NQCprShSuZrtvLKO/YcZ3Aq6NYb6xEnnucU4L2jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAlyuEec/Xyxiw7BBPzjpEydGN1xsXim+M6E7qzSQ3sUSSX9qra+Pin+G3+yVAoCC7lSWvFaY7PJAPL9j873JL2PY/yxo29KjH1QtAOsMm6ij65tJTg5vjqe4KDFERtCfWWeQjR7xtRu/hMuMMiVGjpQvbv/i299ofAPzfOUFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwnl5oP7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615280; x=1806151280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O+4NQCprShSuZrtvLKO/YcZ3Aq6NYb6xEnnucU4L2jU=;
  b=hwnl5oP7ojdUy3bvij3wIWTQwBAvOb/Ud/28oxx7Kl3rrMG46matUu0C
   m0YmDIHgxwrki2HuHiJ34pb5YpL/fKD76velm0Fg6wY9G2wRi4a7wIHKr
   Iq/YN34Gxru1I0KXQg3h4seZbad/x/XONMUbTL4G6nGLVMt5y+g5AVWU3
   70PJFkEl9gZ+76qis9VtCo6a5VPrdZMAla3ay2vCTLcNlmujCAibpBe5N
   MueFzmOdCB7MTcgcY8d5oAJSYTe0YSvsiwEL+Qp8sfSxW/jBpIxI9qtXX
   ep60jufxZBFwgA8sJZ3P1XeWaXHRgOucUW9ZD4Z+A4YKlO+I78F2woYXm
   w==;
X-CSE-ConnectionGUID: 7OI4b+PwSS61EZesuARUeg==
X-CSE-MsgGUID: 95pO+QmARsa+Q6tgESOWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87160624"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87160624"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:19 -0700
X-CSE-ConnectionGUID: GR1lDpTvSMCZVNK5WVr8iA==
X-CSE-MsgGUID: V5xlNNd5SmStHibC9gOluw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248347694"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 05:41:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 780379E; Fri, 27 Mar 2026 13:41:16 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 5/9] usb: xhci: move ring initialization
Date: Fri, 27 Mar 2026 13:34:36 +0100
Message-ID: <20260327123441.806564-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35556-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: A4650344780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index facadf0f0d1e..170615dd1e93 100644
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


