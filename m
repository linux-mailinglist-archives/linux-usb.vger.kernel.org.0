Return-Path: <linux-usb+bounces-37069-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAjHK4RQ/GlOOAAAu9opvQ
	(envelope-from <linux-usb+bounces-37069-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:42:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4F4E500B
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1BD23009825
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3593391E74;
	Thu,  7 May 2026 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9NN+4Cq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F163630B2
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143311; cv=none; b=Czc0RabFhAZWMhdx/dMl276MeJsLZbada3sKJs88nIn1jGDu9x4smlsKLw5BsZYMac9cCwNUddP5GAKZJ0U2SUM9ay33qKJrST4rRLuh4U/DyyHroeiQAa+7CE31RVvjVFc9fnXzM8+HQJeyCeAuke+gfk7nplpGClADP9pUvY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143311; c=relaxed/simple;
	bh=HSi6csZyswRbcCvdldEOiMhpBFS3Ljso9iZCilWAYmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsjQ6uL0c1J1BWd0WinnnhvnYqUxzfdI4WQjNcQtR+p/ZOEfZqWIsFaggbjRCKAe/djLB6YQTD2aE3t400I1HdzzHNxiPSA+hITKGAk9RPPHijNo5z0R6dYAHXOFljoaF1W+nEN992+y8WJFkvJ8UKuYQkMWrsB4SCbaLE4nlq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9NN+4Cq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778143305; x=1809679305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HSi6csZyswRbcCvdldEOiMhpBFS3Ljso9iZCilWAYmE=;
  b=D9NN+4CqyNXHbVNGxNl58KB0Odjp0GHjoXbaOFqHK1tdxei382TACLno
   qmAxL6I0p9X70t2DyUtYcNz4PFUHMXU/T94MH6n9K4ubLcnqwuNylOULj
   3kRiY2OiFCfyggCT56zXnSqbIyBQ9A9KFMb9UXi9gNJzr+OJTczXli5Jd
   XR1itofJk7A8o+GHJwE8rf1U6ASWMYuPnCc6I+4OyCWNNxBpdcLv2Eg62
   SOEBAW30fEVJcgalD7qeN+f+PxwrRE7VyPI02JqNGvLcB2Sn3RymOURg3
   KSfdUjSquRA/ySNVFAtLnH8Qfyv0O8eoC3xxpD4GtPNZuWHPHk3hshHdm
   Q==;
X-CSE-ConnectionGUID: gT1aw/0cQwag5uj9A0WJbA==
X-CSE-MsgGUID: NsHKmZdCRDi5TnRJ63BzKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79197114"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79197114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:41:40 -0700
X-CSE-ConnectionGUID: yQCptER+Ry2rDQrkmcmtsg==
X-CSE-MsgGUID: R2vXPo7iRsaEjZQhxvUWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266778973"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2026 01:41:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id DC0E195; Thu, 07 May 2026 10:41:37 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/3] usb: xhci: refactor DCBAA struct
Date: Thu,  7 May 2026 10:39:43 +0200
Message-ID: <20260507083945.959370-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
References: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 86C4F4E500B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37069-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Embed the 'xhci_device_context_array' structure directly within 'xhci_hcd'
instead of allocating it as a separate block. Only the array of device
context addresses is now allocated separately.

Since the device context addresses are no longer part of an array
structure, rename 'dev_context_ptrs' to 'ctx_array' for clearer access
semantics.

Also remove the redundant comment next to the 'ctx_array' allocation;
using dma_alloc_coherent() for 64-bit * N allocations guarantees both
physically contiguous and properly aligned for 64-byte boundaries.
The xHCI section (5.4.6) refers to DCBAAP instead of DCBAA (6.1).

This change does not modify the number of host controller slots but
simplifies memory management and prepares the driver for a variable number
of HC slots in the future.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 40 ++++++++++++++++++------------------
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.c      |  6 +++---
 drivers/usb/host/xhci.h      | 13 +++++++-----
 4 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..93c6053dc71b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -883,8 +883,8 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
 
 	/* If device ctx array still points to _this_ device, clear it */
 	if (dev->out_ctx &&
-	    xhci->dcbaa->dev_context_ptrs[slot_id] == cpu_to_le64(dev->out_ctx->dma))
-		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
+	    xhci->dcbaa.ctx_array[slot_id] == cpu_to_le64(dev->out_ctx->dma))
+		xhci->dcbaa.ctx_array[slot_id] = 0;
 
 	trace_xhci_free_virt_device(dev);
 
@@ -1022,11 +1022,11 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	dev->udev = udev;
 
 	/* Point to output device context in dcbaa. */
-	xhci->dcbaa->dev_context_ptrs[slot_id] = cpu_to_le64(dev->out_ctx->dma);
+	xhci->dcbaa.ctx_array[slot_id] = cpu_to_le64(dev->out_ctx->dma);
 	xhci_dbg(xhci, "Set slot id %d dcbaa entry %p to 0x%llx\n",
 		 slot_id,
-		 &xhci->dcbaa->dev_context_ptrs[slot_id],
-		 le64_to_cpu(xhci->dcbaa->dev_context_ptrs[slot_id]));
+		 &xhci->dcbaa.ctx_array[slot_id],
+		 le64_to_cpu(xhci->dcbaa.ctx_array[slot_id]));
 
 	trace_xhci_alloc_virt_device(dev);
 
