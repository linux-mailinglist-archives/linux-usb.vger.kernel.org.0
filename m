Return-Path: <linux-usb+bounces-34108-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDkyAnicqWnGAwEAu9opvQ
	(envelope-from <linux-usb+bounces-34108-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:08:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CE214317
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D10E730D726B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C89D3A9002;
	Thu,  5 Mar 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRcOOqMr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48A3A9DB6
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722141; cv=none; b=kReK+YxMBReUQ59QLCC/HIWXl3POoRMiALocERXNSJ4r4jLh9eXDwKNTlIeG5HkqZC2RRuTRcFLiZNxWtu6rvbETe6jyw1LEpLhkB+LZRPpf6wO1fbGrD5wIw44tXhmMRTTi+HCITljuJH9tcgv/JZhj+u5Pl+/8QiHPmK6BVyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722141; c=relaxed/simple;
	bh=wWI4gK8qDe5KSf/+lJlOqH3tKqsiiNslK/XyxfnA4gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvBjHRz8FVDTdxzKCUZm2jQrvb/q6F4ikvKjIEwVJphqiNf3LZLw0nc/DHxfjpQc3KWmmfJEIRoFmJ4dlQ6KqXhLc92Gk7IX3/pzTNg/G3hYI6HarKEfljFeZRSSUdftAy6FAc3NFr+BLDjze8IHNcLjqdVKbh3Saw2PIMVqpeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRcOOqMr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722141; x=1804258141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wWI4gK8qDe5KSf/+lJlOqH3tKqsiiNslK/XyxfnA4gI=;
  b=aRcOOqMra6/4587GS3yf7p7eycWDyYPD4jNv6DMcWNtfGsV2oo+DgTrr
   z7aqtCliFER8AFVuNVbcBJdfx2GlSUY2f66xYfvZh6X9mcjOXI1QQHEb4
   5jq7GEzto6gQOicn2RH0MO0+7nVY6ZtNhrmKOoHRSvHTHXItEgQy5ovS0
   5Hu9HpJu17T9Z0PWtu/s3k48x5vXRXY1NZ8VAU7T0HTAMaPuLwoVGJwFe
   Uq/4vqTcV6xoh4O11otm7uRHLzcEnERnk37eGA/+Y24koiQadpZSBxSCE
   K/Kf8G31Z8DZu3ZfblEnNgl3rTz0oMM/dpFe57VXTQ3mNa6KERJ2uQF40
   w==;
X-CSE-ConnectionGUID: zZxzJuAZShG6c6dBFaXrJQ==
X-CSE-MsgGUID: CDgqmtaPQ16BQJDs/lULVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411867"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411867"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:49:00 -0800
X-CSE-ConnectionGUID: aqLaaxSGSsSrv8w9R2SiYA==
X-CSE-MsgGUID: Ds55QPHiRnO5pBRVUijamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659799"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0574695; Thu, 05 Mar 2026 15:48:58 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 11/12] usb: xhci: prepare for multiple interrupters
Date: Thu,  5 Mar 2026 15:48:23 +0100
Message-ID: <20260305144824.3264408-12-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: 1C1CE214317
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34108-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

The core xhci driver only uses a single interrupter. Prepares the driver
to handle multiple interrupters, although it still uses only one interrupt
for now.

Some initialization, such as IP bit auto-clear and IMODI, was previously
done in xhci_run() (called once per xHCI instance). For simplicity,
move these to xhci_init() to consolidate all interrupter-related setup
in a single place.

Move the ERST dequeue debug message from xhci_run() to the existing ERST
debug message in xhci_set_hc_event_deq(). This function is always called
before xhci_run(), and is called for all interrupters.

This change is necessary to prepare the driver for multiple interrupters.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  3 +--
 drivers/usb/host/xhci-pci.c |  4 ++++
 drivers/usb/host/xhci.c     | 13 +------------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 46d977f9e5c5..a6fde127c569 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2017,8 +2017,7 @@ static void xhci_set_hc_event_deq(struct xhci_hcd *xhci, struct xhci_interrupter
 	/* Don't clear the EHB bit (which is RW1C) because
 	 * there might be more events to service.
 	 */
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-		       "// Write event ring dequeue pointer, preserving EHB bit");
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Write ERST %pad, preserving EHB bit", &deq);
 	xhci_write_64(xhci, deq & ERST_PTR_MASK, &ir->ir_set->erst_dequeue);
 }
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..ea43b0153430 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -181,6 +181,10 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 
 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
+
+	/* MSI/MSI-X interrupts clear IMAN IP bit automatically */
+	xhci->interrupters[0]->ip_autoclear = true;
+
 	return 0;
 
 free_irq_vectors:
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 329fe9ff19f8..e846ab402d3e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -573,6 +573,7 @@ static void xhci_init(struct usb_hcd *hcd)
 	xhci_ring_init(xhci, xhci->interrupters[0]->event_ring);
 	xhci_add_interrupter(xhci, 0);
 	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
+	xhci_set_interrupter_moderation(xhci->interrupters[0], xhci->imod_interval);
 
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
@@ -633,30 +634,18 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
  */
 int xhci_run(struct usb_hcd *hcd)
 {
-	u64 temp_64;
 	int ret;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir = xhci->interrupters[0];
 	/* Start the xHCI host controller running only after the USB 2.0 roothub
 	 * is setup.
 	 */
 
 	hcd->uses_new_polling = 1;
-	if (hcd->msi_enabled)
-		ir->ip_autoclear = true;
-
 	if (!usb_hcd_is_primary_hcd(hcd))
 		return xhci_run_finished(xhci);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_run");
 
-	temp_64 = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
-	temp_64 &= ERST_PTR_MASK;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
-
-	xhci_set_interrupter_moderation(ir, xhci->imod_interval);
-
 	if (xhci->quirks & XHCI_NEC_HOST) {
 		struct xhci_command *command;
 
-- 
2.50.1


