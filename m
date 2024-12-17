Return-Path: <linux-usb+bounces-18589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C509F49E1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 12:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E2C188B908
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB31D1EF080;
	Tue, 17 Dec 2024 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcQQefc0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94250276
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435000; cv=none; b=NhIjmQkNdTyivduAHyckLMdQ+y4VpgWIDx6xbCp7hVhJb+QzQJj/vTcCcfH4y+hN1W9jPiWWyuQzOh3If15GY0JFtkAp3TA/+nOPzpsItKkdNXDn2RBFM/qjFqqlGzntIDWpDAdnvRIX8/zxQRMdgGCp5MBOtyI6t06SLc+LKyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435000; c=relaxed/simple;
	bh=EaCMqDtjWKg5GBGxwi9bC6xq2JVR5kXx2gixI+UMdvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvyBUcHepa6dkERmobFLsLG63Q8yYbm+8ZGfobd5CcrsuxEnFZYyNUxXZSPlDovt9d+J63GvID5dhyKqaFYJrrd92sJTgLLK8pqJvkour2yOKt6ZVWtnU/1Tv7/wX5GvSyjndexefc/geeNBKm36ioEVhmIbGH8g3yf7M6JboTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcQQefc0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734434999; x=1765970999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EaCMqDtjWKg5GBGxwi9bC6xq2JVR5kXx2gixI+UMdvQ=;
  b=KcQQefc0GmVtk+cpEHp4gHhqHgWI2yE/F4xa049AUScG6aYE/VzgwjHX
   c7/YIca4Yv/yRQNvmWCRFur0SwIXvCQDJkGvIOJDk8DQBmlRSPOT7leLF
   GzT77jQcsYV+JUPQrPfS/2SVUZcY8S1clhdKXYum471FbxCRjhs7J/Nhp
   GpQmwUPskrNBeg4OSIKM0vdf4KZ5DNQo9+8SD1XJm5DVi0Bsig06F3Mft
   vjCnq0Hox060dlFQCyWBUP84wRzLwUeNdAEJsdCZXiSFClYxtzonbe+Mp
   1pl+9hiybkzGlSajlXsXX/F0R9MohLl28L7+EO1kZMgSKXRnsVuXJR6JS
   A==;
X-CSE-ConnectionGUID: pxDjwdtHSviJy5qOd7cD8Q==
X-CSE-MsgGUID: oEqNqOFSQRO7pc9GfzCD0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34146758"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34146758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 03:29:56 -0800
X-CSE-ConnectionGUID: p8Sm3blSS5GAVxspwV1jzw==
X-CSE-MsgGUID: geZaBBQlQiyVWytCfLsf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120766573"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2024 03:29:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 443D8331; Tue, 17 Dec 2024 13:29:53 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: WeitaoWang-oc@zhaoxin.com,
	mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/2] Revert "xhci: Fix TRB prefetch issue of ZHAOXIN hosts"
Date: Tue, 17 Dec 2024 13:29:17 +0200
Message-ID: <20241217112917.623898-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217112917.623898-1-niklas.neronin@linux.intel.com>
References: <20241217112917.623898-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2a865a652299f5666f3b785cbe758c5f57453036.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 8 ++------
 drivers/usb/host/xhci-pci.c | 7 +------
 drivers/usb/host/xhci.h     | 2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 471afeba2828..3a0b98a427e9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2439,12 +2439,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	 * and our use of dma addresses in the trb_address_map radix tree needs
 	 * TRB_SEGMENT_SIZE alignment, so we pick the greater alignment need.
 	 */
-	if (xhci->quirks & XHCI_ZHAOXIN_TRB_FETCH)
-		xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
-				TRB_SEGMENT_SIZE * 2, TRB_SEGMENT_SIZE * 2, xhci->page_size * 2);
-	else
-		xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
-				TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE, xhci->page_size);
+	xhci->segment_pool = dma_pool_create("xHCI ring segments", dev,
+			TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE, xhci->page_size);
 
 	/* See Table 46 and Note on Figure 55 */
 	xhci->device_pool = dma_pool_create("xHCI input/output contexts", dev,
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index cb07cee9ed0c..c8322bb828a6 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -473,13 +473,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_ZHAOXIN_HOST;
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 
-		if (pdev->device == 0x9202) {
+		if (pdev->device == 0x9202)
 			xhci->quirks |= XHCI_RESET_ON_RESUME;
-			xhci->quirks |= XHCI_ZHAOXIN_TRB_FETCH;
-		}
-
-		if (pdev->device == 0x9203)
-			xhci->quirks |= XHCI_ZHAOXIN_TRB_FETCH;
 	}
 
 	if (pdev->vendor == PCI_DEVICE_ID_CADENCE &&
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 03c0f2226571..03a1c31228fc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1620,7 +1620,7 @@ struct xhci_hcd {
 #define XHCI_EP_CTX_BROKEN_DCS	BIT_ULL(42)
 #define XHCI_SUSPEND_RESUME_CLKS	BIT_ULL(43)
 #define XHCI_RESET_TO_DEFAULT	BIT_ULL(44)
-#define XHCI_ZHAOXIN_TRB_FETCH	BIT_ULL(45)
+#define XHCI_ZHAOXIN_TRB_FETCH	BIT_ULL(45) /* Deprecated */
 #define XHCI_ZHAOXIN_HOST	BIT_ULL(46)
 #define XHCI_WRITE_64_HI_LO	BIT_ULL(47)
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
-- 
2.45.2


