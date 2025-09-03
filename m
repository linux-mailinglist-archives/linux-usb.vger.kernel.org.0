Return-Path: <linux-usb+bounces-27506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641E4B42784
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF901583428
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2332815DBC1;
	Wed,  3 Sep 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGtZL5VE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777531CA60
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918914; cv=none; b=EDro746hc11oYYotG5lU1UiK6+Tu5SGMnbalXTUPycvZX1g16kvB6/OA1dAL57UPpQrjjJqRuyEAdB0x5Hf+wKuWKodTFK/9h5DyyNxpBVQJh8yaY5JFy7ijH8uTKgEdfP/tSzxwuU7w3vD31K+UvMbw0JroYxRAWRyoujZvxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918914; c=relaxed/simple;
	bh=a929p5LcId2wInBNz54Q3iRlEDtPktYKalwNBM0GW9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ia5pWZgll0J3p50sryFhYIK7HOC8LIf97v2T4ATvNl9922UY2M7fH+DcPhUauzeEE+Xs3AqkwuL4Jp/cDejVt3qbxLBTp2qNzj/k+QdGjYMA86VyF+9mWTIWFfVm9h6eEuhQQ2TJmKE2MrZ5/328xRAutz3I6EOFyiVC8p6hA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGtZL5VE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918913; x=1788454913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a929p5LcId2wInBNz54Q3iRlEDtPktYKalwNBM0GW9U=;
  b=GGtZL5VEig0DbkFSqQRWUECtw7rMmX2TQiKLAI2Dea1orPag7N3jVJJI
   VXlQ6aVDhQ9CxiK3qb/1es8pMZAfN0xRSqhTMYFYhN3a5ebhVGV6mqGuc
   UtOvY38ioEpDjN03NtPSsdwv+zTAZ/y+iv4wEw+FgtFPRtbKrcFMr8u8m
   xVBcLDHrDZ8HGYzJqJx248BT5gNSrDNW8sJqCOJ5Rj9m8cTJQGwHtccfc
   YoLIHOzQkUVc12fQxGtuTspjhoCJSR3gB1qeTEy3u3s3zib1tPWQZZGyy
   06edFrEl8Z6DeHPRq0qU4kkqGy05xiFwceYZN/+pYiVozmjUHlGkwPHv0
   w==;
X-CSE-ConnectionGUID: KP0MMsGDRgGTrX8lPMUvcw==
X-CSE-MsgGUID: xcs79Pf/QG6cCojm6hnQZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59178174"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="59178174"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:52 -0700
X-CSE-ConnectionGUID: 726SuWEAQa+qOWhLl3t/Gw==
X-CSE-MsgGUID: pDo9AJweQxuugvmmFRnKsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171778678"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2025 10:01:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 4483B97; Wed, 03 Sep 2025 19:01:50 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 5/7] usb: xhci: improve Command Ring Control register debugging
Date: Wed,  3 Sep 2025 19:01:25 +0200
Message-ID: <20250903170127.2190730-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the debugging output for Command Ring Control registers in the xHCI
driver. The CRCR consist of the following fields:
 bit 0 - Ring Cycle State
 bit 1 - Command Stop
 bit 2 - Command Abort
 bit 3 - Command Ring Running
 bits 5:4 - RsvdP.
 bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.

Instead of printing the entire 64-bit register as a single block, each
field is now printed separately using the appropriate printk() specifiers.
This approach enhances user interpretation and ensures the DMA address
format is displayed accurately.

Except for bit 3, reading the other bits will consistently return '0'.
Therefore, only modified bits and bit 3 are printed.

xHCI specification, section 5.4.5.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5e5681c1eb4e..4526989169a3 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -499,7 +499,8 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 	crcr &= ~CMD_RING_CYCLE;
 	crcr |= xhci->cmd_ring->cycle_state;
 
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting command ring address to 0x%llx", crcr);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Command ring deq %pad running %u cycle %u",
+		       &deq_dma, crcr & CMD_RING_RUNNING, xhci->cmd_ring->cycle_state);
 	xhci_write_64(xhci, crcr, &xhci->op_regs->cmd_ring);
 }
 
-- 
2.50.1


