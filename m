Return-Path: <linux-usb+bounces-17183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A829BE3DB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B7C1C212E4
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E091DE2A3;
	Wed,  6 Nov 2024 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB6QnTUL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615C1DD0DB
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887979; cv=none; b=UrXuk5ULldcBh7eFFPbAo4wyU+bxXz1HlJTd2vUrgswTm8b6GaZn2bdsz1ePnZIm4amepP8LaiYYwk8Oe0gL4ijENtvWNrfXCotyxk3TUoLb4m4+7eLpqJS80fPk/5QkoNjGAtj1c4hCjuIe5tO0m6HuzM5UdVi0ef42K8K8zK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887979; c=relaxed/simple;
	bh=0HRU4ebVOzXiw313wa1hJ4NXWXbf/A89Ao6sD6Y9JZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aR5iV39q17CzfQ31VsG7tqX130GFULWA3Q0TXgm5H0zc9IX/3CT77wSuRI7aThYCJ2jXl7aj+EmtFF2d4vA2JxnBWecrj/Prjnr+KnNLS1euMyhyALKeUl6MDoXO4dtD2Gfnbj89/g6PFEqwNHKJgcPLFaNNCpaIMq+UlH1K0zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB6QnTUL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887978; x=1762423978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0HRU4ebVOzXiw313wa1hJ4NXWXbf/A89Ao6sD6Y9JZc=;
  b=YB6QnTULz4cXxyTEin339JFHccqp0LeEfSJOOooB6Wrp072TOmtDL7KF
   oVbiPplxIAH3A5yX7qCQKWiWU05McbB6WzuW7JueVvHvdGCbK7mdmZsxc
   F76T85qRYLQdU/uZkvIUz64tKSIqeKJGZdFrw/GjS1IG/YyiQpLqUoioB
   qZYPngprkU/alv5L1BqLtISrAevcW/9DsmLDPuSvHp0g2phiGazd9b1Wg
   iYqqErAL068EPSXlyXdNPGwyHmidu8Z1Wmt3Y2eaNhYPOVMTRstMTj1Qk
   A8RIcpUC5U2rf65lLgP2yPoaD8aqaBA7eDMn20wgY1+EgJv7w+T2VG22k
   g==;
X-CSE-ConnectionGUID: n9QZKmEdTEeGCKRYHULiow==
X-CSE-MsgGUID: pQkLmxSvQDmtT3IcLussHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059390"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:57 -0800
X-CSE-ConnectionGUID: NYA3FsnqRTu/0Ldm/5c1TA==
X-CSE-MsgGUID: 50ySrZ25QNKh2Hp+w8ZIbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84813018"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:57 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/33] xhci: trace stream context at Set TR Deq command completion
Date: Wed,  6 Nov 2024 12:14:34 +0200
Message-Id: <20241106101459.775897-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
References: <20241106101459.775897-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A successful 'Set TR Deq' command writes a new dequeue pointer to the
stream context for stream rings, show the content of the stream ctx
at command completion.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c  | 14 +++++++++-----
 drivers/usb/host/xhci-trace.h |  5 +++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f7f7b0a818f8..f62b243d0fc4 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1338,6 +1338,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	struct xhci_virt_ep *ep;
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_slot_ctx *slot_ctx;
+	struct xhci_stream_ctx *stream_ctx;
 	struct xhci_td *td, *tmp_td;
 	bool deferred = false;
 
@@ -1360,6 +1361,11 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	trace_xhci_handle_cmd_set_deq(slot_ctx);
 	trace_xhci_handle_cmd_set_deq_ep(ep_ctx);
 
+	if (ep->ep_state & EP_HAS_STREAMS) {
+		stream_ctx = &ep->stream_info->stream_ctx_array[stream_id];
+		trace_xhci_handle_cmd_set_deq_stream(ep->stream_info, stream_id);
+	}
+
 	if (cmd_comp_code != COMP_SUCCESS) {
 		unsigned int ep_state;
 		unsigned int slot_state;
@@ -1396,9 +1402,7 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		u64 deq;
 		/* 4.6.10 deq ptr is written to the stream ctx for streams */
 		if (ep->ep_state & EP_HAS_STREAMS) {
-			struct xhci_stream_ctx *ctx =
-				&ep->stream_info->stream_ctx_array[stream_id];
-			deq = le64_to_cpu(ctx->stream_ring) & SCTX_DEQ_MASK;
+			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
 
 			/*
 			 * Cadence xHCI controllers store some endpoint state
@@ -1410,8 +1414,8 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			 * To fix this issue driver must clear Rsvd0 field.
 			 */
 			if (xhci->quirks & XHCI_CDNS_SCTX_QUIRK) {
-				ctx->reserved[0] = 0;
-				ctx->reserved[1] = 0;
+				stream_ctx->reserved[0] = 0;
+				stream_ctx->reserved[1] = 0;
 			}
 		} else {
 			deq = le64_to_cpu(ep_ctx->deq) & ~EP_CTX_CYCLE_MASK;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 56af9f62916a..bfb5c5c17012 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -340,6 +340,11 @@ DEFINE_EVENT(xhci_log_stream_ctx, xhci_alloc_stream_info_ctx,
 	TP_ARGS(info, stream_id)
 );
 
+DEFINE_EVENT(xhci_log_stream_ctx, xhci_handle_cmd_set_deq_stream,
+	TP_PROTO(struct xhci_stream_info *info, unsigned int stream_id),
+	TP_ARGS(info, stream_id)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_ep_ctx,
 	TP_PROTO(struct xhci_ep_ctx *ctx),
 	TP_ARGS(ctx),
-- 
2.25.1


