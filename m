Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BF722B1AE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 16:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbgGWOm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 10:42:58 -0400
Received: from mga02.intel.com ([134.134.136.20]:12017 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729016AbgGWOm5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jul 2020 10:42:57 -0400
IronPort-SDR: 5jP/lAHJ04Q5dpUB+qo2pxk5/00ZOwux2Ui+s1S6kynOCCG9OvoSl8ZbW+Je64SvRBR8lKk/Zk
 vGsIcZ3VcgdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="138607488"
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="138607488"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 07:42:56 -0700
IronPort-SDR: zFCdoB/WXHyx7V/LimO0Rh81sr/BAGJ0r7Ek6TnR1h0j8v4oFax06YfN11wVdBjsrjLmbYeNP5
 zh2vBHQ64w5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,386,1589266800"; 
   d="scan'208";a="320672509"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2020 07:42:55 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 24/27] xhci: dbctty: split dbc tty driver registration and unregistration functions.
Date:   Thu, 23 Jul 2020 17:45:27 +0300
Message-Id: <20200723144530.9992-25-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Split the dbc tty driver registrations function into separate
init and probe parts.

The init part will register the tty driver, and should in the future be
called from module_init().
The probe part will become the normal probe function, but for now it is
called from the init part.

The unregister function is s likewise split into remove and exit parts.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c |   6 +-
 drivers/usb/host/xhci-dbgcap.h |   4 +-
 drivers/usb/host/xhci-dbgtty.c | 125 ++++++++++++++++++++-------------
 3 files changed, 81 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index e3eec628edb5..99f0b425274a 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1032,7 +1032,7 @@ int xhci_dbc_init(struct xhci_hcd *xhci)
 	if (ret)
 		goto init_err3;
 
-	ret = xhci_dbc_tty_register_driver(xhci);
+	ret = xhci_dbc_tty_probe(xhci);
 	if (ret)
 		goto init_err2;
 
@@ -1043,7 +1043,7 @@ int xhci_dbc_init(struct xhci_hcd *xhci)
 	return 0;
 
 init_err1:
-	xhci_dbc_tty_unregister_driver();
+	xhci_dbc_tty_remove(xhci->dbc);
 init_err2:
 	xhci_do_dbc_exit(xhci);
 init_err3:
@@ -1058,7 +1058,7 @@ void xhci_dbc_exit(struct xhci_hcd *xhci)
 		return;
 
 	device_remove_file(dev, &dev_attr_dbc);
-	xhci_dbc_tty_unregister_driver();
+	xhci_dbc_tty_remove(xhci->dbc);
 	xhci_dbc_stop(xhci->dbc);
 	xhci_do_dbc_exit(xhci);
 }
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 796cf2808be8..e4c7c9279ea8 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -190,8 +190,8 @@ static inline struct dbc_ep *get_out_ep(struct xhci_dbc *dbc)
 #ifdef CONFIG_USB_XHCI_DBGCAP
 int xhci_dbc_init(struct xhci_hcd *xhci);
 void xhci_dbc_exit(struct xhci_hcd *xhci);
