Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480D122B1A5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgGWOmp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgGWOmp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:45 -0400
IronPort-SDR: pX8fh82JrwlrjV86XWO56b3lb9X+RDMVb5M2z0AfKgBMb2tSltTUI3C480sX7YQT0ieYrRugm3
 4HtCLNJck1xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607447"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:44 -0700
IronPort-SDR: S501kh4Jw9hbKFFB6HzYJ0XZFyigPf1QiIdgaOdPOFFGsDKU1WuhvcpOInjVstkpTVEXhXwi1m
 sofaKKsgVa+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672435"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:43 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/27] xhci: dbgtty: Pass dbc pointer when registering a dbctty device
Date:   Thu, 23 Jul 2020 17:45:18 +0300
Message-Id: <20200723144530.9992-16-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pass dbc pointer to the xhci_dbc_tty_register_device() and
xhci_dbc_tty_unregister_device() functions instead of xhci_hcd pointer

These functions don't need a xhci_hcd pointer anymore, only use case was
the xhci_err() function, which is now changed to a dev_err() instead.

No functional changes
This change helps decoupling xhci and DbC

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 8 +++-----
 drivers/usb/host/xhci-dbgcap.h | 4 ++--
 drivers/usb/host/xhci-dbgtty.c | 8 +++-----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 1c53fdc791a4..dd8ac5918ad8 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -545,7 +545,7 @@ static void xhci_dbc_stop(struct xhci_hcd *xhci)
 	cancel_delayed_work_sync(&dbc->event_work);
 
 	if (port->registered)
-		xhci_dbc_tty_unregister_device(xhci);
+		xhci_dbc_tty_unregister_device(dbc);
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	ret = xhci_do_dbc_stop(dbc);
@@ -789,10 +789,8 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 	enum evtreturn		evtr;
 	struct xhci_dbc		*dbc;
 	unsigned long		flags;
-	struct xhci_hcd		*xhci;
 
 	dbc = container_of(to_delayed_work(work), struct xhci_dbc, event_work);
-	xhci = dbc->xhci;
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	evtr = xhci_dbc_do_handle_events(dbc);
@@ -800,7 +798,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 
 	switch (evtr) {
 	case EVT_GSER:
-		ret = xhci_dbc_tty_register_device(xhci);
+		ret = xhci_dbc_tty_register_device(dbc);
 		if (ret) {
 			dev_err(dbc->dev, "failed to alloc tty device\n");
 			break;
@@ -809,7 +807,7 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 		dev_info(dbc->dev, "DbC now attached to /dev/ttyDBC0\n");
 		break;
 	case EVT_DISC:
-		xhci_dbc_tty_unregister_device(xhci);
+		xhci_dbc_tty_unregister_device(dbc);
 		break;
 	case EVT_DONE:
 		break;
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 7ca2f4ccc537..628f85f97dfe 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -198,8 +198,8 @@ int xhci_dbc_init(struct xhci_hcd *xhci);
 void xhci_dbc_exit(struct xhci_hcd *xhci);
 int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci);
 void xhci_dbc_tty_unregister_driver(void);
-int xhci_dbc_tty_register_device(struct xhci_hcd *xhci);
-void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci);
+int xhci_dbc_tty_register_device(struct xhci_dbc *dbc);
+void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc);
 struct dbc_request *dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags);
 void dbc_free_request(struct dbc_ep *dep, struct dbc_request *req);
 int dbc_ep_queue(struct dbc_ep *dep, struct dbc_request *req, gfp_t gfp_flags);
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 9a1d38442578..545e8cb0221a 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -440,11 +440,10 @@ xhci_dbc_tty_exit_port(struct dbc_port *port)
 	tty_port_destroy(&port->port);
 }
 
-int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
+int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 {
 	int			ret;
 	struct device		*tty_dev;
-	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
 
 	xhci_dbc_tty_init_port(xhci, port);
@@ -484,14 +483,13 @@ int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
 register_fail:
 	xhci_dbc_tty_exit_port(port);
 
-	xhci_err(xhci, "can't register tty port, err %d\n", ret);
+	dev_err(dbc->dev, "can't register tty port, err %d\n", ret);
 
 	return ret;
 }
 
-void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci)
+void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
 
 	tty_unregister_device(dbc_tty_driver, 0);
-- 
2.17.1

