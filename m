Return-Path: <linux-usb+bounces-35889-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOOgANNuzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35889-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E325389B6A
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2936F318F64E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117F1313537;
	Thu,  2 Apr 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHaC6MWk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53D2F6918
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135873; cv=none; b=Ytn5uy7XEznrWYRd6I7lk2v1JENjzCK89EyPl8BL3Ri+SlzTfnSB2mp3COAWdHBhSZEUSVJKtAtP03+ZK4Jra5p29eDmLDJN1+5W1E9EuhBzXG/qP8JpAO4rBJ06ars7b4E64xpZc7MK3eTfHCcCpHzMKk8KWKvK1rIa1czBYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135873; c=relaxed/simple;
	bh=f+YGYoBZRAiFLM2pDTTnoC6jaCjwOmWoUDl3IhYFzGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HhMrf1f2Vb8kmdYCMNmlWEZpl7B2piz3kXKeIWNYZDGrcSEGupIHpfG+RpWav6lD3tcb3EF0tOD4kQUwjQTtXLZDqKpoV6Y2YJ6mDVFxvXa9vQKzWjztDoaDYX3fbJpXfsPm/xqH/kManmxgqQ8Nd49nrwcPjbEVfqbJJmicKIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHaC6MWk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135873; x=1806671873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+YGYoBZRAiFLM2pDTTnoC6jaCjwOmWoUDl3IhYFzGM=;
  b=dHaC6MWkniI4xmZmgpuv2fRB1c92IDfi05QU3zGpMk78bqsNmQjVQ7nQ
   C+bXz6eKzutrWij52jwVBc9RGmd7ok+DUQ6IadJitPG4btWpBvGSk81WA
   JdBEcB1qp4/0h0lYI6OpD4l7x6S9DncZg8YD7Wgmx9iCfzldWzPyRYDB4
   3kPZplWwcC3/uBCISeXO9LVy2suKjMNkcandIR3caA7jp+VTjKY+qDMnF
   5Bq3AF6Q3mB5ySZb96iEZE693j8q8HNlKw4oiMveoDwnH2jI3PyizKTjp
   9Wl48klJLIIVI85Ti4kyMv+MgzuhwREziG0iXFm5FJF2HymQdkVf9nIO6
   w==;
X-CSE-ConnectionGUID: 094kbsffScyN6daO1p/S1A==
X-CSE-MsgGUID: njn7x9bCSji357/p+0kvug==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650941"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650941"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:53 -0700
X-CSE-ConnectionGUID: XjRdGZeASKGcML9eSVGEOA==
X-CSE-MsgGUID: WVEjDIDfQui7X3QeAYLCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241596"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:51 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 24/25] usb: xhci: remove duplicate '0x' prefix
Date: Thu,  2 Apr 2026 16:13:41 +0300
Message-ID: <20260402131342.2628648-25-mathias.nyman@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-35889-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 5E325389B6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Prefix "0x" is automatically added by '%pad'.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 6 +++---
 drivers/usb/host/xhci-ring.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a9fd26559e50..997fe90f54e5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -994,14 +994,14 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	if (!dev->out_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d output ctx = 0x%pad (dma)\n", slot_id, &dev->out_ctx->dma);
+	xhci_dbg(xhci, "Slot %d output ctx = %pad (dma)\n", slot_id, &dev->out_ctx->dma);
 
 	/* Allocate the (input) device context for address device command */
 	dev->in_ctx = xhci_alloc_container_ctx(xhci, XHCI_CTX_TYPE_INPUT, flags);
 	if (!dev->in_ctx)
 		goto fail;
 
-	xhci_dbg(xhci, "Slot %d input ctx = 0x%pad (dma)\n", slot_id, &dev->in_ctx->dma);
+	xhci_dbg(xhci, "Slot %d input ctx = %pad (dma)\n", slot_id, &dev->in_ctx->dma);
 
 	/* Initialize the cancellation and bandwidth list for each ep */
 	for (i = 0; i < 31; i++) {
@@ -2424,7 +2424,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-		       "Device context base array address = 0x%pad (DMA), %p (virt)",
+		       "Device context base array address = %pad (DMA), %p (virt)",
 		       &xhci->dcbaa->dma, xhci->dcbaa);
 
 	/*
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3589af0e2768..e47e644b296e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -755,7 +755,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	}
 
 	if ((ep->ep_state & SET_DEQ_PENDING)) {
-		xhci_warn(xhci, "Set TR Deq already pending, don't submit for 0x%pad\n",
+		xhci_warn(xhci, "Set TR Deq already pending, don't submit for %pad\n",
 			  &addr);
 		return -EBUSY;
 	}
@@ -763,7 +763,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	/* This function gets called from contexts where it cannot sleep */
 	cmd = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 	if (!cmd) {
-		xhci_warn(xhci, "Can't alloc Set TR Deq cmd 0x%pad\n", &addr);
+		xhci_warn(xhci, "Can't alloc Set TR Deq cmd %pad\n", &addr);
 		return -ENOMEM;
 	}
 
-- 
2.43.0


