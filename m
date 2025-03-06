Return-Path: <linux-usb+bounces-21443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C426DA54E33
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECB0516914A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFED18BC26;
	Thu,  6 Mar 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y30SiK0D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96FF18C92F
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272584; cv=none; b=DwRwkJu1PgiLJ+ZF+BTulF+0c1FvM1LkTEkQzNYl6rKNOHFiaTpxz6pXrFIB1eNUCO/WQUZspCjIeo1iMALj9e+LoeS5CD2TKcMs1WvdXokqURiSPz+YESsfcPaHRQV5QM2cdk4nP/vvmT3p4N4OUDWCFY7yHI/1+Qh2FeXiH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272584; c=relaxed/simple;
	bh=lHz2IuVhfAf7hNSWAwFhNo2S0ql8i7glZ/39KTaUcQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSTx6V7Z+DNfOKOTFRUja0Pxq3rDKIzkYZVgvNQ5FvOjIL6stwX5gvO69r56IiEloiE3Xn/xUMa/2YUDoy3DDe9b0t1bIKsu1lp3bzBPvdaGgMt4TW2et/YjuI/JrCOih4KuVzNsI6Cf0LscftGPVkbRvLJXSmg7u9BleYdqDRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y30SiK0D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272582; x=1772808582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lHz2IuVhfAf7hNSWAwFhNo2S0ql8i7glZ/39KTaUcQo=;
  b=Y30SiK0DXZZ1OJfZbr9DWM+xLUEQ9jENmyEGrUA03q60Ywall3E7yJwc
   eMdo/um08QfTxav3dqIXlPWIn/6i9eogrEV8g+azOaMyA1ZvRmcVRQ3tv
   9obmqpTFaX0DMumOvSIry1+F2A2WonwbRXSbaI/bUS6U6chClhQkEfjFb
   N9jHvKLlMqCpIvDVJ+t02mMo98p4IGHo+94tJnZparKf0MoXYa7AsNlHj
   yrnS5akTMYt+KAgxyf8el6YaOPqtKVbaPMQfBJGXlxLSraSGMLL/cg7QD
   QXnPktMjtuvguBEz6hBI+7PDdUMFh0pxxc5OAN4T7nyzb6VnE4gJXtfsa
   Q==;
X-CSE-ConnectionGUID: p9E2MoR8QUiI3Hv/RmHaDw==
X-CSE-MsgGUID: 4rnW83ATSjGMQY2uyM7IRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657115"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:42 -0800
X-CSE-ConnectionGUID: vBEDqE/KSNirjcdiy4r8SQ==
X-CSE-MsgGUID: q9b0RNBXQry/43qSZ6DNwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954847"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:40 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/15] usb: xhci: refactor trb_in_td() to be static
Date: Thu,  6 Mar 2025 16:49:49 +0200
Message-ID: <20250306144954.3507700-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Relocate trb_in_td() and marks it as static, as it's exclusively utilized
in xhci-ring.c. This adjustment lays the groundwork for future rework of
the function.

The function's logic remains unchanged; only its access specifier is
altered to static and a redundant "else" is removed on line 325
(due to checkpatch.pl complaining).

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 122 +++++++++++++++++------------------
 drivers/usb/host/xhci.h      |   2 -
 2 files changed, 61 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 70b896297494..8c7258afb6bf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -277,6 +277,67 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
 	}
 }
 
