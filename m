Return-Path: <linux-usb+bounces-14721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B42EE96DBD3
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBEB21C21040
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB91449643;
	Thu,  5 Sep 2024 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DK7IbvYp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74943149
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546692; cv=none; b=ZPn0tV9LiTpFq2k79V4J6kivEz7UwEamuIiLW3V5/jSmbQu2yHB2qYcojgl4WGVHhq3OraCzFiJZsfVphNh5Rb8ikxt8KTsq5WP1+PdNVDCHeKByrnqdCgHcxFn0ZYld32qlyIWVUg5Mbr7KN7Kl6Uj2Gwo8fnlouiyp85xX0TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546692; c=relaxed/simple;
	bh=DddwRJJvllW6A/PVAi5YTTyoVri0dn1rja2b35DG9+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=haBE6u2ffMATGiRpGi6L79gBKzDZJD0KXpEA7d3y3M0+9uBzODPBzZM0tPyLxU7F1qcJU4pxqlBSgp6o9H315ve4NP7T1vzG2jmMIIdcpZVpQeu5gERiB8dhwhxeuEfK2A4uYS3G587Zvu+YSfP1TBtEPYrpkLORKzgbyNlY3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DK7IbvYp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546691; x=1757082691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DddwRJJvllW6A/PVAi5YTTyoVri0dn1rja2b35DG9+8=;
  b=DK7IbvYppNaqCbNm/Y6vai0faNd0PNn4pqXte3qVZ3I6YufUxLau0TWf
   tYGHlWOXdlPVjrPwzFEVOPdOQ4gZcjc83PAiZZQYVdLzM2MMm6I78/6Js
   dW1bFI97dN9hD8/8bS6LzY/DHsRg2efwv7lahP+9TpgbbGi9HmfgBi7lX
   w/GegyB0Ogry/arXCBucfzkcY7NMaB7Ag++NudAVDxgjvRT7HvUUYNi03
   rgpHUFnzjSt+NKfg1g8AgmP/AWSxQMcQ0L5ffxD371Ck6ro1dRz7aD+BJ
   jzfQY9dtBqAfLkW4SDaU/eW8kjyKYZV3BWwwkOEkCWO8qk8D7DXOU2N1H
   w==;
X-CSE-ConnectionGUID: KILaieCuQMiywwwGz1hqDw==
X-CSE-MsgGUID: L+BpsSq8SbyZa2LZ6ObHGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677553"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:31 -0700
X-CSE-ConnectionGUID: rMlXhEd/St6AknDI1jgpXw==
X-CSE-MsgGUID: 53JdOeV2S+y0h2+Zm7j01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883231"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:29 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/12] usb: xhci: adjust empty TD list handling in handle_tx_event()
Date: Thu,  5 Sep 2024 17:32:58 +0300
Message-Id: <20240905143300.1959279-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Introduce an initial check for an empty list prior to entering the while
loop. Which enables, the implementation of distinct warnings to
differentiate between scenarios where the list is initially empty and
when it has been emptied during processing skipped isoc TDs.

These adjustments not only simplifies the large while loop, but also
facilitates future enhancements to the handle_tx_event() function.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 51 +++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d37eeee74960..a4383735b16c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2761,35 +2761,25 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		return 0;
 	}
 
-	do {
-		/* This TRB should be in the TD at the head of this ring's
-		 * TD list.
+	if (list_empty(&ep_ring->td_list)) {
+		/*
+		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
+		 * extra completion event if the device was suspended. Or, a event for the last TRB
+		 * of a short TD we already got a short event for. The short TD is already removed
+		 * from the TD list.
 		 */
-		if (list_empty(&ep_ring->td_list)) {
-			/*
-			 * Don't print wanings if it's due to a stopped endpoint
-			 * generating an extra completion event if the device
-			 * was suspended. Or, a event for the last TRB of a
-			 * short TD we already got a short event for.
-			 * The short TD is already removed from the TD list.
-			 */
-
-			if (!(trb_comp_code == COMP_STOPPED ||
-			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
-			      ep_ring->last_td_was_short)) {
-				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
-					  slot_id, ep_index);
-			}
-			if (ep->skip) {
-				ep->skip = false;
-				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
-					 slot_id, ep_index);
-			}
-
-			td = NULL;
-			goto check_endpoint_halted;
+		if (trb_comp_code != COMP_STOPPED &&
+		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
+		    !ep_ring->last_td_was_short) {
+			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
+				  slot_id, ep_index);
 		}
 
+		ep->skip = false;
+		goto check_endpoint_halted;
+	}
+
+	do {
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
 				      td_list);
 
@@ -2800,7 +2790,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				skip_isoc_td(xhci, td, ep, status);
-				continue;
+				if (!list_empty(&ep_ring->td_list))
+					continue;
+
+				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
+					 slot_id, ep_index);
+				ep->skip = false;
+				td = NULL;
+				goto check_endpoint_halted;
 			}
 
 			/*
-- 
2.25.1


