Return-Path: <linux-usb+bounces-26979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D689B2A2D7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 15:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD523BC5FE
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E9C31076A;
	Mon, 18 Aug 2025 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRuM3I9C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C2827B345
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521905; cv=none; b=FlXlIwzYdiNVmxenyKDv8/wJV2Oh6KghfOo1R/XaRwBtBNMdmh9K//mufLzmVIoU2ErSdreng52lKLQqZUHBLCl5h7mrDU8oYd7SrGT7EC1K1EQf/EcjLIvVj7tcbg9iVrRrQP4D6CEJaM/m/kQJaqD/Q24DfYK0kckz+bBhTIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521905; c=relaxed/simple;
	bh=Tn6+8XD6oxGwnEQckfpp649Oon7xQ+f76QkioIiEJnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WkB8OoQVu9EJiAbtzApKEIM3YbzWYBw52DGARAeRwGGMhf4srO4anlsV85c+PlIQgOQNedMS5SszmG2atFMEuzXcxZXI6dqKAMiw8wwNgY9Ekaddz29hYbevLVxw8E0NkAqJdMqwlI6gSA18yUi08SEzmVHhqclSC2lzVp/olLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRuM3I9C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755521904; x=1787057904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tn6+8XD6oxGwnEQckfpp649Oon7xQ+f76QkioIiEJnc=;
  b=iRuM3I9CwkuJvEGQXZ7fWDBnCiuIqRIqJfHphtQcIkbWkmG3i+Uxo0zx
   UYaFPDpyQmw9ZD88P/sTW0n3ceqtkwZJNDvfcKF70iV86pw7mFR0iDz1G
   fH0OUn3uo5l8aCuyUFTHOuzu5+UotEs4l6qf7+HfP7YTCTj61JIUbFyg2
   eVHWfuLlPUo+3LlsR/jc/OnX18RaQ3d1SQ2r8y9q3FqVfHU9c7Al2Is4B
   +j7l0X770JXM0zYaNkbfNNhL55fyplt2cnqeVB/VbnbGOFM8CaPFmhzPk
   4/NI9hWeC6NOUP6WeRzgLhAM5neJRVBkGwXanSv5N5QhO3ptx+EFvIg4D
   Q==;
X-CSE-ConnectionGUID: VzRyTJ2ITG2z+KyV5lSeQw==
X-CSE-MsgGUID: 8BR+eVCGQRiIbDvxxOF4PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68452773"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68452773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:58:24 -0700
X-CSE-ConnectionGUID: 7SgHWY6ET0uGD5iJTEC96w==
X-CSE-MsgGUID: UMt59dVrTM2vMTnBctLT4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167071037"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 05:58:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id DEEEF95; Mon, 18 Aug 2025 14:58:20 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/4] usb: xhci: handle Set TR Deq TRB Error
Date: Mon, 18 Aug 2025 14:57:39 +0200
Message-ID: <20250818125742.3572487-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set TR Deq TRB Error can occur for two reasons:

1. Stream ID is zero or more than the Max Primary Streams.
   This is currently caught by xhci_virt_ep_to_ring(), at the start of the
   function. Thus, this commit does not add handling for this error.

2. Stream ID is non-zero and Stream ID boundary check failed.
   Add a warning detailing the exact reason for this failure and print
   the deq ptr from the Set TR Deq command.
   Macro 'SCTX_DEQ_MASK' is a mask for the TR Dequeue ptr bit field 63:4.

Reuse local variable 'deq'; just change it to 'dma_addr_t', which is what
it should have originally been. (This and 'SCTX_DEQ_MASK' rename is part of
another patch series that I will soon submit)

xHCI specification, rev 1.2:
 Set TR Dequeue Pointer	section 4.6.10
 Stream Array Boundary Checking	4.12.2.1

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ecd757d482c5..7bd559294742 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1420,6 +1420,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_stream_ctx *stream_ctx;
 	struct xhci_td *td, *tmp_td;
+	dma_addr_t deq;
 
 	ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
 	stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
@@ -1451,7 +1452,14 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 
 		switch (cmd_comp_code) {
 		case COMP_TRB_ERROR:
-			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd invalid because of stream ID configuration\n");
+			/*
+			 * Caused by incorrect Stream ID, already checked by xhci_virt_ep_to_ring(),
+			 * or failed boundary check. A failed boundary check means that Set TR Deq
+			 * command references memory that it doesn't have access to.
+			 */
+			deq = le64_to_cpu(trb->event_cmd.cmd_trb) & SCTX_DEQ_MASK;
+			xhci_warn(xhci, "Set TR Deq error stream %u boundary check failed TRB @%pad slot %d ep %u\n",
+				  stream_id, &deq, slot_id, ep_index);
 			break;
 		case COMP_CONTEXT_STATE_ERROR:
 			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.\n");
@@ -1478,7 +1486,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		 * cancelling URBs, which might not be an error...
 		 */
 	} else {
-		u64 deq;
 		/* 4.6.10 deq ptr is written to the stream ctx for streams */
 		if (ep->ep_state & EP_HAS_STREAMS) {
 			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
@@ -1500,7 +1507,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
 		}
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
-			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
+			"Successful Set TR Deq Ptr cmd, deq = @%pad", &deq);
 		if (xhci_trb_virt_to_dma(ep->queued_deq_seg,
 					 ep->queued_deq_ptr) == deq) {
 			/* Update the ring's dequeue segment and dequeue pointer
-- 
2.50.1


