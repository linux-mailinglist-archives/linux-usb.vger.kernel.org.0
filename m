Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCAA22B1A2
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgGWOml (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOml (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:41 -0400
IronPort-SDR: 3kAdPhWnKx6vZKzJDewFclfv622r9XvNlKjBx4e66MmbV6+i6XHaspN+Dh3Ro5DAdbPGx2MWr1
 gKY08A0fODUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607432"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607432"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:40 -0700
IronPort-SDR: xP7/vcCvzg7PdngJimJnov58zat626sfXYcbJzm213CpSGNIHdF1Dpp96MLt1JBokrf8gjhHEc
 vaHyMz0nS3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672422"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:39 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/27] xhci: dbc: Pass dbc pointer to endpoint init and exit functions.
Date:   Thu, 23 Jul 2020 17:45:15 +0300
Message-Id: <20200723144530.9992-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

struct xhci_hcd pointer is not needed for dbc endpoint init and exit,
it was only used to get to the dbc structure.
Pass the dbc pointer as a parameter to these functions instead.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 44fe93632901..6114b334eb61 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -319,10 +319,9 @@ int dbc_ep_queue(struct dbc_ep *dep, struct dbc_request *req,
 	return ret;
 }
 
-static inline void xhci_dbc_do_eps_init(struct xhci_hcd *xhci, bool direction)
+static inline void xhci_dbc_do_eps_init(struct xhci_dbc *dbc, bool direction)
 {
 	struct dbc_ep		*dep;
-	struct xhci_dbc		*dbc = xhci->dbc;
 
 	dep			= &dbc->eps[direction];
 	dep->dbc		= dbc;
@@ -332,16 +331,14 @@ static inline void xhci_dbc_do_eps_init(struct xhci_hcd *xhci, bool direction)
 	INIT_LIST_HEAD(&dep->list_pending);
 }
 
-static void xhci_dbc_eps_init(struct xhci_hcd *xhci)
+static void xhci_dbc_eps_init(struct xhci_dbc *dbc)
 {
-	xhci_dbc_do_eps_init(xhci, BULK_OUT);
-	xhci_dbc_do_eps_init(xhci, BULK_IN);
+	xhci_dbc_do_eps_init(dbc, BULK_OUT);
+	xhci_dbc_do_eps_init(dbc, BULK_IN);
 }
 
-static void xhci_dbc_eps_exit(struct xhci_hcd *xhci)
+static void xhci_dbc_eps_exit(struct xhci_dbc *dbc)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
-
 	memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
 }
 
@@ -418,7 +415,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	string_length = xhci_dbc_populate_strings(dbc->string);
 	xhci_dbc_init_contexts(dbc, string_length);
 
-	xhci_dbc_eps_init(xhci);
+	xhci_dbc_eps_init(dbc);
 	dbc->state = DS_INITIALIZED;
 
 	return 0;
@@ -449,7 +446,7 @@ static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
 	if (!dbc)
 		return;
 
-	xhci_dbc_eps_exit(xhci);
+	xhci_dbc_eps_exit(dbc);
 
 	if (dbc->string) {
 		dma_free_coherent(dbc->dev, dbc->string_size,
-- 
2.17.1