+/*
+ * If the suspect DMA address is a TRB in this TD, this function returns that
+ * TRB's segment. Otherwise it returns 0.
+ */
+static struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
+				      dma_addr_t suspect_dma, bool debug)
+{
+	dma_addr_t start_dma;
+	dma_addr_t end_seg_dma;
+	dma_addr_t end_trb_dma;
+	struct xhci_segment *cur_seg;
+
+	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
+	cur_seg = td->start_seg;
+
+	do {
+		if (start_dma == 0)
+			return NULL;
+		/* We may get an event for a Link TRB in the middle of a TD */
+		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
+				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
+		/* If the end TRB isn't in this segment, this is set to 0 */
+		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
+
+		if (debug)
+			xhci_warn(xhci,
+				"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx\n",
+				(unsigned long long)suspect_dma,
+				(unsigned long long)start_dma,
+				(unsigned long long)end_trb_dma,
+				(unsigned long long)cur_seg->dma,
+				(unsigned long long)end_seg_dma);
+
+		if (end_trb_dma > 0) {
+			/* The end TRB is in this segment, so suspect should be here */
+			if (start_dma <= end_trb_dma) {
+				if (suspect_dma >= start_dma && suspect_dma <= end_trb_dma)
+					return cur_seg;
+			} else {
+				/* Case for one segment with
+				 * a TD wrapped around to the top
+				 */
+				if ((suspect_dma >= start_dma &&
+							suspect_dma <= end_seg_dma) ||
+						(suspect_dma >= cur_seg->dma &&
+						 suspect_dma <= end_trb_dma))
+					return cur_seg;
+			}
+			return NULL;
+		}
+		/* Might still be somewhere in this segment */
+		if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
+			return cur_seg;
+
+		cur_seg = cur_seg->next;
+		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
+	} while (cur_seg != td->start_seg);
+
+	return NULL;
+}
+
 /*
  * Return number of free normal TRBs from enqueue to dequeue pointer on ring.
  * Not counting an assumed link TRB at end of each TRBS_PER_SEGMENT sized segment.
@@ -2079,67 +2140,6 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	spin_lock(&xhci->lock);
 }
 
-/*
- * If the suspect DMA address is a TRB in this TD, this function returns that
- * TRB's segment. Otherwise it returns 0.
- */
-struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td, dma_addr_t suspect_dma,
-			       bool debug)
-{
-	dma_addr_t start_dma;
-	dma_addr_t end_seg_dma;
-	dma_addr_t end_trb_dma;
-	struct xhci_segment *cur_seg;
-
-	start_dma = xhci_trb_virt_to_dma(td->start_seg, td->start_trb);
-	cur_seg = td->start_seg;
-
-	do {
-		if (start_dma == 0)
-			return NULL;
-		/* We may get an event for a Link TRB in the middle of a TD */
-		end_seg_dma = xhci_trb_virt_to_dma(cur_seg,
-				&cur_seg->trbs[TRBS_PER_SEGMENT - 1]);
-		/* If the end TRB isn't in this segment, this is set to 0 */
-		end_trb_dma = xhci_trb_virt_to_dma(cur_seg, td->end_trb);
-
-		if (debug)
-			xhci_warn(xhci,
-				"Looking for event-dma %016llx trb-start %016llx trb-end %016llx seg-start %016llx seg-end %016llx\n",
-				(unsigned long long)suspect_dma,
-				(unsigned long long)start_dma,
-				(unsigned long long)end_trb_dma,
-				(unsigned long long)cur_seg->dma,
-				(unsigned long long)end_seg_dma);
-
-		if (end_trb_dma > 0) {
-			/* The end TRB is in this segment, so suspect should be here */
-			if (start_dma <= end_trb_dma) {
-				if (suspect_dma >= start_dma && suspect_dma <= end_trb_dma)
-					return cur_seg;
-			} else {
-				/* Case for one segment with
-				 * a TD wrapped around to the top
-				 */
-				if ((suspect_dma >= start_dma &&
-							suspect_dma <= end_seg_dma) ||
-						(suspect_dma >= cur_seg->dma &&
-						 suspect_dma <= end_trb_dma))
-					return cur_seg;
-			}
-			return NULL;
-		} else {
-			/* Might still be somewhere in this segment */
-			if (suspect_dma >= start_dma && suspect_dma <= end_seg_dma)
-				return cur_seg;
-		}
-		cur_seg = cur_seg->next;
-		start_dma = xhci_trb_virt_to_dma(cur_seg, &cur_seg->trbs[0]);
-	} while (cur_seg != td->start_seg);
-
-	return NULL;
-}
-
 static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
 		struct xhci_virt_ep *ep)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5b8751b86008..cd96e0a8c593 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1884,8 +1884,6 @@ int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
-struct xhci_segment *trb_in_td(struct xhci_hcd *xhci, struct xhci_td *td,
-			       dma_addr_t suspect_dma, bool debug);
 int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code);
 void xhci_ring_cmd_db(struct xhci_hcd *xhci);
 int xhci_queue_slot_control(struct xhci_hcd *xhci, struct xhci_command *cmd,
-- 
2.43.0


