Return-Path: <linux-usb+bounces-22745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DCBA804B5
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49F9888117B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D349E26AA8A;
	Tue,  8 Apr 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJNO4WUI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F9D26A1BD
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113595; cv=none; b=NoCIprh9N06IJaUnfbVuDM8X3g9PXowmOW7+KzO0nZLfDogPBZp6/IN5hnFR1DMpMTJYWGxSgx7EpExG8m/S9xiNqQ7xTIVxwr30hfRsdPV+gTTvjAlDoFKYZOeyhDZoftxs7cmHetckTWthqETESlUoLVV/BSOTC0AXSDOpWEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113595; c=relaxed/simple;
	bh=xGt0mxrN7AiVppxGA1MpDekMAPzUwM4oMwXZAoKWQf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0ojuWp8ycOcm5MNw8374dxwdhhB/K1lptEWzrXuR0iafOE+8d7+TulsnFWSKkxtJOhARiuYJAWQRduMWFSvWWhzfb7RxvqvFw+RD7/qLrLqKFeNmi96TmRGt0N4lPFricSFgtbpgmXqFW4px1vHDfQFVNHKRsUNhZxFWjX2VBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJNO4WUI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113594; x=1775649594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xGt0mxrN7AiVppxGA1MpDekMAPzUwM4oMwXZAoKWQf8=;
  b=UJNO4WUIXdjjVdCP1hQhBOcwiQxerE1VpSoV6V5TSvmrjJf4kC84+/aP
   Ry+w8lLDRraHRwSPNbkTNIJJSiR1k9V3sJSWPtNUSxeV8Pf8CwIMUPl1s
   pX519eLaQyH8N9BYM6ZofdbG6014GTr+8QrAfbNQk6q3QImUW7RBQUlU6
   AOwsWm+zR9Smv8CMHrp2Stz+t3HWLms6jtsi4suRXy6VHN0Xxm2rKfdsq
   zATW5dVm9vHAVBfLOZq7r7CnvnNrcw8RKy0rd2e3iYGqtfA9iUSMGa+hC
   e21zoutLoS/dHJ48vNuGGetftBa1koLSkkxiIv8DSoVJqpaI/1FEZhkrC
   A==;
X-CSE-ConnectionGUID: qs8COjrUR+iGJJg8W+9eCg==
X-CSE-MsgGUID: QOlJmp7zQVycaAvxHpCSbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45676469"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45676469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:59:52 -0700
X-CSE-ConnectionGUID: IFlesGr5SvSiWHBmM7yWHA==
X-CSE-MsgGUID: vwlHScdASI+jWRVTFcTQAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151428056"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 04:59:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 4879C484; Tue, 08 Apr 2025 14:59:50 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 5/9] usb: xhci: rework Event Ring Segment Table Size mask
Date: Tue,  8 Apr 2025 14:57:48 +0300
Message-ID: <20250408115752.1344901-6-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Event Ring Segment Table Size Register contain two fields:
 - Bits 15:0:	Event Ring Segment Table Size
 - Bits 31:16:	RsvdZ (Reserved and Zero)

The current mask 'ERST_SIZE_MASK' refers to the RsvdZ bits (31:16).
Change the mask to refer to bits 15:0, which are the Event Ring Segment
Table Size bits.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 4 ++--
 drivers/usb/host/xhci.h     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index ebbf5f039902..b6a2b0c01eb2 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1802,7 +1802,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	 */
 	if (ir->ir_set) {
 		tmp = readl(&ir->ir_set->erst_size);
-		tmp &= ERST_SIZE_MASK;
+		tmp &= ~ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
 		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
@@ -2306,7 +2306,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 
 	/* set ERST count with the number of entries in the segment table */
 	erst_size = readl(&ir->ir_set->erst_size);
-	erst_size &= ERST_SIZE_MASK;
+	erst_size &= ~ERST_SIZE_MASK;
 	erst_size |= ir->event_ring->num_segs;
 	writel(erst_size, &ir->ir_set->erst_size);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 20e5b6ebbab1..5e5b71958745 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -252,8 +252,8 @@ struct xhci_intr_reg {
 #define ER_IRQ_COUNTER_MASK	(0xffff << 16)
 
 /* erst_size bitmasks */
-/* Preserve bits 16:31 of erst_size */
-#define	ERST_SIZE_MASK		(0xffff << 16)
+/* bits 15:0 - Event Ring Segment Table Size, number of ERST entries */
+#define	ERST_SIZE_MASK		(0xffff)
 
 /* erst_base bitmasks */
 #define ERST_BASE_RSVDP		(GENMASK_ULL(5, 0))
-- 
2.47.2


