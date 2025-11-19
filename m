Return-Path: <linux-usb+bounces-30710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E535C6F56F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0CB8335AA54
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C2036997A;
	Wed, 19 Nov 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISAz1Mu6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE136922A
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562291; cv=none; b=VIgKOWFqutNoWtkp1fSgLOSVEirlMiAQfOToGTl8f3knnPMO2LAmeOd7AVPdQY9epSug19Is36syTPtdBaLTxvmzbdZUN8ksMUGQculfLzoHgArnRVZZxy4OAwduetLmg4f82V1KDfWr0oxqge5laM3ryTiLAXDNJRizulN8Lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562291; c=relaxed/simple;
	bh=Al8AZPThi3ZBHU/J150jaGNt8xZuyn67gfedbZ9mZv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2nYgWdNulbuWddiCsZNbDrJGvV8kLzVX6zh+RUEpYsqB4WbEDTgkZBdTkkWZTy45ezXWdm1f1lkZdPLIUlDuL77QK+dgHjgOBVMEEvAkW+TfRPEdym4Ll+ICJsnyctFX0QBK8B/5ByiU7+2SKaAO/wE/0U2Mo+auBnPQ0nuK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISAz1Mu6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562290; x=1795098290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Al8AZPThi3ZBHU/J150jaGNt8xZuyn67gfedbZ9mZv4=;
  b=ISAz1Mu6bHeQokRCFBCnwlZW/qH/hesCVbthxm5Fo9VsEvLeDxyIeOas
   qwrhN/2pIB0F7RAeaSz0nhPu5Iq68+rpSyobdsMF4hwwScAQAvLc/Z2FC
   I1f4N/eS5InhHMuyCud1dG8oqp8vi4+34Ugnj5dl+cAcK30Fv+Gd1KROQ
   L7Vjwge6+ZlBNld6kD4ZDn+NccCEsnKl02oTsf5i2pLUGJPTGTPQEwI61
   IiJlTl9l5MqIbjS3vl6ZM9ijmZfS/XjXaz+FzM/cI0LJGCmKFM5S1eq8h
   UfGQ610TW2bvTi5Up8B9ghBj6aGROIeNkdR22AsRd+CTJoVTWP23SaGFr
   Q==;
X-CSE-ConnectionGUID: G3xhsxdKQ8Ww3GfxFE1dpw==
X-CSE-MsgGUID: c7f2GSDOR0SBvlmdJJPWxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645532"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645532"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:50 -0800
X-CSE-ConnectionGUID: 8So0ajmyT/mqqf7yHMnDEA==
X-CSE-MsgGUID: TGtxBtjtREG7sgBxb1regA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992045"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:48 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/23] usb: xhci: Assume that endpoints halt as specified
Date: Wed, 19 Nov 2025 16:24:03 +0200
Message-ID: <20251119142417.2820519-10-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

xHCI 4.8.3 recommends that software should simply assume endpoints to
halt after certain events, without looking at the Endpoint Context for
confirmation, because HCs may be slow to update that.

While no cases of such "slowness" appear to be known, different problem
exists on AMD Promontory chipsets: they may halt and generate a transfer
event, but fail to ever update the Endpoint Context at all, at least not
until some command is queued and fails with Context State Error. This is
easily triggered by disconnecting D- of a full speed serial device.

Possibly similar bug in non-AMD hardware has been reported to linux-usb.

In such case, failed TD is given back without erasing from the ring and
endpoint isn't reset. If some URB is unlinked later, Stop Endpoint fails
and its handler resets the endpoint. On next submission it will restart
on the stale TD. Outcome is UAF on success, or another halt on error and
then Dequeue doesn't move and URBs are stuck. Unlinking and resubmitting
the URBs causes unlimited ring expansion if the situation repeats.

This can be solved by ignoring Endpoint Context State and trusting that
endpoints halt when required, except one known case in ancient hardware.
The check for "Already resolving halted ep" becomes redundant, because
for these completion codes we now jump to xhci_handle_halted_endpoint()
which deals with pending EP_HALTED internally.

Link: https://lore.kernel.org/linux-usb/20250311234139.0e73e138@foxbook/
Link: https://lore.kernel.org/linux-usb/20250918055527.4157212-1-zhangjinpeng@kylinos.cn/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 73 ++++++++++++------------------------
 1 file changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 88022d221c70..95005f9a3504 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2180,24 +2180,31 @@ static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
  * External device side is also halted in functional stall cases. Class driver
  * will clear the device halt with a CLEAR_FEATURE(ENDPOINT_HALT) request later.
  */
