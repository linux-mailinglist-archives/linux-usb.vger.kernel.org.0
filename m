Return-Path: <linux-usb+bounces-34105-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMYPIZmZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34105-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0590213F1F
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E185D3180F49
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D8B3A9D9E;
	Thu,  5 Mar 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRYKeC4c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1CF3A8FEE
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722139; cv=none; b=frlCqw/nFhE6PeFJvP2YjOvODzuH6WSy7qL7Oklhfv83jUAffRUxlj7eL4NtA5ocjY9cZeqFCVOXaLmzE0RIm3xL3UBykenz7bUSDiNTGa87QzcoVnLUEiNHg+m5QkPDRqfIsIAk+6+04OplyxQ41qs9tKSBqCT79gC3c2Jwe+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722139; c=relaxed/simple;
	bh=if7hIUNCjNWbJCyJHpJE/58piclb0W1Oe9NI8gAEAH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWHX4Xb4z9SSZ+Dh9oCED58f+4V37tL2SPUxNlxDwxADkRZnhUccyBcq1L5vHV3WawEDlmPLt1vmFCiSW5VHztMiRpXDypH+HkDrcr5sp9DBHGPzPVhdy+L2JufLEK+27mlpwWmF+CNp6p5bwuK7CKgjc+/uu7P/eI69wm87SH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRYKeC4c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722139; x=1804258139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=if7hIUNCjNWbJCyJHpJE/58piclb0W1Oe9NI8gAEAH0=;
  b=aRYKeC4csGtaNDoLLBhRkj9VoL+YxXSkiREJDNqImHqjSvfxmoFvCWYE
   Typ/3TP2yxAc77ZQevlIdAsVhZEjXMkuFY9wZ5eloP5X38VL/Xo0YBpz4
   Yc1OlsbVOxcUlOWuFJmlYICmV9+vCaNWxL0Ozaen/b1k9DvRMaLinzFto
   S01/lxxt5UlmMfvFJPGmpmV08jkHofQrwCBuaKWpZ9W+cCrfMwfNSt+yV
   LtEQWWjTDehVh6mHiCaVdqdBPChio516NCW8eoM64gP/DL73tCMsipZwE
   jPBuOKwjegeejxIcXlm6vQexNYZCDF88FCpsYSC6HTGdZLbdw33noDtVA
   Q==;
X-CSE-ConnectionGUID: ncr8x32dSvWDECFLcxQ9XQ==
X-CSE-MsgGUID: mP3gLkgxQwy62qglSu7SLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411860"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411860"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:58 -0800
X-CSE-ConnectionGUID: WO0akWVORPmxuO7xMjnTYg==
X-CSE-MsgGUID: glaKP02VRvSd7cVUP4qhDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659793"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 6D49395; Thu, 05 Mar 2026 15:48:55 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 07/12] usb: xhci: split core allocation and initialization
Date: Thu,  5 Mar 2026 15:48:19 +0100
Message-ID: <20260305144824.3264408-8-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: E0590213F1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34105-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Separate allocation and initialization in the xHCI core:
* xhci_mem_init() now only handles memory allocation.
* xhci_init() now only handles initialization.

This split allows xhci_init() to be reused when resuming from S4
suspend-to-disk.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 338e93f39937..0c2239b5b805 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -536,23 +536,9 @@ static void xhci_set_dev_notifications(struct xhci_hcd *xhci)
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
+static void xhci_init(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	int retval;
-
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
-
-	retval = xhci_mem_init(xhci, GFP_KERNEL);
-	if (retval)
-		return retval;
 
 	/* Set the Number of Device Slots Enabled to the maximum supported value */
 	xhci_enable_max_dev_slots(xhci);
@@ -587,9 +573,6 @@ static int xhci_init(struct usb_hcd *hcd)
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
 		compliance_mode_recovery_timer_init(xhci);
 	}
-
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -1187,11 +1170,14 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		 * first with the primary HCD, and then with the secondary HCD.
 		 * If we don't do the same, the host will never be started.
 		 */
-		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
-		retval = xhci_init(hcd);
+		xhci_dbg(xhci, "Allocate the xhci_hcd\n");
+		retval = xhci_mem_init(xhci, GFP_KERNEL);
 		if (retval)
 			return retval;
 
+		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
+		xhci_init(hcd);
+
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
 		if (!retval && xhci->shared_hcd) {
@@ -5523,12 +5509,15 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
 
-	xhci_dbg(xhci, "Calling HCD init\n");
-	/* Initialize HCD and host controller data structures. */
-	retval = xhci_init(hcd);
+	xhci_dbg(xhci, "Allocate the xhci_hcd\n");
+	/* Allocate xHCI data structures */
+	retval = xhci_mem_init(xhci, GFP_KERNEL);
 	if (retval)
 		return retval;
-	xhci_dbg(xhci, "Called HCD init\n");
+
+	xhci_dbg(xhci, "Initialize the xhci_hcd\n");
+	/* Initialize HCD and host controller data structures */
+	xhci_init(hcd);
 
 	if (xhci_hcd_is_usb3(hcd))
 		xhci_hcd_init_usb3_data(xhci, hcd);
-- 
2.50.1


