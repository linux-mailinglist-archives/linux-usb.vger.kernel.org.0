Return-Path: <linux-usb+bounces-16369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2C9A2300
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 15:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 336E71C22579
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 13:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9015F1DDC3F;
	Thu, 17 Oct 2024 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgRHxQFf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095701DD555
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729170448; cv=none; b=Q0ENSE3BrSbE2ZnfF2+ZQeJlOF6eh9b9+Zj3uNwrWurkmNcIkiwSn5Vhha5drcjvoTikhWp8jgtFKWYt7CBl2yhhJAW0DimP/njvJVlmoSGUyqJU+thRz4rl0BZIhIl6nn0P51Ead2MPqG5HxlMUKxA2w4vXMTG63GUnORCmtRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729170448; c=relaxed/simple;
	bh=lGuzb/ERQnaUKrGTzan8G/swae+p6maGTMxPIG81KS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1hl3j4bRfe8dI87LLii+4Ualb49aXzwPm8w2lF0yCkvR40Zq5yp8W2GU+3wc0lhVe6wlvtSghluh/s/YuDs7ecefeKmvxEhiiZR9752yzBMnbjRF5UE/eKWsoCM8byDbrm29Fw/5f0V5br2lRJSReflIx8tN3KJSnZUG1cc9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgRHxQFf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729170445; x=1760706445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lGuzb/ERQnaUKrGTzan8G/swae+p6maGTMxPIG81KS0=;
  b=ZgRHxQFfgDgrAV5sY6tSA2mOYueZw5PHGLmm+2OhdI04UXDkG1rsDMBz
   ndZ/q5eBWiUSgEonmH64kzYaMPI8JLC7xnkwEC+mmzCiWMMH6blVq7gKe
   Gd4jc/5pecq49MP3uVMZT/pm9/BtRbppFZQDBlEzGiGIMgSzeVJXdgr+o
   0lMtQz6YU1Hso81ht14/Cy+AX1NuwrPSYSHr+QVoLbR6rTw4DJKEJCv3e
   7Jkp58jA9Tvy0TG4IcChGk4SGSWOi9QR99J6xZa4AnzSqMjXZS9kAihD6
   mgfO+l3KEIekIpPz0guMTA+cxtUc1ilSmyksOmH+RKE2VY8FSs+7amIHI
   A==;
X-CSE-ConnectionGUID: fGReWtTdQpuAfReo8xjhbg==
X-CSE-MsgGUID: i7if6o2YRzKWsX+BTzt1+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32452109"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="32452109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 06:07:23 -0700
X-CSE-ConnectionGUID: W05oOlW7S2i6f3ipNsQi0A==
X-CSE-MsgGUID: SJB+99pBQj+06yEOHnKg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109354606"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 06:07:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id E062736B; Thu, 17 Oct 2024 16:07:20 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/8] usb: xhci: improve xhci_clear_command_ring()
Date: Thu, 17 Oct 2024 16:05:04 +0300
Message-ID: <20241017130508.1293021-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant TRB cycle reset, the TRB cycle is already set to zero by
the preceding memset(), making the explicit reset unnecessary.

Clarify ring loop start point. Change the loop start from the dequeue
segment to the start segment. Both approaches achieve the same result,
but starting from the start segment makes it clearer that the entire ring
is being zeroed out.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 62c2fd301456..52c304329f26 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -778,10 +778,8 @@ static void xhci_clear_command_ring(struct xhci_hcd *xhci)
 	struct xhci_segment *seg;
 
 	ring = xhci->cmd_ring;
-	xhci_for_each_ring_seg(ring->deq_seg, seg) {
+	xhci_for_each_ring_seg(ring->first_seg, seg)
 		memset(seg->trbs, 0, sizeof(union xhci_trb) * (TRBS_PER_SEGMENT - 1));
-		seg->trbs[TRBS_PER_SEGMENT - 1].link.control &= cpu_to_le32(~TRB_CYCLE);
-	}
 
 	xhci_initialize_ring_info(ring);
 	/*
-- 
2.45.2