-int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci);
-void xhci_dbc_tty_unregister_driver(void);
+int xhci_dbc_tty_probe(struct xhci_hcd *xhci);
+void xhci_dbc_tty_remove(struct xhci_dbc *dbc);
 int xhci_dbc_tty_register_device(struct xhci_dbc *dbc);
 void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc);
 struct dbc_request *dbc_alloc_request(struct xhci_dbc *dbc,
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index ab2b82aa04be..9acf1efba36c 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -14,6 +14,11 @@
 #include "xhci.h"
 #include "xhci-dbgcap.h"
 
+static int dbc_tty_init(void);
+static void dbc_tty_exit(void);
+
+static struct tty_driver *dbc_tty_driver;
+
 static unsigned int
 dbc_send_packet(struct dbc_port *port, char *packet, unsigned int size)
 {
@@ -278,55 +283,6 @@ static const struct tty_operations dbc_tty_ops = {
 	.unthrottle		= dbc_tty_unthrottle,
 };
 
-static struct tty_driver *dbc_tty_driver;
-
-int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
-{
-	int			status;
-	struct xhci_dbc		*dbc = xhci->dbc;
-
-	dbc_tty_driver = tty_alloc_driver(1, TTY_DRIVER_REAL_RAW |
-					  TTY_DRIVER_DYNAMIC_DEV);
-	if (IS_ERR(dbc_tty_driver)) {
-		status = PTR_ERR(dbc_tty_driver);
-		dbc_tty_driver = NULL;
-		return status;
-	}
-
-	dbc_tty_driver->driver_name = "dbc_serial";
-	dbc_tty_driver->name = "ttyDBC";
-
-	dbc_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
-	dbc_tty_driver->subtype = SERIAL_TYPE_NORMAL;
-	dbc_tty_driver->init_termios = tty_std_termios;
-	dbc_tty_driver->init_termios.c_cflag =
-			B9600 | CS8 | CREAD | HUPCL | CLOCAL;
-	dbc_tty_driver->init_termios.c_ispeed = 9600;
-	dbc_tty_driver->init_termios.c_ospeed = 9600;
-	dbc_tty_driver->driver_state = &dbc->port;
-
-	tty_set_operations(dbc_tty_driver, &dbc_tty_ops);
-
-	status = tty_register_driver(dbc_tty_driver);
-	if (status) {
-		xhci_err(xhci,
-			 "can't register dbc tty driver, err %d\n", status);
-		put_tty_driver(dbc_tty_driver);
-		dbc_tty_driver = NULL;
-	}
-
-	return status;
-}
-
-void xhci_dbc_tty_unregister_driver(void)
-{
-	if (dbc_tty_driver) {
-		tty_unregister_driver(dbc_tty_driver);
-		put_tty_driver(dbc_tty_driver);
-		dbc_tty_driver = NULL;
-	}
-}
-
 static void dbc_rx_push(unsigned long _port)
 {
 	struct dbc_request	*req;
@@ -498,3 +454,74 @@ void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 	xhci_dbc_free_requests(&port->read_queue);
 	xhci_dbc_free_requests(&port->write_pool);
 }
+
+int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
+{
+	struct xhci_dbc		*dbc = xhci->dbc;
+	int			status;
+
+	/* dbc_tty_init will be called by module init() in the future */
+	status = dbc_tty_init();
+	if (status)
+		return status;
+
+	dbc_tty_driver->driver_state = &dbc->port;
+
+	return 0;
+out:
+
+	/* dbc_tty_exit will be called by module_exit() in the future */
+	dbc_tty_exit();
+	return status;
+}
+
+/*
+ * undo what probe did, assume dbc is stopped already.
+ * we also assume tty_unregister_device() is called before this
+ */
+void xhci_dbc_tty_remove(struct xhci_dbc *dbc)
+{
+	/* dbc_tty_exit will be called by  module_exit() in the future */
+	dbc_tty_exit();
+}
+
+static int dbc_tty_init(void)
+{
+	int		ret;
+
+	dbc_tty_driver = tty_alloc_driver(1, TTY_DRIVER_REAL_RAW |
+					  TTY_DRIVER_DYNAMIC_DEV);
+	if (IS_ERR(dbc_tty_driver))
+		return PTR_ERR(dbc_tty_driver);
+
+	dbc_tty_driver->driver_name = "dbc_serial";
+	dbc_tty_driver->name = "ttyDBC";
+
+	dbc_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
+	dbc_tty_driver->subtype = SERIAL_TYPE_NORMAL;
+	dbc_tty_driver->init_termios = tty_std_termios;
+	dbc_tty_driver->init_termios.c_cflag =
+			B9600 | CS8 | CREAD | HUPCL | CLOCAL;
+	dbc_tty_driver->init_termios.c_ispeed = 9600;
+	dbc_tty_driver->init_termios.c_ospeed = 9600;
+
+	tty_set_operations(dbc_tty_driver, &dbc_tty_ops);
+
+	ret = tty_register_driver(dbc_tty_driver);
+	if (ret) {
+		pr_err("Can't register dbc tty driver\n");
+		put_tty_driver(dbc_tty_driver);
+	}
+	return ret;
+}
+
+static void dbc_tty_exit(void)
+{
+	if (dbc_tty_driver) {
+		tty_unregister_driver(dbc_tty_driver);
+		put_tty_driver(dbc_tty_driver);
+		dbc_tty_driver = NULL;
+	}
+}
+
+
-- 
2.17.1

