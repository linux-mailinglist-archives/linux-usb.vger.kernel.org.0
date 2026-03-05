Return-Path: <linux-usb+bounces-34101-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDPRIGicqWnGAwEAu9opvQ
	(envelope-from <linux-usb+bounces-34101-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:08:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88017214306
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75E153060BC0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30793A874C;
	Thu,  5 Mar 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE/Pf26C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033F3A5E6B
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722138; cv=none; b=aTK+VDX2H2FI0Mh+InBBzdQlvZpisGLUjqCdAQIKWTYjRiaKTlz8B+pv3CnoMhxL0F9TM4WnbTv0zV5Ci36NlDb2DCHTqlh4R3DGavUEiwzavdFoCZY843tAOUduIneGzjFRPoHuE2BezRw+CwtObVtr3HFFc7o9IltxGz1Plrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722138; c=relaxed/simple;
	bh=Sm1uw+dM3vA8+JG5lJNjqORUdxuKyxb36cB9q8U+XeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faKAmJoCqxVfyzJu2xh39joETl/vx7/q+Hx4aDF8JgiL40JhkZTlMRFCB1Q6jYE2L+hrR1HJ0PhmmSGnc74rbhYt/VElys/gUz5+vUDqt0NnxFmFv1R0hOtvdPK26oN1MNscKQ1rn/k1+CGq3ZbEum1rFthfNdETs2BVWtFUnAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE/Pf26C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722137; x=1804258137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sm1uw+dM3vA8+JG5lJNjqORUdxuKyxb36cB9q8U+XeU=;
  b=QE/Pf26CBb3uGAAgit8eIl9CIuXiSmiE/+nvAfHtqmhKbzXzFLiWhPax
   wRdLtbMNgLTTxqZTq+H/sx87KeIkk1Zrcpy4JQGfpUeZ9vOBLjN1js8AH
   1ns3AV7/2Y/vt5PHAtHRxP9CRWeo4pLGTCjSnnGSKKhabK2O59+SW+/2S
   YHzu2u/Ed7AdbApP/uVVYXN84ZxntH+FqDq0JYkWhZv9bUKsofmzP4Nzd
   2GPdAUNceaGQA0jiM5ruCT9hn3eXBS+M2twAObbpux4yYA4yovL03Lr5G
   g5YvOjkHIoqJZgJJdu5KR+hED4Ir4qM4+EFGDME0z5C1uwxKJrShvYdFU
   w==;
X-CSE-ConnectionGUID: E8eRn2fyQpmUtgHWA5U00g==
X-CSE-MsgGUID: FslttbDgR9yI5ZUOyt+DgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411854"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:55 -0800
X-CSE-ConnectionGUID: wbPS/g9cTWKr7YnAZN5CYA==
X-CSE-MsgGUID: sFcBeuNWScuqr5maeqA+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659788"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0977C9B; Thu, 05 Mar 2026 15:48:53 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 04/12] usb: xhci: move reserving command ring trb
Date: Thu,  5 Mar 2026 15:48:16 +0100
Message-ID: <20260305144824.3264408-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 88017214306
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34101-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

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
index c708bdd69f16..2e6c5fe11940 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2477,13 +2477,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index ad095768ed48..e8366aa479ab 100644
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


