Return-Path: <linux-usb+bounces-947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F457B57D1
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 18:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id C088B1C2093C
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 16:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1FF1DA51;
	Mon,  2 Oct 2023 16:18:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0071DA34
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 16:18:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E549E;
	Mon,  2 Oct 2023 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696263530; x=1727799530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XhexIisAVKWahtWglpDt4hA3GcZPi6mztI8CxfJXXLo=;
  b=mpbI92o1F0vBH6TzmoruAHDR9PjY1ZGFByAbN+5dPXQ11bv2RaE0SGyj
   wi5LXaNXPfyXval2Kl7GV2txNcfoS92aih0QqoqbmO8NKpmDgKaIzU+2t
   W9aBZH6UmJfVoy3uOStc4S38g6fSo4LI2Z13ehYiFGmHUs4XGLQQlNf8O
   kqzbok6OUBeZnNb1MXCfAHBFp26iOWuLlhRCqHFYyIglwEFww22pWraBq
   2BfGInaf6PrI1Bon7NcTvZjKGU00UMCXfh5ddyGOIHuVYMUMKPcSW3lN/
   P9971Q+hosupLLhyWuOLr5it2y7CshVFTL0wlN5D3rsI0k1k+enEOAdn2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362949514"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362949514"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816339774"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816339774"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 02 Oct 2023 09:16:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 47CFD14AF; Mon,  2 Oct 2023 19:16:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 05/10] xhci: dbc: Check for errors first in xhci_dbc_stop()
Date: Mon,  2 Oct 2023 19:16:05 +0300
Message-Id: <20231002161610.2648818-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
References: <20231002161610.2648818-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The usual patter is to check for errors and then continue if none.
Apply that pattern to xhci_dbc_stop() code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 3c90410e9cde..d110eb5f1625 100644
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
2.40.0.1.gaa8946217a0b


