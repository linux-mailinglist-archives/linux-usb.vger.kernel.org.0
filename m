Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C0C22B1A0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgGWOmj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:38 -0400
IronPort-SDR: 42eiHK2OyN4ZPGSk+GKOwn4NBDH6PcDP7c5nRZk/sofBHKFJE+w80WCdF8hVQiabOeJpbCwG4Z
 mKmGjoKErbVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607420"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607420"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:38 -0700
IronPort-SDR: vpasVZhva84DnmIqzIKd1Kr6U24u5axkxu5zwyvmFjGdcZPSgwvRqPHyo6FmTt8iS0S2qWJ0p1
 a9m1yp7g2YWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672403"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:36 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/27] xhci: dbc: Don't pass the xhci pointer as a parameter to xhci_dbc_init_context()
Date:   Thu, 23 Jul 2020 17:45:13 +0300
Message-Id: <20200723144530.9992-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_dbc_init_context() no longer needs the struct xhci_hcd pointer.
Pass the dbc pointer directly instead.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 3541fbbfc28b..a5281f95fd72 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -63,16 +63,14 @@ static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
 	return string_length;
 }
 
-static void xhci_dbc_init_contexts(struct xhci_hcd *xhci, u32 string_length)
+static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
 {
-	struct xhci_dbc		*dbc;
 	struct dbc_info_context	*info;
 	struct xhci_ep_ctx	*ep_ctx;
 	u32			dev_info;
 	dma_addr_t		deq, dma;
 	unsigned int		max_burst;
 
-	dbc = xhci->dbc;
 	if (!dbc)
 		return;
 
@@ -421,7 +419,7 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	/* Setup strings and contexts: */
 	string_length = xhci_dbc_populate_strings(dbc->string);
-	xhci_dbc_init_contexts(xhci, string_length);
+	xhci_dbc_init_contexts(dbc, string_length);
 
 	xhci_dbc_eps_init(xhci);
 	dbc->state = DS_INITIALIZED;
-- 
2.17.1

