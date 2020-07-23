Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B564922B1AF
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgGWOm7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728791AbgGWOm6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:58 -0400
IronPort-SDR: ZzBYuOqRNUU8dbEVjbIZtcrgonXJWytaEtOQffX64PIv4bZ+b59ghj+igIHrX6rij4KMV9hfcA
 dmDlqrQnkeRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607492"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:58 -0700
IronPort-SDR: DQcEi5q+kiUtkqxgljxqsjJfSfnz83Fo2bF5TZJIEENKWN1UkewE42EHt5Co3aSyCTGd3eGRse
 Mo5R4axG7tVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672515"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:56 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 25/27] xhci: dbc: Add a operations structure to access driver functions
Date:   Thu, 23 Jul 2020 17:45:28 +0300
Message-Id: <20200723144530.9992-26-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't call dbctty driver functions directly from dbc core code.
Introduce a new dbc_driver structure that contains function pointers
for disconnect and configure operations.

The driver (ttydbc) must provide these opeations when creating a dbc.

Name the structure dbc_driver instead of dbc_ops as we plan to
add more driver configureable values here, such as vid and pid.

Decouples dbc and dbctty.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 17 ++++++-----------
 drivers/usb/host/xhci-dbgcap.h |  8 ++++++--
 drivers/usb/host/xhci-dbgtty.c | 11 +++++++++--
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 99f0b425274a..47090bceae21 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -636,8 +636,8 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 
 	cancel_delayed_work_sync(&dbc->event_work);
 
-	if (port->registered)
-		xhci_dbc_tty_unregister_device(dbc);
+	if (port->registered && dbc->driver->disconnect)
+		dbc->driver->disconnect(dbc);
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	ret = xhci_do_dbc_stop(dbc);
@@ -877,7 +877,6 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 
 static void xhci_dbc_handle_events(struct work_struct *work)
 {
-	int			ret;
 	enum evtreturn		evtr;
 	struct xhci_dbc		*dbc;
 	unsigned long		flags;
@@ -890,16 +889,12 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 
 	switch (evtr) {
 	case EVT_GSER:
-		ret = xhci_dbc_tty_register_device(dbc);
-		if (ret) {
-			dev_err(dbc->dev, "failed to alloc tty device\n");
-			break;
-		}
-
-		dev_info(dbc->dev, "DbC now attached to /dev/ttyDBC0\n");
+		if (dbc->driver->configure)
+			dbc->driver->configure(dbc);
 		break;
 	case EVT_DISC:
-		xhci_dbc_tty_unregister_device(dbc);
+		if (dbc->driver->disconnect)
+			dbc->driver->disconnect(dbc);
 		break;
 	case EVT_DONE:
 		break;
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index e4c7c9279ea8..5018b32fc742 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -112,6 +112,11 @@ struct dbc_port {
 	bool				registered;
 };
 
+struct dbc_driver {
+	int (*configure)(struct xhci_dbc *dbc);
+	void (*disconnect)(struct xhci_dbc *dbc);
+};
+
 struct xhci_dbc {
 	spinlock_t			lock;		/* device access */
 	struct device			*dev;
@@ -133,6 +138,7 @@ struct xhci_dbc {
 	struct dbc_ep			eps[2];
 
 	struct dbc_port			port;
+	const struct dbc_driver		*driver;
 };
 
 struct dbc_request {
@@ -192,8 +198,6 @@ int xhci_dbc_init(struct xhci_hcd *xhci);
 void xhci_dbc_exit(struct xhci_hcd *xhci);
 int xhci_dbc_tty_probe(struct xhci_hcd *xhci);
 void xhci_dbc_tty_remove(struct xhci_dbc *dbc);
-int xhci_dbc_tty_register_device(struct xhci_dbc *dbc);
-void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc);
 struct dbc_request *dbc_alloc_request(struct xhci_dbc *dbc,
 				      unsigned int direction,
 				      gfp_t flags);
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 9acf1efba36c..3231cec74a7a 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -455,6 +455,11 @@ void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 	xhci_dbc_free_requests(&port->write_pool);
 }
 
+static const struct dbc_driver dbc_driver = {
+	.configure		= xhci_dbc_tty_register_device,
+	.disconnect		= xhci_dbc_tty_unregister_device,
+};
+
 int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
 {
 	struct xhci_dbc		*dbc = xhci->dbc;
@@ -465,6 +470,8 @@ int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
 	if (status)
 		return status;
 
+	dbc->driver = &dbc_driver;
+
 	dbc_tty_driver->driver_state = &dbc->port;
 
 	return 0;
@@ -481,6 +488,8 @@ int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
  */
 void xhci_dbc_tty_remove(struct xhci_dbc *dbc)
 {
+	dbc->driver = NULL;
+
 	/* dbc_tty_exit will be called by  module_exit() in the future */
 	dbc_tty_exit();
 }
@@ -523,5 +532,3 @@ static void dbc_tty_exit(void)
 		dbc_tty_driver = NULL;
 	}
 }
-
-
-- 
2.17.1

