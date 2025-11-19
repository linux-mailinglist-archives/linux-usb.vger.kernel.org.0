Return-Path: <linux-usb+bounces-30714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B814C6F587
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BB7CA3A2FB8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FBB36A000;
	Wed, 19 Nov 2025 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdP/L0yH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104AA22652D
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562297; cv=none; b=VXCrPEvlnHd0fMGiVx1Hn/LbG2Vs0GHorAcOY6fVGH698nhOkSsXllJFB3sFJUTAYgtR/SJJd20IMaTfgprzR3T3PJAnQ0d9+hMa4Xqk9WV34W9FjaGGyHBgT+EiFc5+1shbtZIm2AJe2QCeygqJ4MLflX4xoOfVhXG4ipZuwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562297; c=relaxed/simple;
	bh=OWGxUFH6ohdftL/CwXZtavxGvQ3QYe6MuhebpfBUOv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f64os6vCQl+cZ+1mx4/v3pIjFqOBJkPL2bAzj8f8MEPNjcLqy848a3BHLrIMtfR1W2kFFGiJZwO4wrTd9Z+gY/SAMyR1gktFQ/qVHyKKPkoLs4uPodB7OOWC6z90qlZJ4QL/tn8/OdE1FJ9/dIvHscMdBeFL+kYeEYvPmzJ1mVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdP/L0yH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562296; x=1795098296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OWGxUFH6ohdftL/CwXZtavxGvQ3QYe6MuhebpfBUOv8=;
  b=WdP/L0yH7sRNojsDXp3ewhPRrqFDoF4o+UQARvYYLKAXejMBmEf8vCH7
   vMQbdDudzD26bD2RYOUpV2BMXyONyGERLYIACdFYcYrqnTp28oEubAL8U
   roG7Sb1Fy95/9aC96Hx9O5uufEhrAr6JBCW187FS6QpuQFMienMHKZbCp
   UiDAA85XQXkxG79/z7My4fxn88YC//zqaBUi/hu+0h5V35cm9CuQk/ITv
   FqMPA1KJf1DfHvrzJA98X1TDQPeXLo1deu8J/kvbV7mfUXr4Se0bKrQqx
   m77JtqJPGvcBb9QAln/pq27H3sAjhGoLubgnLO7g6EpBGJWd5zCZXUFkb
   w==;
X-CSE-ConnectionGUID: +hWLiYFwSvuZJ2trv6eZHg==
X-CSE-MsgGUID: A9X/vEWgRf+W7yNQ3XnqJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645554"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645554"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:56 -0800
X-CSE-ConnectionGUID: sj9N1iIhSeyxiP3mffDtDg==
X-CSE-MsgGUID: JP9Ac9bUSYqLAENSgLIeYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:54 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/23] usb: xhci: remove unused trace operation and argument
Date: Wed, 19 Nov 2025 16:24:07 +0200
Message-ID: <20251119142417.2820519-14-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Remove endpoint number 'ep_num' argument and memory operation from
xhci_log_ctx() trace function. These changes were added in commit
1d27fabec068 ("xhci: add xhci_address_ctx trace event") on Aug 14, 2013
and have never been used.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 18 ++++--------------
 drivers/usb/host/xhci.c       | 11 ++++-------
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 481becbcbf81..8e5b8e1282f7 100644
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
index 593b9d3aa9b6..7ac8198d0d7b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4379,8 +4379,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG | EP0_FLAG);
 	ctrl_ctx->drop_flags = 0;
 
-	trace_xhci_address_ctx(xhci, virt_dev->in_ctx,
-				le32_to_cpu(slot_ctx->dev_info) >> 27);
+	trace_xhci_address_ctx(xhci, virt_dev->in_ctx);
 
 	trace_xhci_address_ctrl_ctx(ctrl_ctx);
 	spin_lock_irqsave(&xhci->lock, flags);
@@ -4440,7 +4439,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_err(xhci,
 			 "ERROR: unexpected setup %s command completion code 0x%x.\n",
 			 act, command->status);
-		trace_xhci_address_ctx(xhci, virt_dev->out_ctx, 1);
+		trace_xhci_address_ctx(xhci, virt_dev->out_ctx);
 		ret = -EINVAL;
 		break;
 	}
@@ -4458,14 +4457,12 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
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
2.43.0


