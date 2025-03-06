Return-Path: <linux-usb+bounces-21438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3AA54E2E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C94A188E1BD
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E8B186E2F;
	Thu,  6 Mar 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD3+8YjC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA71898E9
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272576; cv=none; b=RFSMBtRKmP6qmlhyjxIE0x3YkTQWBQ5a5GK7Q5EgG00SUGKwnRtI2RfJzCmLBbBJccjnwFY/b/xfUi7XZz8BrnlReFqIyhY05uesMf9B1/2M/GvabjbC5+NhrlZezgF+cZD1U5iNiMFlMY4L3pAAoUslgg5Pw7611nOwrPlenuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272576; c=relaxed/simple;
	bh=WTo7iAd8v0TqG8xP1gXPK0X4oX25knAvutngm3Td86U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFpm2/eaPJDCMUl7JxkeYVtDoB8thPLxbJci9as5BZeZBw1eBFPFoa3yhFml06rbFFmw5JTsrF8l3ytUvdf1rA3mVaQogpJO/FlfzOF0S5Oggf24mMbY4Cfjw7pLvBAbVElVU1mEVxDP4KT3JYF02Yf4xeqwwktIpSrYraRKY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD3+8YjC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272574; x=1772808574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WTo7iAd8v0TqG8xP1gXPK0X4oX25knAvutngm3Td86U=;
  b=aD3+8YjCLnSjsfcWpEY9RaFNykby7/ELcQMb35BR4SNiuU+wO17jAzu6
   kn/rVpYPJ0Ew6CpLIpOpf668zGXT6Uh5WOKP2Ld5KmmyXMsf56v4WhbbS
   Cb2N7rEwVYRJB4QvSlhhVLmIBxo1mXe4ffWja3QTrBjxDwPJ3A5NoTsPX
   6ETBXhq/JdKL5p0FUrgaU3rXtZvq2KCSlpGJsvQH/p41Gcd3yK7aAfv0N
   teDZO+ly9wFYYaj56l9ZG2Fb/I2vPVXbRooerpknwzFmMCoDYUxaDOQ/7
   2ac8YNDM+XpHlH1CyoGNBH8ZJ1CMFTo957moHp8R7F5cch6J3yr1fCn5L
   g==;
X-CSE-ConnectionGUID: 2J5sQDs7TRy9ax5e3Ef+og==
X-CSE-MsgGUID: zF3kU8LYQ82yyhL+3Mtcqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657078"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657078"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:33 -0800
X-CSE-ConnectionGUID: 7Vp5hkr6R1GKxFThI1a8aQ==
X-CSE-MsgGUID: oqcmsH5CTDKZsExylPm+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954803"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:32 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/15] usb: xhci: Fix isochronous Ring Underrun/Overrun event handling
Date: Thu,  6 Mar 2025 16:49:44 +0200
Message-ID: <20250306144954.3507700-6-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

The TRB pointer of these events points at enqueue at the time of error
occurrence on xHCI 1.1+ HCs or it's NULL on older ones. By the time we
are handling the event, a new TD may be queued at this ring position.

I can trigger this race by rising interrupt moderation to increase IRQ
handling delay. Similar delay may occur naturally due to system load.

If this ever happens after a Missed Service Error, missed TDs will be
skipped and the new TD processed as if it matched the event. It could
be given back prematurely, risking data loss or buffer UAF by the xHC.

Don't complete TDs on xrun events and don't warn if queued TDs don't
match the event's TRB pointer, which can be NULL or a link/no-op TRB.
Don't warn if there are no queued TDs at all.

Now that it's safe, also handle xrun events if the skip flag is clear.
This ensures completion of any TD stuck in 'error mid TD' state right
before the xrun event, which could happen if a driver submits a finite
number of URBs to a buggy HC and then an error occurs on the last TD.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 47aaaf4eb92a..d34f46b63006 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2627,6 +2627,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
+	bool ring_xrun_event = false;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2733,14 +2734,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * Underrun Event for OUT Isoch endpoint.
 		 */
 		xhci_dbg(xhci, "Underrun event on slot %u ep %u\n", slot_id, ep_index);
-		if (ep->skip)
-			break;
-		return 0;
+		ring_xrun_event = true;
+		break;
 	case COMP_RING_OVERRUN:
 		xhci_dbg(xhci, "Overrun event on slot %u ep %u\n", slot_id, ep_index);
-		if (ep->skip)
-			break;
-		return 0;
+		ring_xrun_event = true;
+		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		/*
 		 * When encounter missed service error, one or more isoc tds
@@ -2813,6 +2812,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		if (trb_comp_code != COMP_STOPPED &&
 		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
+		    !ring_xrun_event &&
 		    !ep_ring->last_td_was_short) {
 			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
 				  slot_id, ep_index);
@@ -2847,6 +2847,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				goto check_endpoint_halted;
 			}
 
+			/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
+			if (ring_xrun_event)
+				return 0;
+
 			/*
 			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
 			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
@@ -2893,6 +2897,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	/* Get out if a TD was queued at enqueue after the xrun occurred */
+	if (ring_xrun_event)
+		return 0;
+
 	if (trb_comp_code == COMP_SHORT_PACKET)
 		ep_ring->last_td_was_short = true;
 	else
-- 
2.43.0


