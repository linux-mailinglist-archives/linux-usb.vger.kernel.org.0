Return-Path: <linux-usb+bounces-30492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F44C57896
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 14:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E273AD310
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED200352929;
	Thu, 13 Nov 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4YREOoe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B5351FB9
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038750; cv=none; b=NATGgICU6ypmUwvjxFdLCnvrxCgynmRYU5kB/FIN7p6V8HGYkzPRvumHrvBPFfRDfn0Hr+H+vT4+E/dAwhfiNlNv4ss82+kEDv3iHq2Y1v+1ptKGjamvUx6eDisRDa7UjPTu3mdR5BGpzu8PyK/smPM0er1Y2f3CE0HqMcM48SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038750; c=relaxed/simple;
	bh=WQCY93oVfivecS1o5iYr9Aiigl200opDbw3B4rrSBFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESmEbnhlXY/FmAMyqeH+jQtSY5bkBeEd/XbdYWdSwt1AFNzaiA6scogDBziiS1aTEu0E2GsMjY2qU6E4R/PgRtHFyz5Lt02lW+mvREtbewUJn6hBB/bw2IRHuaKDwzkm9GrFe+l1Zds5V8MUD4f46GgXWj5c+l4jQGwm6DuawSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4YREOoe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038750; x=1794574750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WQCY93oVfivecS1o5iYr9Aiigl200opDbw3B4rrSBFE=;
  b=n4YREOoewEUjGSN35Sg+MgkwYpAo0ZVO0TjD2PoocRRGdoEdWbKJPelZ
   0eUB07mFuMhJOLTix53+4gBy9BUyDNHLv4KxffpgpS9gW4Y0NIfC5dlDL
   F1QUYWY8ht8wPtkaxv+Ruj4r8iSNuzc5ytVn4pYvCFPhTpUd+zKOWpD/j
   E67C4yt8N8w0MRKabcDf+p4WjkiIAE7xWzLwpCbDBC4kdCr6FiSuOUWcJ
   syLylW2JmoX9rysyrx/DWO+/Myr8Ngm54pNcyTPVrjHhnV5LAh88deH3i
   OUtBO7T4HHiRKwJ0Hb9Uo9J4UkenyAWRadMkiWAjEBKNDWbi96P7rEVKn
   A==;
X-CSE-ConnectionGUID: 36/kSuh1TJeq3D0K7zTNjw==
X-CSE-MsgGUID: 0idR4vR7SjusvFApn9afig==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76577040"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="76577040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:59:07 -0800
X-CSE-ConnectionGUID: 8dlVb5PkRXCbpmLWjw9Nbw==
X-CSE-MsgGUID: AHmvO2ixR5aZ0rFZj3kaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193742301"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 04:59:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 3D44D96; Thu, 13 Nov 2025 13:59:04 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 13/13] usb: xhci: use 64-bit Addressing Capability macro
Date: Thu, 13 Nov 2025 13:56:40 +0100
Message-ID: <20251113125640.2875608-14-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify by replace BIT(0) call with its relevant macro.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 79e707686c1a..294cc9226328 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5480,7 +5480,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * DMA_BIT_MASK(32)) in this xhci_gen_setup().
 	 */
 	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
-		xhci->hcc_params &= ~BIT(0);
+		xhci->hcc_params &= ~HCC_64BIT_ADDR;
 
 	/* Set dma_mask and coherent_dma_mask to 64-bits,
 	 * if xHC supports 64-bit addressing */
-- 
2.50.1


