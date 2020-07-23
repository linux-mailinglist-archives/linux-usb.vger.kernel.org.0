Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC02422B1AB
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgGWOmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729016AbgGWOmx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:53 -0400
IronPort-SDR: fw0qd9FKF2YoslRRURiLIMDXF68AFmODz1NiCjVOIZslSsd59yi8leL6ek1E2+h0I2HRMe/zuO
 noVhxFHY+Auw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607477"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607477"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:53 -0700
IronPort-SDR: v+trDyt+JW5xv2HsqEZ5msHu4rHDhMwlI/gbqGoweRUcORdp4SpTFwzskC4T2icNMhUQ5GzMg4
 Wx7BaoCVREBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672478"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:51 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 21/27] xhci: dbc: Pass dbc pointer to dbc start and stop functions.
Date:   Thu, 23 Jul 2020 17:45:24 +0300
Message-Id: <20200723144530.9992-22-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_dbc_start() and xhci_dbc_stop() functions only used xhci_hcd pointer
to get the dbc pointer.
Pass the dbc pointer instead of the xhci_hcd pointer as a parameter

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 626635f26658..af6e3622e53a 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -548,11 +548,10 @@ static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 	dbc->ring_evt = NULL;
 }
 
-static int xhci_do_dbc_start(struct xhci_hcd *xhci)
+static int xhci_do_dbc_start(struct xhci_dbc *dbc)
 {
 	int			ret;
 	u32			ctrl;
-	struct xhci_dbc		*dbc = xhci->dbc;
 
 	if (dbc->state != DS_DISABLED)
 		return -EINVAL;
@@ -593,33 +592,31 @@ static int xhci_do_dbc_stop(struct xhci_dbc *dbc)
 	return 0;
 }
 
-static int xhci_dbc_start(struct xhci_hcd *xhci)
+static int xhci_dbc_start(struct xhci_dbc *dbc)
 {
 	int			ret;
 	unsigned long		flags;
-	struct xhci_dbc		*dbc = xhci->dbc;
 
 	WARN_ON(!dbc);
 
-	pm_runtime_get_sync(xhci_to_hcd(xhci)->self.controller);
+	pm_runtime_get_sync(dbc->dev); /* note this was self.controller */
 
 	spin_lock_irqsave(&dbc->lock, flags);
-	ret = xhci_do_dbc_start(xhci);
+	ret = xhci_do_dbc_start(dbc);
 	spin_unlock_irqrestore(&dbc->lock, flags);
 
 	if (ret) {
-		pm_runtime_put(xhci_to_hcd(xhci)->self.controller);
+		pm_runtime_put(dbc->dev); /* note this was self.controller */
 		return ret;
 	}
 
 	return mod_delayed_work(system_wq, &dbc->event_work, 1);
 }
 
-static void xhci_dbc_stop(struct xhci_hcd *xhci)
+static void xhci_dbc_stop(struct xhci_dbc *dbc)
 {
 	int ret;
 	unsigned long		flags;
-	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
 
 	WARN_ON(!dbc);
@@ -635,7 +632,7 @@ static void xhci_dbc_stop(struct xhci_hcd *xhci)
 
 	if (!ret) {
 		xhci_dbc_mem_cleanup(dbc);
-		pm_runtime_put_sync(xhci_to_hcd(xhci)->self.controller);
+		pm_runtime_put_sync(dbc->dev); /* note, was self.controller */
 	}
 }
 
@@ -996,13 +993,15 @@ static ssize_t dbc_store(struct device *dev,
 			 const char *buf, size_t count)
 {
 	struct xhci_hcd		*xhci;
+	struct xhci_dbc		*dbc;
 
 	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
 
 	if (!strncmp(buf, "enable", 6))
-		xhci_dbc_start(xhci);
+		xhci_dbc_start(dbc);
 	else if (!strncmp(buf, "disable", 7))
-		xhci_dbc_stop(xhci);
+		xhci_dbc_stop(dbc);
 	else
 		return -EINVAL;
 
@@ -1047,7 +1046,7 @@ void xhci_dbc_exit(struct xhci_hcd *xhci)
 
 	device_remove_file(dev, &dev_attr_dbc);
 	xhci_dbc_tty_unregister_driver();
-	xhci_dbc_stop(xhci);
+	xhci_dbc_stop(xhci->dbc);
 	xhci_do_dbc_exit(xhci);
 }
 
@@ -1062,7 +1061,7 @@ int xhci_dbc_suspend(struct xhci_hcd *xhci)
 	if (dbc->state == DS_CONFIGURED)
 		dbc->resume_required = 1;
 
-	xhci_dbc_stop(xhci);
+	xhci_dbc_stop(dbc);
 
 	return 0;
 }
@@ -1077,7 +1076,7 @@ int xhci_dbc_resume(struct xhci_hcd *xhci)
 
 	if (dbc->resume_required) {
 		dbc->resume_required = 0;
-		xhci_dbc_start(xhci);
+		xhci_dbc_start(dbc);
 	}
 
 	return ret;
-- 
2.17.1

