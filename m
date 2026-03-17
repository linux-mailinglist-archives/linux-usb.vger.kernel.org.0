Return-Path: <linux-usb+bounces-34945-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHR6IKdruWmvEQIAu9opvQ
	(envelope-from <linux-usb+bounces-34945-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1ED2AC7AF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51893303BF9B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBA23EAC6F;
	Tue, 17 Mar 2026 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlM0t0Ka"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBB3E95AC
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759374; cv=none; b=cTtRwClClV/MthGnoY4bOR+zozmyNHienENKofRxdbRTVo1HoB0r22mwaifjntHkFm8CZBQUoxrECrsTx46v3iUoIbceUFwuo1OnVtLSdKXavwgp/v7tdH1s8+tgxt4Q+U6zYNfb1oyM0vL0ppyRUqUafvgM+9b9zYeOBNn7vf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759374; c=relaxed/simple;
	bh=Dh3wABj3gjX8NYt5D+POJpFaeIDa2Cb1GdzOO0Gq4Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwiWJeB+eNxK3oLgFk2HTyfODVHrivic3Q+v2ax4sHda8TlBn5Dor9yHC9VKuxj6BhrzlN97VoPNH/p662CLll+Vgun0RshV7MXvkC+6SodOzgpcS82w1bMTXIRsoj5Zd6sh30sty6t9v8MfygH6ECbcl8lEXMhpCZq4SBA/qq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlM0t0Ka; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759373; x=1805295373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dh3wABj3gjX8NYt5D+POJpFaeIDa2Cb1GdzOO0Gq4Gg=;
  b=MlM0t0KalmI4yzbeZIPfJzZaGwTI9lMUn03OGOZbBjhfw1G3wum9j7Hs
   vGB/Zu/K6kPAJsjQXlMUm6fl1Ymcy+PgZq7TOrLYMwa2Oejgcac860bgm
   HJY7Ajsy3ucMJwpOF+Rb67Aq2EIQmLprSlcHnqQXniKBDaeoBN4zr7z5J
   hgUfaMXNyfwjn9NGS/iafyB6pVQkh3GaKzBQeFkqgWf7Yx+nhDDF6genF
   H8qiA1ogJj/PelaUfMDUtWXMK6L0Qx+eJegBlD2OACXC8CM655xrFh35d
   qWMyfVBX/dhA9vKi2VgqyubUhNPKOsu6lex8uBWMpbFj9vJzVUaktr7F6
   A==;
X-CSE-ConnectionGUID: J/BBCWoHR+CrpL4uVRklqw==
X-CSE-MsgGUID: F/9sN81sSQWgfZAO+GT0JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491173"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491173"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:12 -0700
X-CSE-ConnectionGUID: 37W0qUe+QQ6LuK5Hbu8sMg==
X-CSE-MsgGUID: JBQyEPy8Q+2cQF7zPaSldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219394905"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 07:56:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id C059898; Tue, 17 Mar 2026 15:56:09 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH v2 3/9] usb: xhci: factor out roothub bandwidth cleanup
Date: Tue, 17 Mar 2026 15:55:38 +0100
Message-ID: <20260317145544.2076387-4-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34945-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 4A1ED2AC7AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
---
v2:
 * New patch. The function introduced is used in patch 9.

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
+	if (xhci->rh_bw)
+		xhci_rh_bw_cleanup(xhci);
 
-	for (i = 0; i < xhci->max_ports; i++) {
-		struct xhci_tt_bw_info *tt, *n;
-		list_for_each_entry_safe(tt, n, &xhci->rh_bw[i].tts, tt_list) {
-			list_del(&tt->tt_list);
-			kfree(tt);
-		}
-	}
-
-no_bw:
 	xhci->cmd_ring_reserved_trbs = 0;
 	xhci->usb2_rhub.num_ports = 0;
 	xhci->usb3_rhub.num_ports = 0;
-- 
2.50.1


