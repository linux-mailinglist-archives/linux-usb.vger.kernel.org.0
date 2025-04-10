Return-Path: <linux-usb+bounces-22918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D357BA84794
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 17:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F15B461CED
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F73D1E9B1F;
	Thu, 10 Apr 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPR98IPj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0B1E5B9F
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298262; cv=none; b=LmwVj7QA41LB5MlxiFUAnRbysEsRo3Tpu/uSTnj1y5oPkRcZy6RuvdVtx6EnyJSkKZRxnQWsCxIAzJX8rifv4mgMX5dIcbO/SFO/nx3kTKgiMAhdIGZE5YzIxzADb/76YIaA0+ZLglcXZ5zNN1UCbLWrD38+q94SkNulNKBR8+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298262; c=relaxed/simple;
	bh=kWiYUW4oM5Uc9rLButl1omzs1blRdK1HKWAloBzuEL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9lf5DsS3+6XExyXaefXew+/2g8IBNCJyqWsThVrYDcZi0yaWmhRmCrLwIg52BWQrlRMk5ZMVUksD8BsQpBADjS9vm+d4unYi7DjfW+VUYc3OdZcNpNejUyKNAct0t78A5VDaefQDRWNGb/+jhjwzxfV3wm42niKwt+CQRvHL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPR98IPj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298260; x=1775834260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kWiYUW4oM5Uc9rLButl1omzs1blRdK1HKWAloBzuEL0=;
  b=nPR98IPjCCMvaey7KUM0jYbFQJQORqY/InhXIakXJvNtL+xkmTl3qW+Y
   pPgYPpL0aQlN7n3j/XFJF9M3PVL6tToeHGpMZ73PwfaZqek1J0LS1Ir34
   6ZWyc8AKam8u2J3TQnvF3Zqnn9Wfej11MAJtvxUghaScrRg7zZdyet9O7
   OhGfBmXhaP0ka5xDRbHIGubWR3kWpEEhOQtPeh/o9zpRBt9xgcaGA4gDu
   +3lKuv99mQor5wqgYb11BYY42PpaEoDcak61rcc7OlEDNkGJiV58EmEgv
   xT+cmkJGNcCEHH3N8ODhWXw1QjxDFF3PjtEy5kVw2M3CFJ56WHuz/TlQI
   A==;
X-CSE-ConnectionGUID: Qkk2wEVLRv6PymMXEwHXAQ==
X-CSE-MsgGUID: p1CMuuduS5mBzMfv4++LFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48534979"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48534979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:17:39 -0700
X-CSE-ConnectionGUID: OGnjUBg8T26ZIlrSJo928A==
X-CSE-MsgGUID: 6R2hF353QZ2Yubex6cBb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128913202"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 10 Apr 2025 08:17:37 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/5] usb: xhci: Fix Short Packet handling rework ignoring errors
Date: Thu, 10 Apr 2025 18:18:25 +0300
Message-ID: <20250410151828.2868740-4-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

A Short Packet event before the last TRB of a TD is followed by another
event on the final TRB on spec-compliant HCs, which is most of them.

A 'last_td_was_short' flag was added to know if a TD has just completed
as Short Packet and another event is to come. The flag was cleared after
seeing the event (unless no TDs are pending, but that's a separate bug)
or seeing a new TD complete as something other than Short Packet.

A rework replaced the flag with an 'old_trb_comp_code' variable. When
an event doesn't match the pending TD and the previous event was Short
Packet, the new event is silently ignored.

To preserve old behavior, 'old_trb_comp_code' should be cleared at this
point, but instead it is being set to current comp code, which is often
Short Packet again. This can cause more events to be silently ignored,
even though they are no longer connected with the old TD that completed
short and indicate a serious problem with the driver or the xHC.

Common device classes like UAC in async mode, UVC, serial or the UAS
status pipe complete as Short Packet routinely and could be affected.

Clear 'old_trb_comp_code' to zero, which is an invalid completion code
and the same value the variable starts with. This restores original
behavior on Short Packet and also works for illegal Etron events, which
the code has been extended to cover too.

Fixes: b331a3d8097f ("xhci: Handle spurious events on Etron host isoc enpoints")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 94a2ae2c52e2..4e975caca235 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2913,7 +2913,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
 				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
 					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
-				ep_ring->old_trb_comp_code = trb_comp_code;
+				ep_ring->old_trb_comp_code = 0;
 				return 0;
 			}
 
-- 
2.43.0


