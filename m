Return-Path: <linux-usb+bounces-11687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A6918157
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516E91F23F76
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7856C1862B4;
	Wed, 26 Jun 2024 12:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OD6wCfb9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CDC1836C8
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406026; cv=none; b=h+iz0QpJ9FT4T1Dvqfx5KG+uCH6X/yl4DYwNbQ332JgWO752ORmi4otYClnN35IhsrMPTI3Rg/eMsks+TDoat0Z55w3Hk0rfnBMdTpnrUVmAWel1gtMvQWn8SJwIyEmHgxH/Z4JfO236Nqpxv3U6gn2i6j8YRXH8vQXQ/f2YUZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406026; c=relaxed/simple;
	bh=IACzM/uBS3sHDxS1V7z5DJRW3az1am/eJpqCCLcoJJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tI/jYPewXjV8hKHz+4PCyK/K76t91LD0m4FNnVX2vhSh8jPB6Zy3FubYqqUQQpGil8ORZrAZ8foh2l8Z6s7AsJ+qeehm3hoG4DXgMoXXJwxAsT2MJQqlOoHr1Ht6tOYf+wPTE5xIv+QEcbO/xkovwKoTqKuzxAphI/x3TBRXG1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OD6wCfb9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406025; x=1750942025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IACzM/uBS3sHDxS1V7z5DJRW3az1am/eJpqCCLcoJJo=;
  b=OD6wCfb9QIh4LiZcijPDjsrNIls7QZ6KGKl2ndowBff2P1JdZE2OGPVK
   nGhzGDm9zs7zHXxfL8orzZLDuntVnM0kEfhzpqMiKSgVLrNcSasBXvkBS
   bUBdehBrLaqgE/vGfRLvvr31rlf/6WJpSHgwaFAf9VQsREPk/0MhhokPw
   B+hOO/3nr1ih/896nmdLQQFI1rGmrcBFYM1D9Xki4qETySyKecj6icX+0
   pmr5e5O89Moj2x3ySZ147XMU2SjRA7YO9jMmcCwdkDqeHraxZNeiyoI20
   LBm+x2DsNL3LBTaYL5VLdmUWL1rtbw/Mupzc4+dyIvyMrxKKjjYGQA1ba
   Q==;
X-CSE-ConnectionGUID: oil8qJfjRnenpblqrnzPHg==
X-CSE-MsgGUID: /0JstX8hT+6LaTzwASnzKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353408"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:04 -0700
X-CSE-ConnectionGUID: MuvrZKyjQ2GacOcaQNjBfQ==
X-CSE-MsgGUID: gYK/FWH6RqqNdCcCWfgCMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442689"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/21] xhci: rework xhci internal endpoint halt state detection.
Date: Wed, 26 Jun 2024 15:48:28 +0300
Message-Id: <20240626124835.1023046-15-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
References: <20240626124835.1023046-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When xhci_requires_manual_halt_cleanup() was written it wasn't clear
that the xhci internal endpoint halt state always needs to be cleared
with a reset endpoint command. Functional stall cases additionally halt
the device side endpoint which requires class driver to clear the device
side halt with a CLEAR_FEATURE(ENDPOINT_HALT) request as well.

Clean up, rename, and make sure the new function always return true
when internal endpoint state is halted, including stall cases.

Based on related cleanup suggestion code by Niklas Neronin

cc: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 56 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 900bf34174f9..3479c9cb5d33 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2130,28 +2130,34 @@ static void xhci_clear_hub_tt_buffer(struct xhci_hcd *xhci, struct xhci_td *td,
 	}
 }
 
-/* Check if an error has halted the endpoint ring.  The class driver will
- * cleanup the halt for a non-default control endpoint if we indicate a stall.
- * However, a babble and other errors also halt the endpoint ring, and the class
- * driver won't clear the halt in that case, so we need to issue a Set Transfer
- * Ring Dequeue Pointer command manually.
+/*
+ * Check if xhci internal endpoint state has gone to a "halt" state due to an
+ * error or stall, including default control pipe protocol stall.
+ * The internal halt needs to be cleared with a reset endpoint command.
+ *
+ * External device side is also halted in functional stall cases. Class driver
+ * will clear the device halt with a CLEAR_FEATURE(ENDPOINT_HALT) request later.
  */
-static int xhci_requires_manual_halt_cleanup(struct xhci_ep_ctx *ep_ctx, unsigned int trb_comp_code)
+static bool xhci_halted_host_endpoint(struct xhci_ep_ctx *ep_ctx, unsigned int comp_code)
 {
-	/* TRB completion codes that may require a manual halt cleanup */
-	if (trb_comp_code == COMP_USB_TRANSACTION_ERROR ||
-			trb_comp_code == COMP_BABBLE_DETECTED_ERROR ||
-			trb_comp_code == COMP_SPLIT_TRANSACTION_ERROR)
-		/* The 0.95 spec says a babbling control endpoint
-		 * is not halted. The 0.96 spec says it is.  Some HW
-		 * claims to be 0.95 compliant, but it halts the control
-		 * endpoint anyway.  Check if a babble halted the
-		 * endpoint.
+	/* Stall halts both internal and device side endpoint */
+	if (comp_code == COMP_STALL_ERROR)
+		return true;
+
+	/* TRB completion codes that may require internal halt cleanup */
+	if (comp_code == COMP_USB_TRANSACTION_ERROR ||
+	    comp_code == COMP_BABBLE_DETECTED_ERROR ||
+	    comp_code == COMP_SPLIT_TRANSACTION_ERROR)
+		/*
+		 * The 0.95 spec says a babbling control endpoint is not halted.
+		 * The 0.96 spec says it is. Some HW claims to be 0.95
+		 * compliant, but it halts the control endpoint anyway.
+		 * Check endpoint context if endpoint is halted.
 		 */
 		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_HALTED)
-			return 1;
+			return true;
 
-	return 0;
+	return false;
 }
 
 int xhci_is_vendor_info_code(struct xhci_hcd *xhci, unsigned int trb_comp_code)
@@ -2321,7 +2327,7 @@ static int process_ctrl_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_STOPPED_LENGTH_INVALID:
 		goto finish_td;
 	default:
-		if (!xhci_requires_manual_halt_cleanup(ep_ctx, trb_comp_code))
+		if (!xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
 			break;
 		xhci_dbg(xhci, "TRB error %u, halted endpoint index = %u\n",
 			 trb_comp_code, ep->ep_index);
@@ -2791,11 +2797,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
 					 slot_id, ep_index);
 			}
-			if (trb_comp_code == COMP_STALL_ERROR ||
-			    xhci_requires_manual_halt_cleanup(ep_ctx, trb_comp_code)) {
-				xhci_handle_halted_endpoint(xhci, ep, NULL,
-							    EP_HARD_RESET);
-			}
+			if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+				xhci_handle_halted_endpoint(xhci, ep, NULL, EP_HARD_RESET);
+
 			return 0;
 		}
 
@@ -2911,10 +2915,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 
 		if (trb_is_noop(ep_trb)) {
-			if (trb_comp_code == COMP_STALL_ERROR ||
-			    xhci_requires_manual_halt_cleanup(ep_ctx, trb_comp_code))
-				xhci_handle_halted_endpoint(xhci, ep, td,
-							    EP_HARD_RESET);
+			if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+				xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 		} else {
 			td->status = status;
 
-- 
2.25.1


