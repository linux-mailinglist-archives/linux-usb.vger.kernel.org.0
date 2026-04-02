Return-Path: <linux-usb+bounces-35872-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFsEGXlszmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35872-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:17:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688F389862
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB850303CBC8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2489F2DA75B;
	Thu,  2 Apr 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERXF6G1B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931662D73BD
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135843; cv=none; b=lXwVXHtj3L72UbLhfOU9WGlOLYJTK+yB1IEmMWD6/cDnX+2XLDcqltykNYX+Dg6VyuGSDi+ZYiazGpWqPz9YGuqn06MObz9V+d4nM63d5HS28LyzOWDgMZL1wZwiocMwOLoZusG+5u1GQTDWdAnHyxa+UczhHXzd3oXkJClcR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135843; c=relaxed/simple;
	bh=dOb6G8nH5h++QhGFhztH10RKQZFShcvaMDnwIukJVHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AihC8j3AQqDXaCpriysJGExX/sHjiMSQ6yhY4Vfli9W99fat4ixl6Q4dNkieqmG/NKJTGcOlis3PCp203s5bcqkgeQfpelF4kMFjMwBsyO4sCpMZP45lChNvWRD79CsOjvDaRf/uJRkQGWHQRdhaF1BIRir/Hyr8YNy+6+vxPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERXF6G1B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135843; x=1806671843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dOb6G8nH5h++QhGFhztH10RKQZFShcvaMDnwIukJVHM=;
  b=ERXF6G1BNAEM5UKDwIgz6IN1fMWLxqHe2/tyeeYTVCvQKpPodbehq2Bu
   bykpuWaD7Y2VxsHu3rDwgQVVmmgNieIEH8Oy1674XMLwZh5MGSnam9BQc
   Z9sbfVQwQ1HMyGQulmIAGghHxiduOT5ZJJdyn1a7Gm7SHjnT4rAwm1EXn
   Yq9owgOGRH05MBECXKTpHhur17CUq6vZr7FWdorqjv2nPwWkgy90HMdb5
   2ocpoxXju8I45p2GNY7M+KupJ2FhsWAU9rzpjVi8XSKiyv+2bIUc5Aked
   Q/tUPhogeXfxoSSAJnfokTsuacWahly+p3vOveTPrbfcz4c9TfGTMY797
   Q==;
X-CSE-ConnectionGUID: I/fnWXTbRs6dy02wcKHtsg==
X-CSE-MsgGUID: vA8sLLyjRzK1tVQGxwPHYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650834"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:23 -0700
X-CSE-ConnectionGUID: ktJgbgS1RhutPijLbPH5uA==
X-CSE-MsgGUID: EmMk51T6QRGYSB97gR8jcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241512"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:21 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/25] usb: xhci: move reserving command ring trb
Date: Thu,  2 Apr 2026 16:13:24 +0300
Message-ID: <20260402131342.2628648-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35872-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5688F389862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Move the command ring TRB reservation from xhci_mem_init() to xhci_init().

Function xhci_mem_init() is intended for memory allocation,
while xhci_init() is for initialization.

This split allows xhci_init() to be reused when resuming from S4
suspend-to-disk.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
index fdd3a19b7c9c..b9fa941425c5 100644
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
2.43.0


