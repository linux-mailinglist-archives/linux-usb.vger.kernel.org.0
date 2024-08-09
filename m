Return-Path: <linux-usb+bounces-13270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A89894D066
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 14:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167831F22351
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 12:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E9C194A66;
	Fri,  9 Aug 2024 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duY3yw7Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395E194A5A
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723207351; cv=none; b=CZvgZ+WtrgImtuYAOhBDsqKTu3SuQlx6L8C7e5lcay+jiArB3eyavp1h7udKb3YnxQeKt0X8dQHzkRVmeep1UISP5IUlHOJSMwmKI5sWar7c8P6kerxHT0VZGU2UDIHascxbU46KzKTryPp5X6jqIv7Xpp1ePNKyiVXUAmlThf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723207351; c=relaxed/simple;
	bh=/tgxg9Rz9lLOKJNNeC9Ad+nzDvDpm+GDVGMfJrFQD/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g7giYSDPaZDyCqoikF53HN8Ta2SsNUV7aY/HBrPskcRDPfmzpM4UBbZSDKvQvh+j+Bb57/jc7gr+kQpNd2IQlzP58YsufVNvjRrPw3c9K4zxLwC+aJ3bTtCaAT2lkeAdJqkioA7aNdztnQ/gmoqezENQLpwrXlFxPoaKCXVd3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duY3yw7Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723207350; x=1754743350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/tgxg9Rz9lLOKJNNeC9Ad+nzDvDpm+GDVGMfJrFQD/g=;
  b=duY3yw7YD0AaMhnkDNMrOwZu6sRgsx+tr2Qxee5qDSv2RoXE+H1/2ltX
   xUu4P/U2U4mUof6ix0uU8wWQNaQTewz1K8v60sy4p9Gr1vWU8Cx78a1Le
   ttttC87pE7jEBT1vgsO0K73KIIlVHh/sCQrvnAj16VB2ZfkPrW8w0G8KP
   uQOK+gkCz21RrwlxPTagIJ+gtK+X1bR9EYah9S9+nqUvzfkGQiUN1aYds
   T622o/KD7Ak6iN7Y+IKnexSTE5gBNDbx06ydl/mwUgopmXjwbI7JRQpzI
   8PKu3qMqm0M1RSZTtYyS8stWjM1ytPPghyxU+aO4CAsIR3C57ksTfgVJ5
   w==;
X-CSE-ConnectionGUID: V1Y1B3GWTzaL8szVcS83QQ==
X-CSE-MsgGUID: SzzLCzCIQdKMhPsp0ybuiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32768618"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="32768618"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:42:30 -0700
X-CSE-ConnectionGUID: IWus64/sSousJdgDTUkFkw==
X-CSE-MsgGUID: eV9iidRrSeehjq79aCd5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57473989"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2024 05:42:28 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/2] usb: xhci: fix duplicate stall handling in handle_tx_event()
Date: Fri,  9 Aug 2024 15:44:08 +0300
Message-Id: <20240809124408.505786-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809124408.505786-1-mathias.nyman@linux.intel.com>
References: <20240809124408.505786-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Stall handling is managed in the 'process_*' functions, which are called
right before the 'goto' stall handling code snippet. Thus, there should
be a return after the 'process_*' functions. Otherwise, the stall code may
run twice.

Fixes: 1b349f214ac7 ("usb: xhci: add 'goto' for halted endpoint check in handle_tx_event()")
Reported-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b7517c3c8059..4ea2c3e072a9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2910,6 +2910,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
 	else
 		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
+	return 0;
 
 check_endpoint_halted:
 	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
-- 
2.25.1


