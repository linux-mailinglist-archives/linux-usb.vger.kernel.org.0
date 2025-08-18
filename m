Return-Path: <linux-usb+bounces-26980-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A7B2A290
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 14:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53B7A4E2E8A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075D731A068;
	Mon, 18 Aug 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jw1TYmI/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097A21ABAA
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521907; cv=none; b=TJRgElXLgEMawgeyokYu97JzzkYLbjA7fTaHqFnl5U17ddti+eUQ8mXwDD5gLS7f+/5rGf6BEO1RkU1zN69DiF7uNvz+WW78Yt0S8FD+/4vxpM4aE/+VQCWBu3aEptkG2Jg+i4X9Yy7VCMCJfN3BiOikl+slfdwUHqx+JD8S+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521907; c=relaxed/simple;
	bh=Lx3S5K+yxbpahaVhz319DfTV6rP8p1Tm+dZ5QAURHTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9rHwlftj4yTFdVcXTf3YAu2YYzvrLH0rnEwMUDTRdXp0Qbf76P4fE2aPNjpd/105y69aGlkDv4aglYT7QUagq+8k6DztXA/LTCxhQC0P7G4TM1I9XGc7HZUPGXmiipbojVS3Aj8B/uM7COkXmXopZ4Ve1L4iGIInl/zGhkfUjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jw1TYmI/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755521906; x=1787057906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lx3S5K+yxbpahaVhz319DfTV6rP8p1Tm+dZ5QAURHTA=;
  b=Jw1TYmI/2qGRsZl2yAZbYRhjLv+XVgWP7YJKwxodptpgPZufi4BSzpUu
   wbiTMxPdSQXkRvpSCWK+jc/97McFCp9dcrSjnyBJlrsaoJxPm7RfXJxvr
   /eV31OlT8iiNH/9GeNKnfdiMBgXcmzx0PIfX0dy4ruRf3fhzF53xCfs3Y
   pHpb4xH/GamOscnUAdfxOmGfcxcuIN1MVfdnt2tvTqdoMxlcgPzwqb/dy
   WbeaeFuJAH7B3dGT1wKGHTFQvF62q8qKgdclrJLNgzX2sI4eHk2ebMu9t
   EEZ9I977bOD4Gy5rRuT37Q8Y38YNoUCy3AqTn812r747s+IDQDJ6dScRg
   g==;
X-CSE-ConnectionGUID: M7EiRqHDT6CFiLOztwSlxw==
X-CSE-MsgGUID: BAl5LmhgR8uE6TXeYhi2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68452775"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68452775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:58:24 -0700
X-CSE-ConnectionGUID: RZKfBmIPSiqA+Rm6Bkr+nQ==
X-CSE-MsgGUID: LhqcQ2vuS9CBkRnbg82YhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167071040"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 05:58:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id DAA3B96; Mon, 18 Aug 2025 14:58:21 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/4] usb: xhci: handle Set TR Deq Slot Not Enabled Error
Date: Mon, 18 Aug 2025 14:57:40 +0200
Message-ID: <20250818125742.3572487-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Set TR Deq Slot Not Enabled error occurs when the Endpoint State is
disabled. In this state, the slot's Doorbell register is disabled, meaning
it cannot receive or handle Transfer Descriptors (TDs).

Because the slot cannot receive or handle TDs, it should not have any TDs.
Consequently, all cancelled TDs are released.
(The goto 'td_cleanup' is used for other cases in later patches)

Case 'COMP_SLOT_NOT_ENABLED_ERROR' (11) is moved between 'COMP_TRB_ERROR'
(5) and 'COMP_CONTEXT_STATE_ERROR' (19).

xHCI specification, rev 1.2:
 Slot State		section 4.5.3

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7bd559294742..79c15dbae43b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1461,6 +1461,9 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			xhci_warn(xhci, "Set TR Deq error stream %u boundary check failed TRB @%pad slot %d ep %u\n",
 				  stream_id, &deq, slot_id, ep_index);
 			break;
+		case COMP_SLOT_NOT_ENABLED_ERROR:
+			xhci_warn(xhci, "Set TR Deq error slot %d is Disabled\n", slot_id);
+			goto td_cleanup;
 		case COMP_CONTEXT_STATE_ERROR:
 			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.\n");
 			ep_state = GET_EP_CTX_STATE(ep_ctx);
@@ -1470,10 +1473,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 					"Slot state = %u, EP state = %u",
 					slot_state, ep_state);
 			break;
-		case COMP_SLOT_NOT_ENABLED_ERROR:
-			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd failed because slot %u was not enabled.\n",
-					slot_id);
-			break;
 		default:
 			xhci_warn(xhci, "WARN Set TR Deq Ptr cmd with unknown completion code of %u.\n",
 					cmd_comp_code);
@@ -1554,6 +1553,17 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
 		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
+	return;
+td_cleanup:
+	ep->ep_state &= ~SET_DEQ_PENDING;
+	ep->queued_deq_seg = NULL;
+	ep->queued_deq_ptr = NULL;
+
+	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
+		td->cancel_status = TD_CLEARED;
+		ep_ring = xhci_urb_to_transfer_ring(xhci, td->urb);
+		xhci_td_cleanup(xhci, td, ep_ring, td->status);
+	}
 }
 
 static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
-- 
2.50.1


