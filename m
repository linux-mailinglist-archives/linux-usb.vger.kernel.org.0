Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F90322B1A1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbgGWOmk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:39 -0400
IronPort-SDR: Itoxk8ZOSAGsgvJrWl56rUWHAvyYCNm9UGihnFaqM5CuE7spixV23IRuVLg9/TXwxm3Bthq0zj
 4i7jtlGNI27g==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607425"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607425"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:39 -0700
IronPort-SDR: HIFgE2ox5Rc7b8kbqladqRomgKcTnfuYJYjXXLP3pprG51clIrkckeyVEASKIEpFD3iap35J6U
 ODQmyI/ZHihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672415"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:37 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/27] xhci: dbc: Get the device pointer from dbc structure in dbc_ep_do_queue()
Date:   Thu, 23 Jul 2020 17:45:14 +0300
Message-Id: <20200723144530.9992-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dbc_ep_do_queue() can now get the device pointer directly from dbc
structure instead of going through the xhci_hcd structure.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index a5281f95fd72..44fe93632901 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -267,11 +267,8 @@ static int
 dbc_ep_do_queue(struct dbc_ep *dep, struct dbc_request *req)
 {
 	int			ret;
-	struct device		*dev;
 	struct xhci_dbc		*dbc = dep->dbc;
-	struct xhci_hcd		*xhci = dbc->xhci;
-
-	dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct device		*dev = dbc->dev;
 
 	if (!req->length || !req->buf)
 		return -EINVAL;
-- 
2.17.1

