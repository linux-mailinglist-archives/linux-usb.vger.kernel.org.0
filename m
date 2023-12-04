Return-Path: <linux-usb+bounces-3664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCD8030D4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BD21F20FE0
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A573D22EEB;
	Mon,  4 Dec 2023 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjb7uxIw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEF0DF
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686680; x=1733222680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m2p+6Tu1KkmGHBeJ1Zq4LR9AjDNyGXuey9lfazNYhwc=;
  b=bjb7uxIwomtY0ikLDBoG7VORa6Nv30pAaTcY4CKbH2lVdGHA0bx7G1mc
   8jE63PgGSH9mvfUKftrl/jFb1FPq5Mz5qWPVPdCFRaxsCcqaxKPnvSoAx
   IEY2+bimhGBrQPqKcmPawPIVuOSwFesW1ynPNkVIA7mSK1wG96h63Z10t
   B8MQ8NxnyWTYgM+6wUryF0IRYR1Oz3jFg4imV3BkPYwnZEMpyo8KvE9XN
   1sA1blARvEdbBjCAw+qgs7dVgBaV+1shz7szZcqDzcZ7VRxneZw1umOa4
   hhmBJklUr8ayEx6zs23PFfcOdD8GbIigYNwUdy1t5SlRetY+8oAxfw7SB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260655"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260655"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338892"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338892"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:29 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 05/18] xhci: dbc: Check for errors first in xhci_dbc_stop()
Date: Mon,  4 Dec 2023 12:45:21 +0200
Message-Id: <20231204104534.1335903-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
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


