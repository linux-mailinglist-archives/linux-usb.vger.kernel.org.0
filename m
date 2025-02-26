Return-Path: <linux-usb+bounces-21094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1BEA46455
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 16:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD985188AEC6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 15:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3607226CEE;
	Wed, 26 Feb 2025 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxUmLR34"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9A22423E
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582934; cv=none; b=Xp2hf8WuU2nOFMzsV23vXDjl0JiT09qeR+cGuiEULSMi6DiVF3crRjsU8K2j3wrovYMrHZKr1fh5a8+SRzxzdzozubds2MIfOR4BVm9nae1meCzNMVHpeAVV/26Hv8kHcJQU+oe1y7ssDVUOlc3pVRHLAJVzOHDGdrCtGMV2PDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582934; c=relaxed/simple;
	bh=SP8WGblJeEmFl2u6kpyoJ7FvlI0A3Br348uyu/17l9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTTvu8+3m5m+GRDIAKy507O3B7Jag9bYXc63JIHMzUHTIhPNargEGBVSxpdEWKNRvJhOCgteLWbEaBHwk1Sml07/F7ID87j9yOzygsoqBjDDdBZCNq88fm5Mso/IiehIvFEWBV0eAVO3VXIj2+BYYme9pEdANFVSZ74Lz+ByPFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxUmLR34; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740582933; x=1772118933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SP8WGblJeEmFl2u6kpyoJ7FvlI0A3Br348uyu/17l9U=;
  b=PxUmLR34UQqHEOO12sQ5CVwweq9JvQ2QfQAKEWkWJaZGEorCd+iCcc/l
   uAoeJHwR7UUZ1rXqmcVhXkB936UeT42xY8puesV+4j5JfcAYiwdKcJ4rY
   FhDsa682dOm1C3hiArupmIiQrrY60qmdL79PqPka3kU8L/akl2977S8w0
   C5HJQ2ifc/f2/hj7vAFCVmVaQ59vtqVhUNtNS6sARQldgaO+uUYmfReT7
   r9U3KgWODPWTNts/73g7HUmAwkb0v7VAYohErCjeSTKSaMjFn78m33g2w
   MgEfuncyK3l/+SWktYq/7XgavIW0CVdeB56IxryyozUkkdwlf7hi1LFEV
   A==;
X-CSE-ConnectionGUID: dwDfNEEYQDG5s9XtYPiyJg==
X-CSE-MsgGUID: FMlxhYhmTX+MBpqEtxDvxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41687026"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41687026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 07:15:31 -0800
X-CSE-ConnectionGUID: sO4S4Hm+T5W1e7Buu7AS7w==
X-CSE-MsgGUID: KpYqHBpuSxCYS9VqUtF0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121828550"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2025 07:15:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 2E04E995; Wed, 26 Feb 2025 17:15:29 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/3] usb: xhci: improve TR Dequeue Pointer macro
Date: Wed, 26 Feb 2025 17:14:56 +0200
Message-ID: <20250226151458.3871867-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
References: <20250226151458.3871867-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Endpoint Context Field at Offset 0x08 is defined as follows:
 - Bit 0:	Dequeue Cycle State (DCS)
 - Bits 3:1:	RsvdZ (Reserved and Zero)
 - Bits 63:4:	TR Dequeue Pointer

Rename 'SCTX_DEQ_MASK' macro to 'TR_DEQ_PTR_MASK' for better clarity.
The acronym "SCTX" stands for Stream Context, but the TR Dequeue Pointer
is not exclusively for Stream Context.

Use GENMASK_ULL() to get mask for bits 63:4 instead of inverted 3:0 mask.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 4 ++--
 drivers/usb/host/xhci.h      | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d4ec1e707107..9ff5ca4d5c1c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1448,7 +1448,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		u64 deq;
 		/* 4.6.10 deq ptr is written to the stream ctx for streams */
 		if (ep->ep_state & EP_HAS_STREAMS) {
-			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
+			deq = le64_to_cpu(stream_ctx->stream_ring) & TR_DEQ_PTR_MASK;
 
 			/*
 			 * Cadence xHCI controllers store some endpoint state
@@ -1464,7 +1464,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 				stream_ctx->reserved[1] = 0;
 			}
 		} else {
-			deq = le64_to_cpu(ep_ctx->deq) & SCTX_DEQ_MASK;
+			deq = le64_to_cpu(ep_ctx->deq) & TR_DEQ_PTR_MASK;
 		}
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			"Successful Set TR Deq Ptr cmd, deq = @%08llx", deq);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c3..621ffe9df283 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -500,7 +500,8 @@ struct xhci_ep_ctx {
 
 /* deq bitmasks */
 #define EP_CTX_CYCLE_MASK		(1 << 0)
-#define SCTX_DEQ_MASK			(~0xfL)
+/* bits 63:4 - TR Dequeue Pointer */
+#define TR_DEQ_PTR_MASK			GENMASK_ULL(63, 4)
 
 
 /**
-- 
2.47.2


