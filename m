Return-Path: <linux-usb+bounces-27502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3DB42781
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEE797B2A01
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D52FD1C2;
	Wed,  3 Sep 2025 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfkunUjU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED3A2BCF5D
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918912; cv=none; b=Mb9MTuL32dytw+3i9msQGGpMVHfhrFfrYhfs9lL5L72Be2NBJxrINnVfec0UEGOx0MAWlaWJ+9iHORlq3MorkuZPAwii7+ajiHkiibFeTFUdM86xUyFPgEUaLHdtjJjujH6FYCKMFTfxs9oLt6HIl+faFDHQImRvNLW2AtPDy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918912; c=relaxed/simple;
	bh=gHs2+iYkfhzHJQ7V5td6wFQ5XfN887fGS4w0ecyKfoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=layDRB6HjHf8TDfBKe13+4RAnMbpyElcokjeDip/CwhQJQLlWV0Ag0/xrcXFiTz7NpN9VktaHkhaKO4jk0WMRbDFZa+j3uRPrsMd/lGzFwmb6goVFI4I2Ox+ywM//wQcLKtXUymz6er9LR0HKT73aH8MC5BCZTeXRS4yFibg8hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfkunUjU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918912; x=1788454912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHs2+iYkfhzHJQ7V5td6wFQ5XfN887fGS4w0ecyKfoY=;
  b=GfkunUjUcpefHZpj2m/9P8ZrEJRbTI/wJlUPHJM2VrevG8K1L6IxhAUg
   UQbZuDxt9hHSQ91gSLuQMGZtR9PzTVXnJC2GrMUIGT+zYWkZ66JvQMegj
   XAbMYC5sucxwve0z8ceZaWj59DOk3+BTBiWMFtctbR39CCwOMtxryidnF
   yb2jq/Oj3U6BBYOIl1MRM0isiMxrv0yuRTwZejov4pNpC8X//FILRjdL1
   ZzZzNaAwtjPL/5HHEwWwxjpGt/CTNrGAiQo8HnBdixsRu+0rPSYTtzMCf
   4MCInrt47QSoyIXg0E3OmPGcn+pCxNgq9xhPL4SzJianUIW6ZylLjMV02
   w==;
X-CSE-ConnectionGUID: XebMoLUtQM6feaQpQDvBlg==
X-CSE-MsgGUID: Gl80hYNHQmOXtIagZg3XuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687953"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:52 -0700
X-CSE-ConnectionGUID: SsBNjaC1SleTOdqYMqKypQ==
X-CSE-MsgGUID: Qz+LAqmOQNu8QN4du49/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007531"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id ED17396; Wed, 03 Sep 2025 19:01:48 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/7] usb: xhci: improve Stream Context register debugging
Date: Wed,  3 Sep 2025 19:01:23 +0200
Message-ID: <20250903170127.2190730-4-niklas.neronin@linux.intel.com>
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

Improve the debugging output for Stream Context registers in the xHCI
driver. The Stream Context registers consist of the following fields:
 bit 0 - Dequeue Cycle State.
 bits 3:1 - Stream Context Type.
 bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.

Instead of printing the entire 64-bit register as a single block, each
field is now printed separately. This approach enhances the readability.

Remove xhci_dbg() in xhci_alloc_stream_info(). A detailed trace message is
printed after xhci_update_stream_mapping() call.

xHCI specification, section 6.2.4.1.

Why not use 'dma_addr_t' for the address?
The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
system architecture or xHCI driver flags, whereas the 64-bit address field
size remains constant. Since hardware cannot be fully trusted, it's better
to print the entire 64-bit address to detect any non-zero values in the
upper 32 bits. This approach ensures that potential issues are easily
detected.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 16 ++++++++++------
 drivers/usb/host/xhci-mem.c     |  1 -
 drivers/usb/host/xhci-trace.h   |  5 +++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c6d44977193f..35398b95c5a2 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -521,6 +521,7 @@ static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
 	struct xhci_ep_priv	*epriv = s->private;
 	struct xhci_stream_ctx	*stream_ctx;
 	dma_addr_t		dma;
+	u64			ctx;
 	int			id;
 
 	if (!epriv->stream_info)
@@ -533,12 +534,15 @@ static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
 	for (id = 0; id < epriv->stream_info->num_stream_ctxs; id++) {
 		stream_ctx = epriv->stream_info->stream_ctx_array + id;
 		dma = epriv->stream_info->ctx_array_dma + id * 16;
-		if (id < epriv->stream_info->num_streams)
-			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma,
-				   id, le64_to_cpu(stream_ctx->stream_ring));
-		else
-			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
-				   &dma, le64_to_cpu(stream_ctx->stream_ring));
+
+		if (id < epriv->stream_info->num_streams) {
+			ctx = le64_to_cpu(stream_ctx->stream_ring);
+			seq_printf(s, "%pad stream %d: deq %016llx SCT %llu cycle %llu\n",
+				   &dma, id, ctx & TR_DEQ_PTR_MASK, CTX_TO_SCT(ctx),
+				   ctx & EP_CTX_CYCLE_MASK);
+		} else {
+			seq_printf(s, "%pad stream %d: entry not used\n", &dma, id);
+		}
 	}
 
 	return 0;
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2a414dee7233..9520e7c6e774 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -676,7 +676,6 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 			cur_ring->cycle_state;
 		stream_info->stream_ctx_array[cur_stream].stream_ring =
 			cpu_to_le64(addr);
-		xhci_dbg(xhci, "Setting stream %d ring ptr to 0x%08llx\n", cur_stream, addr);
 
 		ret = xhci_update_stream_mapping(cur_ring, mem_flags);
 
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 8451e9386aa9..f6a2b4cedb8d 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -329,9 +329,10 @@ DECLARE_EVENT_CLASS(xhci_log_stream_ctx,
 		__entry->ctx_array_dma = info->ctx_array_dma + stream_id * 16;
 
 	),
-	TP_printk("stream %u ctx @%pad: SCT %llu deq %llx", __entry->stream_id,
+	TP_printk("stream %u ctx @%pad: SCT %llu deq %llx cycle %llu", __entry->stream_id,
 		&__entry->ctx_array_dma, CTX_TO_SCT(__entry->stream_ring),
-		__entry->stream_ring
+		__entry->stream_ring & TR_DEQ_PTR_MASK,
+		__entry->stream_ring & EP_CTX_CYCLE_MASK
 	)
 );
 
-- 
2.50.1


