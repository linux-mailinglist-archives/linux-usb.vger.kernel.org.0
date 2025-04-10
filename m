Return-Path: <linux-usb+bounces-22916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AAAA84791
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 17:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F13C19E6A1B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1449B1E8328;
	Thu, 10 Apr 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLFD2fjH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6A31E5B62
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298259; cv=none; b=VhIeIyKBxRwgv/IoZ2qVy2o2vy1wXjbFBPKVaQKBf9LqpKBzDS0cqIPBNP18mQwe+enPyQPxTMtDfNp3LpX0aP7dV7ZAzwF30wlipGjNaeCQb4fXEvzym9PdDd2hKfXuwO4BBiQKytfXXqT/HN7LiPjBkNXPcdC/14MgcqucvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298259; c=relaxed/simple;
	bh=7X9K936NDdJI7VX8E6tVVtQM4qvXW1mkExk9bwY0gT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiKutCjGj1JKd/1OJbgDcTW9hy3wTQCqrYnAodEC3cN/zngTWOxrsiiT2lMzIGP4RZoME2tflGwLxLYW/nnyyv2Yg00b5Hw6At7VRguobJDLx6sp2RVlsWCWTxGBTQmNIXAHxpbRAzWFTJx3ZQMW6o7F1vCEYZaPO/a0UEQGeqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLFD2fjH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298258; x=1775834258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7X9K936NDdJI7VX8E6tVVtQM4qvXW1mkExk9bwY0gT8=;
  b=OLFD2fjHsyVxD1cogN6bv5Fs17BI5KTSirJl7fhKfwpvYqvtcNMIJy9/
   X+INXF4H2FJ6g1Liq+YFMBk8DMxfpNyAjZdqycgTOgY7yvp2DM+U0Pxg4
   pF77KyAqM7+u44qZwIvdP8yLBi/xk0d0h7DnCfioQue1CH4AZ6BVybygu
   Drf87s4vgs4zoIKvGDIY288jXzzQAjQRbCUHZs5TKlaKJQah9Xv3uNUKB
   btPqmkI4ETLQ8IU4H2CnkOQulrqLhXDUk4/3dRkK3JSy8UG0z8ZjKljl0
   u2Soti8Wna7NDI9E6BdUknNKFQwSYbun/j2nnciK+/zkk7DJmEtXBIiGA
   A==;
X-CSE-ConnectionGUID: N65IwDDtTwqDY+457Lj/Pw==
X-CSE-MsgGUID: l88NEllCT+G6z4aF3yrG+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48534962"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48534962"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:17:35 -0700
X-CSE-ConnectionGUID: H2R7GEmBSyKJ8vL09obsJA==
X-CSE-MsgGUID: j9K0069pR8emPzPztjnwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128913176"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2025 08:17:33 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH 1/5] Revert "xhci: Avoid queuing redundant Stop Endpoint command for stalled endpoint"
Date: Thu, 10 Apr 2025 18:18:23 +0300
Message-ID: <20250410151828.2868740-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410151828.2868740-1-mathias.nyman@linux.intel.com>
References: <20250410151828.2868740-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0c74d232578b1a7071e0312312811cb75b26b202.

Paul Menzel reported that the two EP_STALLED patches in 6.15-rc1 cause
regression. Turns out that the new flag may never get cleared after
reset-resume, preventing xhci from restarting the endpoint.

Revert this to take a proper look at it.

Link: https://lore.kernel.org/linux-usb/84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de
cc: Paul Menzel <pmenzel@molgen.mpg.de>
cc: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0452b8d65832..6370874bf265 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1770,8 +1770,8 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		goto done;
 	}
 
-	/* In these cases no commands are pending but the endpoint is stopped */
-	if (ep->ep_state & (EP_CLEARING_TT | EP_STALLED)) {
+	/* In this case no commands are pending but the endpoint is stopped */
+	if (ep->ep_state & EP_CLEARING_TT) {
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
@@ -3208,12 +3208,10 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		return;
 
 	ep = &vdev->eps[ep_index];
-
-	spin_lock_irqsave(&xhci->lock, flags);
-
 	ep->ep_state &= ~EP_STALLED;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
+	spin_lock_irqsave(&xhci->lock, flags);
 	if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
 		ep->ep_state &= ~EP_HARD_CLEAR_TOGGLE;
 		spin_unlock_irqrestore(&xhci->lock, flags);
-- 
2.43.0


