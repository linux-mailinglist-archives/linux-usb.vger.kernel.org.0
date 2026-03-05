Return-Path: <linux-usb+bounces-34104-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH6vIJqZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34104-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB50213F27
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA8F317D917
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038D93A7F50;
	Thu,  5 Mar 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFhfWKSg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B333A874B
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722139; cv=none; b=EWp31FG2laNCM2my8K0YSij0Evg/BZXfLbX+YypHbUcH/pqF1hEqQD7likrsC3uI4IxkPq27yMSO8IwhlezujUrAQphc5fLiqfzFTt6W5PqLQWGVQaAQaFjcBUv1dbxIj1Mjm7XGGkKkydL5M4AReFR58kvDY78wflDcch/AzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722139; c=relaxed/simple;
	bh=WdTS+H+tlbCpDjkBXXR05BG08HPWbq3pcVVTF+zRt5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppncP2DWz05yu7zCWe0eZ+akCk3qaNuKc54+fM9MYxiJdk/E5HA5bW1D2pOxpa24dYne69QIph4HYl5DJef1bZ5fkUA8WFX2NZ703n4aSwSNOSsy2q+ZxKK8LN/QYUpnxqnE8rrf38j3bRmnqOfL/LC5kBYVPXLW2pa6iBIKNyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFhfWKSg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722138; x=1804258138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdTS+H+tlbCpDjkBXXR05BG08HPWbq3pcVVTF+zRt5Y=;
  b=GFhfWKSgeawaaB+pGKlujTHdbVpLF5md6SHYBAxEueCZ0FbH6v1mk8Z8
   W8p6dnu7UuZujY3CYikEOt52WjSoGgvppJhshm1q1aa/mmDF4a9u78s9s
   r8/+HjFeL68X/CqP4d8ioJvQXY368kLN7VLfjJcfjawXlaE5tMcgZ4pPe
   Qknx51Zw3vlT/mVPBVsYDxl6Owf/gh82JhwAiBJuxA5nADySJULulKi4G
   fdIV1lriwfNyEN8Tz9i4GXMNw2kWWqGPf7FFics5cG1Z/h98gJImuzJWZ
   xer0txtCbGr7t0ZHqcMW2TDaZcBBmhobyplfjL3LaNG0Zt064mmRaHx2Q
   Q==;
X-CSE-ConnectionGUID: woR9nK6wTDmWofCs+5Rsng==
X-CSE-MsgGUID: P4xtxnH9SIiQUXJpeOI9oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73857694"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73857694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:57 -0800
X-CSE-ConnectionGUID: pZHekqgaRHiTSb8G91L82A==
X-CSE-MsgGUID: 8pTLYgm9TuKU0PdG2Je65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249163766"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 06:48:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A58D499; Thu, 05 Mar 2026 15:48:54 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 06/12] usb: xhci: move initialization for lifetime objects
Date: Thu,  5 Mar 2026 15:48:18 +0100
Message-ID: <20260305144824.3264408-7-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: 2CB50213F27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34104-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Initialize objects that exist for the lifetime of the driver only once,
rather than repeatedly. These objects do not require re-initialization
after events such as S4 (suspend-to-disk).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  1 -
 drivers/usb/host/xhci.c     | 15 ++++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 005b7bc1bfda..fae75969e49a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2001,7 +2001,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->port_caps = NULL;
 	xhci->interrupters = NULL;
 
-	xhci->page_size = 0;
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d9519a9e9e17..338e93f39937 100644
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
@@ -5522,6 +5515,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
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


