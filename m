Return-Path: <linux-usb+bounces-9905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF08B5ABC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26E491F21070
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2E2757ED;
	Mon, 29 Apr 2024 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bu9RRcmr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C97BB17
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399278; cv=none; b=Mj8xFyV4fojjOAWMT1ZSDJlq+G9LrH7GWCVRnB666VqZVUt1MaW1gKUuNZGrXa5OfEJmDzEfawFRjGs24kA/U54RIXGG593admHDnYYdS8Dxg+xUL5AjhkC6SJ/fo5M27tvcRHtjdeHspnmNwxu1JgGD82KFxULBykoxYhYKkhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399278; c=relaxed/simple;
	bh=kQu+z7O+4ThimD1k+IyZuwLD8oXS15XBxt1q2Acs1PY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EAZGjmf3EWiaf5+f+gMw2XlOk8IncN3JtjL4ZBXEAmGUZ0Qe15ZiK4wBdox5I3VKPqPr77Z2lnCo7gjp7Bt59a9ihjvKHKCWNOQn+eqIJCoYwLR/c5G3OPzzNqerpBUvmgwz35990eRXhnd6d4VcvTs9fy6cxtj3PYd3TkRsfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bu9RRcmr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399277; x=1745935277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQu+z7O+4ThimD1k+IyZuwLD8oXS15XBxt1q2Acs1PY=;
  b=bu9RRcmr/8VBeHzD96nQtqC1RmxlL6kAz7PONJDPVwPnAOMr3bANsdp4
   VTm2Z+pcvTktl/EwiCEIxB7xtXDBPmjDkyN2V9unEzR+5rd0vYe07rCfP
   P8AkWsRCBFqQpQd7UQ05IuXGYnpruFRZH3kMq2yhdYFyT+lpeE0jAWbLj
   6RTYOAq9poRMgjpb8f2GuUQcMVe82r4ZXfWCHc0ELEHd0k7MablR5HNDp
   jLE5fUYpXZiqqGDV7HomRZFhgyDaERDVVVnRScrBOcyRogjn9Nz+O8iry
   yLSkprCFd5/QQ5hZhyjlu9IFaOxcZThL6T0E5rIFuxbnZshd6KXAEBY+5
   w==;
X-CSE-ConnectionGUID: J5ow7KJfQ1So4i41uLez6g==
X-CSE-MsgGUID: PXug1N9lRYGKrlKczAK4dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911484"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911484"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:17 -0700
X-CSE-ConnectionGUID: twIAEIwvQpWRGoDgTWpJaw==
X-CSE-MsgGUID: bt4JMsGqQ7uvG+hAu9F55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521841"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:14 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/18] usb: xhci: replace goto with return when possible in handle_tx_event()
Date: Mon, 29 Apr 2024 17:02:39 +0300
Message-Id: <20240429140245.3955523-13-mathias.nyman@linux.intel.com>
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

Simplifying the handle_tx_event() function by addressing the complexity
of its while loop. Replaces specific 'goto cleanup' statements with
'return' statements, applicable only where 'ep->skip' is set to 'false',
ensuring loop termination.

The original while loop, combined with 'goto cleanup', adds unnecessary
complexity. This change aims to untangle the loop's logic, facilitating a
more straightforward review of the upcoming comprehensive rework.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e96ac2d7b9b1..0f48f9befc94 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2804,7 +2804,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				xhci_handle_halted_endpoint(xhci, ep, NULL,
 							    EP_HARD_RESET);
 			}
-			goto cleanup;
+			return 0;
 		}
 
 		/* We've skipped all the TDs on the ep ring when ep->skip set */
@@ -2812,7 +2812,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			ep->skip = false;
 			xhci_dbg(xhci, "All tds on the ep_ring skipped. Clear skip flag for slot %u ep %u.\n",
 				 slot_id, ep_index);
-			goto cleanup;
+			return 0;
 		}
 
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
@@ -2851,7 +2851,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
 			    ep_ring->last_td_was_short) {
 				ep_ring->last_td_was_short = false;
-				goto cleanup;
+				return 0;
 			}
 
 			/*
-- 
2.25.1


