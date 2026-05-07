Return-Path: <linux-usb+bounces-37071-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP8HIFxT/GlnOQAAu9opvQ
	(envelope-from <linux-usb+bounces-37071-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:54:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAEF4E540A
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 611F4306BFDE
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 08:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED3B391842;
	Thu,  7 May 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fs48+bpZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404A36C9C1
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143323; cv=none; b=XjCgIlOI7yG3OA+QdarU4mDd4Q86bEgPO+MAIDVCK/3SU2rtdJo+9YRzwH2VCetjZdtpGG3X/93xc8M1ELArfsuMMRBL9dh28ky0MFjEdIWkvF+G3bj302QwRZ6Mk982PTL8+44/ruHOCJ8y675x/VC7zvULX93knPiy4/ur9/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143323; c=relaxed/simple;
	bh=2P4GsqselYtp4tm1r9yt5qqL/ceHBr2D1cq3v13zd1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHDz2q8qGLhQlnb3dMx5rgt1IaYPayfatoea3XXWdjyfowFd/r3bbTU804rD6wScKPJBzr263BwBvcR1KMmmw4MC2tXTxRDKW56UtzGf+EXAx01cBdkrSAm1j7MVCk5WHR8ahaEx7Ag/vhVqjtzU5yjbXpNRfCih5tzTRidAwOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fs48+bpZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778143316; x=1809679316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2P4GsqselYtp4tm1r9yt5qqL/ceHBr2D1cq3v13zd1k=;
  b=fs48+bpZA+yS+YysPTJsLYY5zwcGHsHpiplDQOHl2prrfwdeeO3GcW5s
   ujf7YpVUYly490gQ/1wNodiIYA0eDfi9B48ee7CnkGbBPvFpU1mT7su5J
   nQSRQN3VKuhJq7De4GUDiuOb62asWWX/JxbLc41SH7geHHtAgIcNNwh4x
   RaUgb/RrEXP3nRUjFSJBR16g9ujYMQ5zehRS8M2mtoxXlwojeppsacE2S
   styr5Av1ir3Wt9lctFSAzNGmB9HR1665UnoLJ6vKgqpQamJbmNTgYHwc5
   PS6GQ4NbmVx6ju8UwD8+TUM77L9bRpOD8Fxf7P9N19HPe3ZteJ1dIV87R
   A==;
X-CSE-ConnectionGUID: t/8on/rdSpq4OrBLHEilVw==
X-CSE-MsgGUID: ReBT+AQ4TgC+SdT9eARtLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79104738"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79104738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:41:53 -0700
X-CSE-ConnectionGUID: sCdrLqdfTwmzCzRmygcEuw==
X-CSE-MsgGUID: L+v4C2fTRD2qnZTct4JtAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233313598"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 01:41:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0886395; Thu, 07 May 2026 10:41:51 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/3] usb: xhci: allocate DCBAA based on host controller max slots
Date: Thu,  7 May 2026 10:39:44 +0200
Message-ID: <20260507083945.959370-3-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: DDAEF4E540A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37071-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Allocate the Device Context Base Address Array (DCBAA) according to the
maximum number of device slots supported by the host controller, instead
of always allocating the absolute maximum of 255 entries.

The xHCI specification defines the DCBAA size as (MaxSlotsEnabled + 1)
entries. In the xhci driver there is currently no distinction between
MaxSlots and MaxSlotsEnabled, as all available slots are enabled during
initialization. As a result, 'max_slots' effectively represents both
values.

This change allows the xHCI driver to respect custom slot limits, reduces
unnecessary memory usage, and removes the obsolete "TODO" comment.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 6 +++---
 drivers/usb/host/xhci-ring.c | 4 ++--
 drivers/usb/host/xhci.h      | 7 ++-----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 93c6053dc71b..ac915dacd886 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1981,7 +1981,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	dcbaa = &xhci->dcbaa;
 	if (dcbaa->ctx_array) {
-		dma_free_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+		dma_free_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
 				  dcbaa->ctx_array, dcbaa->dma);
 		dcbaa->ctx_array = NULL;
 	}
@@ -2417,8 +2417,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
-	dcbaa->ctx_array =
-		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+	xhci->dcbaa.ctx_array =
+		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
 				   &dcbaa->dma, flags);
 	if (!dcbaa->ctx_array)
 		goto fail;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 22f663daf625..67231741f474 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -609,7 +609,7 @@ static struct xhci_virt_ep *xhci_get_virt_ep(struct xhci_hcd *xhci,
 					     unsigned int slot_id,
 					     unsigned int ep_index)
 {
-	if (slot_id == 0 || slot_id >= MAX_HC_SLOTS) {
+	if (slot_id == 0 || slot_id > xhci->max_slots) {
 		xhci_warn(xhci, "Invalid slot_id %u\n", slot_id);
 		return NULL;
 	}
@@ -1804,7 +1804,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	struct xhci_command *cmd;
 	u32 cmd_type;
 
-	if (slot_id >= MAX_HC_SLOTS) {
+	if (slot_id > xhci->max_slots) {
 		xhci_warn(xhci, "Invalid slot_id %u\n", slot_id);
 		return;
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58d20b8459ec..b467b875eeba 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -792,7 +792,8 @@ struct xhci_tt_bw_info {
 
 /**
  * struct xhci_device_context_array
- * @ctx_array:	Pointer to an array of addresses
+ * @ctx_array:	Pointer to an array of addresses. The array size depends on Max
+ *		Slots read from HCSPARAMS1.
  * @dma:	DMA address to @ctx_array
  *
  * Device Context Base Address Array (DCBAA) - Section 6.1.
@@ -803,10 +804,6 @@ struct xhci_device_context_array {
 	__le64		*ctx_array;
 	dma_addr_t	dma;
 };
-/*
- * TODO: change this to be dynamically sized at HC mem init time since the HC
- * might not be able to handle the maximum number of devices possible.
- */
 
 
 struct xhci_transfer_event {
-- 
2.50.1


