Return-Path: <linux-usb+bounces-7338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7186CB12
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 15:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EFB11F24088
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148751353E3;
	Thu, 29 Feb 2024 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjBqAZpJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3545B134CE0
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215993; cv=none; b=daaLZfUM4hPsSbxweJuSTHnEijkOkE68hufS/sVg4IuuGkQ47M5DdNEHSyOG8tKMyiTs94HjC6g45RKDnSMS8wm0hvC/sYcrSY4mc0Ezq5SQuCpi5X/3vTuV2ynadtrRBlg1OI0HhQH5yJ+rZ+MJ035u1xg+/9796orSRxZBHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215993; c=relaxed/simple;
	bh=89n19r5KupUpVzKaBY95bg4JqemB4uJxOJX4dx5kJLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CiqfzXtNNwewZ1c6hH9EAUxnx48g/bq702otlDjGgM0b0cDVd0HV3UgaOxurZBH3ASZIt0O6lPdbQ/EjoYPWmbjQcj+Y5jHII4JtgRsQ7okxJeXuIzvKCUPsqszOsxGl5A2VxYdYFfiamHBjgete0H7pruy9sAy57iEoASl14i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjBqAZpJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215992; x=1740751992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=89n19r5KupUpVzKaBY95bg4JqemB4uJxOJX4dx5kJLk=;
  b=YjBqAZpJJzj4OpYSncaQjNq5r+mUmE0HYFhXNhVf+AErRe4VWCR0CdGs
   ot+0cTXkGPQsd27dDShBTXLnAg2SiSHULaJkk3lw77In6xGVDyXWZvSOK
   maoo1opVpk/igQ3CkdNXzo91zramHeyRfno4wcLh7xsT2C1lgqcrLs4I1
   po5cCmf73j+B+e6SlnCP1YrfX2BDSJPlqUqPsgoDDGDzrA2Q78LZYH/R1
   TvW6Ctq4mtwyquaYfH6I2baSjsVmz/BeGP4TtMSMw8eAbQvZ+Eyc34hmA
   rrxWI6rDHwEnGtL0qkNm9+nOiBX+Se2+7rMzNfSOrgNbq8Iy2Jpf6Bvdm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3609383"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:13:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035990"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035990"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 06:13:10 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/9] usb: xhci: remove duplicate code from 'xhci_clear_command_ring()'
Date: Thu, 29 Feb 2024 16:14:33 +0200
Message-Id: <20240229141438.619372-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Replace a segment of code within 'xhci_clear_command_ring()' with a
function call to 'xhci_initialize_ring_info()'. This change eliminates
code duplication, as 'xhci_initialize_ring_info()' performs the same
operations as the replaced code.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c50d5881e214..5d70e0176527 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -794,19 +794,7 @@ static void xhci_clear_command_ring(struct xhci_hcd *xhci)
 		seg = seg->next;
 	} while (seg != ring->deq_seg);
 
-	/* Reset the software enqueue and dequeue pointers */
-	ring->deq_seg = ring->first_seg;
-	ring->dequeue = ring->first_seg->trbs;
-	ring->enq_seg = ring->deq_seg;
-	ring->enqueue = ring->dequeue;
-
-	ring->num_trbs_free = ring->num_segs * (TRBS_PER_SEGMENT - 1) - 1;
-	/*
-	 * Ring is now zeroed, so the HW should look for change of ownership
-	 * when the cycle bit is set to 1.
-	 */
-	ring->cycle_state = 1;
-
+	xhci_initialize_ring_info(ring, 1);
 	/*
 	 * Reset the hardware dequeue pointer.
 	 * Yes, this will need to be re-written after resume, but we're paranoid
-- 
2.25.1


