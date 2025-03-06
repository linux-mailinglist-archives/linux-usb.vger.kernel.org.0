Return-Path: <linux-usb+bounces-21441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341FA54E31
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 15:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B667169A1C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 14:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5465818A6AF;
	Thu,  6 Mar 2025 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePTjGjr+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E46189520
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272580; cv=none; b=PlVHgzJyVwuqBpOqH5XQy1W+QflQe6WI9S/dTGYaDbQC/nOmTFKoBQE2MhVRObeqLmbr6xmWcEuIt+u7I5y5riMBXkpxPmTlZvG/mUyXvrO5mytrH/X4Rs7+RYxrhZWkMRteZBtRHbwRWdHn0McLg+5ZnhQl1IijF4VSNDfUIjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272580; c=relaxed/simple;
	bh=WlPYjLgbpW13RkXfUCvYmGhjGRIj2KD2O+2YVWR1p3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOpw/chaUfSmI/JL8SCzb4cYAfsftD0a+0OVv3wQLSjoaLiaFxBvmAWhpVRUyXFvLDd/0BdsaS1FfHlIGLfACTbxXG1RGrI0LdQy9eOTFFCJcPU+Of8MYHkidUBcY8/ldiTpzlq3QnNm9sbeKsVwDuKbjnQT97TCRmcVhZb7JXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePTjGjr+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272579; x=1772808579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WlPYjLgbpW13RkXfUCvYmGhjGRIj2KD2O+2YVWR1p3k=;
  b=ePTjGjr+etrsGL+sr28n+tpjBzqh2DAyAkjAdTrtm19tedkGN5Zhj92N
   +EDwY7reDbc64yD9osRhFTXFENHpsfU0dSJz4zet1L7abLKClGJ5raaiF
   wBpwZ8pAw+mP3idsxJVCgL91g7BMfV0uLqRdXpX7BcM/q80ufV0/NLeeo
   0Bqqrdmld/FOrrqLoT9AX69PgURxb68yVHHQlcKt/TJLGJvIyCJdlXcQy
   gm24wjxXhlxJG/eT+hA4UOpZ6hDZVi9ANtW1+KTJ3OO64oybaEPjfueHo
   TWf9PPW/h5zvTOF4McjPu4T56R7MmoMwBNO6iH0WfyzWc0ktTOBj8j9Vw
   w==;
X-CSE-ConnectionGUID: u4gMUdjvSE+sqTPTWwbxxg==
X-CSE-MsgGUID: iaC7cTXPTFqxsMa/OMQi3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67657101"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="67657101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:49:38 -0800
X-CSE-ConnectionGUID: ymb58kyqQ2aeHZnRG4mxBQ==
X-CSE-MsgGUID: 4QwmtPDQRr2kSRa4R/S3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119954831"
Received: from unknown (HELO mattu-haswell.fi.intel.com) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 06:49:37 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/15] usb: xhci: correct debug message page size calculation
Date: Thu,  6 Mar 2025 16:49:47 +0200
Message-ID: <20250306144954.3507700-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
References: <20250306144954.3507700-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The ffs() function returns the index of the first set bit, starting from 1.
If no bits are set, it returns zero. This behavior causes an off-by-one
page size in the debug message, as the page size calculation [1]
is zero-based, while ffs() is one-based.

Fix this by subtracting one from the result of ffs(). Note that since
variable 'val' is unsigned, subtracting one from zero will result in the
maximum unsigned integer value. Consequently, the condition 'if (val < 16)'
will still function correctly.

[1], Page size: (2^(n+12)), where 'n' is the set page size bit.

Fixes: 81720ec5320c ("usb: host: xhci: use ffs() in xhci_mem_init()")
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..dc5bcd8db4c0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2391,10 +2391,10 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	page_size = readl(&xhci->op_regs->page_size);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Supported page size register = 0x%x", page_size);
-	i = ffs(page_size);
-	if (i < 16)
+	val = ffs(page_size) - 1;
+	if (val < 16)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size of %iK", (1 << (i+12)) / 1024);
+			"Supported page size of %iK", (1 << (val + 12)) / 1024);
 	else
 		xhci_warn(xhci, "WARN: no supported page size\n");
 	/* Use 4K pages, since that's common and the minimum the HC supports */
-- 
2.43.0


