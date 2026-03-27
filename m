Return-Path: <linux-usb+bounces-35554-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NnsLTZ8xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35554-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:46:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00D344851
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C5830F62B9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EEC23183B;
	Fri, 27 Mar 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjZ0eamR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85A023D2A3
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615280; cv=none; b=GEPRnHd5iTviMSCCtXb3TXm90Gj0UQPDeCYcMe27DvhGqtoTvaJxlMbonTCL5n4KP3+Pnd3k4nrX8u/q5ijqg83gw46l/Hem6PhvK/Afj860qyCbKqRHbT1Xs3dbxkWS33+smy+nKjTsnkiXdTBQ1ZHgpkFnLbTAGco52RACayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615280; c=relaxed/simple;
	bh=jM74lLxWqB9qrJYjqqGFAf6NQ144NjhNygQ96kkxB1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvpnwcBoROxIi0Y4Z0HjoChZsDktbrYeDi33dRO5171NtqG6M5QYCEcUNV2hcsxmCF8VeeDACpzoEtNOhJacDLlw+xS9qUpOKoR/JE5VatOCdwuiiZtnMAu+C3lJ5/0ihPY/8F1beRF0tX/9Uv+0zzDD/edNQsCUvWXc3PMQGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjZ0eamR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615279; x=1806151279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jM74lLxWqB9qrJYjqqGFAf6NQ144NjhNygQ96kkxB1A=;
  b=HjZ0eamRmHdT/QChZKHZBdQUHsgDV/zzWw6IGu/lLYEz4QmlbJpEaTeb
   GACslFMVcBWi8FxSKnhT9t+Q3wdcezDtHkTSq7UQEdayAnFRZPBmg4CSb
   6juvELRNfDuqj+C+om+DFRHlGXfwP+xG1jTo/42ery+R+/8flRZF+wzag
   0xnaSJBzQo/indv4IPvhqykxL5RePU1XaBI8zl+335bOqZOVkX6EMHAef
   We7dr3bE+/+Kk29Cc3k/syxwrEwWRWbUJuXBHQ/Z6YRyoP7UpU/zjaFPn
   SZuGNid8B2v6gvdIL3VXkde2lQyZPhtGrOBGCeIGHlYiCbFQHc6x2vugD
   w==;
X-CSE-ConnectionGUID: sCmYenKJQPO+QAMZ4bUvOw==
X-CSE-MsgGUID: 1xZKk1ptSCWrWjSCmsG8yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79287720"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="79287720"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:18 -0700
X-CSE-ConnectionGUID: s2KvmFZnTbaKY3/TGaPcJw==
X-CSE-MsgGUID: A4zK1ZLLSWqAjf060DQFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230076176"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 05:41:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0FA159D; Fri, 27 Mar 2026 13:41:16 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/9] usb: xhci: move reserving command ring trb
Date: Fri, 27 Mar 2026 13:34:35 +0100
Message-ID: <20260327123441.806564-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35554-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 3B00D344851
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the command ring TRB reservation from xhci_mem_init() to xhci_init().

Function xhci_mem_init() is intended for memory allocation,
while xhci_init() is for initialization.

This split allows xhci_init() to be reused when resuming from S4
suspend-to-disk.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 7 -------
 drivers/usb/host/xhci.c     | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d4a9dbed8f16..45638ab13635 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2485,13 +2485,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "First segment DMA is 0x%pad",
 		       &xhci->cmd_ring->first_seg->dma);
 
-	/*
-	 * Reserve one command ring TRB for disabling LPM.
-	 * Since the USB core grabs the shared usb_bus bandwidth mutex before
-	 * disabling LPM, we only need to reserve one TRB for all devices.
-	 */
-	xhci->cmd_ring_reserved_trbs++;
-
 	/* Allocate and set up primary interrupter 0 with an event ring. */
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating primary event ring");
 	xhci->interrupters = kcalloc_node(xhci->max_interrupters, sizeof(*xhci->interrupters),
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a04b1365bb6a..facadf0f0d1e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -564,6 +564,12 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set the Number of Device Slots Enabled to the maximum supported value */
 	xhci_enable_max_dev_slots(xhci);
 
+	/*
+	 * Reserve one command ring TRB for disabling LPM.
+	 * Since the USB core grabs the shared usb_bus bandwidth mutex before
+	 * disabling LPM, we only need to reserve one TRB for all devices.
+	 */
+	xhci->cmd_ring_reserved_trbs = 1;
 	/* Set the address in the Command Ring Control register */
 	xhci_set_cmd_ring_deq(xhci);
 
-- 
2.50.1


