Return-Path: <linux-usb+bounces-34949-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE3sKFVuuWm8EgIAu9opvQ
	(envelope-from <linux-usb+bounces-34949-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:08:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6792ACACD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E753530E6E33
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398713EB7F1;
	Tue, 17 Mar 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAqQEtyq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC2D3EAC91
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759376; cv=none; b=CrFVmsONBiQeLEOLLFtUTxGA+xHbaBl9/lPTZ+lP7t/cmJMzVUnJCMDkSSNyfyYoVvnUFpkzcOJkIwN1lzaDHl4+kmhoEOp6xtEvpB/X/yy/vujdubJ1nlAXxI47AM1ldHIaWJDysODPS8IzQzbbBthCQ44fsrKgvSY1vJIdxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759376; c=relaxed/simple;
	bh=1a18UBDzAjrTcbexSvX6z+Cu4FXnXtm5JvnuB04w748=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pct567xUTaEyLYzDViDfUxZSDKLYw7eHLERM5I8Z+Z1ved2MPcShTs1HGHucBn/a7XVSVMCH1ctx61KKnJRftipi5pAjdOOttNot4Zbd3EZzDPmCiGwPFMgJ7Ep5+pUvbjzJZjv5KOnL+1mWuq4LVwz+XITYVAZk6xi7SmUkhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAqQEtyq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759375; x=1805295375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1a18UBDzAjrTcbexSvX6z+Cu4FXnXtm5JvnuB04w748=;
  b=bAqQEtyqKKJ09jM6RTwcY1pxqSn38tFFOLoVumiIM4pJRjxKM4rmzuGo
   goFR/8PLmpboVJ0BqXL3xzTrsfgA7GA2oF14gNN1xqvwcrY3PV2bifDYm
   fFPmkxgsFp9szakdbp1MVClwWpikx79TBI0zBOXhhDWTZgJpxjsgSsv8u
   B+OSH37cI0khuhgcYvBf04WuN5KvUd4Pu4jNk6P6EPyMRG0+Xip6pcdTg
   NfQDMcrfzJDI2SWCz8/A8c2Kqxny5b88r3BEZBhk/oBPN9au9TdGTnueu
   yrpDcfcqcVfc5L4qsZV3lRtZLj/rIC5/JTqz3r+41Ld+3HkHVBqihhobG
   g==;
X-CSE-ConnectionGUID: KlZO4fkKTbSuBGM7ycd8Pg==
X-CSE-MsgGUID: aeHMIk4BQ62kqiNNyXcZ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491187"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491187"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:15 -0700
X-CSE-ConnectionGUID: JhSLBG2gRlGz4UIMSeABEw==
X-CSE-MsgGUID: RrTazLlBSWyDwjqbN0vqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219394925"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 07:56:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5100C9B; Tue, 17 Mar 2026 15:56:13 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH v2 7/9] usb: xhci: split core allocation and initialization
Date: Tue, 17 Mar 2026 15:55:42 +0100
Message-ID: <20260317145544.2076387-8-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34949-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 5C6792ACACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Separate allocation and initialization in the xHCI core:
* xhci_mem_init() now only handles memory allocation.
* xhci_init() now only handles initialization.

This split allows xhci_init() to be reused when resuming from S4
suspend-to-disk.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
 * Re-add function comment to xhci_init()
 * Moved xhci_mem_init() and xhci_init() start/finish debug messages
   into the functions themselves.

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


