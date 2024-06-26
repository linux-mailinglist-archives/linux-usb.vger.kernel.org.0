Return-Path: <linux-usb+bounces-11684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD35918154
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 188982880EF
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA3183098;
	Wed, 26 Jun 2024 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d84aTcj7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B81822F7
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406021; cv=none; b=s4TE9uTdhSx0c+FFVnluFzN1ygOBbZrmTSzn1lFggKYU+/AelLlvOKitp8ztW9OCrz4jGayLvSINz/mBA5rAGxH4BPxN3BW0f5h1dgJpgQcEEhwxSr1B28mqozQLs4thKl6hojPlOy3niagwjtVk3qNqTA3D31rtJ+Yc1pAJHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406021; c=relaxed/simple;
	bh=fZwTs67BnEpBaW6b3/gDKaY8dkiRQzJyHp+ZIyB5gf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KCHxihUIlvalJu6xt78Ggu4tKoxHUxvzCcpxh1cKv0+uWfhdP2n4M8KU7tBVYU7W/ZRikeAq0qF8dz9PhSIUpvJm4HLrTECpmg0LUgQgSx0rP/ipY7JRoGD1Ny9GyKnL8hpveAt5dhpH1A/LmVKs2/uffqmQLjJUH1ZxlOemPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d84aTcj7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406020; x=1750942020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fZwTs67BnEpBaW6b3/gDKaY8dkiRQzJyHp+ZIyB5gf0=;
  b=d84aTcj7CITfnIRQfiUO1rGlpZ68oTlfvDpyHurZGpIMU+FvCA+giFL6
   cM9nrdUtnyJq+T4W0dA/odRLyCVMx0AJbubQAq5xl2NY5x9BH+guXbPJc
   ykq2S9kC7MMT+KzfzqEoH34+i9wLnQ8sVtXYSEi1ywL++GJDFPwZIAgWE
   CR88kQcHvNguSFKrNCV0ot4rzgoRqET0/XhL+qgruMEWeIWZt0cbhvqld
   0ZOeXiqfWwsG+KSnrZgqGleIhDKeApcCgu/LOJtcQPVdSPgx/R42Uw3zD
   fOjOiseI5pFrYoBPtlOf1lNDulhETctlwlqf8Y5E/gfot2ulp13qgRzxs
   Q==;
X-CSE-ConnectionGUID: bG1Gbuw/TPGf24KP1BA2sg==
X-CSE-MsgGUID: JDDmBbXITXqLOBhp3OXVMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353398"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:46:59 -0700
X-CSE-ConnectionGUID: 4cvR+9XjSt2t/4kwJwg52w==
X-CSE-MsgGUID: t7w5xN1uSTiPWGfU6PrA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442655"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:46:58 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/21] usb: xhci: move untargeted transfer event handling to a separate function
Date: Wed, 26 Jun 2024 15:48:25 +0300
Message-Id: <20240626124835.1023046-12-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Move handling transfer events without a target transfer TRB into
handle_transferless_tx_event(), this type of event does not utilize the
rest of handle_tx_event() and as a result it's better to separate it
into a dedicated function.

Additionally, this change reduces handle_tx_event()'s size and makes it
more readable.

[Mathias: Simplify code to return helper function value directly. This
removes the second xhci_err() message for untargeted and unexpected
event completion types]

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 56 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8502776d84d6..7f40be2a3885 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2562,6 +2562,33 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	return finish_td(xhci, ep, ep_ring, td, trb_comp_code);
 }
 
+/* Transfer events which don't point to a transfer TRB, see xhci 4.17.4 */
+static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+					u32 trb_comp_code)
+{
+	switch (trb_comp_code) {
+	case COMP_STALL_ERROR:
+	case COMP_USB_TRANSACTION_ERROR:
+	case COMP_INVALID_STREAM_TYPE_ERROR:
+	case COMP_INVALID_STREAM_ID_ERROR:
+		xhci_dbg(xhci, "Stream transaction error ep %u no id\n", ep->ep_index);
+		if (ep->err_count++ > MAX_SOFT_RETRY)
+			xhci_handle_halted_endpoint(xhci, ep, NULL, EP_HARD_RESET);
+		else
+			xhci_handle_halted_endpoint(xhci, ep, NULL, EP_SOFT_RESET);
+		break;
+	case COMP_RING_UNDERRUN:
+	case COMP_RING_OVERRUN:
+	case COMP_STOPPED_LENGTH_INVALID:
+		break;
+	default:
+		xhci_err(xhci, "ERROR Transfer event for unknown stream ring slot %u ep %u\n",
+			 ep->vdev->slot_id, ep->ep_index);
+		return -ENODEV;
+	}
+	return 0;
+}
+
 /*
  * If this function returns an error condition, it means it got a Transfer
  * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
@@ -2605,33 +2632,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		goto err_out;
 	}
 
-	/* Some transfer events don't always point to a trb, see xhci 4.17.4 */
-	if (!ep_ring) {
-		switch (trb_comp_code) {
-		case COMP_STALL_ERROR:
-		case COMP_USB_TRANSACTION_ERROR:
-		case COMP_INVALID_STREAM_TYPE_ERROR:
-		case COMP_INVALID_STREAM_ID_ERROR:
-			xhci_dbg(xhci, "Stream transaction error ep %u no id\n",
-				 ep_index);
-			if (ep->err_count++ > MAX_SOFT_RETRY)
-				xhci_handle_halted_endpoint(xhci, ep, NULL,
-							    EP_HARD_RESET);
-			else
-				xhci_handle_halted_endpoint(xhci, ep, NULL,
-							    EP_SOFT_RESET);
-			break;
-		case COMP_RING_UNDERRUN:
-		case COMP_RING_OVERRUN:
-		case COMP_STOPPED_LENGTH_INVALID:
-			break;
-		default:
-			xhci_err(xhci, "ERROR Transfer event for unknown stream ring slot %u ep %u\n",
-				 slot_id, ep_index);
-			goto err_out;
-		}
-		return 0;
-	}
+	if (!ep_ring)
+		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
 
 	/* Count current td numbers if ep->skip is set */
 	if (ep->skip)
-- 
2.25.1


