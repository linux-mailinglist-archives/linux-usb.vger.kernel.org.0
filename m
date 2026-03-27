Return-Path: <linux-usb+bounces-35557-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ASjMD17xmmjKwUAu9opvQ
	(envelope-from <linux-usb+bounces-35557-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 735663447A2
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 256BD308FD29
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5EE3793D3;
	Fri, 27 Mar 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjyyakZI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA534A3B1
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615281; cv=none; b=vAvYbmpFQ+uXwirPBC085GIkByeBgVHhfVKK9s485HsRQeAcPR/SBAI83DTGFH+L0cEPRQHwRtSRtn7NE0EtZB+s4oWiz9lRwiBaYY67W14bQ3TZa7ujexdlnaKtEAfGhmh+jBsBWnR5yqNserm3R98QnuuDYpnVqa0Iv9Yu3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615281; c=relaxed/simple;
	bh=k2Qn+dJj8EA5R++a8MzwWEmrFLqfJvI0dU9lIkKB0mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3vBHu7wBentOLTBwOea6Wy9ToZ53E3Vf3A3UmRvP2n2oG8IjvEZXa5S9wBmpMWLl/CF5DQJ70hHGmZilSfRPUg80+ryYqC8+94yXuQwQLhaijO3oCn39yL7D51bZsR8hYki9U8ZCRdkyOmGlAiQrCO7Veg+/uxO7Vyv0Kdz7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjyyakZI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615280; x=1806151280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k2Qn+dJj8EA5R++a8MzwWEmrFLqfJvI0dU9lIkKB0mg=;
  b=AjyyakZIgAPjJDwhZEdNKjEsnFbWZpBlt/U9foe2/e/5rqflO7tb2IGI
   v1HPge9NaBcpAUXDs4aQWLmA1TCmTQAxJybW78xNqvkvI26Mhs4yfZ5gu
   2mpfHiBVHF335F67U49cAnwv1LcJa0kgGwRis1j81u3MxavNEUbVxfym0
   myxsSPYn7I92eTAlgOfTWNOCGeLKc1pNAPSYQq9BfzEohY5jM+W6XGNyc
   yPp4/nIna4s/S3vEwDtHMq0T7k3Q446cCuuMT6RrQ8/yhxyoVmIP1U5Jv
   ACXuMTZL9B17khrdvnwzEWrlWc600s17DSpT8PMnqosDlxflhVH1643Zs
   w==;
X-CSE-ConnectionGUID: f/01IYFsT8CxbSwibOtz3w==
X-CSE-MsgGUID: wGpt15HnS7iBR8HSSxXaAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79287728"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="79287728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:20 -0700
X-CSE-ConnectionGUID: aHOEDL+YRbeoXUlh50feUg==
X-CSE-MsgGUID: b7pJ4O5qRS+aYO4zCp+49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230076180"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 05:41:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id B29AF99; Fri, 27 Mar 2026 13:41:17 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 7/9] usb: xhci: split core allocation and initialization
Date: Fri, 27 Mar 2026 13:34:38 +0100
Message-ID: <20260327123441.806564-8-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35557-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 735663447A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Separate allocation and initialization in the xHCI core:
* xhci_mem_init() now only handles memory allocation.
* xhci_init() now only handles initialization.

This split allows xhci_init() to be reused when resuming from S4
suspend-to-disk.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  3 +++
 drivers/usb/host/xhci.c     | 30 ++++++++++--------------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2cd6111c9707..f1b4f06d4b8b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2421,6 +2421,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
 
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
+
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
 	 * "physically contiguous and 64-byte (cache line) aligned".
@@ -2510,6 +2512,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (xhci_setup_port_arrays(xhci, flags))
 		goto fail;
 
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
 	return 0;
 
 fail:
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4e811a2668e6..658419eb6827 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -536,24 +536,13 @@ static void xhci_set_dev_notifications(struct xhci_hcd *xhci)
 	writel(dev_notf, &xhci->op_regs->dev_notification);
 }
 
-/*
- * Initialize memory for HCD and xHC (one-time init).
- *
- * Program the PAGESIZE register, initialize the device context array, create
- * device contexts (?), set up a command ring segment (or two?), create event
- * ring (one for now).
- */
-static int xhci_init(struct usb_hcd *hcd)
+/* Setup basic xHCI registers */
+static void xhci_init(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	int retval;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
-	retval = xhci_mem_init(xhci, GFP_KERNEL);
-	if (retval)
-		return retval;
-
 	/* Set the Number of Device Slots Enabled to the maximum supported value */
 	xhci_enable_max_dev_slots(xhci);
 
@@ -589,7 +578,6 @@ static int xhci_init(struct usb_hcd *hcd)
 	}
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -1190,11 +1178,12 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		 * first with the primary HCD, and then with the secondary HCD.
 		 * If we don't do the same, the host will never be started.
 		 */
-		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
-		retval = xhci_init(hcd);
+		retval = xhci_mem_init(xhci, GFP_KERNEL);
 		if (retval)
 			return retval;
 
+		xhci_init(hcd);
+
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
 		if (!retval && xhci->shared_hcd) {
@@ -5526,12 +5515,13 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
 
-	xhci_dbg(xhci, "Calling HCD init\n");
-	/* Initialize HCD and host controller data structures. */
-	retval = xhci_init(hcd);
+	/* Allocate xHCI data structures */
+	retval = xhci_mem_init(xhci, GFP_KERNEL);
 	if (retval)
 		return retval;
-	xhci_dbg(xhci, "Called HCD init\n");
+
+	/* Initialize HCD and host controller data structures */
+	xhci_init(hcd);
 
 	if (xhci_hcd_is_usb3(hcd))
 		xhci_hcd_init_usb3_data(xhci, hcd);
-- 
2.50.1


