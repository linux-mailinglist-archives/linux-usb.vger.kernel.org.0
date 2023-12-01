Return-Path: <linux-usb+bounces-3556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98115800DF0
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C866B1C212C5
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F98F4A99C;
	Fri,  1 Dec 2023 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipIPK2wt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3A610F9
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443157; x=1732979157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mI5a0q49215kEf4DX3nYkdjXNjVH4U9+9HhGfVzgrzw=;
  b=ipIPK2wtBVzHrfcHo6XoHVcP8dwHZ/zA2DeVzqza0fpGjfZzPKrx0zuo
   aAuC7+6TqdOn55iwDCkBP9yC28zYMpZenK0v51Q8g/qgUIA8iFO4bXS6d
   pI7K6siyBhMaz6k7HEwJ9llJJQbX6X2y+ZuN8qE2HKl3D58XGCEBuy0kx
   /GHeX8Gm03tZw4HcYzDoqUHaHWUs8w9qn+gfiCiKCg8IPHu0APF0l9fO8
   SXO4hCtON7K2yYHh1e/7zJKfhPftSAdG4Ytb+pxe6eme4RhYZRa3+tC4S
   6qCtUbzzwGam1lw2ZX0m+m1jWq/df8VrTfIgPdtvvCYqCPFlk+kWiwZH1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309737"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309737"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112573"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112573"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:55 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/19] xhci: dbc: Use sizeof(*pointer) instead of sizeof(type)
Date: Fri,  1 Dec 2023 17:06:37 +0200
Message-Id: <20231201150647.1307406-10-mathias.nyman@linux.intel.com>
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

It is preferred to use sizeof(*pointer) instead of sizeof(type).
The type of the variable can change and one needs not change
the former (unlike the latter). No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 0c9fd61e9c5b..73494d55b0be 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -380,7 +380,7 @@ static void xhci_dbc_eps_exit(struct xhci_dbc *dbc)
 static int dbc_erst_alloc(struct device *dev, struct xhci_ring *evt_ring,
 		    struct xhci_erst *erst, gfp_t flags)
 {
-	erst->entries = dma_alloc_coherent(dev, sizeof(struct xhci_erst_entry),
+	erst->entries = dma_alloc_coherent(dev, sizeof(*erst->entries),
 					   &erst->erst_dma_addr, flags);
 	if (!erst->entries)
 		return -ENOMEM;
@@ -394,7 +394,7 @@ static int dbc_erst_alloc(struct device *dev, struct xhci_ring *evt_ring,
 
 static void dbc_erst_free(struct device *dev, struct xhci_erst *erst)
 {
-	dma_free_coherent(dev, sizeof(struct xhci_erst_entry), erst->entries,
+	dma_free_coherent(dev, sizeof(*erst->entries), erst->entries,
 			  erst->erst_dma_addr);
 	erst->entries = NULL;
 }
@@ -494,7 +494,7 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 		goto ctx_fail;
 
 	/* Allocate the string table: */
-	dbc->string_size = sizeof(struct dbc_str_descs);
+	dbc->string_size = sizeof(*dbc->string);
 	dbc->string = dma_alloc_coherent(dev, dbc->string_size,
 					 &dbc->string_dma, flags);
 	if (!dbc->string)
-- 
2.25.1


