Return-Path: <linux-usb+bounces-35555-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHQXKR57xmmjKwUAu9opvQ
	(envelope-from <linux-usb+bounces-35555-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A928D344781
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4F1C3006234
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3420C377EB0;
	Fri, 27 Mar 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIiexpHn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FCE33A718
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615280; cv=none; b=kTBt2jKVnWbf6g6DXqNohwzFbI/wBrK77KTWJD7NPur11ReozwHi+E1doRgB7fFrqdfZSR6Mk/mcXEOYxK7VlcekCnXAk/xSwvIrPkLs1t+IVIyEH+m5hbRh5CJkrACnp0SEIT9rmaf27KLVRPc1mKQKYzxpp6Hr+smKGyHIeEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615280; c=relaxed/simple;
	bh=ASswkset0ZmL+yyqr4I3jG4dIZjR3uP2RM5zvDebfFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6ZtGatQh0bO5KXlSEq8xz0IFld+TeLsWdAIAM1NCOpBHmlsGEnFB98nTC7hbw6ZM1+1bqZ3WFy+gyeKXmVzb/2MI3rvHqVQw9seQsuB1/+01LjFWG52K8dzMO10qCix1+YFvC8dj/26emiLFVe06N2C4e/fMhmneySVqWhwim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIiexpHn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615280; x=1806151280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ASswkset0ZmL+yyqr4I3jG4dIZjR3uP2RM5zvDebfFk=;
  b=IIiexpHnLlWHUrodctUclkeFvH+C7qjI0pxQxBzS57j83Uv0PfCco6th
   rZeF+vYQylz2WT/EQ3DezICSRCTWxziAM8q80uMTs84gf1S15j018wUe4
   OMClOuA2MxvKD5zQveW6fQURY9GZRJyS7+Ej6FOPVjAz23MvFdcvaUHYJ
   zneLY3Mtns43y38ef11pd7U+rjULQeT8QL5QqWZ2FAm7r8TxvqHobDoq7
   fcnhwmhZ3WLVpjiKgo3LXQZogXOUFxUeeACt++3l93j62V4K6Px8PIpRw
   VN8MdSIu5qOhbuDgsFwqjp5WXAQSLfJJbX30eR5O9LXc2dmPwyREIx0PK
   Q==;
X-CSE-ConnectionGUID: ioiZavEmTGCmigoAxVAKOw==
X-CSE-MsgGUID: cTkmTjJlTVGpqK21RjZrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87160627"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87160627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:20 -0700
X-CSE-ConnectionGUID: PzQhMC4cSjaQr153mZwhXQ==
X-CSE-MsgGUID: 1JmI7gY3T3iUf2iX/MEGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248347698"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 05:41:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 28FCA98; Fri, 27 Mar 2026 13:41:17 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 6/9] usb: xhci: move initialization for lifetime objects
Date: Fri, 27 Mar 2026 13:34:37 +0100
Message-ID: <20260327123441.806564-7-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35555-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: A928D344781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Initialize objects that exist for the lifetime of the driver only once,
rather than repeatedly. These objects do not require re-initialization
after events such as S4 (suspend-to-disk).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  1 -
 drivers/usb/host/xhci.c     | 15 ++++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ca4463eebc49..2cd6111c9707 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2009,7 +2009,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->port_caps = NULL;
 	xhci->interrupters = NULL;
 
-	xhci->page_size = 0;
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 170615dd1e93..4e811a2668e6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -549,13 +549,6 @@ static int xhci_init(struct usb_hcd *hcd)
 	int retval;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
-	spin_lock_init(&xhci->lock);
-
-	INIT_LIST_HEAD(&xhci->cmd_list);
-	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
-	init_completion(&xhci->cmd_ring_stop_completion);
-	xhci_hcd_page_size(xhci);
-	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
 
 	retval = xhci_mem_init(xhci, GFP_KERNEL);
 	if (retval)
@@ -5525,6 +5518,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	}
 
+	spin_lock_init(&xhci->lock);
+	INIT_LIST_HEAD(&xhci->cmd_list);
+	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
+	init_completion(&xhci->cmd_ring_stop_completion);
+	xhci_hcd_page_size(xhci);
+
+	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
+
 	xhci_dbg(xhci, "Calling HCD init\n");
 	/* Initialize HCD and host controller data structures. */
 	retval = xhci_init(hcd);
-- 
2.50.1


