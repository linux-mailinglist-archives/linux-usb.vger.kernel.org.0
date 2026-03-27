Return-Path: <linux-usb+bounces-35559-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MNHMk98xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35559-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:47:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28746344859
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B03B83125344
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CCA242D62;
	Fri, 27 Mar 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wp/5WYbM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301561474CC
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615285; cv=none; b=JDxB1t3W7oIgCBeU4LB6g7KMSvEIBVp8cNx2l6I3dTGIZfuibl3VpLCOjF0+UM4qkU3Ocq8cx8nJ8qof12p9K/JA+cePvXgHvYxbM99hXRlb22ovwKd14jH4TAYz8M4Z0/AWyfipoIIXELzoK3ogvO65XSRC6SaanaKZeo4wVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615285; c=relaxed/simple;
	bh=PfkWvlvTBNewUFNXUnUThQHtg6q5nTSgdZEN3foLFmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGSZ2cSCF/8tM47n3fKGZO1kaRwdSsUgg8yoB8uiKLhKmrJJ58FWANJgoiNoj5CAUHnuaxYwsDAKtofTHJp5tVKQhR2yZ6xcfs+2I21Y2eNt95sA9fY+NmsjtRiQbYo91naxv++EOtyretDaTlg3VCZVAB88KZCm6Q5707ChZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wp/5WYbM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615283; x=1806151283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PfkWvlvTBNewUFNXUnUThQHtg6q5nTSgdZEN3foLFmg=;
  b=Wp/5WYbMggG8lOX3vqrF9Myd5faykK1jl6Msp+uB5LrfnCx3nARv27D1
   l8GOa4HsiDTiufXHkZ41J+51aL4TJHrIjSSzi2nUT+jZkl8aF9z3d4CDn
   sqNOCmrJ/3/XHnuCgE88dgvS/sWTS8crh55w9l3CLcQQ7JJp/MRty42YP
   Ioe2flev+XmdBazrOeoeNeCMnUNuGuGsl9Zqi+izP/W0tRe+W6OMU2J4A
   K00RtUAuHkE94L7AUA6PWe+2enSQUmqH2w4LG7fGV/+9hI7S+kYi7SRlc
   yEvc56gveE9MsCa2QcIRV7iLKhB1JbSEXj0u8w6sfQiNVEt6pmvKe7AmA
   A==;
X-CSE-ConnectionGUID: D0QTi8KBQUee+2D4+zMKjA==
X-CSE-MsgGUID: mTQU3XYHRamqvfRcPUZjTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87160633"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87160633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:21 -0700
X-CSE-ConnectionGUID: Labnuc/MTEabb7YsgQ+d/A==
X-CSE-MsgGUID: ERRio84mTIWdiqG6TsBZyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248347709"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 05:41:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id CD4549D; Fri, 27 Mar 2026 13:41:18 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 9/9] usb: xhci: optimize resuming from S4 (suspend-to-disk)
Date: Fri, 27 Mar 2026 13:34:40 +0100
Message-ID: <20260327123441.806564-10-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,uniontech.com,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35559-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 28746344859
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On resume from S4 (power loss after suspend/hibernation), the xHCI
driver previously freed, reallocated, and fully reinitialized all
data structures. Most of this is unnecessary because the data is
restored from a saved image; only the xHCI registers lose their values.

This patch optimizes S4 resume by performing only a host controller
reset, which includes:
* Freeing or clearing runtime-created data.
* Rewriting xHCI registers.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  4 +--
 drivers/usb/host/xhci.c     | 53 ++++++++++++++++++++++---------------
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f1b4f06d4b8b..4156822eb000 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -936,7 +936,7 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
  * that tt_info, then free the child first. Recursive.
  * We can't rely on udev at this point to find child-parent relationships.
  */
-static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
+void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id)
 {
 	struct xhci_virt_device *vdev;
 	struct list_head *tt_list_head;
@@ -1905,7 +1905,7 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
 
 /* Cleanup roothub bandwidth data */
-static void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
+void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
 {
 	struct xhci_root_port_bw_info *rh_bw;
 	struct xhci_tt_bw_info *tt_info, *tt_next;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 232e6143ac4b..8fb2b91fc0cc 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1082,9 +1082,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 {
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
+	struct xhci_segment	*seg;
 	int			retval = 0;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
+	bool			reset_registers = false;
 
 	if (!hcd->state)
 		return 0;
@@ -1103,10 +1105,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 
 	spin_lock_irq(&xhci->lock);
 
-	if (xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
-		power_lost = true;
-
-	if (!power_lost) {
+	if (power_lost || xhci->broken_suspend || xhci->quirks & XHCI_RESET_ON_RESUME) {
+		xhci_dbg(xhci, "HC state lost, performing host controller reset\n");
+		reset_registers = true;
+	} else {
+		xhci_dbg(xhci, "HC state intact, continuing without reset\n");
 		/*
 		 * Some controllers might lose power during suspend, so wait
 		 * for controller not ready bit to clear, just as in xHC init.
@@ -1144,11 +1147,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		temp = readl(&xhci->op_regs->status);
 		if ((temp & (STS_SRE | STS_HCE)) && !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
-			power_lost = true;
+			reset_registers = true;
 		}
 	}
 
-	if (power_lost) {
+	if (reset_registers) {
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
 			timer_delete_sync(&xhci->comp_mode_recovery_timer);
@@ -1172,27 +1175,33 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		if (retval)
 			return retval;
 
-		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
-		temp = readl(&xhci->op_regs->status);
-		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
+		cancel_delayed_work_sync(&xhci->cmd_timer);
+
+		/* Delete all remaining commands */
+		xhci_cleanup_command_queue(xhci);
+
+		/* Clear data which is re-initilized during runtime */
+		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
+			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
+
+		for (int i = xhci->max_slots; i > 0; i--)
+			xhci_free_virt_devices_depth_first(xhci, i);
+
+		xhci_rh_bw_cleanup(xhci);
+
+		xhci->cmd_ring_reserved_trbs = 0;
+		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
+			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
 
-		xhci_dbg(xhci, "cleaning up memory\n");
-		xhci_mem_cleanup(xhci);
 		xhci_debugfs_exit(xhci);
-		xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
-			    readl(&xhci->op_regs->status));
-
-		/* USB core calls the PCI reinit and start functions twice:
-		 * first with the primary HCD, and then with the secondary HCD.
-		 * If we don't do the same, the host will never be started.
-		 */
-		retval = xhci_mem_init(xhci, GFP_KERNEL);
-		if (retval)
-			return retval;
 
 		xhci_init(hcd);
 
+		/*
+		 * USB core calls the PCI reinit and start functions twice:
+		 * first with the primary HCD, and then with the secondary HCD.
+		 * If we don't do the same, the host will never be started.
+		 */
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
 		if (!retval && xhci->shared_hcd) {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ade0198bf9ea..a76e183515b3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1792,6 +1792,7 @@ void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 void xhci_mem_cleanup(struct xhci_hcd *xhci);
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags);
 void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev, int slot_id);
+void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id);
 int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id, struct usb_device *udev, gfp_t flags);
 int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *udev);
 void xhci_copy_ep0_dequeue_into_input_ctx(struct xhci_hcd *xhci,
@@ -1803,6 +1804,7 @@ void xhci_update_tt_active_eps(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		int old_active_eps);
 void xhci_clear_endpoint_bw_info(struct xhci_bw_info *bw_info);
+void xhci_rh_bw_cleanup(struct xhci_hcd *xhci);
 void xhci_update_bw_info(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *in_ctx,
 		struct xhci_input_control_ctx *ctrl_ctx,
-- 
2.50.1


