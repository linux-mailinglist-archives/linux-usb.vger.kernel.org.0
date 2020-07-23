Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FB722B1A8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgGWOmt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:49 -0400
IronPort-SDR: S+4CxdFjuSnJj5JHoKn2L1PrDmVD9HYa9SvhzS52C7rocQs/08zdHyZpKakr74y2VBFH+n7lWF
 kteZtF0ISFrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607460"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:49 -0700
IronPort-SDR: o2XDy40NAeuga/Zw0rp6jsLSdCRnmagWpFGgWjRkt0Q9Gv/D+Q1aknG+cSibU/h8ofsPAjJlW2
 dZKIHNunc7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672454"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:47 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 18/27] xhci: dbc: Don't use generic xhci context allocation for dbc
Date:   Thu, 23 Jul 2020 17:45:21 +0300
Message-Id: <20200723144530.9992-19-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DbC context is different from the xhci device context.
It's a lot smaller as it only contains three 64 bytes sub-contexts;
the info, endpoint-out, and endpoint-in contexts. In total 192 bytes.
The context size (CSZ) field in HCCPARAMS1 xhci register does not alter
DbC context size like it does for xhci device contexts.

So don't use the geneic xhci context memory allocation, or the
dma pool that is intended for xhci device contexts.

In addition to saving memory this also helps decoupleing xhci and dbc code.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 2473100b955a..fb56198d3aff 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -14,6 +14,14 @@
 #include "xhci-trace.h"
 #include "xhci-dbgcap.h"
 
+static void dbc_free_ctx(struct device *dev, struct xhci_container_ctx *ctx)
+{
+	if (!ctx)
+		return;
+	dma_free_coherent(dev, ctx->size, ctx->bytes, ctx->dma);
+	kfree(ctx);
+}
+
 static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
 {
 	struct usb_string_descriptor	*s_desc;
@@ -364,6 +372,25 @@ static void dbc_erst_free(struct device *dev, struct xhci_erst *erst)
 	erst->entries = NULL;
 }
 
+static struct xhci_container_ctx *
+dbc_alloc_ctx(struct device *dev, gfp_t flags)
+{
+	struct xhci_container_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), flags);
+	if (!ctx)
+		return NULL;
+
+	/* xhci 7.6.9, all three contexts; info, ep-out and ep-in. Each 64 bytes*/
+	ctx->size = 3 * DBC_CONTEXT_SIZE;
+	ctx->bytes = dma_alloc_coherent(dev, ctx->size, &ctx->dma, flags);
+	if (!ctx->bytes) {
+		kfree(ctx);
+		return NULL;
+	}
+	return ctx;
+}
+
 static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	int			ret;
@@ -391,7 +418,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 		goto erst_fail;
 
 	/* Allocate context data structure: */
-	dbc->ctx = xhci_alloc_container_ctx(xhci, XHCI_CTX_TYPE_DEVICE, flags);
+	dbc->ctx = dbc_alloc_ctx(dev, flags); /* was sysdev, and is still */
 	if (!dbc->ctx)
 		goto ctx_fail;
 
@@ -420,7 +447,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	return 0;
 
 string_fail:
-	xhci_free_container_ctx(xhci, dbc->ctx);
+	dbc_free_ctx(dev, dbc->ctx);
 	dbc->ctx = NULL;
 ctx_fail:
 	dbc_erst_free(dev, &dbc->erst);
@@ -453,7 +480,7 @@ static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
 		dbc->string = NULL;
 	}
 
-	xhci_free_container_ctx(xhci, dbc->ctx);
+	dbc_free_ctx(dbc->dev, dbc->ctx);
 	dbc->ctx = NULL;
 
 	dbc_erst_free(dev, &dbc->erst);
-- 
2.17.1

