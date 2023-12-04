Return-Path: <linux-usb+bounces-3668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D768030D8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E00A1F21083
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850FB22EE6;
	Mon,  4 Dec 2023 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbNV6Qxh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD025F0
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686681; x=1733222681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iJHXi3j3U32EWoNcDluKAqucLOZhvERaFM27gw3VDuA=;
  b=PbNV6QxhLOLICQ6uabotNOGNohrs+1lLfVy7e2eXXR+4ONedTZrgepph
   GMHG8vNV+CvurSseGj5vzAkpF+yyCstzzAciX6HsYnDCkOHTF9NMET6Wz
   htyfxNL0X7VjZyhfIwYRVMprhxWRdtXYIoTjxSZpTtx4Udh6eHJIMIpZo
   ZPMNZ67ShGdCQIBJrSVg7bEvYrSkZZKhCdEhQT2kWMucLu6RoBNqfvs+Q
   4zbTYFz0zUN5CBQPJuqUtFR+27OUpMhIlBsiLc2FAL0i55Ch889jMrD0a
   uqxgm1aboVT4ACSy3tNQdOSMxTqGIMS3JdNazh6xO3VGncOpsgpxCzFUD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260664"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260664"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338911"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338911"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:34 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 08/18] xhci: dbc: Use sizeof(*pointer) instead of sizeof(type)
Date: Mon,  4 Dec 2023 12:45:24 +0200
Message-Id: <20231204104534.1335903-9-mathias.nyman@linux.intel.com>
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

It is preferred to use sizeof(*pointer) instead of sizeof(type).
The type of the variable can change and one needs not change
the former (unlike the latter). No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 779a564ad698..8053aa3a7092 100644
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


