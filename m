Return-Path: <linux-usb+bounces-35871-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIqwOatuzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35871-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037E389B36
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5585B3131B7A
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F202DC321;
	Thu,  2 Apr 2026 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKB/dmeh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5662DCC04
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135842; cv=none; b=IeuMlL2hVya3u8agJNzBCd/MojiBMGKydOORoyn4/ARyR/19rHXxZ69rk8hesz33aK/YpFR8iY7eL/wDmYMPM2Vbfhs0gHVXELDDsiEm4WExgcwZ+D6/oWeoXnMoV2b3fOHytXxYZAAynsbHQNL+zlVXtOpXbCFbr71KTRyQ1J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135842; c=relaxed/simple;
	bh=wSwOp69QVhR2s+SW2dfNI2QyndRmdm0C2xUiSVjemVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRC44hHL5okTphivFtiPAPmKszDgFoAB0tNPnWPCvZQ3I5jvi4+Y2UvxLtP7Ljp2tJdZGwGnuM5C+qe/GyWd2NZUYT+4gVWtfDI5Ggfso35PhR3Ww6zc/LSI3aCwaB7ZlgOMTGSkxOqREapGDMNdOQ8OzUpz61QQhdqNhzhs+YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKB/dmeh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135841; x=1806671841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wSwOp69QVhR2s+SW2dfNI2QyndRmdm0C2xUiSVjemVk=;
  b=SKB/dmeh8woEFTfbc3AyaWY7ePuYzYmBgWJADTeLfzeagQEmthRBY/Uf
   ro36wAHrkfLTSovEUF+uN3gMuK3jNDRPCWmEOiVWjD8M79NF3IijucOMp
   xAptpq5YpZtVDUHmwQNk0SyuzWQokmrFZqkSnuXrf9uNv959ujK+0l8g9
   5E9ooGPfeEv09EuFnEkOitQeefEV18a4vqZAeUcuub/D3DwEjVM6uDYdw
   lazHsdCXtoPbqKDsqDCov7YtvLea9MS2V/gcdjz3hQB/ZRjMPPtMPrU5P
   IIJAutKkG3L1FNpxWEse5/Mg3/Y7sIru/yFxxIr+6E5Ld/Jaz2GR4U/f6
   w==;
X-CSE-ConnectionGUID: FYvRTOyvSjiQfbPxfI5bOQ==
X-CSE-MsgGUID: lWZCDISuT/CchbFaqhpk7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650827"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:21 -0700
X-CSE-ConnectionGUID: YHmhU4EBRFiPjONq3UUT7w==
X-CSE-MsgGUID: SjD22WQQQMWnkBo/ApgH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241505"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:20 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/25] usb: xhci: factor out roothub bandwidth cleanup
Date: Thu,  2 Apr 2026 16:13:23 +0300
Message-ID: <20260402131342.2628648-7-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35871-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 6037E389B36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Introduce xhci_rh_bw_cleanup() to release all bandwidth tracking
structures associated with xHCI roothub ports.

The new helper clears:
 * TT bandwidth entries
 * Per-interval endpoint lists

This refactors and consolidates the existing per-port cleanup logic
previously embedded in xhci_mem_cleanup(), reducing duplication and
making the teardown sequence easier to follow.

The helper will also be reused for upcoming S4 resume handling.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 50 +++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 75bc1eb98b76..d4a9dbed8f16 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1895,10 +1895,36 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 }
 EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
 
+/* Cleanup roothub bandwidth data */
+static void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
+{
+	struct xhci_root_port_bw_info *rh_bw;
+	struct xhci_tt_bw_info *tt_info, *tt_next;
+	struct list_head *eps, *ep, *ep_next;
+
+	for (int i = 0; i < xhci->max_ports; i++) {
+		rh_bw = &xhci->rh_bw[i];
+
+		/* Clear and free all TT bandwidth entries */
+		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
+			list_del(&tt_info->tt_list);
+			kfree(tt_info);
+		}
+
+		/* Clear per-interval endpoint lists */
+		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
+			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
+
+			list_for_each_safe(ep, ep_next, eps)
+				list_del_init(ep);
+		}
+	}
+}
+
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
-	int i, j;
+	int i;
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
@@ -1917,15 +1943,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
 	xhci_cleanup_command_queue(xhci);
 
-	for (i = 0; i < xhci->max_ports && xhci->rh_bw; i++) {
-		struct xhci_interval_bw_table *bwt = &xhci->rh_bw[i].bw_table;
-		for (j = 0; j < XHCI_MAX_INTERVAL; j++) {
-			struct list_head *ep = &bwt->interval_bw[j].endpoints;
-			while (!list_empty(ep))
-				list_del_init(ep->next);
-		}
-	}
-
 	for (i = xhci->max_slots; i > 0; i--)
 		xhci_free_virt_devices_depth_first(xhci, i);
 
@@ -1959,18 +1976,9 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	scratchpad_free(xhci);
 
-	if (!xhci->rh_bw)
-		goto no_bw;
-
-	for (i = 0; i < xhci->max_ports; i++) {
-		struct xhci_tt_bw_info *tt, *n;
-		list_for_each_entry_safe(tt, n, &xhci->rh_bw[i].tts, tt_list) {
-			list_del(&tt->tt_list);
-			kfree(tt);
-		}
-	}
+	if (xhci->rh_bw)
+		xhci_rh_bw_cleanup(xhci);
 
-no_bw:
 	xhci->cmd_ring_reserved_trbs = 0;
 	xhci->usb2_rhub.num_ports = 0;
 	xhci->usb3_rhub.num_ports = 0;
-- 
2.43.0


