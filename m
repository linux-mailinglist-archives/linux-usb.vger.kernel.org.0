Return-Path: <linux-usb+bounces-14713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0696DBC7
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 16:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03FF11F22F4F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 14:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D63A16426;
	Thu,  5 Sep 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4qjorFU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EB10A1F
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546678; cv=none; b=aDIV1n3dPncEP0VzkZXV+htdcXHCm9xWT9cdHMBAKLF+VIPGsoGcL5Tj50KyZ/IhYKowhXcAWCYYyRPicv5ovBoGgfeJa7K33Jfbq8i0d+twR4C76vZv6h9CIVdcemUmD4rBBxWs9CVp8exMc0Mg3QPqL7QCRHIJvVYw8yO8luk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546678; c=relaxed/simple;
	bh=CLucGv1pavS/wLejQmnD5HY67vRpdNogchfIfuY5Qzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ouw0j68g2PL2jhjIhO/EeIUu9FixefQ6rzLdV/M89Of37nQzNB90IadV3uYbsaidormhFflkZR0zNOec+kHpNgoojv1FztB3A6pW92g+Mp2BrwPHbMb/129yxQikXOBqI1LTLVgfRuzyffbPOyEOUEZYnNowR5uegxRo8OtCQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4qjorFU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546677; x=1757082677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CLucGv1pavS/wLejQmnD5HY67vRpdNogchfIfuY5Qzc=;
  b=G4qjorFUe2ZyP521TjPxLU/ZIrNEeICC6KJGJCx7WHInyDc0YXoGIG3T
   frQF9zEflkjfgWfAZ3m+CzfSqiUGIXTGDp0M7TOjPz96mIcGpN6KthTTa
   P2dwY6gJhoaMgTecjqAl8g5E5G5HltiVQYidbjG8bKnKhpvthj8fSPu4j
   eh+TryPpFsC+xlMSLcLDd4xK1vIk0uNCvJw3wrrlS/rnhGnJL9eHozzv3
   mf8T2/KNISXFv5IHylNh+Vg9CjwhC4Yf1/Ob4YtWepMqHQT0vliiMyFie
   ErvciKRmupKuYVuK/vDzOep5GhV+hjKX/Fp8jJdFVrYmkmEpFY2DVoE9M
   w==;
X-CSE-ConnectionGUID: OOhyL3iuR4il+95GtbSR4g==
X-CSE-MsgGUID: GY1aayP6TiiDh8ICuwUxvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49677499"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49677499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:31:16 -0700
X-CSE-ConnectionGUID: MccVbFa5SSOSDUFNx8pl2A==
X-CSE-MsgGUID: 8ZAOLlRDTN2HrHWArE3EHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="88883214"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 07:31:15 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/12] xhci: dbc: add dbgtty request to end of list once it completes
Date: Thu,  5 Sep 2024 17:32:50 +0300
Message-Id: <20240905143300.1959279-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure we move the requests from the read_queue to the end of the
read_pool list, avoiding looping and using the same one request all
the time.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgtty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index b74e98e94393..5e567b3eb4d9 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -346,7 +346,7 @@ static void dbc_rx_push(struct tasklet_struct *t)
 			port->n_read = 0;
 		}
 
-		list_move(&req->list_pool, &port->read_pool);
+		list_move_tail(&req->list_pool, &port->read_pool);
 	}
 
 	if (do_push)
-- 
2.25.1


