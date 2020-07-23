Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6412822B19A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgGWOmb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOma (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:30 -0400
IronPort-SDR: fXOJgUgSwhSsNL0ejbuxIz/uGjtbEAEu5UBeoEfTnO0kqp4Vo7MGzkhxz/vroLYfOSb/yS4vvj
 D/9K+E66lguw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607376"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:30 -0700
IronPort-SDR: 0v2obsNS5PplOzrdt78w9sDMeByTmSOriTEQKfEBsKWuOnesnZwec8AQCP32pZAaUqjrySyKRF
 9SVcKajzKV2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672369"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:28 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/27] xhci: dbc: Don't use generic xhci erst allocation and free functions
Date:   Thu, 23 Jul 2020 17:45:07 +0300
Message-Id: <20200723144530.9992-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The generic erst allocation and free functions take struct xhci_hcd pointer
as a parameter. Create own erst helpers for DbC in order to decouple xhci
and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 424b571d6ca9..138b0c994ad2 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -370,12 +370,36 @@ static void xhci_dbc_eps_exit(struct xhci_hcd *xhci)
 	memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
 }
 
+static int dbc_erst_alloc(struct device *dev, struct xhci_ring *evt_ring,
+		    struct xhci_erst *erst, gfp_t flags)
+{
+	erst->entries = dma_alloc_coherent(dev, sizeof(struct xhci_erst_entry),
+					   &erst->erst_dma_addr, flags);
+	if (!erst->entries)
+		return -ENOMEM;
+
+	erst->num_entries = 1;
+	erst->entries[0].seg_addr = cpu_to_le64(evt_ring->first_seg->dma);
+	erst->entries[0].seg_size = cpu_to_le32(TRBS_PER_SEGMENT);
+	erst->entries[0].rsvd = 0;
+	return 0;
+}
+
+static void dbc_erst_free(struct device *dev, struct xhci_erst *erst)
+{
+	if (erst->entries)
+		dma_free_coherent(dev, sizeof(struct xhci_erst_entry),
+				  erst->entries, erst->erst_dma_addr);
+	erst->entries = NULL;
+}
+
 static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	int			ret;
 	dma_addr_t		deq;
 	u32			string_length;
 	struct xhci_dbc		*dbc = xhci->dbc;
+	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
 
 	/* Allocate various rings for events and transfers: */
 	dbc->ring_evt = xhci_ring_alloc(xhci, 1, 1, TYPE_EVENT, 0, flags);
@@ -391,7 +415,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto out_fail;
 
 	/* Allocate and populate ERST: */
-	ret = xhci_alloc_erst(xhci, dbc->ring_evt, &dbc->erst, flags);
+	ret = dbc_erst_alloc(dev, dbc->ring_evt, &dbc->erst, flags);
 	if (ret)
 		goto erst_fail;
 
@@ -429,7 +453,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	xhci_free_container_ctx(xhci, dbc->ctx);
 	dbc->ctx = NULL;
 ctx_fail:
-	xhci_free_erst(xhci, &dbc->erst);
+	dbc_erst_free(dev, &dbc->erst);
 erst_fail:
 	xhci_ring_free(xhci, dbc->ring_out);
 	dbc->ring_out = NULL;
@@ -446,6 +470,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct xhci_dbc		*dbc = xhci->dbc;
+	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
 
 	if (!dbc)
 		return;
@@ -462,7 +487,7 @@ static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_free_container_ctx(xhci, dbc->ctx);
 	dbc->ctx = NULL;
 
-	xhci_free_erst(xhci, &dbc->erst);
+	dbc_erst_free(dev, &dbc->erst);
 	xhci_ring_free(xhci, dbc->ring_out);
 	xhci_ring_free(xhci, dbc->ring_in);
 	xhci_ring_free(xhci, dbc->ring_evt);
-- 
2.17.1

