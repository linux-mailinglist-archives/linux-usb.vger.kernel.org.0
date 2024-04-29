Return-Path: <linux-usb+bounces-9904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F298B5ABB
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F7E52887F1
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DC37BB15;
	Mon, 29 Apr 2024 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkk6Bo/I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2E17580B
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399277; cv=none; b=AenwQ/9RxKj52LBnf08SlfvRyga/iFP8bHzqKQiRIs6N9SLm9T8c4g+lmiVTLR2m25OfDKj7aWD996BkBHU/DTBmFZOc8EWwruX+JjHum+9MXBuTdU+4PSJPdDNLzbmpf1gb29bvTAq7HNlDbiQTI5xlcsvjsmyQ0KOYugpZHe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399277; c=relaxed/simple;
	bh=ZBcJ7kpP+wzthbCxksQVXJ0M6gz//zrZI03BHng7CYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lFFmdxX6ZGH5cmrWmfNTKSbGZ/XLNxyGOy80niMVm9lgMq32oTXb/OqbroOJqumrY5cmNwYb7LgHgux+nCygKT3+hvwF+mqa1264ExVRZ2pS/P57svRCRbhhOQXk1Qf49/9LSMClKWu5h4jVdZ3xAbxbupCcubQ2JYJvVoYh4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkk6Bo/I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399276; x=1745935276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZBcJ7kpP+wzthbCxksQVXJ0M6gz//zrZI03BHng7CYI=;
  b=lkk6Bo/IIljU/7Wu4z8hpedN+TTrz0Acp56CLDgE8G8IpMjKQ1jD93Id
   3xn9QPjJnySjPcJr98Nptg4I9r3wduIVIz5znlqIdJ1pFB3Agt9oStAWT
   FO2CSny4aXfk/IxT/r0hOKiP4iopAdWn0b6416ukyHNdObduZsE+5IKt6
   BcBnwp5PuOlAddELcEYz3a1Ey6kBQbPkZzFhCSsyBpM++5g92gi7nwJeL
   815IDFe5eMoqzlQ1wkU0iabJq2h9GDt/kMSnZCpWGiHK7AHeThsJDr3qq
   YjabGaTmOCiJpHSA6FZ5mLSeN+0vV8QBxmLsKVk6oaL2iW1gIJ3cjT9NE
   Q==;
X-CSE-ConnectionGUID: UqmWO05hRl68sR9s6LPdkg==
X-CSE-MsgGUID: vxO8WE0jSLaYRqJV+cwrHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911474"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:15 -0700
X-CSE-ConnectionGUID: 5BfJ2D+xR0mxIOWLlBhoig==
X-CSE-MsgGUID: eeaHUMqaRw+/AmJ6kEUO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521825"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/18] usb: xhci: remove 'handling_skipped_tds' from handle_tx_event()
Date: Mon, 29 Apr 2024 17:02:38 +0300
Message-Id: <20240429140245.3955523-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
References: <20240429140245.3955523-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

When handle_tx_event() encounters a COMP_MISSED_SERVICE_ERROR or
COMP_NO_PING_RESPONSE_ERROR event, it moves to 'goto cleanup'.
Here, it sets a flag, 'handling_skipped_tds', based on conditions that
exclude these two error events.

Subsequently, the process evaluates the loop that persists as long as
'handling_skipped_tds' remains true. However, since 'trb_comp_code' does
not change after its assignment, if it indicates either of the two error
conditions, the loop terminates immediately.

To simplify this process and enhance clarity, the modification involves
returning immediately upon detecting COMP_MISSED_SERVICE_ERROR or
COMP_NO_PING_RESPONSE_ERROR. This adjustment allows for the direct use of
'ep->skip', removing the necessity for the 'handling_skipped_tds' flag.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 00f48dd197ac..e96ac2d7b9b1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2587,7 +2587,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
 	int td_num = 0;
-	bool handling_skipped_tds = false;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2748,13 +2747,13 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dbg(xhci,
 			 "Miss service interval error for slot %u ep %u, set skip flag\n",
 			 slot_id, ep_index);
-		goto cleanup;
+		return 0;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
 		xhci_dbg(xhci,
 			 "No Ping response error for slot %u ep %u, Skip one Isoc TD\n",
 			 slot_id, ep_index);
-		goto cleanup;
+		return 0;
 
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 		/* needs disable slot command to recover */
@@ -2939,18 +2938,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
 		else
 			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
-cleanup:
-		handling_skipped_tds = ep->skip &&
-			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
-			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
-
+cleanup:;
 	/*
 	 * If ep->skip is set, it means there are missed tds on the
 	 * endpoint ring need to take care of.
 	 * Process them as short transfer until reach the td pointed by
 	 * the event.
 	 */
-	} while (handling_skipped_tds);
+	} while (ep->skip);
 
 	return 0;
 
-- 
2.25.1


