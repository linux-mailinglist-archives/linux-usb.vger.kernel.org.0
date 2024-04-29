Return-Path: <linux-usb+bounces-9910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7148B5AC1
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B40D51F22DE1
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C397C6C5;
	Mon, 29 Apr 2024 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9pVbLNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980B74BE2
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399287; cv=none; b=dmvr50cA4KXWDP1gU50n69HjpuYQu2eNbNQ7WVa4zNHvcorNZw2SIVOdP0WFW2m2oEs7Zgm8UFGwPJZY7Dwt7O1mPO/Qag5C4X8SdMLJSIQC1UCpFvupm2/JcbL5vZyhVzxuPMd9SaHruy5EJHlEVN3m09H+GWH22bC9oqRlX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399287; c=relaxed/simple;
	bh=1Aq+4wp4kygQSouNeLmoTUAfpl0acq/WvxnMb6/5c/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k+on9wHNuqdh0vsQuq97EWzcC8M4KITUxzS/yjbFSmLAaXRAgvBbiE7AEKV6m/JH/F1Z14+T5FvBnSlhjp9ltI806SAlU9DoD8oO4ppm8Cpx2jq75FaDBEiGAAz1ywshjiKNqtv/sHT6SSqulLIpsSXumFdIVLQmRSJCzRvrOso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9pVbLNV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399286; x=1745935286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Aq+4wp4kygQSouNeLmoTUAfpl0acq/WvxnMb6/5c/I=;
  b=S9pVbLNVMMATkDM3UMqAflrZQ3QDLd8V3Vq9ZoWPmd0zdUUy2k1yZUvd
   AdZsTRoiRzHTmFnI6QHDv8mo4RsnUNj8Mc8p/vMkyZR3QY9xS0N/f68H7
   OWWPADg2RQp2iGydVa/5g04LHrScCv30yb6+7jjjRywnhhOmPkD1YzVim
   ZbWY3EOd1EiXYC6W4MPsq/UcdxssTZpo/xPafrhiD/egtng9pRxnmgvXG
   7LNMGll2tskwqHPFFP/yVitxg9DGJQOKcsKJ1NRVv2iD8pbEZ5iDLC2pK
   zmppSekA0qnPH9YOknHQxzEdPrYMXqzWegZze49Z4g+G/hDTc1eBlclkq
   A==;
X-CSE-ConnectionGUID: +Sjfgmf1StivoeUePY3ufw==
X-CSE-MsgGUID: qY3gNNVARyCuvvMJQAzycA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911543"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911543"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:25 -0700
X-CSE-ConnectionGUID: WdhzIsARQYe8I7kS5/7OSw==
X-CSE-MsgGUID: QTUwj01OSRm2snucUvWM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521942"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:23 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 17/18] usb: xhci: remove duplicate TRB_TO_SLOT_ID() calls
Date: Mon, 29 Apr 2024 17:02:44 +0300
Message-Id: <20240429140245.3955523-18-mathias.nyman@linux.intel.com>
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

Remove unnecessary repeated calls to TRB_TO_SLOT_ID(). The slot ID is
stored in the 'slot_id' variable at the function's start.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b395708c488c..a7423ed992ee 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2723,20 +2723,16 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		xhci_dbg(xhci, "underrun event on endpoint\n");
 		if (!list_empty(&ep_ring->td_list))
-			xhci_dbg(xhci, "Underrun Event for slot %d ep %d "
-					"still with TDs queued?\n",
-				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
-				 ep_index);
+			xhci_dbg(xhci, "Underrun Event for slot %u ep %d still with TDs queued?\n",
+				 slot_id, ep_index);
 		if (ep->skip)
 			break;
 		return 0;
 	case COMP_RING_OVERRUN:
 		xhci_dbg(xhci, "overrun event on endpoint\n");
 		if (!list_empty(&ep_ring->td_list))
-			xhci_dbg(xhci, "Overrun Event for slot %d ep %d "
-					"still with TDs queued?\n",
-				 TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
-				 ep_index);
+			xhci_dbg(xhci, "Overrun Event for slot %u ep %d still with TDs queued?\n",
+				 slot_id, ep_index);
 		if (ep->skip)
 			break;
 		return 0;
@@ -2795,9 +2791,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			if (!(trb_comp_code == COMP_STOPPED ||
 			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
 			      ep_ring->last_td_was_short)) {
-				xhci_warn(xhci, "WARN Event TRB for slot %d ep %d with no TDs queued?\n",
-						TRB_TO_SLOT_ID(le32_to_cpu(event->flags)),
-						ep_index);
+				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
+					  slot_id, ep_index);
 			}
 			if (ep->skip) {
 				ep->skip = false;
-- 
2.25.1


