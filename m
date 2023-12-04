Return-Path: <linux-usb+bounces-3658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F88030CE
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD69280F72
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1145224C1;
	Mon,  4 Dec 2023 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErUtXJhC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BD985
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686679; x=1733222679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pmgPGc1srr1dzu/HPKmpJ+L8TTfBdUlMHyhoyA6SiTQ=;
  b=ErUtXJhCnK5nzwTzAcV6sgVfOFw6TID96FzGzl7d7nzBPGQp2icxvnMY
   eByWacqcO/7lghNL+R/wUEVvrrPvWUQvDOLXTkAWpx0/vLDwBYyq69E/u
   MP1AzfU9vxNupdDkdUdraN8q5SyFUOVlg0ylCT3W3T+23tjUB5IKF3Slp
   +uUXWrt0dFjwZqRELnxCwSGisjvi9Bb5MbJ0Db9DTad/UNb38lL9fC5x7
   8OVKTK7pCwD7JRw4HkgfCst5EtpMGLnAX/Izhb72WlbKwIdETsPojuG2F
   t8m/SAlYGeWoKkmyAGcjx9iHx0+TWbirvOOz3qHs8Ob/sVg8VEnJL8+P3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15260646"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="15260646"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861338845"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="861338845"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 02:44:23 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 01/18] xhci: dbc: Drop duplicate checks for dma_free_coherent()
Date: Mon,  4 Dec 2023 12:45:17 +0200
Message-Id: <20231204104534.1335903-2-mathias.nyman@linux.intel.com>
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


