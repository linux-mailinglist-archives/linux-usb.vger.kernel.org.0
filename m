Return-Path: <linux-usb+bounces-34946-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGtxLqpruWl6EgIAu9opvQ
	(envelope-from <linux-usb+bounces-34946-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE312AC7B6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66F713032895
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71FB3E95AC;
	Tue, 17 Mar 2026 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1VPveaQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642813E9F7F
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759374; cv=none; b=ctV8yyus8p6HnNy4qAnkrbU21sLm55Rd0BpcrGSV/1tsj9AJy9gEMLKyhqsY6TvNTZMfjpUZPRJgaSuQWAwVzjqFoMTAxD+oFbyV31E83AIu6LWJBkMO0gBNe2O5vy+rrON1bp1UoBL3chAlxBXipu7jbRgDqZNKHsyXyPnjQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759374; c=relaxed/simple;
	bh=jM74lLxWqB9qrJYjqqGFAf6NQ144NjhNygQ96kkxB1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVEvxvfQgn3XyllhWbY1YYsBI9xLxTwUoxcx7zyuTcFe2yfjAMCEUhViQvIYYBn33MZJTlm7WgKSvPxep6spWF3lLJ7LZSYVKt5NpnvfCrvPPWpISCyNzpI8saNtvJjW9UP645IWkv/3KueX8S8x3rKK/aBQDGlRi0cq4yzpLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1VPveaQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759373; x=1805295373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jM74lLxWqB9qrJYjqqGFAf6NQ144NjhNygQ96kkxB1A=;
  b=F1VPveaQSbt98FiG+dANoUUZZBhmIuf2ny554DgwPic8l+irrXNVxhao
   Oks4FXz+tZvHyQsGt2/4Q0mxfA64dFaSJ+30xC/DOQhmiRb0iK3jakWIi
   /S92EzfkCqFShp9A39AJuxGW2sfhVhx7zTFvYZ44LdvEsBjsTLMkU4pD1
   bbJ+AagJqYw+Gp3X9fl+IRoz3Fbwq73bZIANGFc0ciarZCsBk7oc3SzPi
   TGnuITROsRfiUE0hGduh7JlNxZPfBQUR/wkRgdcQ/dVatERWXLWdXiywp
   ZeNVsny+G9I3iNx3LgWJChIAbwHudP6FJzJt8P0L9EbwE8iszWN9hm4Mh
   Q==;
X-CSE-ConnectionGUID: VWK2Mcl6SFeY3D2eJvzQZA==
X-CSE-MsgGUID: k7kaKqNnS4K2KmWR5R8VVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491176"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:12 -0700
X-CSE-ConnectionGUID: 5vEtpl5PSKuipaVDabeJrw==
X-CSE-MsgGUID: AxQ71rxOQdKGm30NaixuSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219394908"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 07:56:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id B19419D; Tue, 17 Mar 2026 15:56:10 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH v2 4/9] usb: xhci: move reserving command ring trb
Date: Tue, 17 Mar 2026 15:55:39 +0100
Message-ID: <20260317145544.2076387-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
References: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34946-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CE312AC7B6
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


