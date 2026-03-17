Return-Path: <linux-usb+bounces-34951-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PSDBblruWmvEQIAu9opvQ
	(envelope-from <linux-usb+bounces-34951-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B38122AC7D9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E6463040103
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35893E95AD;
	Tue, 17 Mar 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjlGHn+B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1971F3EB7ED
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759378; cv=none; b=Lzuu+Hng6mm3HLR6c1QLk8c6iWOFzC31+4smt9WHSX29zYgAdVdRzs4jHaGiAkY730JyQ0Ih0BDMY6H5x17DGj3SpTb0eTFPUVm/pu1xDUJW4gWTLzGd1GjhyhqtApyavcV358A1CHXtC9PEUZtE9z7Ih9kdS41DCnOYLcdCAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759378; c=relaxed/simple;
	bh=A2Sl5vAQfUZ78YqdT8/2WTFv/lpnkZGbMV6lC4NTJ2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sd8+HgVYF5QlS5iso49xtZ3KguXr+44g8TVGtcuqZ7YYV/6Fl/YtVU1uT9DiMgoroTaERzif0dUn4RSrvuRnPDW5Ey7ZevF7J75q8tGje3HkGmPUxsKEMI1v0edcVElMMFYTRxmeO/TlvoXKBKYrKNOY4gIVOgd8PwF14pCNVrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjlGHn+B; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759377; x=1805295377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A2Sl5vAQfUZ78YqdT8/2WTFv/lpnkZGbMV6lC4NTJ2w=;
  b=FjlGHn+BQrJm6s1OWlWJ3iee+ECvVXLotpHLxSB8pqGl5vb6g65P5EYa
   Oypws6HmP7F2uw5scwmojcbYx5XUbI0wtV7AfYpk6IwOYG4us+rSRmd52
   QHlaZcScGBIKT7G48HRIS/sDnlIvioKbuFs5QRmvE3hiDCwEGRABV2rOu
   ArNTKHgAK8UHnaJ7vAqNfRI9BX44NUsHgIBsTMVCnhCdTH8ZkeHf+y+sm
   TyI7JJXT9aN89osVs94wvwZa34FWhhL012/KZG2ZBvxdV3y1PHXyGGnsl
   cOWF4+k7evXte9c1OSyTKPkXt/e2ZC5qOlSkCLz6ERQrqpwLIKcPnTgXI
   Q==;
X-CSE-ConnectionGUID: Mv2ECIoIT7uCdW7+ti2MDg==
X-CSE-MsgGUID: Vy0CD4ErT2S03vjQv9rbIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491194"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:17 -0700
X-CSE-ConnectionGUID: e//Z/k6pToSK3IP5G+GuUg==
X-CSE-MsgGUID: pRXdzfJ9T1C8dyAPmcQrRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219394933"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2026 07:56:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 3B81E98; Tue, 17 Mar 2026 15:56:15 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH v2 9/9] usb: xhci: optimize resuming from S4 (suspend-to-disk)
Date: Tue, 17 Mar 2026 15:55:44 +0100
Message-ID: <20260317145544.2076387-10-niklas.neronin@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-34951-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: B38122AC7D9
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
v2:
 * Fix commit title: "suspend-to-RAM" -> "suspend-to-disk"
 * Cleanup 'cmd_timer', 'cmd_list', 'tts', 'endpoints' during S4 resume.

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
index 232e6143ac4b..13042f7bc592 100644
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
+		for (int i = xhci->max_ports; i > 0; i--)
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


