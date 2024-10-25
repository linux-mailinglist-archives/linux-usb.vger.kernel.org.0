Return-Path: <linux-usb+bounces-16713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF59B0157
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 13:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BFD5B24212
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 11:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2E41FBF66;
	Fri, 25 Oct 2024 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk56Qulf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6662003DC
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855684; cv=none; b=oZtUEh14IRIcwUc3dQBEHVaDHc5SuJh4BMuGdrvIHAMGYh6Y8s7Y0A5HJ91NsVVkAqXTTNc9akQwE3krX4skuKGZnMF1IGSaO3w5Es+PCm7RetymlQnmjn7dcBi9OUMeY+3Lit+d1EvPvr/jsGZ/kHq50AB7W/l67mlLCeS/1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855684; c=relaxed/simple;
	bh=r4EEMBMHZuNDL9Gs8ckr2W0jEOA8g5BohUX00x84UYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etnZbTPnYbNsy3mUorU/AL2vaARpp0veZq9TA/+gZznfH4wVtqEDYhZuXYOaSwiUaWkKZTZiyrkDjL+1tnkQOz1+/Sryk+EDu+s5lSFeJAdjBVD+V8DjyvNu4tMgbImjM7CMmFmSCwFVjlZXX666qH6DaGWW/T+qbSmcdkDo/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk56Qulf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729855682; x=1761391682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4EEMBMHZuNDL9Gs8ckr2W0jEOA8g5BohUX00x84UYs=;
  b=hk56QulfE04AeOAjOxAd6sdT1bjnbV7x7Tv/KujuiIL0JDweLFoDo5PE
   8xPxq7ZrptDu6G5F8YqP7STkmPso7vL0QY5yQmJG2/CJlbCSvMt9+QWqZ
   w01YRK/A4HUwqUwPz2VNneRqo1V07JoJ/8/opkMl3XyGco2GzTPCt4bEc
   aY2hVlI5rzdpG5y/qcaSP3fOLaJIHheoQ54AQVcp7WKRnD9RVMCdf61nd
   8a6SfdtCyp68Or+5x85FNWgLHVnoPTdwIOjhCufowWKLJGug5bcF7d2NU
   EVCRlWf+fwwUptz1sDPO5XKN1uUrXnGIVxzuajrcXU27lWWHf7ktLddV2
   Q==;
X-CSE-ConnectionGUID: en5HwbPmR/WXTXyrbdiBVg==
X-CSE-MsgGUID: NtPkALZVR3SfDXBWBfcRHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40896762"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40896762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:28:02 -0700
X-CSE-ConnectionGUID: /NKfd8miT6CRHlWCnG+GBw==
X-CSE-MsgGUID: KgmarfUuRbGor+dsjPRyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="111699182"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 04:28:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id D4C5735E; Fri, 25 Oct 2024 14:27:59 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/2] usb: xhci: improve xhci_set_interrupter_moderation()
Date: Fri, 25 Oct 2024 14:27:01 +0300
Message-ID: <20241025112701.303035-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025112701.303035-1-niklas.neronin@linux.intel.com>
References: <20241025112701.303035-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function sets the interrupt moderation interval through the IMODI
16-bit register, where the interval is represented in increments of 250
nanoseconds. For example, an IMODI register value of 16 is multiplied by
250 to get 4000 nanoseconds, resulting in an interrupt every ~1ms.

Currently, the function has the potential to fail, but this failure is not
handled, and the xhci driver proceeds as usual. Fix the issue by removing
the possibility of failure. Instead, the IMODI is set to the closest valid
value.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c |  5 +----
 drivers/usb/host/xhci.c     | 25 +++++++++++++------------
 drivers/usb/host/xhci.h     |  4 ++--
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8a6b91862cae..7355ca85e1b3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2365,10 +2365,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 		return NULL;
 	}
 
-	err = xhci_set_interrupter_moderation(ir, imod_interval);
-	if (err)
-		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
-			  i, imod_interval);
+	xhci_set_interrupter_moderation(xhci, ir, imod_interval);
 
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 899c0effb5d3..9bf5d2e09c60 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -346,21 +346,22 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-/* interrupt moderation interval imod_interval in nanoseconds */
-int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
-				    u32 imod_interval)
+/* Interrupt moderation interval in 250 nanoseconds increments, 0 means no interrupt throttling. */
+void xhci_set_interrupter_moderation(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
+				     u32 imod_interval)
 {
-	u32 imod;
+	u32 irq_control;
 
-	if (!ir || !ir->ir_set || imod_interval > U16_MAX * 250)
-		return -EINVAL;
+	imod_interval /= 250;
+	imod_interval = min(imod_interval, U16_MAX);
 
-	imod = readl(&ir->ir_set->irq_control);
-	imod &= ~ER_IRQ_INTERVAL_MASK;
-	imod |= (imod_interval / 250) & ER_IRQ_INTERVAL_MASK;
-	writel(imod, &ir->ir_set->irq_control);
+	irq_control = readl(&ir->ir_set->irq_control);
+	irq_control &= ~ER_IRQ_INTERVAL_MASK;
+	irq_control |= imod_interval & ER_IRQ_INTERVAL_MASK;
+	writel(irq_control, &ir->ir_set->irq_control);
 
-	return 0;
+	xhci_dbg(xhci, "Interrupt moderation interval set to %uns for interrupt %u\n",
+		 imod_interval * 250, ir->intr_num);
 }
 
 static void compliance_mode_recovery(struct timer_list *t)
@@ -567,7 +568,7 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"ERST deq = 64'h%0lx", (long unsigned int) temp_64);
 
-	xhci_set_interrupter_moderation(ir, xhci->imod_interval);
+	xhci_set_interrupter_moderation(xhci, ir, xhci->imod_interval);
 
 	if (xhci->quirks & XHCI_NEC_HOST) {
 		struct xhci_command *command;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f998df70f80f..8a47cb059582 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1871,8 +1871,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct usb_device *hdev,
 		struct usb_tt *tt, gfp_t mem_flags);
-int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
-				    u32 imod_interval);
+void xhci_set_interrupter_moderation(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
+				     u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-- 
2.45.2