@@ -1677,7 +1677,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->scratchpad->sp_buffers)
 		goto fail_sp3;
 
-	xhci->dcbaa->dev_context_ptrs[0] = cpu_to_le64(xhci->scratchpad->sp_dma);
+	xhci->dcbaa.ctx_array[0] = cpu_to_le64(xhci->scratchpad->sp_dma);
 	for (i = 0; i < num_sp; i++) {
 		dma_addr_t dma;
 		void *buf = dma_alloc_coherent(dev, xhci->page_size, &dma,
@@ -1933,6 +1933,7 @@ void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_device_context_array *dcbaa;
 	int i;
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
@@ -1978,10 +1979,12 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Freed medium stream array pool");
 
-	if (xhci->dcbaa)
-		dma_free_coherent(dev, sizeof(*xhci->dcbaa),
-				xhci->dcbaa, xhci->dcbaa->dma);
-	xhci->dcbaa = NULL;
+	dcbaa = &xhci->dcbaa;
+	if (dcbaa->ctx_array) {
+		dma_free_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+				  dcbaa->ctx_array, dcbaa->dma);
+		dcbaa->ctx_array = NULL;
+	}
 
 	scratchpad_free(xhci);
 
@@ -2409,23 +2412,20 @@ EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
-	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
-	dma_addr_t	dma;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_device_context_array *dcbaa = &xhci->dcbaa;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
-	/*
-	 * xHCI section 5.4.6 - Device Context array must be
-	 * "physically contiguous and 64-byte (cache line) aligned".
-	 */
-	xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma, flags);
-	if (!xhci->dcbaa)
+	dcbaa->ctx_array =
+		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+				   &dcbaa->dma, flags);
+	if (!dcbaa->ctx_array)
 		goto fail;
 
-	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "Device context base array address = %pad (DMA), %p (virt)",
-		       &xhci->dcbaa->dma, xhci->dcbaa);
+		       &dcbaa->dma, dcbaa->ctx_array);
 
 	/*
 	 * Initialize the ring segment pool.  The ring must be a contiguous
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..22f663daf625 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1613,7 +1613,7 @@ static void xhci_handle_cmd_disable_slot(struct xhci_hcd *xhci, int slot_id,
 		/* Delete default control endpoint resources */
 		xhci_free_device_endpoint_resources(xhci, virt_dev, true);
 	if (cmd_comp_code == COMP_SUCCESS) {
-		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
+		xhci->dcbaa.ctx_array[slot_id] = 0;
 		xhci->devs[slot_id] = NULL;
 	}
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a54f5b57f205..9a471bd72265 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -558,7 +558,7 @@ static void xhci_init(struct usb_hcd *hcd)
 	xhci_set_cmd_ring_deq(xhci);
 
 	/* Set Device Context Base Address Array pointer */
-	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
+	xhci_write_64(xhci, xhci->dcbaa.dma, &xhci->op_regs->dcbaa_ptr);
 
 	/* Set Doorbell array pointer */
 	xhci_set_doorbell_ptr(xhci);
@@ -4460,9 +4460,9 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 		"Slot ID %d dcbaa entry @%p = %#016llx",
 		udev->slot_id,
-		&xhci->dcbaa->dev_context_ptrs[udev->slot_id],
+		&xhci->dcbaa.ctx_array[udev->slot_id],
 		(unsigned long long)
-		le64_to_cpu(xhci->dcbaa->dev_context_ptrs[udev->slot_id]));
+		le64_to_cpu(xhci->dcbaa.ctx_array[udev->slot_id]));
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 			"Output Context DMA address = %#08llx",
 			(unsigned long long)virt_dev->out_ctx->dma);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..58d20b8459ec 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -792,12 +792,15 @@ struct xhci_tt_bw_info {
 
 /**
  * struct xhci_device_context_array
- * @dev_context_ptr	array of 64-bit DMA addresses for device contexts
+ * @ctx_array:	Pointer to an array of addresses
+ * @dma:	DMA address to @ctx_array
+ *
+ * Device Context Base Address Array (DCBAA) - Section 6.1.
+ * ctx_array[0]:		Scratchpad Buffer Array Base Address
+ * ctx_array[1-MaxSlots]:	Device Context Base Address
  */
 struct xhci_device_context_array {
-	/* 64-bit device addresses; we only write 32-bit addresses */
-	__le64			dev_context_ptrs[MAX_HC_SLOTS];
-	/* private xHCD pointers */
+	__le64		*ctx_array;
 	dma_addr_t	dma;
 };
 /*
@@ -1532,7 +1535,7 @@ struct xhci_hcd {
 	/* optional reset controller */
 	struct reset_control *reset;
 	/* data structures */
-	struct xhci_device_context_array *dcbaa;
+	struct xhci_device_context_array	dcbaa;
 	struct xhci_interrupter **interrupters;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
-- 
2.50.1


