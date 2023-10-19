Return-Path: <linux-usb+bounces-1907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DEB7CF541
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 338ECB212B5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BAB1DFE9;
	Thu, 19 Oct 2023 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCvQ1Ndg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13118C1A
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC81138
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711303; x=1729247303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pDGdH1jF0F5j7Akx0UQbRcUz/P0jzS8UD4vFUEAKnkM=;
  b=mCvQ1Ndgn7Yf64isFhi8PLBsuz3Zt8mAseRo7EP5oXNJKvlF7D5wWcK8
   esVm+olLtBimU/UxDIwMXrrufC40t1veyW9NYKSy0B6n3DEIAV5fJg38T
   On9kjlXou77AnmgBR7YVAH55OKGPdcfWLZySNscl+RnY12Hnhbvm5m5Jb
   S4a0CnA66WnDpGw21+s8pzwHwUNVBJlu5PR6VJTW7WzXO8T0Q/O9NwFos
   +6k2Y4oMCtQsO8yVQHpR80zfkBd5KozzsdFc/QFPx1CF9hnxG1jGHDyCD
   MjoVwZRJaHAeSp8lO4CHXuwyvgJ3uhwWeMBciMzGwYd2lPJPY3whRi4KV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075896"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075896"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557789"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557789"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:21 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/19] xhci: simplify event ring dequeue tracking for transfer events
Date: Thu, 19 Oct 2023 13:29:17 +0300
Message-Id: <20231019102924.2797346-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No matter what type of event we receive we want to increase the event
ring dequeue pointer one step for every event that is handled.

For unknown reasons the event ring dequeue increase is done inside the
transfer event handler and port event handler.

As the transfer event handler got more complex and can now loop through
several transfer TRBs on a transfer ring, there were additinal checks
added to avoid increasing event ring dequeue more than one step.

No need for elaborate checks to avoid increasing event ring dequeue
in case the transfer event handler goes through a loop.
Just increasing the event ring dequeue outside the transfer event
handler.

End goal is to increase event ring dequeue in just one place.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 17404b14d1bf..7aa6f132835b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2884,13 +2884,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
 			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
 
-		/*
-		 * Do not update event ring dequeue pointer if we're in a loop
-		 * processing missed tds.
-		 */
-		if (!handling_skipped_tds)
-			inc_deq(xhci, ir->event_ring);
-
 	/*
 	 * If ep->skip is set, it means there are missed tds on the
 	 * endpoint ring need to take care of.
@@ -2924,7 +2917,6 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	union xhci_trb *event;
 	int update_ptrs = 1;
 	u32 trb_type;
-	int ret;
 
 	/* Event ring hasn't been allocated yet. */
 	if (!ir || !ir->event_ring || !ir->event_ring->dequeue) {
@@ -2957,9 +2949,7 @@ static int xhci_handle_event(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		update_ptrs = 0;
 		break;
 	case TRB_TRANSFER:
-		ret = handle_tx_event(xhci, ir, &event->trans_event);
-		if (ret >= 0)
-			update_ptrs = 0;
+		handle_tx_event(xhci, ir, &event->trans_event);
 		break;
 	case TRB_DEV_NOTE:
 		handle_device_notification(xhci, event);
-- 
2.25.1


