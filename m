Return-Path: <linux-usb+bounces-35877-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFIyGLtszmmpngYAu9opvQ
	(envelope-from <linux-usb+bounces-35877-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:18:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DB23898A7
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D72703047D75
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5FA2F693B;
	Thu,  2 Apr 2026 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtFgzAsa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE352F2607
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135853; cv=none; b=atyzmqt1hdsPMlgWYS5N8NUyctdeiGk1qD7dgQoHGGqSDxZ1TlDAXBJeLapdltuu51iR+z2h4t/GYljcCcmbklumhLbnOB+NF/WNRayrHAoqY8Pl4mgdeDceR0PnM/mKZHlfd+154DPwRCU5JLHFtiXjSMVM+7tKUMbz5GJ5Q4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135853; c=relaxed/simple;
	bh=nEN9ax4Tn+PYTtAu5zKmEdjXYr+gFh1xgc4uSgnhHsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbM3qym/PwqTDPw4CujFZ2mgScPxfEW3bjQDtp/rVprOdULVCGTb+zmiLXQ3Qb5JDnolZhdVCq9lxqPVANkC+cs7dTnt1a1krvCivjTfVfDrMG1yJ7vp4GSnESbQwcmpu6Z2I2qo3RAh8/akzbV/0st9DSk4Ti1Tn6cDvRwr9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtFgzAsa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135852; x=1806671852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nEN9ax4Tn+PYTtAu5zKmEdjXYr+gFh1xgc4uSgnhHsk=;
  b=BtFgzAsawzK8kiRtOvsjtyX2YefQgjJFKoDqbKvoxYrLyuu2TiiwOuG9
   q3fs7BbsMG23dCvrx12tGo+ZgTLVDkXpt5HQNwDnGi5NymDysqYVj6E2b
   oPkcujV3p8A4q1MNgNNb7hEBvokqTAoF3l7aA/MkUvJ2ENdOioosTqWeN
   U6e6SEhpltJhSUgyrXPcuDuguGi2dsMja9Y+cMD+zbmPI6XtiZT9jcrun
   vPecRSMHoAeTkjEQQDjYdCfocUWQg6VJ3Gzt9XBFhFp++JP6DJItmnGEh
   IfxjizdIRNBCkVpnXEtB0Za2U/ZrmrNqOqtE35PvU/pSGEWu4JbUpaaZ1
   A==;
X-CSE-ConnectionGUID: 2bveO4pfSM2NIPnu282mYA==
X-CSE-MsgGUID: YNj/fMEeSsSSnRXVAZEd5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650860"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:32 -0700
X-CSE-ConnectionGUID: P8MDUAPQRw6ulBrrPOtLQQ==
X-CSE-MsgGUID: 9qewOa6ESVC839Yinnlw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241537"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:30 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/25] usb: xhci: optimize resuming from S4 (suspend-to-disk)
Date: Thu,  2 Apr 2026 16:13:29 +0300
Message-ID: <20260402131342.2628648-13-mathias.nyman@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35877-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 79DB23898A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Neronin <niklas.neronin@linux.intel.com>

On resume from S4 (power loss after suspend/hibernation), the xHCI
driver previously freed, reallocated, and fully reinitialized all
data structures. Most of this is unnecessary because the data is
restored from a saved image; only the xHCI registers lose their values.

This patch optimizes S4 resume by performing only a host controller
reset, which includes:
* Freeing or clearing runtime-created data.
* Rewriting xHCI registers.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  4 +--
 drivers/usb/host/xhci.c     | 51 ++++++++++++++++++++++---------------
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 34 insertions(+), 23 deletions(-)

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
index 2c573aad4464..ece3ff7916ff 100644
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
 
-		/* USB core calls the PCI reinit and start functions twice:
+		xhci_init(hcd);
+
+		/*
+		 * USB core calls the PCI reinit and start functions twice:
 		 * first with the primary HCD, and then with the secondary HCD.
 		 * If we don't do the same, the host will never be started.
 		 */
-		retval = xhci_mem_init(xhci, GFP_KERNEL);
-		if (retval)
-			return retval;
-
-		xhci_init(hcd);
-
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
 		if (!retval && xhci->shared_hcd) {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 06f6da4d982f..aeecd301f207 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1793,6 +1793,7 @@ void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 void xhci_mem_cleanup(struct xhci_hcd *xhci);
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags);
 void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev, int slot_id);
+void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_id);
 int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id, struct usb_device *udev, gfp_t flags);
 int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *udev);
 void xhci_copy_ep0_dequeue_into_input_ctx(struct xhci_hcd *xhci,
@@ -1804,6 +1805,7 @@ void xhci_update_tt_active_eps(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		int old_active_eps);
 void xhci_clear_endpoint_bw_info(struct xhci_bw_info *bw_info);
+void xhci_rh_bw_cleanup(struct xhci_hcd *xhci);
 void xhci_update_bw_info(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *in_ctx,
 		struct xhci_input_control_ctx *ctrl_ctx,
-- 
2.43.0


