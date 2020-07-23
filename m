Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9994D22B1B1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgGWOnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:43:01 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728553AbgGWOnB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:43:01 -0400
IronPort-SDR: tsSlWaITCWCgarleATW4+WypM3w+3fVcOX168lUNP7WLsxKba80InQXWc57Snwjc6bMZf0U7EF
 DRJPy+B5FVkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607504"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607504"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:43:00 -0700
IronPort-SDR: ggiolBXBIjYOu9Mp9I4U9N9YKf5zYtgc149fSWRNrm9cG4eVzr+InUjol9PBYhH6tU+0H12/DQ
 +r2kPTg4goiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672529"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:59 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 27/27] xhci: dbc: remove tty specific port structure from struct xhci_dbc
Date:   Thu, 23 Jul 2020 17:45:30 +0300
Message-Id: <20200723144530.9992-28-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use a void pointer that any function driver can use instead.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.h |  2 +-
 drivers/usb/host/xhci-dbgtty.c | 29 +++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 5018b32fc742..c70b78d504eb 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -137,8 +137,8 @@ struct xhci_dbc {
 	unsigned			resume_required:1;
 	struct dbc_ep			eps[2];
 
-	struct dbc_port			port;
 	const struct dbc_driver		*driver;
+	void				*priv;
 };
 
 struct dbc_request {
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 3b306a22da47..0b942112b6f8 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -19,6 +19,11 @@ static void dbc_tty_exit(void);
 
 static struct tty_driver *dbc_tty_driver;
 
+static inline struct dbc_port *dbc_to_port(struct xhci_dbc *dbc)
+{
+	return dbc->priv;
+}
+
 static unsigned int
 dbc_send_packet(struct dbc_port *port, char *packet, unsigned int size)
 {
@@ -99,7 +104,7 @@ static void
 dbc_read_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 {
 	unsigned long		flags;
-	struct dbc_port		*port = &dbc->port;
+	struct dbc_port		*port = dbc_to_port(dbc);
 
 	spin_lock_irqsave(&port->port_lock, flags);
 	list_add_tail(&req->list_pool, &port->read_queue);
@@ -110,7 +115,7 @@ dbc_read_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 static void dbc_write_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 {
 	unsigned long		flags;
-	struct dbc_port		*port = &dbc->port;
+	struct dbc_port		*port = dbc_to_port(dbc);
 
 	spin_lock_irqsave(&port->port_lock, flags);
 	list_add(&req->list_pool, &port->write_pool);
@@ -397,7 +402,7 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 {
 	int			ret;
 	struct device		*tty_dev;
-	struct dbc_port		*port = &dbc->port;
+	struct dbc_port		*port = dbc_to_port(dbc);
 
 	if (port->registered)
 		return -EBUSY;
@@ -446,7 +451,7 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 
 void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 {
-	struct dbc_port		*port = &dbc->port;
+	struct dbc_port		*port = dbc_to_port(dbc);
 
 	if (!port->registered)
 		return;
@@ -468,6 +473,7 @@ static const struct dbc_driver dbc_driver = {
 int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
 {
 	struct xhci_dbc		*dbc = xhci->dbc;
+	struct dbc_port		*port;
 	int			status;
 
 	/* dbc_tty_init will be called by module init() in the future */
@@ -475,13 +481,20 @@ int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
 	if (status)
 		return status;
 
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port) {
+		status = -ENOMEM;
+		goto out;
+	}
+
 	dbc->driver = &dbc_driver;
+	dbc->priv = port;
+
 
-	dbc_tty_driver->driver_state = &dbc->port;
+	dbc_tty_driver->driver_state = port;
 
 	return 0;
 out:
-
 	/* dbc_tty_exit will be called by module_exit() in the future */
 	dbc_tty_exit();
 	return status;
@@ -493,7 +506,11 @@ int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
  */
 void xhci_dbc_tty_remove(struct xhci_dbc *dbc)
 {
+	struct dbc_port         *port = dbc_to_port(dbc);
+
 	dbc->driver = NULL;
+	dbc->priv = NULL;
+	kfree(port);
 
 	/* dbc_tty_exit will be called by  module_exit() in the future */
 	dbc_tty_exit();
-- 
2.17.1

