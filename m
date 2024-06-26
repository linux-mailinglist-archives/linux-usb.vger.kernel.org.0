Return-Path: <linux-usb+bounces-11690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BB91815A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBE251F24826
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D91186E30;
	Wed, 26 Jun 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bs+55l+W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F32186E24
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406030; cv=none; b=fwj695g2K35kFHGbTQJ5hhJ3JbFyJUJPFBcsX4VdMEB4Q2A5fL7CmCdJOqnmAxJFq86mx/fkZgI60j5tMO48mG64UhWq87My+jN5JwpjvRwo9OIubENwkZ3lvHGV3woaNPtv4H9bVOcb5dJrV+HwHGiy19UWChAKJP8UGlgnI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406030; c=relaxed/simple;
	bh=gyKO8IFwKr7MXu/XKILJaXKUfHQfFNfxpzzz0D0jN9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RmM4yoYHT8tF2SvzL0vIhv7Dog9tzXK1Ngy0gcWKYNIG0Mhek9fIsoLEz/eNx7kcbG+0+0ftreJSo7gEo3B7dWSCM7/X5RMdzWNxEWqC24uDSRhdvC2Na4TzsHoDpPN5qhS/nkDXN+ACJRK3n+iV5/pUut4QsdNpPuJaRePgRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bs+55l+W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406029; x=1750942029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gyKO8IFwKr7MXu/XKILJaXKUfHQfFNfxpzzz0D0jN9M=;
  b=bs+55l+WyLwPgp81byTzd8uUj+kCfyupPe/N7FTxLoaFzpW7SSYsORPG
   tMCdEQ9NgbuXzWFXjySxzQcnGg4mhbENdSJYSDA/W5KohgSF9N5cM7mNg
   M6p0EZ4bVwm5vzELiIkrHwIkXWqEAXyAJi7hqQuUmBJ4nqTx/aB3DoqHx
   t+rqr8y6B6hvuCBdks0FyrNvkvBm8JGhaZCSXVNfL5ZCHHhmFXfaKi6on
   JNizuZUPi2sAc796YDtMo8bZ+Lb5Rgo01uuK5XJI1+b/aeWjbHSjdWR1w
   DoHNKk0VoOMDSvpkInUienVXGEmNwWiZARkyw8yWCuqtJ3lbD3vsRd3xw
   Q==;
X-CSE-ConnectionGUID: /1rf79BxQOGtt52mYL2Xtg==
X-CSE-MsgGUID: h4mFc3fWR+6qdqb9k+M5mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353420"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353420"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:09 -0700
X-CSE-ConnectionGUID: SA/TNRwgSeKhZQVd1Bw7GA==
X-CSE-MsgGUID: XJvCFHs5Tyyr7MarGYHYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442745"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:07 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/21] usb: xhci: remove infinite loop prevention
Date: Wed, 26 Jun 2024 15:48:31 +0300
Message-Id: <20240626124835.1023046-18-mathias.nyman@linux.intel.com>
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

If a buggy HW reports some unpredicted event (for example, an overrun event
following a MSE event while the EP ring is actually not empty), the driver
will never find the TD, and it will loop until the TD list is empty.

Before commits [1][2], the spin lock was released when giving back a URB in
the do-while loop. This could cause more TD to be added to TD list, causing
an infinite loop.

Because of commits [1][2] the spin lock is not released any more, thus the
infinite loop prevention is unnecessary and is removed.

[1], commit 0c03d89d0c71 ("xhci: Giveback urb in finish_td directly")
[2], commit 36dc01657b49 ("usb: host: xhci: Support running urb giveback in
			   tasklet context")

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8289f69a6978..7baa9dc706a1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2611,7 +2611,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
-	int td_num = 0;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2637,10 +2636,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (!ep_ring)
 		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
 
-	/* Count current td numbers if ep->skip is set */
-	if (ep->skip)
-		td_num += list_count_nodes(&ep_ring->td_list);
-
 	/* Look for common error cases */
 	switch (trb_comp_code) {
 	/* Skip codes that require special handling depending on
@@ -2799,18 +2794,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			return 0;
 		}
 
-		/* We've skipped all the TDs on the ep ring when ep->skip set */
-		if (ep->skip && td_num == 0) {
-			ep->skip = false;
-			xhci_dbg(xhci, "All tds on the ep_ring skipped. Clear skip flag for slot %u ep %u.\n",
-				 slot_id, ep_index);
-			return 0;
-		}
-
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
 				      td_list);
-		if (ep->skip)
-			td_num--;
 
 		/* Is this a TRB in the currently executing TD? */
 		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
-- 
2.25.1


