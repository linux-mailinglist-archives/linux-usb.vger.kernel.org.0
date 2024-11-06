Return-Path: <linux-usb+bounces-17182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03F9BE3D9
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 11:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791911F24D72
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F36E1DB546;
	Wed,  6 Nov 2024 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4mR7UTB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5201D5CFA
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887978; cv=none; b=BpKb+DWi6v/E5iaMM/+XLkgrBRZ5m6GKSSbm7O7feLANj3I8NIw+qe+pzs3yiEAhucs+JbF1Yj+GMu8F4wwrwdHOWdcACJiM4xlGP+c2EbDkaArOtQs3ctsc5TGoIZdHQ3cXC2UwN2hvbCCqbu9G0Vq5CCFZrlDYbFmw6IBBUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887978; c=relaxed/simple;
	bh=ZjxwuchpkyrJ0+rosThp0q94ZW/u8yk0ApMkmTjeAHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uiVYcP+0UKhAZKUyE2qrmTmEBdLZrayxZZL9y9lAYL8cJX3g1IztLLiYMy4UZI2oFhFOR6kLbTCOgxplmSXm8lQgRaoEgkrR4MJwTybNn00t7XRTwIxFxcXPIckjvdkznAll8ibvCC/afT41DD4G/rLi6HefPBpX9PHhVWP2VBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4mR7UTB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887976; x=1762423976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZjxwuchpkyrJ0+rosThp0q94ZW/u8yk0ApMkmTjeAHE=;
  b=S4mR7UTB1bctm4PftP8u0eN3CxghALMFVVWDCR7SupgFO0FTZFO1oPuM
   lf3wP2rNaW8QGOUyP+AJlwzYDucPN7ySLFfG307Q5wLoghxgK9FPMqZ3t
   AFajOFiYLQxJ2/QMRZNFL75o8hEDXj2gyuX12DQ3daIKud+Ke5TjuoRvv
   +93hahCebGAw9n50MQZzgnWEO0CKk+TMIiM5wk+jCXZi3czq7bOgN1q3i
   sgV89Kr1+kbrBM1Q7j3ohC1nZeezTZ28rEtbBJlD7jha5BZCfade3NCJR
   GDtSV9neTXeYvyuRXbHDYOYKmx0TjufbRnUnyv9Hj+4wGIQw69g3K2xbf
   A==;
X-CSE-ConnectionGUID: OcRwd6TASA+o0+5H/QDGWw==
X-CSE-MsgGUID: s1ZPVyb0SpaULht2QYAsVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42059388"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42059388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:12:56 -0800
X-CSE-ConnectionGUID: vLsHOjDeTR6kkwBBSJA0Qw==
X-CSE-MsgGUID: XIsSwVkYSqatqdQOI+y2BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84812996"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 06 Nov 2024 02:12:55 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/33] xhci: add stream context tracing
Date: Wed,  6 Nov 2024 12:14:33 +0200
Message-Id: <20241106101459.775897-8-mathias.nyman@linux.intel.com>
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

Show stream id, stream context type (SCT), ring dequeue pointer and
the DMA address of the stream context during stream allocation

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c   |  2 ++
 drivers/usb/host/xhci-trace.h | 26 ++++++++++++++++++++++++++
 drivers/usb/host/xhci.h       |  1 +
 3 files changed, 29 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d2900197a49e..2952737ccf6c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -658,6 +658,8 @@ struct xhci_stream_info *xhci_alloc_stream_info(struct xhci_hcd *xhci,
 		xhci_dbg(xhci, "Setting stream %d ring ptr to 0x%08llx\n", cur_stream, addr);
 
 		ret = xhci_update_stream_mapping(cur_ring, mem_flags);
+
+		trace_xhci_alloc_stream_info_ctx(stream_info, cur_stream);
 		if (ret) {
 			xhci_ring_free(xhci, cur_ring);
 			stream_info->stream_rings[cur_stream] = NULL;
diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 57b8cb5a8d19..56af9f62916a 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -314,6 +314,32 @@ DEFINE_EVENT(xhci_log_urb, xhci_urb_dequeue,
 	TP_ARGS(urb)
 );
 
+DECLARE_EVENT_CLASS(xhci_log_stream_ctx,
+	TP_PROTO(struct xhci_stream_info *info, unsigned int stream_id),
+	TP_ARGS(info, stream_id),
+	TP_STRUCT__entry(
+		__field(unsigned int, stream_id)
+		__field(u64, stream_ring)
+		__field(dma_addr_t, ctx_array_dma)
+
+	),
+	TP_fast_assign(
+		__entry->stream_id = stream_id;
+		__entry->stream_ring = le64_to_cpu(info->stream_ctx_array[stream_id].stream_ring);
+		__entry->ctx_array_dma = info->ctx_array_dma + stream_id * 16;
+
+	),
+	TP_printk("stream %u ctx @%pad: SCT %llu deq %llx", __entry->stream_id,
+		&__entry->ctx_array_dma, CTX_TO_SCT(__entry->stream_ring),
+		__entry->stream_ring
+	)
+);
+
+DEFINE_EVENT(xhci_log_stream_ctx, xhci_alloc_stream_info_ctx,
+	TP_PROTO(struct xhci_stream_info *info, unsigned int stream_id),
+	TP_ARGS(info, stream_id)
+);
+
 DECLARE_EVENT_CLASS(xhci_log_ep_ctx,
 	TP_PROTO(struct xhci_ep_ctx *ctx),
 	TP_ARGS(ctx),
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 7d81645c2c5d..89337562440b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -554,6 +554,7 @@ struct xhci_stream_ctx {
 
 /* Stream Context Types (section 6.4.1) - bits 3:1 of stream ctx deq ptr */
 #define	SCT_FOR_CTX(p)		(((p) & 0x7) << 1)
+#define	CTX_TO_SCT(p)		(((p) >> 1) & 0x7)
 /* Secondary stream array type, dequeue pointer is to a transfer ring */
 #define	SCT_SEC_TR		0
 /* Primary stream array type, dequeue pointer is to a transfer ring */
-- 
2.25.1


