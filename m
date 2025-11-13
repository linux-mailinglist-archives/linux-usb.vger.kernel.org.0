Return-Path: <linux-usb+bounces-30481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF6C57815
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 13:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D450353763
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A58C2F9DA1;
	Thu, 13 Nov 2025 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZDQMq/D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06B34E772
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038740; cv=none; b=anecNxz+2I5GAj9BFxkVJi78ZA0GS18hfSHOUSAaX9O8F3rY4/wqMjho6DIt7if2NA3X9LNhpK2jt7+DoVcDYrQlWir2Se9xOW9S7Jewpmpz/QNGnM6O+QvjWhX8sztMl+D8F8tjs6vJftvWj0orIP6JES4Nyf8lVj2ciiT3pS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038740; c=relaxed/simple;
	bh=NGoy5vQhzHlKRpfyrmWisKJ9tQf/nTl5kBR2ASXPtuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmDqzsQfQfFQePLL3xXQctCU21xdB70TyMpMWpvzu2RU3Cv1+1NgAhmSoqqvSSdBJuOua9KcA+Wnel4UFk7UBwJ4GuMJ7+bbeX3eW8+W+G7dGb5B/gbBF9Fc5eU6bzo+KwrrVqoLujdKEPUffbG2R/Ra6bLG4LEaPMkpIOS2/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZDQMq/D; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038739; x=1794574739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NGoy5vQhzHlKRpfyrmWisKJ9tQf/nTl5kBR2ASXPtuo=;
  b=lZDQMq/DC1zGcHo373YEW6xArc81bm9fXIt1jO2079UwI4qvJu4uBa9f
   +cRm49HWPD7KH4eGJc8iw6la1FXCtv9v/yymeeWlcYsgO3vaHp/OOXgiA
   sjV1jPPPne7I1qOQbhEqzzXPx/ccWeSOIcqJNhxKp7NyPJxjrFYMKyRPJ
   DJFsC46MJfTqMPoqJwouFNwjFITcdmU+FP/PRWBLmrFB1jzERa+ABW2D3
   ZncYbZuTp0M1ClAuHsWEo27pGijSWAM4W+0wpVjoooSK2C4vwEdkk1JRq
   a8guQ6o+eH/Xfo5tcsgJkHs9cRbtnpWkgvwYd2oRRwISFwK9wHZFfIgOk
   Q==;
X-CSE-ConnectionGUID: leeA1YGyQQ6U39zBPBCsnQ==
X-CSE-MsgGUID: SPsYlvq7Tw2FKwe6brvpaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150392"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:58 -0800
X-CSE-ConnectionGUID: GLsUueETRbK8Rr7QeLohtg==
X-CSE-MsgGUID: KLzjREBvSSScVu4ShG9/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673826"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 3716296; Thu, 13 Nov 2025 13:58:56 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 02/13] usb: xhci: remove unused trace operation and argument
Date: Thu, 13 Nov 2025 13:56:29 +0100
Message-ID: <20251113125640.2875608-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove endpoint number 'ep_num' argument and memory operation from
xhci_log_ctx() trace function. These changes were added in commit
1d27fabec068 ("xhci: add xhci_address_ctx trace event") on Aug 14, 2013
and have never been used.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 18 ++++--------------
 drivers/usb/host/xhci.c       | 11 ++++-------
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 9abc904f1749..bf13da417f8e 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -71,18 +71,13 @@ DEFINE_EVENT(xhci_log_msg, xhci_dbg_ring_expansion,
 );
 
 DECLARE_EVENT_CLASS(xhci_log_ctx,
-	TP_PROTO(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
-		 unsigned int ep_num),
-	TP_ARGS(xhci, ctx, ep_num),
+	TP_PROTO(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx),
+	TP_ARGS(xhci, ctx),
 	TP_STRUCT__entry(
 		__field(int, ctx_64)
 		__field(unsigned, ctx_type)
 		__field(dma_addr_t, ctx_dma)
 		__field(u8 *, ctx_va)
-		__field(unsigned, ctx_ep_num)
-		__dynamic_array(u32, ctx_data,
-			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 8) *
-			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1))
 	),
 	TP_fast_assign(
 
@@ -90,10 +85,6 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 		__entry->ctx_type = ctx->type;
 		__entry->ctx_dma = ctx->dma;
 		__entry->ctx_va = ctx->bytes;
-		__entry->ctx_ep_num = ep_num;
-		memcpy(__get_dynamic_array(ctx_data), ctx->bytes,
-			((HCC_64BYTE_CONTEXT(xhci->hcc_params) + 1) * 32) *
-			((ctx->type == XHCI_CTX_TYPE_INPUT) + ep_num + 1));
 	),
 	TP_printk("ctx_64=%d, ctx_type=%u, ctx_dma=@%llx, ctx_va=@%p",
 			__entry->ctx_64, __entry->ctx_type,
@@ -102,9 +93,8 @@ DECLARE_EVENT_CLASS(xhci_log_ctx,
 );
 
 DEFINE_EVENT(xhci_log_ctx, xhci_address_ctx,
-	TP_PROTO(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx,
-		 unsigned int ep_num),
-	TP_ARGS(xhci, ctx, ep_num)
+	TP_PROTO(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx),
+	TP_ARGS(xhci, ctx)
 );
 
 DECLARE_EVENT_CLASS(xhci_log_trb,
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0cb45b95e4f5..42975df517cb 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4366,8 +4366,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG | EP0_FLAG);
 	ctrl_ctx->drop_flags = 0;
 
-	trace_xhci_address_ctx(xhci, virt_dev->in_ctx,
-				le32_to_cpu(slot_ctx->dev_info) >> 27);
+	trace_xhci_address_ctx(xhci, virt_dev->in_ctx);
 
 	trace_xhci_address_ctrl_ctx(ctrl_ctx);
 	spin_lock_irqsave(&xhci->lock, flags);
@@ -4427,7 +4426,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_err(xhci,
 			 "ERROR: unexpected setup %s command completion code 0x%x.\n",
 			 act, command->status);
-		trace_xhci_address_ctx(xhci, virt_dev->out_ctx, 1);
+		trace_xhci_address_ctx(xhci, virt_dev->out_ctx);
 		ret = -EINVAL;
 		break;
 	}
@@ -4445,14 +4444,12 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 			"Output Context DMA address = %#08llx",
 			(unsigned long long)virt_dev->out_ctx->dma);
-	trace_xhci_address_ctx(xhci, virt_dev->in_ctx,
-				le32_to_cpu(slot_ctx->dev_info) >> 27);
+	trace_xhci_address_ctx(xhci, virt_dev->in_ctx);
 	/*
 	 * USB core uses address 1 for the roothubs, so we add one to the
 	 * address given back to us by the HC.
 	 */
-	trace_xhci_address_ctx(xhci, virt_dev->out_ctx,
-				le32_to_cpu(slot_ctx->dev_info) >> 27);
+	trace_xhci_address_ctx(xhci, virt_dev->out_ctx);
 	/* Zero the input context control for later use */
 	ctrl_ctx->add_flags = 0;
 	ctrl_ctx->drop_flags = 0;
-- 
2.50.1


