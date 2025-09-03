Return-Path: <linux-usb+bounces-27501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1194B42782
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333C27B2716
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC5331AF1B;
	Wed,  3 Sep 2025 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFVgEcLX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7103FF1
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918911; cv=none; b=Sz1+sQgLPAvOJ26rXmy6RjnUrMJ+/tzx5UgTSzv0zzq1brhxa7wX7JbFAyVWdwIKAD6YciTHxpa2sudsiXZRhX/lf+Jq1VhaF2fu/He9aHD6rfC4iszy0ZA8EMm6yDvbzEjqOLWlk0EsCmYLWxlW2SseasBcWPdOwBZulnawgPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918911; c=relaxed/simple;
	bh=Fu6mEuVkx7SUO/e55E17BDMDRgxOsYFhiJkGBc0V4B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPNNrR3hfLAiCpLYstmW8cUP790DV8mcSxcc+vJ2p9N8pi6Ao8Uk4E/vg3NeJ1Z7euuZaRSZQ2TIYM1PbC8KGpyHkk0WD+4jzP0pVS6hLXYBKr4Qb9srRxf+tXRLGseFJ3vbu8PJI7H54PVIXqdZxA07dbmpwYa9bSP8yWzdogg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFVgEcLX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918910; x=1788454910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fu6mEuVkx7SUO/e55E17BDMDRgxOsYFhiJkGBc0V4B8=;
  b=hFVgEcLXqlYJRrURlOvQqkZaugw+oA0786iSygIOFt5Yph4QJ1GJmb59
   RBK8SbQY5OKqS+AX1b40a85+ybufQ/co6Rdp/04jmPT8SzyW57toNjszK
   84Cpo3k6p/wVv/A1bshwCoXSG7VvZoitpvZaX1QMdncRAdRVQcrOl3qhp
   9M9FO2u0vJ5JILqoi+7Sbfckunz1SaxZikpwGjBnEmsbpYQBJSx70hJX+
   6Qtl6i3hgrs6szudwQhZO6ivmgixM71cDY6CrgSkJK/dBbUQnK8BX8pxl
   JVXFaIv/3ynWJwDzkHHxkF8tdLeVnLGIC4Z3KIgY34EtQ/6DZ4zMAjUrg
   w==;
X-CSE-ConnectionGUID: XrcbNGdbQEap4nfhZdzOog==
X-CSE-MsgGUID: bqZxIaM6Qsu/IXHQPklfdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687943"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687943"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:50 -0700
X-CSE-ConnectionGUID: rt0hWeqyReWVkbXjvvOlaw==
X-CSE-MsgGUID: hhLxRFeqR/O6HE9aznISJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007526"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 623E794; Wed, 03 Sep 2025 19:01:47 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/7] usb: xhci-dbgcap: correct DMA address handling
Date: Wed,  3 Sep 2025 19:01:21 +0200
Message-ID: <20250903170127.2190730-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address the handling of addresses within the dbc_handle_xfer_event(),
ensuring accurate extraction and comparison.

Variable details:
'r->trb_dma'		    : A DMA address.
'ep_ctx->deq'		    : A le64, bits 63:4 contain the DMA address.
'event->trans_event.buffer' : A le64, bits 63:0 contain the DMA address.

1. Convert 'ep_ctx->deq' and 'event->trans_event.buffer' addresses to
   the CPU's native byte order.

2. Use mask; TR_DEQ_PTR_MASK (bits 63:4) to extract the address from
   'ep_ctx->deq', replacing the previous use of ~TRB_CYCLE (bits 63:1).

Why not use 'dma_addr_t' for the address?
The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
system architecture or xHCI driver flags, whereas the 64-bit address field
size remains constant. Since hardware cannot be fully trusted, it's better
to print the entire 64-bit address to detect any non-zero values in the
upper 32 bits. This approach ensures that potential issues are easily
detected.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 06a2edb9e86e..2f24a3a54439 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -724,6 +724,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	u32			comp_code;
 	size_t			remain_length;
 	struct dbc_request	*req = NULL, *r;
+	u64			ep_trb, deq;
 
 	comp_code	= GET_COMP_CODE(le32_to_cpu(event->generic.field[2]));
 	remain_length	= EVENT_TRB_LEN(le32_to_cpu(event->generic.field[2]));
@@ -733,10 +734,11 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 	ep_ctx		= (ep_id == EPID_OUT) ?
 				dbc_bulkout_ctx(dbc) : dbc_bulkin_ctx(dbc);
 	ring		= dep->ring;
+	ep_trb		= le64_to_cpu(event->trans_event.buffer);
 
 	/* Match the pending request: */
 	list_for_each_entry(r, &dep->list_pending, list_pending) {
-		if (r->trb_dma == event->trans_event.buffer) {
+		if (r->trb_dma == ep_trb) {
 			req = r;
 			break;
 		}
@@ -768,8 +770,9 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		status = -comp_code;
 		break;
 	case COMP_STALL_ERROR:
+		deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
 		dev_warn(dbc->dev, "Stall error at bulk TRB %llx, remaining %zu, ep deq %llx\n",
-			 event->trans_event.buffer, remain_length, ep_ctx->deq);
+			 ep_trb, remain_length, deq);
 		status = 0;
 		dep->halted = 1;
 
@@ -788,7 +791,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		 * TRB again.
 		 */
 
-		if ((ep_ctx->deq & ~TRB_CYCLE) == event->trans_event.buffer) {
+		if (deq == ep_trb) {
 			dev_dbg(dbc->dev, "Ep stopped on Stalled TRB\n");
 			if (remain_length == req->length) {
 				dev_dbg(dbc->dev, "Spurious stall event, keep req\n");
-- 
2.50.1


