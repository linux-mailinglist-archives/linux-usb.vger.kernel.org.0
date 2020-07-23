Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA4A22B1AA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbgGWOmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:51 -0400
IronPort-SDR: EJCZUPNYrdN8B37l30ZYcxnKj5oOW/U8OYE1/5zDIPa8VsGIZUa3Wh9UKkvocsb6LFrJWIkC+6
 U565RgoqVvOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607471"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:51 -0700
IronPort-SDR: UM4Np482aMP6B2a0S1TIXSc89JwqY9IwSj2Oot4doxCBozlqaSzeE495DBqjhWbubMC+DI7SA+
 qngQ3JUcajrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672471"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:50 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 20/27] xhci: dbc: Pass dbc pointer to dbc memory init and cleanup functions
Date:   Thu, 23 Jul 2020 17:45:23 +0300
Message-Id: <20200723144530.9992-21-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dbc mem_init and mem_cleanup functions used xhci_hcd to get to the device
pointer. The device pointer can be accessed directly from dbc structure,
so pass a pointer to dbc as a parameter instead.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index b00cbff5e2ca..626635f26658 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -451,13 +451,12 @@ xhci_dbc_ring_alloc(struct device *dev, enum xhci_ring_type type, gfp_t flags)
 	return NULL;
 }
 
-static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
+static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 {
 	int			ret;
 	dma_addr_t		deq;
 	u32			string_length;
-	struct xhci_dbc		*dbc = xhci->dbc;
-	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
+	struct device		*dev = dbc->dev;
 
 	/* Allocate various rings for events and transfers: */
 	dbc->ring_evt = xhci_dbc_ring_alloc(dev, TYPE_EVENT, flags);
@@ -524,11 +523,8 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	return -ENOMEM;
 }
 
-static void xhci_dbc_mem_cleanup(struct xhci_hcd *xhci)
+static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
-	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
-
 	if (!dbc)
 		return;
 
@@ -568,7 +564,7 @@ static int xhci_do_dbc_start(struct xhci_hcd *xhci)
 	if (ret)
 		return ret;
 
-	ret = xhci_dbc_mem_init(xhci, GFP_ATOMIC);
+	ret = xhci_dbc_mem_init(dbc, GFP_ATOMIC);
 	if (ret)
 		return ret;
 
@@ -638,7 +634,7 @@ static void xhci_dbc_stop(struct xhci_hcd *xhci)
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
 	if (!ret) {
-		xhci_dbc_mem_cleanup(xhci);
+		xhci_dbc_mem_cleanup(dbc);
 		pm_runtime_put_sync(xhci_to_hcd(xhci)->self.controller);
 	}
 }
-- 
2.17.1

