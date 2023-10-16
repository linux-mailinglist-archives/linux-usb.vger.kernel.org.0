Return-Path: <linux-usb+bounces-1667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629847CA8E3
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 15:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F17F281822
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB9727ECC;
	Mon, 16 Oct 2023 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2FAnSit"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1422772A
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 13:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00A2AB;
	Mon, 16 Oct 2023 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697461789; x=1728997789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wKIv3sJ1clYjdqjwiVvVRD9CCUCGlQHTF5I50Li2+CE=;
  b=a2FAnSity9U8+c9YPI7bdJ8uLCLCXe9/UnhpW0UjY9plAN/HrJlhGPdR
   AWgiEEIm/CItmeySEuzovep/ij2jObaf2+BO2iYmA0R41GPvrsisvBMpY
   RUP6RrkyysYaHS20UVqyAxWqHr3c6X38KrrVQv2KP1IiEAvkFc2SfJ9vM
   cDNKXNjOyQhFb3KrIhg99SCW9Nk+KDuDy+c1guJ9BhsJMVd5wuFSXo0LM
   sNrk2C9svR3nwl7Je/fn/VQM2jqVYMwhSA8x4YUtbj3EHSOXfEccFoj68
   e8V0p5LCf3GZs1j5narvFUEypIkHR7wW67X6WbjrfkTvM8njGZVwZ6OdT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4133288"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4133288"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1087067131"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="1087067131"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 06:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0707F11D; Mon, 16 Oct 2023 16:09:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 01/10] xhci: dbc: Drop duplicate checks for dma_free_coherent()
Date: Mon, 16 Oct 2023 16:09:25 +0300
Message-Id: <20231016130934.1158504-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
References: <20231016130934.1158504-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

dma_free_coherent() is NULL-aware, not necessary to check for
the parameter twice. Drop duplicate conditionals in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.40.0.1.gaa8946217a0b


