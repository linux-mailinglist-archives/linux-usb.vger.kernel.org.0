Return-Path: <linux-usb+bounces-11688-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A054918158
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C301F24040
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDAC1862BD;
	Wed, 26 Jun 2024 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjVdpqf7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B91822F3
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406027; cv=none; b=OhcicmbkIdifHJqgqdSOYSLrdGlPSa9O6R3t0HHA4B7FSGVRjKNMZrhANUjlfSsarDiu3UyeOk8qTUmac9+grB5QWgU3JOb0ajcTnsAFoNhmy3mI42v62wOlBpOBY2NwQ3u4WdFtLcGJDnfevxedtIT/DSBmOOg+y7vDaTgz+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406027; c=relaxed/simple;
	bh=jmWZnCIqgkLd8OyOu0s6Mkzb6PVeEji6dumfz48P/Go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i3MJc1i3QQphPhLEiVob9bcOiGC//u7do1MSY3M93+Pl1207sochwt8essguN3IaII7Ulak5hDwm9sv+RQ4Mtqy2NsEknDFU8txtzWTf8TucLjDhfs1bsSOTe/UIhFVr4qXjpzwaWmjS9gklmlPCGng3m8Af3rhrn0Q3PqFohww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjVdpqf7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406026; x=1750942026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jmWZnCIqgkLd8OyOu0s6Mkzb6PVeEji6dumfz48P/Go=;
  b=XjVdpqf7B1E95IyEiycyvOsMQmN5kd0b8SYy2mr11qBMOXdLeYPqvCpI
   Ri4mRY9suH53eKnz6JqzGeDfmI+DVdBC1D8aBPOJaIFmukgyPBSMTiyA+
   OO5ZACQi2fTw5tvkZjGZY6P8wSLAsTTp+WnDZNPnJtUX+TGFSnYLLVSYk
   5g9B/Lu+SdJKavtbEQSlHFqafwndkqHX4Ar73jrFRRRThcSTYvl/LvDCX
   XqoHOXULJHiHeaWuSTT3dP8wbVjtc7Xu8KFea5donG7/cGohxUPaP+kFq
   a+RVPBJaGrDTMtrHx3+QmSw9Ivp2ZEgbS5Dg6ej0/iwi/SCswI2nGQLgV
   g==;
X-CSE-ConnectionGUID: ELMlxjR6R3GDn16LUNkVmQ==
X-CSE-MsgGUID: Oy8ApBI+QMKU1rU3GZ/DiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353412"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:06 -0700
X-CSE-ConnectionGUID: NEQCoS0kTcuzh60nmMdNSA==
X-CSE-MsgGUID: xAS4TpsQT/G4UctCr9xAog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442706"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:04 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/21] usb: xhci: ensure skipped isoc TDs are returned when isoc ring is stopped
Date: Wed, 26 Jun 2024 15:48:29 +0300
Message-Id: <20240626124835.1023046-16-mathias.nyman@linux.intel.com>
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

Missed service event tells the driver that the hardware wasn't able to
process some queued isoc TDs in their right time slots, and some TDs will
be skipped. The driver sets a 'skip' flag to indicate that the next
transfer event after this event will point to some future TD instead of
the next queued TD. Once the driver receives the next event, it will skip
and give back all those hardware skipped TDs.

However, should this subsequent event be a stop endpoint which does not
point to the next pending TD, the driver fails to return the skipped TDs.
Instead, it loops for a period before outputting an erroneous message.

Fix this by repositioning the 'stop endpoint' check to follow the isoc
skip check, ensuring the skipped TDs are properly returned.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3479c9cb5d33..14898335d193 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2819,19 +2819,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		/* Is this a TRB in the currently executing TD? */
 		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
 
-		/*
-		 * Skip the Force Stopped Event. The event_trb(event_dma) of FSE
-		 * is not in the current TD pointed by ep_ring->dequeue because
-		 * that the hardware dequeue pointer still at the previous TRB
-		 * of the current TD. The previous TRB maybe a Link TD or the
-		 * last TRB of the previous TD. The command completion handle
-		 * will take care the rest.
-		 */
-		if (!ep_seg && (trb_comp_code == COMP_STOPPED ||
-			   trb_comp_code == COMP_STOPPED_LENGTH_INVALID)) {
-			continue;
-		}
-
 		if (!ep_seg) {
 
 			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
@@ -2839,6 +2826,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				continue;
 			}
 
+			/*
+			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
+			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
+			 * pointer still at the previous TRB of the current TD. The previous TRB
+			 * maybe a Link TD or the last TRB of the previous TD. The command
+			 * completion handle will take care the rest.
+			 */
+			if (trb_comp_code == COMP_STOPPED ||
+			    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
+				return 0;
+			}
+
 			/*
 			 * Some hosts give a spurious success event after a short
 			 * transfer. Ignore it.
-- 
2.25.1


