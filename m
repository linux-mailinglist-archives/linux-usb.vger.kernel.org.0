Return-Path: <linux-usb+bounces-9898-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC5C8B5AB5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 16:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F9E1F2177F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB1977F15;
	Mon, 29 Apr 2024 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzG7hs+1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1AB74C08
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399267; cv=none; b=Dj+QxY6OtnFMfbQyBCWKm2euCwi/mZ/zyyLY3yt6b/dxdjgJt54qzRFXuD4oiwCZAIn8D8W0IzPEUKcNdiQ6hcW30QXc0VAr12UVPR8PxCSn0apSptlMScvl2zu/HVIemTh9JAS04dBu/y7jQa3Pywm8WLBsFXdA22AjsnD0c7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399267; c=relaxed/simple;
	bh=gh7v0TPcm8kafkASBUIJLKChTl6CDwYRLGq0V7ItfFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zo0ar3SB2Envzi86GmVP325O33sSmpdHz607gbPMNi5ZJnRHQeWKxkzc+cWxKOlPaCKXulByNGZCFrC7896TtcZr/WZlkYWa0ulrmzNoM/47TpB7yH42p4YQJe1xhqly++KsvTXx4R4p053AdXGDP7KMUXEL451DnSl2CHt/m9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzG7hs+1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399265; x=1745935265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gh7v0TPcm8kafkASBUIJLKChTl6CDwYRLGq0V7ItfFY=;
  b=HzG7hs+1wGcytG/vOA0QrI6OEDeaBwoSE87xWPSNR7GOVq3ILT1myDbg
   /kx0hWauWzeAOcd2VMlBRaUgc6MS6ZWv6IBJoNgFbxMBmyDdgkCLP4QUs
   NaT67yItYmuJJetgiFyTd/pW6VYV5FdMv2aKSnFfVKq8s8FmuLwP1B1KZ
   TJG6U8TPd2dhzgxkU2RiAQ42TSQPQ4C+CthVAmcGyM3LJu1r+NJVf9AtR
   5bgzA6liVY2NZdSaHDs64RXl3PpYFv8ahkSVMgnZzk4acUXmIEzlwxfQx
   YPz1dzqvMhjzbVkv7dqhFLZC26dLYpO/QjpCHi1T+H4M1TSHrRS9w6Y/x
   Q==;
X-CSE-ConnectionGUID: ohJk6EvaRLOx4VMl5f6BhQ==
X-CSE-MsgGUID: phStoBo5TbmHl9m7GQltsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9911423"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9911423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 07:01:05 -0700
X-CSE-ConnectionGUID: MmsuarwLTdSrxsnOq2Wi3Q==
X-CSE-MsgGUID: S5WVU9JiQ62s/ATP6xPPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26521744"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 07:01:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/18] usb: xhci: address off-by-one in xhci_num_trbs_free()
Date: Mon, 29 Apr 2024 17:02:32 +0300
Message-Id: <20240429140245.3955523-6-mathias.nyman@linux.intel.com>
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

Reduce the number of do-while loops by 1. The number of loops should be
number of segment + 1, the +1 is in case deq and enq are on the same
segment. But due to the use of a do-while loop, the expression is
evaluated after executing the loop, thus the loop is executed 1 extra
time.

Changing the do-while loop expression from "<=" to "<", reduces the loop
amount by 1. The expression "<=" would also work if it was a while loop
instead of a do-while loop.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3cc5c70d54c7..0a7c70ae5edc 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -308,7 +308,7 @@ static unsigned int xhci_num_trbs_free(struct xhci_hcd *xhci, struct xhci_ring *
 		free += last_on_seg - enq;
 		enq_seg = enq_seg->next;
 		enq = enq_seg->trbs;
-	} while (i++ <= ring->num_segs);
+	} while (i++ < ring->num_segs);
 
 	return free;
 }
-- 
2.25.1


