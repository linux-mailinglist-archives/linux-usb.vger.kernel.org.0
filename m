Return-Path: <linux-usb+bounces-3552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8859800DEC
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156521C20FFE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397063E460;
	Fri,  1 Dec 2023 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ae9Fc7P9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713B010F8
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443150; x=1732979150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m2p+6Tu1KkmGHBeJ1Zq4LR9AjDNyGXuey9lfazNYhwc=;
  b=ae9Fc7P9dGReM3lLS14Yk0gcxAiLnb70GLb5pmREQBErn6helPW2PN5R
   OgON2WXCU7d6KhXNy8QsUIPPYrzg2x+YPFKhwOSxRB/jBAOAigUJCjc/b
   iX8n5kayXIkKASpe/TtxWRzeW1P+7IAO/dXGcPF5hCNeP/PTZ13WISlxm
   L2WXXIOIBUa5Q9Rxv2Paz44Gop5OG3/y3Jr1zkox1TAI8Ue/q5o16y74J
   sCr+hbim+/59V6bnMajJiPyT2iKC5Ulce7tgznZLrxes6qOZGpjQGRcsu
   tPQlChyjc8q+MSqgR9/7D4A1mRbB45JO+71snOTE34mLx5/pb9AiO/gM/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309704"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309704"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112535"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112535"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:48 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 05/19] xhci: dbc: Check for errors first in xhci_dbc_stop()
Date: Fri,  1 Dec 2023 17:06:33 +0200
Message-Id: <20231201150647.1307406-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
References: <20231201150647.1307406-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The usual pattern is to check for errors and then continue if none.
Apply that pattern to xhci_dbc_stop() code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 660e3ee31dc6..6b9f4b839270 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -646,11 +646,11 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 	spin_lock_irqsave(&dbc->lock, flags);
 	ret = xhci_do_dbc_stop(dbc);
 	spin_unlock_irqrestore(&dbc->lock, flags);
+	if (ret)
+		return;
 
-	if (!ret) {
-		xhci_dbc_mem_cleanup(dbc);
-		pm_runtime_put_sync(dbc->dev); /* note, was self.controller */
-	}
+	xhci_dbc_mem_cleanup(dbc);
+	pm_runtime_put_sync(dbc->dev); /* note, was self.controller */
 }
 
 static void
-- 
2.25.1


