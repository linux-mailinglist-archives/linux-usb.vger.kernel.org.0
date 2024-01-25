Return-Path: <linux-usb+bounces-5506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1E83C67F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 16:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25C011F22AB6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 15:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DC073162;
	Thu, 25 Jan 2024 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjK3HFNU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6586C63411
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196372; cv=none; b=uGjuL8R1hw/7HC7nxPVxIYGXsIAp1kGObqsFp+qR+4ctPyYb319yc7mtOrK1MiwLr0rf2003pB7yrcvnOWtO5wGf5SiLf0P+xed3ur2ocNNF0zYC86wA31CGc1ZGxPuGcMJ/QveiPeA49Q4eS2LaqisO9sYCT5KdNfPHqD2xRDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196372; c=relaxed/simple;
	bh=7zpiG3WM9+M2C982iPJzrxRyKJXcVSLtl4XnxF98gVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q+3Defjd1YnNLEYfjdUn4/SYgWcNTjKV71FzstV5l5uSlaB/deyW8tgX6gFIrD16QzenyNGFtXS3Eg7e8RdHFHNN6OhIVwVAVqaDH1Qf5p2WYm8RF0jZRA0A6iQMrSRgiJuVrSz5L/RFyFiUQ5VSLY5lOT0AotPlxxncZOcfe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjK3HFNU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706196371; x=1737732371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7zpiG3WM9+M2C982iPJzrxRyKJXcVSLtl4XnxF98gVU=;
  b=PjK3HFNUl4GyNcKMGPm8gOlxH/Oa2KyOrZNcpNh3MFNgbXZizrRNFtWx
   Oh4fiPadVh5hnSpgLMx+uSclHC5H9it3KTJC+/N8CV20zGWBfkGAQDVOT
   goiY7acG9I00AUV7MOPEYSIn1MJAUr4MqSe3Ig1zqSOG0+z23XHpdwdpq
   WpHUQRqlhVKIxSvKK7ek0VHZA+Y4hwo5ZYGff4W7PTbLwQ7qfi0OJIwJH
   PqyEC966Drl7zQlzoCeLwQOBR91Slr5//hOE66etQU5xhY9hqhI3YXHKe
   UNp1p3FfnjyUWctjEqrEZgnXrXUlbBp+IxR8My+eDo18o9NjEwzfqGkrD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23651340"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="23651340"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 07:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857099925"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="857099925"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2024 07:26:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 1/4] xhci: fix possible null pointer dereference at secondary interrupter removal
Date: Thu, 25 Jan 2024 17:27:34 +0200
Message-Id: <20240125152737.2983959-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125152737.2983959-1-mathias.nyman@linux.intel.com>
References: <20240125152737.2983959-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't try to remove a secondary interrupter that is known to be invalid.
Also check if the interrupter is valid inside the spinlock that protects
the array of interrupters.

Found by smatch static checker

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-usb/ffaa0a1b-5984-4a1f-bfd3-9184630a97b9@moroto.mountain/
Fixes: c99b38c41234 ("xhci: add support to allocate several interrupters")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 4460fa7e9fab..d00d4d937236 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1861,14 +1861,14 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	unsigned int intr_num;
 
+	spin_lock_irq(&xhci->lock);
+
 	/* interrupter 0 is primary interrupter, don't touch it */
-	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
+	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters) {
 		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
-
-	/* fixme, should we check xhci->interrupter[intr_num] == ir */
-	/* fixme locking */
-
-	spin_lock_irq(&xhci->lock);
+		spin_unlock_irq(&xhci->lock);
+		return;
+	}
 
 	intr_num = ir->intr_num;
 
-- 
2.25.1


