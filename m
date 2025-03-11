Return-Path: <linux-usb+bounces-21647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E7A5C880
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 16:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79C647A4D62
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31A225EFA0;
	Tue, 11 Mar 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTY0YxM7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3C25E807
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707893; cv=none; b=FLkVqsiRV43gk6uSqJpvCGvROwCZiVk2K1eGwgqSpsFos1r+OcjemuveB2PEAfSaKnC5ArnkNlFfkjjXvhbItWHcm5KoJW4Mdb/cF8YfRYos42fxA+xvAWTUiI0/YobHcekQaDpT3FRaSbC+fs0dVtzjxcfM+4/hVRltw99Xs24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707893; c=relaxed/simple;
	bh=ZK8Z/ztxQnTD9D147oktvTcS8Xjx1IlJk/oVJ2QW0nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZ74JvBPBBpIOuUrXihaubOJseiCvKbFq6h1DB3odyZ6YhVfrpmbkTIhJynNWGt5FCQQ14qwzPbP1XqM+KV6qlgCmhqKhxZvOpVRBpBMk1gFkwE98gvqPuPqEz4b2lweTqzZVth57VB0IeaKYc+R0R3ffVLizx5r0Eu2LxdAj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTY0YxM7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741707892; x=1773243892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZK8Z/ztxQnTD9D147oktvTcS8Xjx1IlJk/oVJ2QW0nc=;
  b=TTY0YxM7QssLwA3z+ulc+xLNxCFWJtQmlDAWxj6L5ZQuHkvDbC2me46W
   VwS9l3cqldMn26GAKgRdeAY13blPYZWQbfVOScdVJ6ZCts3lnfl2Iy6mF
   ZNtL3mbt578BURvFMj3UyqhmzgSsl7rq2GvQl5xzXdnEoOi19HSnRE8Oa
   f45G2KgYQwz5Tj47vwnGuOchafn1IOaQYe173KtXRPIOaP7vtrd71oaPE
   d9KYFCI07iAWnkqIG3XNdcJZDU3hyTtomDCErXjxk0H3zsKtSdlKHOxnH
   64z0S8xBOKduJ5uir2NpaEg74DnWH7+IzYk7cUZlbf6PnK5ht1bebZRQ6
   w==;
X-CSE-ConnectionGUID: Va/hMT8cTWCjMqqR8RYuRQ==
X-CSE-MsgGUID: banRDN/BQZu4vtca3qDTog==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="30327898"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="30327898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 08:44:51 -0700
X-CSE-ConnectionGUID: rBrg1wtSR9aDsNuwiDGOGw==
X-CSE-MsgGUID: 7ILL9i4ITQOVLoPwzYFrxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125396697"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2025 08:44:50 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH 1/3] xhci: Avoid queuing redundant Stop Endpoint command for stalled endpoint
Date: Tue, 11 Mar 2025 17:45:49 +0200
Message-ID: <20250311154551.4035726-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
References: <20250311154551.4035726-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If EP_STALLED flag is set in xhci_urb_dequeue(), without EP_HALTED or
SET_DEQ_PENDING flags, then the endpoint is in stopped state and the
cancelled URB can be given back immediately withouth queueing
a 'stop endpoint' command.

Without this change the cancelled URB would eventually be given back
in the 'context state error' completion path of the 'stop endpoint'
command. This is not optimal.

For this improvement to work the EP_STALLED flag must be cleared with
xhci lock held.

Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1852175f48c1..19e308f4fc06 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1773,8 +1773,8 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		goto done;
 	}
 
-	/* In this case no commands are pending but the endpoint is stopped */
-	if (ep->ep_state & EP_CLEARING_TT) {
+	/* In these cases no commands are pending but the endpoint is stopped */
+	if (ep->ep_state & (EP_CLEARING_TT | EP_STALLED)) {
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
@@ -3211,10 +3211,12 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 		return;
 
 	ep = &vdev->eps[ep_index];
+
+	spin_lock_irqsave(&xhci->lock, flags);
+
 	ep->ep_state &= ~EP_STALLED;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
-	spin_lock_irqsave(&xhci->lock, flags);
 	if (ep->ep_state & EP_HARD_CLEAR_TOGGLE) {
 		ep->ep_state &= ~EP_HARD_CLEAR_TOGGLE;
 		spin_unlock_irqrestore(&xhci->lock, flags);
-- 
2.43.0


