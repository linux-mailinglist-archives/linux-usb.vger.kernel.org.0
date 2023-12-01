Return-Path: <linux-usb+bounces-3548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8089800DE7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 16:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52081C21063
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 15:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A6F3E460;
	Fri,  1 Dec 2023 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHII7qES"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D7B193
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443143; x=1732979143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pmgPGc1srr1dzu/HPKmpJ+L8TTfBdUlMHyhoyA6SiTQ=;
  b=nHII7qESLRa5spQ9S96a5xZwTKxwVe/PiKkJ9023N4QAYMugYCJiA5na
   rwQWwCc4RjeMuZuzBMHcVNotNMVymcwOlg88YGmhSXxmbrApfrie1haCW
   4U4QjLLfU95lUtZ1C3wXTOCBillLQbk4naWLAgima93JGm6rtGC/LHV0u
   8BU9OIBcpqohsFs0lSQP52oCThSuV71pmAnnJ3424pP5CJRXXxNUYaP0K
   6jFCwO8piEsGlu+p+pFwxXminn6dLGOYukrkMg+Y0umPz4whg8lYwbjJW
   IKrxjkv6WrnKDsb4yG77jCyffs3jnfUWwjN7nxculWjTYsbhTPUv5M91D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396309678"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="396309678"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943112503"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="943112503"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 07:05:41 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/19] xhci: dbc: Drop duplicate checks for dma_free_coherent()
Date: Fri,  1 Dec 2023 17:06:29 +0200
Message-Id: <20231201150647.1307406-2-mathias.nyman@linux.intel.com>
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

dma_free_coherent() is NULL-aware, not necessary to check for
the parameter twice. Drop duplicate conditionals in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index b40d9238d447..9e9ce3711813 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -28,7 +28,7 @@ static void dbc_ring_free(struct device *dev, struct xhci_ring *ring)
 	if (!ring)
 		return;
 
-	if (ring->first_seg && ring->first_seg->trbs) {
+	if (ring->first_seg) {
 		dma_free_coherent(dev, TRB_SEGMENT_SIZE,
 				  ring->first_seg->trbs,
 				  ring->first_seg->dma);
@@ -394,9 +394,8 @@ static int dbc_erst_alloc(struct device *dev, struct xhci_ring *evt_ring,
 
 static void dbc_erst_free(struct device *dev, struct xhci_erst *erst)
 {
-	if (erst->entries)
-		dma_free_coherent(dev, sizeof(struct xhci_erst_entry),
-				  erst->entries, erst->erst_dma_addr);
+	dma_free_coherent(dev, sizeof(struct xhci_erst_entry), erst->entries,
+			  erst->erst_dma_addr);
 	erst->entries = NULL;
 }
 
@@ -543,11 +542,8 @@ static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 
 	xhci_dbc_eps_exit(dbc);
 
-	if (dbc->string) {
-		dma_free_coherent(dbc->dev, dbc->string_size,
-				  dbc->string, dbc->string_dma);
-		dbc->string = NULL;
-	}
+	dma_free_coherent(dbc->dev, dbc->string_size, dbc->string, dbc->string_dma);
+	dbc->string = NULL;
 
 	dbc_free_ctx(dbc->dev, dbc->ctx);
 	dbc->ctx = NULL;
-- 
2.25.1


