Return-Path: <linux-usb+bounces-30702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EC7C6F548
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3AFD93883FA
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA2A368283;
	Wed, 19 Nov 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWw9dvMn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2336826C
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562280; cv=none; b=ni7xJcNqM5b5AMamXscnJzIPiRqsC7HGyfxfvip/vJDfUiq4Ws6bKjzhVnnopNGpDLzsKRA7O1SSeraY2vQ1Z75/R/G+81rFI+tOQssDNPSPIh/SVBW7w4GnGS/1zt/e4ef8C2H2bpqVBy8q9WYt4QrOxs7R18fp5+UANARm4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562280; c=relaxed/simple;
	bh=5GdZLIbIAyzzeYoWQBskBDjccyJg5sqPYoXNSeBlT3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4Jp+Ml1Xa6KIZAO8WwEI7X7XuvM+GCJ7k3a3pNKT3EOLStPXWgctAkU1VMQXQ0v8WpSokYLwyMcjsQ3eQCvbU6LpJaNOVOV6tnvgj6YSv7yrXDZKza2Di732IPuBarrr+U3HLIjmUMMSkLXQIfRtvWDK1E9HU5MB00hDSGlcyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWw9dvMn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562279; x=1795098279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5GdZLIbIAyzzeYoWQBskBDjccyJg5sqPYoXNSeBlT3M=;
  b=OWw9dvMnk293z2Lue2HogMxf9AEBbPSJUUzg3ePV2Mpmhy6DnI8UHS5V
   aLJ2f2VTKpS9BZVpnR8RQ+rKlA4wcsGIs5HZkHKQXIKMGeU1oAE5XHJUK
   adxzawIRfOgVPKMZXLZKyuynXL3J2XSmjbEktfvjDDkuGw44mZsmtTacM
   W/AQtIybvhznjQlBtzpzaZ/9+IAvhcQDGQeRWUHmFspxDPQ1j3TtYg1MO
   HR+NVYmN5YbSo3y+VVK9sx0L3DSeFm4NycJUogTK4W1wwcxScnCY8f1vo
   hwDIPd8fiyvIXoNCBRIIkwjNT+4m/0/Q9ghGDfmOR13SsAhhz6h+MP2EJ
   g==;
X-CSE-ConnectionGUID: +43h+JUrQbu0+hFEYOCiYQ==
X-CSE-MsgGUID: Ti62OicoRUurXOxc7R3l8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645496"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:39 -0800
X-CSE-ConnectionGUID: KRaHA/pKQL+96suNbN5Ctg==
X-CSE-MsgGUID: qi5U0t45Qv+0rSAdTJ3hkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221991976"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:37 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/23] xhci: Add helper to find trb from its dma address
Date: Wed, 19 Nov 2025 16:23:56 +0200
Message-ID: <20251119142417.2820519-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a xhci_dma_to_trb() helper, and use it to find the transfer TRB
early in handle_tx_event() based on the dma address found in the
event TRB.

With this helper we can avoid using 'ep_seg' transfer TRB segment
variable as both a a boolean to indicate if the transfer TRB is part
of the next queued TD, and to actually find the transfer TRB based
on ep_seg and ep_trb_dma.

This is a first step in reworking and cleaning up trb_in_td() and
handle_tx_event()

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8e209aa33ea7..7fccca7e1c62 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -82,6 +82,23 @@ dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg,
 	return seg->dma + (segment_offset * sizeof(*trb));
 }
 
+static union xhci_trb *xhci_dma_to_trb(struct xhci_segment *start_seg,
+				       dma_addr_t dma,
+				       struct xhci_segment **match_seg)
+{
+	struct xhci_segment *seg;
+
+	xhci_for_each_ring_seg(start_seg, seg) {
+		if (in_range(dma, seg->dma, TRB_SEGMENT_SIZE)) {
+			if (match_seg)
+				*match_seg = seg;
+			return &seg->trbs[(dma - seg->dma) / sizeof(union xhci_trb)];
+		}
+	}
+
+	return NULL;
+}
+
 static bool trb_is_noop(union xhci_trb *trb)
 {
 	return TRB_TYPE_NOOP_LE32(trb->generic.field[3]);
@@ -2658,7 +2675,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	int ep_index;
 	struct xhci_td *td = NULL;
 	dma_addr_t ep_trb_dma;
-	struct xhci_segment *ep_seg;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
@@ -2689,6 +2705,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (!ep_ring)
 		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
 
+	/* find the transfer trb this events points to */
+	ep_trb = xhci_dma_to_trb(ep_ring->deq_seg, ep_trb_dma, NULL);
+
 	/* Look for common error cases */
 	switch (trb_comp_code) {
 	/* Skip codes that require special handling depending on
@@ -2862,10 +2881,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
 				      td_list);
 
-		/* Is this a TRB in the currently executing TD? */
-		ep_seg = trb_in_td(td, ep_trb_dma);
-
-		if (!ep_seg) {
+		/* Is this TRB not part of the currently executing TD? */
+		if (!trb_in_td(td, ep_trb_dma)) {
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				/* this event is unlikely to match any TD, don't skip them all */
@@ -2948,7 +2965,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (ring_xrun_event)
 		return 0;
 
-	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
 
 	/*
-- 
2.43.0