-static bool xhci_halted_host_endpoint(struct xhci_ep_ctx *ep_ctx, unsigned int comp_code)
+static bool xhci_halted_host_endpoint(struct xhci_hcd *xhci, struct xhci_ep_ctx *ep_ctx,
+				      unsigned int comp_code)
 {
-	/* Stall halts both internal and device side endpoint */
-	if (comp_code == COMP_STALL_ERROR)
-		return true;
+	int ep_type = CTX_TO_EP_TYPE(le32_to_cpu(ep_ctx->ep_info2));
 
-	/* TRB completion codes that may require internal halt cleanup */
-	if (comp_code == COMP_USB_TRANSACTION_ERROR ||
-	    comp_code == COMP_BABBLE_DETECTED_ERROR ||
-	    comp_code == COMP_SPLIT_TRANSACTION_ERROR)
+	switch (comp_code) {
+	case COMP_STALL_ERROR:
+		/* on xHCI this always halts, including protocol stall */
+		return true;
+	case COMP_BABBLE_DETECTED_ERROR:
 		/*
 		 * The 0.95 spec says a babbling control endpoint is not halted.
 		 * The 0.96 spec says it is. Some HW claims to be 0.95
 		 * compliant, but it halts the control endpoint anyway.
 		 * Check endpoint context if endpoint is halted.
 		 */
-		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_HALTED)
-			return true;
+		if (xhci->hci_version <= 0x95 && ep_type == CTRL_EP)
+			return GET_EP_CTX_STATE(ep_ctx) == EP_STATE_HALTED;
+
+		fallthrough;
+	case COMP_USB_TRANSACTION_ERROR:
+	case COMP_SPLIT_TRANSACTION_ERROR:
+		/* these errors halt all non-isochronous endpoints */
+		return ep_type != ISOC_IN_EP && ep_type != ISOC_OUT_EP;
+	}
 
 	return false;
 }
@@ -2234,41 +2241,9 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		 * the ring dequeue pointer or take this TD off any lists yet.
 		 */
 		return;
-	case COMP_USB_TRANSACTION_ERROR:
-	case COMP_BABBLE_DETECTED_ERROR:
-	case COMP_SPLIT_TRANSACTION_ERROR:
-		/*
-		 * If endpoint context state is not halted we might be
-		 * racing with a reset endpoint command issued by a unsuccessful
-		 * stop endpoint completion (context error). In that case the
-		 * td should be on the cancelled list, and EP_HALTED flag set.
-		 *
-		 * Or then it's not halted due to the 0.95 spec stating that a
-		 * babbling control endpoint should not halt. The 0.96 spec
-		 * again says it should.  Some HW claims to be 0.95 compliant,
-		 * but it halts the control endpoint anyway.
-		 */
-		if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_HALTED) {
-			/*
-			 * If EP_HALTED is set and TD is on the cancelled list
-			 * the TD and dequeue pointer will be handled by reset
-			 * ep command completion
-			 */
-			if ((ep->ep_state & EP_HALTED) &&
-			    !list_empty(&td->cancelled_td_list)) {
-				xhci_dbg(xhci, "Already resolving halted ep for 0x%llx\n",
-					 (unsigned long long)xhci_trb_virt_to_dma(
-						 td->start_seg, td->start_trb));
-				return;
-			}
-			/* endpoint not halted, don't reset it */
-			break;
-		}
-		/* Almost same procedure as for STALL_ERROR below */
-		xhci_clear_hub_tt_buffer(xhci, td, ep);
-		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
-		return;
-	case COMP_STALL_ERROR:
+	}
+
+	if (xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code)) {
 		/*
 		 * xhci internal endpoint state will go to a "halt" state for
 		 * any stall, including default control pipe protocol stall.
@@ -2279,14 +2254,12 @@ static void finish_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		 * stall later. Hub TT buffer should only be cleared for FS/LS
 		 * devices behind HS hubs for functional stalls.
 		 */
-		if (ep->ep_index != 0)
+		if (!(ep->ep_index == 0 && trb_comp_code == COMP_STALL_ERROR))
 			xhci_clear_hub_tt_buffer(xhci, td, ep);
 
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 		return; /* xhci_handle_halted_endpoint marked td cancelled */
-	default:
-		break;
 	}
 
 	xhci_dequeue_td(xhci, td, ep_ring, td->status);
@@ -2363,7 +2336,7 @@ static void process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_STOPPED_LENGTH_INVALID:
 		goto finish_td;
 	default:
-		if (!xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+		if (!xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code))
 			break;
 		xhci_dbg(xhci, "TRB error %u, halted endpoint index = %u\n",
 			 trb_comp_code, ep->ep_index);
@@ -2973,7 +2946,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	return 0;
 
 check_endpoint_halted:
-	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+	if (xhci_halted_host_endpoint(xhci, ep_ctx, trb_comp_code))
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 	return 0;
-- 
2.43.0


