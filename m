Return-Path: <linux-usb+bounces-34109-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK5wIpKZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34109-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF7213F07
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F8D83198790
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEC93A9DBA;
	Thu,  5 Mar 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR747159"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F1C3A9D82
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722142; cv=none; b=biIgARsrvdLKxMv3W1/F2yrtdkRlMkY2X/XxLjtkuWEOjNL4+GRYgM1aSTn7LT06+Zhmi8lLGndQKvvvDol+pWIai4/J+qQuPq9BQKJdK3auSeFalAF5vrGQof06zz2hIyyeuc/OVgcpalyeVrHB7+aFkY0iMA0rlkNWUZ7qa2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722142; c=relaxed/simple;
	bh=K3D243gLi+NO0QeD1P0Cd5ord/pmpDGS6LY+sV1cjWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvuVGlrnjAC4l4JFMhc25SBWgm1CL2wtwI5Gk6XYlCUMj+N0l+wRDDI2yf1bv0EW4J/SEwfW2Hid7mc/BGEn6hM568DNsmLsnvslmyWmB2sTg2dPgww5tEKBEpwPOrya83dljXqcsFA0RELX5PDHcBnowlqEdzR4O7N+dc66rn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR747159; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722140; x=1804258140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K3D243gLi+NO0QeD1P0Cd5ord/pmpDGS6LY+sV1cjWQ=;
  b=gR747159NhYxpx38I2sqAV0LLUPMfc1LF9T5et0HH/MAHb5TRKXVSOoM
   ZaPmJpbMlYmljuNSA11V0qTuUN8NyUwVh4K0c+jcS0CcRXs0LXVvozydW
   11tdaW4IpZxFWlwo3S4qxL1VTUgpn14pdWHI7Is4kh37rO/MxZgV1FtRZ
   +kG0TOEcxWspRqZDDXaGhKTvlGKqOTPylde1CdhFCmsDx7WFj4/7vNLVI
   iD+BDfuL1DGEmlWvpdCq8q0PKaEBQxz2Z1bQuPvNhzPPKz5hLgSIueAGy
   XSgkf/x0XDUlPtVlhJrLVZb30fPFZ63qjY4bHlNySWocLdeNxWhQhLJbg
   A==;
X-CSE-ConnectionGUID: u4iFVleBRkmHjpvyEx4UMw==
X-CSE-MsgGUID: ZSMDGITvRJWeTuzptoXIRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73857699"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73857699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:59 -0800
X-CSE-ConnectionGUID: unkjuluGQnCA7Jx0EgSxDg==
X-CSE-MsgGUID: 489VWK3AQE+UhbTiFr5/zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249163767"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 06:48:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id BF5AC98; Thu, 05 Mar 2026 15:48:56 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 09/12] usb: xhci: optimize resuming from S4 (suspend-to-RAM)
Date: Thu,  5 Mar 2026 15:48:21 +0100
Message-ID: <20260305144824.3264408-10-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: 0FFF7213F07
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
	TAGGED_FROM(0.00)[bounces-34109-lists,linux-usb=lfdr.de];
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
 drivers/usb/host/xhci-mem.c |  2 +-
 drivers/usb/host/xhci.c     | 46 +++++++++++++++++++------------------
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fae75969e49a..46d977f9e5c5 100644
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
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b22f10cfbe7b..e03f717d2314 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1075,9 +1075,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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
@@ -1096,10 +1098,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 
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
@@ -1137,11 +1140,11 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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
@@ -1165,28 +1168,27 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		if (retval)
 			return retval;
 
-		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
-		writel(STS_EINT, &xhci->op_regs->status);
-		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
+		/* Clear data which is re-initilized during runtime */
+		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
+			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
+
+		for (int i = xhci->max_ports; i > 0; i--)
+			xhci_free_virt_devices_depth_first(xhci, i);
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
+		xhci_dbg(xhci, "Re-initializing xHCI registers\n");
+		xhci_init(hcd);
+
+		/*
+		 * USB core calls the PCI reinit and start functions twice:
 		 * first with the primary HCD, and then with the secondary HCD.
 		 * If we don't do the same, the host will never be started.
 		 */
-		xhci_dbg(xhci, "Allocate the xhci_hcd\n");
-		retval = xhci_mem_init(xhci, GFP_KERNEL);
-		if (retval)
-			return retval;
-
-		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
-		xhci_init(hcd);
-
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd);
 		if (!retval && xhci->shared_hcd) {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ade0198bf9ea..e6a51f1318c2 100644
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
-- 
2.50.1


