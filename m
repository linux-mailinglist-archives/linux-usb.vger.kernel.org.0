Return-Path: <linux-usb+bounces-35875-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JSLMDVvzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35875-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:29:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17D389BE1
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 299B631403E8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A2B2D8DC3;
	Thu,  2 Apr 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBvSZj78"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F4D2F1FEA
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135849; cv=none; b=QOf9drHPlhf8CFzzVYWBJRlJS9IgVJ9Mo/1B2F7iMUQRE2/e5QzavNYDu28OiKWXjSsLaDxhJFea3jzL/twddmQGfyTJ1jRd/JdzklFBk69aj5IBbfJiEu/YY9PTT96RE3lyTdekpEfn7uNVSZs6EG6nWf0WjRyeX4ya0yN2dx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135849; c=relaxed/simple;
	bh=ahO45hTmcjfkAcBd6tg+k/e8NqSea7OKH/O0+fOge4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kskan0fFhtu7MAPhKxfbJMTSfppA3tec0ghHs//8LdSYxa76ERD8b5YxQimZZqvuTt7FMOJtT90MXivbikjwkXSN75nItcC9UNtHWKE1LGxS2X/AYsm9p8YJGPLPjdeuRTcGtby48pUzeX0uozaAg8dmQ6n8XMQFY4wNPn3WD5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBvSZj78; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135848; x=1806671848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ahO45hTmcjfkAcBd6tg+k/e8NqSea7OKH/O0+fOge4c=;
  b=SBvSZj78lAKfD+jrcU7S6QSaZq8LLvjt73pZW68dXSMLYHN9oMkjN2qP
   A79M+J6nazq5mX+TFHBzk+9CKKdmW3xU2jagM0WAuuebe6ITqmN+phPa/
   Zmf9+NpkQPtXMpMTRFpv9IVVHreS969Zz+jB9u/qRAgJ4G7ERV5N14qF4
   CjFJ13VhbDeo4y0we8x3A4ELJKRCWdyV2LrNQol44LpkOQjsbD0T5yPv9
   KCnUNeaUFYVPxskX9RPy5Xd0i4TNKA+i8lilhzy+QR0aiDZa+K1+qsHGe
   YhsmOTXegzSdGrfpmz+3MF1dJABszTcq0kx6eXjRt3WVqa6c1qSDJ0+ZC
   Q==;
X-CSE-ConnectionGUID: RO6OTIwpQ16om4dDzmTxCw==
X-CSE-MsgGUID: Cigi0NJiSE+lOFkEtbZlKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650855"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650855"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:28 -0700
X-CSE-ConnectionGUID: nHOqXWeiTgy9dABz54FJcQ==
X-CSE-MsgGUID: 5c09mH/nSZuH4fmL2iNK3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241527"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:27 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/25] usb: xhci: split core allocation and initialization
Date: Thu,  2 Apr 2026 16:13:27 +0300
Message-ID: <20260402131342.2628648-11-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35875-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 3E17D389BE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Separate allocation and initialization in the xHCI core:
* xhci_mem_init() now only handles memory allocation.
* xhci_init() now only handles initialization.

This split allows xhci_init() to be reused when resuming from S4
suspend-to-disk.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
index 674bd40e4e2d..9e2e2c2ed0e0 100644
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
@@ -5533,12 +5522,13 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
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
2.43.0


