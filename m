Return-Path: <linux-usb+bounces-37070-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOK/H6hS/GlOOAAAu9opvQ
	(envelope-from <linux-usb+bounces-37070-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:51:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD74E526A
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 10:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A52630E0DE2
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 08:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D5639280D;
	Thu,  7 May 2026 08:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWc++N2w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABD39183A
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143322; cv=none; b=N1B90cpt/SwTfwaP+35s+FVNxTkEi1X+XxAfR+5Rs8gjG5N2JsubK+uByFJl8dbmPse/Uflj3IzmjWxGJxDkLNWnuHwXF4XJIbkEBmHaFB8aJBC9YPTME6+1NZEQb5gTKXBFqs5HCKx1RxD1kc7aZLoSbSXHrAmieaJUYi846tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143322; c=relaxed/simple;
	bh=a87WHH4P2C+4eX7bp217Cdhf0qy/0O1xrAJ0BjSFw4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkWJtN85W3+vd0/JGb95LNKiuczvpAsfdZKHP437cpMI8tV62aP2DjGP9ku+fxzIuPDJ8skvX80LZgmCNyleT3wAqfzsFQs154Y2FeY5kHAEvof3Jlbc/aUyVml+S1ZLJzAwpCwn9DGe14gMEYruriyWAALEEDOVD7lRp5sfjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWc++N2w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778143316; x=1809679316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a87WHH4P2C+4eX7bp217Cdhf0qy/0O1xrAJ0BjSFw4Y=;
  b=SWc++N2wiPO5AdxRag6nCBIuQ2dAO/7P5jTSEgu0qcmXD8QWUV7hdL3X
   Pmdq8dgDX82bDRmTdqGpofJqdx5FpWu8UNyoDNmTmnu/VOB2On0ZmcCHA
   ooTwFhceq4uMme71bWo/RJz7PwVVtj3f7YiWlWAqABzS7gG88dcM5fvkd
   EnvtRfkhHBPPa9uGNFGlMYy4ybbjngsMgwEMfS/MQeqnCRiXLQg7iNTlf
   hoDTcjRllP8aH+qe7wje+pnY4sdV8+KM5SLuMx3bpFw69Qbzska4yT641
   /cuPv/HasuBKVgvOLEMe/e3VETMBh1nh+U2OvZLcn/gR5RfZrXXZh1HLW
   g==;
X-CSE-ConnectionGUID: f45uNJgrQ5G36CApD43ouA==
X-CSE-MsgGUID: Hnkvvn/QRlya+ExSUWtL1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79104739"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79104739"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:41:54 -0700
X-CSE-ConnectionGUID: clzjbMa/SbeupgI0D3w+qA==
X-CSE-MsgGUID: 8YzcACVuReeXAZ+HWH4L8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233313602"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 01:41:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 4BC3398; Thu, 07 May 2026 10:41:52 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/3] usb: xhci: allocate internal DCBAA mirror dynamically
Date: Thu,  7 May 2026 10:39:45 +0200
Message-ID: <20260507083945.959370-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
References: <20260507083945.959370-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DFFD74E526A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37070-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Allocate the internal virtual device array dynamically based on the
maximum number of slots reported by the host controller. Previously,
the array was always allocated to the absolute maximum of 255 entries.

Repurpose the 'MAX_HC_SLOTS' macro to limit the number of enabled slots.
This mirrors how the maximum number of ports and interrupters are handled.

The allocation now uses kcalloc_node(), which zeroes the memory
automatically, making the explicit memset() call unnecessary.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 14 ++++++++++++--
 drivers/usb/host/xhci.c     |  4 +---
 drivers/usb/host/xhci.h     |  9 ++++++---
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ac915dacd886..1effc9f08678 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1953,8 +1953,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
 	xhci_cleanup_command_queue(xhci);
 
-	for (i = xhci->max_slots; i > 0; i--)
-		xhci_free_virt_devices_depth_first(xhci, i);
+	if (xhci->devs) {
+		for (i = xhci->max_slots; i > 0; i--)
+			xhci_free_virt_devices_depth_first(xhci, i);
+		kfree(xhci->devs);
+	}
 
 	dma_pool_destroy(xhci->segment_pool);
 	xhci->segment_pool = NULL;
@@ -2011,6 +2014,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->rh_bw = NULL;
 	xhci->port_caps = NULL;
 	xhci->interrupters = NULL;
+	xhci->devs = NULL;
 
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
@@ -2417,6 +2421,12 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating internal virtual device array");
+	xhci->devs = kcalloc_node(xhci->max_slots + 1, sizeof(*xhci->devs), flags,
+				  dev_to_node(dev));
+	if (!xhci->devs)
+		goto fail;
+
 	xhci->dcbaa.ctx_array =
 		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
 				   &dcbaa->dma, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9a471bd72265..151a759806f8 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5460,7 +5460,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
-	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
+	xhci->max_slots = min(HCS_MAX_SLOTS(hcs_params1), MAX_HC_SLOTS);
 	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
 	if (!xhci->max_interrupters)
@@ -5533,8 +5533,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	init_completion(&xhci->cmd_ring_stop_completion);
 	xhci_hcd_page_size(xhci);
 
-	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
-
 	/* Allocate xHCI data structures */
 	retval = xhci_mem_init(xhci, GFP_KERNEL);
 	if (retval)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index b467b875eeba..f977c8e6a90a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -33,8 +33,11 @@
 /* xHCI PCI Configuration Registers */
 #define XHCI_SBRN_OFFSET	(0x60)
 
-/* Max number of USB devices for any host controller - limit in section 6.1 */
-#define MAX_HC_SLOTS		256
+/*
+ * Max number of Devices Slots. xHCI specification section 5.3.3
+ * Valid values are in the range of 1 to 255.
+ */
+#define MAX_HC_SLOTS		255
 /*
  * Max Number of Ports. xHCI specification section 5.3.3
  * Valid values are in the range of 1 to 255.
@@ -1552,7 +1555,7 @@ struct xhci_hcd {
 	/* these are not thread safe so use mutex */
 	struct mutex mutex;
 	/* Internal mirror of the HW's dcbaa */
-	struct xhci_virt_device	*devs[MAX_HC_SLOTS];
+	struct xhci_virt_device	**devs;
 	/* For keeping track of bandwidth domains per roothub. */
 	struct xhci_root_port_bw_info	*rh_bw;
 
-- 
2.50.1


