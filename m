Return-Path: <linux-usb+bounces-35874-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF5THZ9szmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35874-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:18:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A34389890
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6FDE3023538
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BBF2F1FC3;
	Thu,  2 Apr 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCgPCqy6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A012E54D1
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135847; cv=none; b=XePQ2r/OF3wpqisQWlVoNY4QCUQKrjnRZdH3fT4hdmf9/23CLph7zyX0mFRZqZGscL/RSDJ2dgPBrh5z9OyLa8ZfUuWzerjk6sDXOz6ibvi1di79EZFh4WxUcepdty1trEkf+6fVlYvrNnCKCnJjZGOOjiD81cxjnvQx3/u8eQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135847; c=relaxed/simple;
	bh=9AIkRverQbXHEELgOwdl9BEzrWlX5XL6+YPtu0mAOiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYx1RdZrJowOt8n2i8oKjNJ+xYeW7CrLUKYh4hdhejNsaykJdhu84OS1q7fAerSUlS+Wf3HlhpfNUVye5jeJQYqHeYmgiICpPof0Epq9IZoRba40OH+aBdqI71R8gDgfjfXjPGg03ZjHv8xmMm4HdTOVYcKdDrDKJ+amE29NO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCgPCqy6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135847; x=1806671847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9AIkRverQbXHEELgOwdl9BEzrWlX5XL6+YPtu0mAOiA=;
  b=VCgPCqy6fQQVsLvXpcLU/1YuQ+7P7mhiN0JCHrvvug6ls3pXkeVfYl66
   r513iWjnkBcg8yMPs27va99j0u3bq2UY+LcT2GlXuPhV36MuSjWqBUKfK
   W10Nw6rsfpB8EIHKktvZeqTuFK8qcuFIknRKWasoDttk8cBkwff4ui0sz
   S10MnYE6eCpUqqI98j5s39ffFVq2fGYuwGXztV+Ly8rhnoJG2G9aaulhE
   tX9T1N18lQiGiLzeCLGeay+KH1xoW7bxzFLXJ91cKWXlzq5CuSrL45KB7
   o7NkZEJQEEkFqhB3h1jNy9AKYTJS+BhvS2QNafwIE9yAlClfj1hRxexDX
   Q==;
X-CSE-ConnectionGUID: mB8JlC7URxW2L1NWyPURpg==
X-CSE-MsgGUID: T7cBgFmvQHCI28KGQsM/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650847"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:26 -0700
X-CSE-ConnectionGUID: gM7odaeFTPiphAmbPCvNBA==
X-CSE-MsgGUID: ENzp5rwRSZeZx2fhOjhf1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241519"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:25 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/25] usb: xhci: move initialization for lifetime objects
Date: Thu,  2 Apr 2026 16:13:26 +0300
Message-ID: <20260402131342.2628648-10-mathias.nyman@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-35874-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: B3A34389890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Initialize objects that exist for the lifetime of the driver only once,
rather than repeatedly. These objects do not require re-initialization
after events such as S4 (suspend-to-disk).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
index dd495dc740c3..674bd40e4e2d 100644
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
@@ -5532,6 +5525,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
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
2.43.0


