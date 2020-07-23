Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8C922B1B0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgGWOnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:43:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728791AbgGWOm7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:59 -0400
IronPort-SDR: 04cNFYaejEwXPry7ZaFQA1s25O0Db0RPhuOmR3tv4QEOgtIXRNu4VRCL8slby+//GgB2aK0M5C
 WJ0HZU5Vccww==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607501"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607501"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:59 -0700
IronPort-SDR: dt0/0x3VBbVubf88NkrF9ZKWyKwL+Keq0gW/mdG4zbmxhku/c2Fn9OQtxuyQJ8Q1m8/Zt7I0em
 Jx87IhB4UjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672523"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:57 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 26/27] xhci: dbgcap: remove dbc dependency on dbctty specific flag
Date:   Thu, 23 Jul 2020 17:45:29 +0300
Message-Id: <20200723144530.9992-27-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dbc should not be aware of, or use any dbctty specific variables.
currenly dbc driver reads the port->registered flag to see if the
callbacks should be called.

Only makes these decisions based on dbc internal state instead.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 16 ++++++++++++----
 drivers/usb/host/xhci-dbgtty.c |  5 +++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 47090bceae21..c57178db7994 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -630,14 +630,22 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
 {
 	int ret;
 	unsigned long		flags;
-	struct dbc_port		*port = &dbc->port;
 
 	WARN_ON(!dbc);
 
-	cancel_delayed_work_sync(&dbc->event_work);
+	switch (dbc->state) {
+	case DS_DISABLED:
+		return;
+	case DS_CONFIGURED:
+	case DS_STALLED:
+		if (dbc->driver->disconnect)
+			dbc->driver->disconnect(dbc);
+		break;
+	default:
+		break;
+	}
 
-	if (port->registered && dbc->driver->disconnect)
-		dbc->driver->disconnect(dbc);
+	cancel_delayed_work_sync(&dbc->event_work);
 
 	spin_lock_irqsave(&dbc->lock, flags);
 	ret = xhci_do_dbc_stop(dbc);
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 3231cec74a7a..3b306a22da47 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -399,6 +399,9 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 	struct device		*tty_dev;
 	struct dbc_port		*port = &dbc->port;
 
+	if (port->registered)
+		return -EBUSY;
+
 	xhci_dbc_tty_init_port(dbc, port);
 	tty_dev = tty_port_register_device(&port->port,
 					   dbc_tty_driver, 0, NULL);
@@ -445,6 +448,8 @@ void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 {
 	struct dbc_port		*port = &dbc->port;
 
+	if (!port->registered)
+		return;
 	tty_unregister_device(dbc_tty_driver, 0);
 	xhci_dbc_tty_exit_port(port);
 	port->registered = false;
-- 
2.17.1

