Return-Path: <linux-usb+bounces-11686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE9918156
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 14:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E271C21C9E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 12:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A0B1862AC;
	Wed, 26 Jun 2024 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azki7HnW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395E1862A4
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719406024; cv=none; b=Ru3YhEaS6+gM+AV+MWNVEG49sJKxMJGTXfDAZr01M2hH+VRub7Hlj1We624Ix/+jJMrHdHj2E0oYCGS2jHY0Q9I6YtK7366mx5DmWuwTkDEhjK1pLoSwMs/t0JCY1pmVQhOtI7et/nXcWLmFHbO18R1D1J+hqiZF2RXtGrH6mu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719406024; c=relaxed/simple;
	bh=XrZxLF1GsrrK3ggG/UOEThyva4VHGIqS1npY/wmHnHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ceVIaalKD3jcr7QqA7gC1Kv6RvAvbcnnIKXwTmJXBKJxOCmcldZvybGHrvmZvM3Vy/88r6PM3ePA1hSKFsWxKqUkhdI1ACb+r9bpqJl907S9iciqgvPA9T7pIUVcbucnm6ecoBAyI3sRoOn8yGlxZyt8T1t2sUQ0FuTEzj1pyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azki7HnW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719406023; x=1750942023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XrZxLF1GsrrK3ggG/UOEThyva4VHGIqS1npY/wmHnHY=;
  b=azki7HnWKdvuxS7l4XweJ6J/kD9ffjCrETtFe0xi4AYrilhiN6v6IQ2Y
   2fZLBoEHAQg4TuQ+aftIe5vStKdjXyWWC+BogdLyLaIC0uAzldwKyYgc0
   XPf7Xg5Ldz5sF5r+Ts2Wsw7OWlsuyimGlHSqwEKrqdMy1PJ5pCLX0aymH
   RGaiFMXx0P+QKDkviA1kGinwE5UcTlO+86ua1dhuApTTX0zR2jziazdYj
   jMoEyadSxPkHl7/uIqBv1UT+wxouoCM6OpzEPr/2CtDmV4Wr29iUZFD4F
   ix0Zo3yKS/QVCNIAfUBSQvkI0KWO0UJoDZnW7D7O9WhPAgcFd4GcvXjk+
   w==;
X-CSE-ConnectionGUID: Z7b9I4lCSvSEAsH81WsrLQ==
X-CSE-MsgGUID: rInFaToiSxWFkOpqX+zYQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16353404"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16353404"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:47:02 -0700
X-CSE-ConnectionGUID: ngMSNATARRqzJdHdy4eIrw==
X-CSE-MsgGUID: cxGxdKALR2i/Cq7aG6iK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48442673"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 05:47:01 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	niklas.neronin@linux.intel.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/21] usb: xhci: remove obsolete sanity check debug messages
Date: Wed, 26 Jun 2024 15:48:27 +0300
Message-Id: <20240626124835.1023046-14-mathias.nyman@linux.intel.com>
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

Remove debug messages that served as sanity checks during the initial
implementation phase of underrun/overrun completion codes. These checks
are now unnecessary.

Instead, improve the default debug messages for underrun/overrun events,
so that they are consistent with the reset of the completion codes.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d4e4c1c71f90..900bf34174f9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2719,18 +2719,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * a Ring Overrun Event for IN Isoch endpoint or Ring
 		 * Underrun Event for OUT Isoch endpoint.
 		 */
-		xhci_dbg(xhci, "underrun event on endpoint\n");
-		if (!list_empty(&ep_ring->td_list))
-			xhci_dbg(xhci, "Underrun Event for slot %u ep %d still with TDs queued?\n",
-				 slot_id, ep_index);
+		xhci_dbg(xhci, "Underrun event on slot %u ep %u\n", slot_id, ep_index);
 		if (ep->skip)
 			break;
 		return 0;
 	case COMP_RING_OVERRUN:
-		xhci_dbg(xhci, "overrun event on endpoint\n");
-		if (!list_empty(&ep_ring->td_list))
-			xhci_dbg(xhci, "Overrun Event for slot %u ep %d still with TDs queued?\n",
-				 slot_id, ep_index);
+		xhci_dbg(xhci, "Overrun event on slot %u ep %u\n", slot_id, ep_index);
 		if (ep->skip)
 			break;
 		return 0;
-- 
2.25.1


