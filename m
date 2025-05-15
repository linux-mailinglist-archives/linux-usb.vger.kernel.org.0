Return-Path: <linux-usb+bounces-23981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED88AB889E
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D6BD1893223
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4C218C322;
	Thu, 15 May 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJTXmQef"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12600198823
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317392; cv=none; b=LgsRPYs84nq2KwC+Yo016tzHLDz7KH4c2tCaYjPl0FgazCGR5VgHgTQT1oWHMIll6N/v0a2Xc/ngk7pOgftcQszVWlG+1YSwwEQA/f+8BQGWuB+D5BlFNiVivX2647lch5JO2IEy+qChKcV4LUppxTo1z00t4RkjKTiPsYSqSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317392; c=relaxed/simple;
	bh=ScoFeJpto2ARbUmsCalrnyX52pQexxvIr2G37W8CNzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDVzNLeD1H2pIpfHdfWC6OrIV2abBDtlM4suzxiQwf5tfPk9pcQXMuiju8rNfox5w/9zhxooxrUR3retfBOaInqCDAS6bMfiDDgXYvEP14NT6OpkAmN7fp/Jf+WJWa7tvceetipRBpnqwWnNnOnPh7wbWu171rJvZrvbhETCU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJTXmQef; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317392; x=1778853392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ScoFeJpto2ARbUmsCalrnyX52pQexxvIr2G37W8CNzs=;
  b=PJTXmQefPl9o5nEIp+oy2DKiSrm22jAkOWw2K7edWMEf7o6MSRZfuvV1
   XgxW1kpGyC2m4i//pdM4Fks9wG+imIY0NnPM1aC8DI0UBQpe2Wy1QjnkN
   nI5aAiv1mJl4FgI1PuXwVGmmLWBPz7J6Fxcegb7+7q0f6RS8nOeeBjjSg
   vF/pLiPo/pLfs1qCsFQ5OPAi88c32ip3mJQ/gyfkLDndycUPo2GJQoOEu
   atKFOVCzw8q2fBYK3rcbVZElSn35D2MKJcPwntDMGWK/bt5oH45pZA3pH
   X1ARi+6tJBgnWVoZ6IHnhZHJE7L/DjvlmUxqI9mf6/fI4XkqblOv84JbE
   g==;
X-CSE-ConnectionGUID: 0Tdflsm+TK6hABr+ls5Ilg==
X-CSE-MsgGUID: NfE/OIAFQC2z6TQO779cYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60269987"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60269987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:31 -0700
X-CSE-ConnectionGUID: bS88wonTR/WqSNw0LHggEw==
X-CSE-MsgGUID: 2ooEJOarTjeMa8Pczp3Kug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372040"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:29 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/24] usb: xhci: Don't log transfer ring segment list on errors
Date: Thu, 15 May 2025 16:55:58 +0300
Message-ID: <20250515135621.335595-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

The error message above used to span two lines, rarely more. A recent
cleanup concentrated useful information from it in one line, but then
it added printing the list of all ring segments, which is even longer
than before. It provides no new information in usual cases and little
in unusual ones, but adds noise to the log. Drop it.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index d4e157e66473..e70bf7a27556 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2978,9 +2978,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
 		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
 
-	xhci_for_each_ring_seg(ep_ring->first_seg, ep_seg)
-		xhci_warn(xhci, "Ring seg %u dma %pad\n", ep_seg->num, &ep_seg->dma);
-
 	return -ESHUTDOWN;
 
 err_out:
-- 
2.43.0


