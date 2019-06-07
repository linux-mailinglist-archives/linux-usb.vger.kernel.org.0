Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA0138477
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 08:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfFGGhv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 02:37:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:57977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727341AbfFGGhv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 02:37:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 23:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,562,1557212400"; 
   d="scan'208";a="182572405"
Received: from intel.iind.intel.com ([10.66.245.146])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2019 23:37:48 -0700
From:   Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, rajaram.regupathy@intel.com,
        abhilash.k.v@intel.com, prabhat.chand.pandey@intel.com,
        m.balaji@intel.com
Subject: [PATCH 2/5] usb: xhci: dbc: DbC TTY driver to use new interface
Date:   Fri,  7 Jun 2019 12:03:03 +0530
Message-Id: <20190607063306.5612-3-prabhat.chand.pandey@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change DbC TTY driver to use the new modular interface exposed by the DbC
core. This will allow other function drivers with a different interface
also to use DbC.

[no need to add running number to tty driver name, remove it. -Mathias]
Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/Kconfig       | 15 ++++++-
 drivers/usb/host/Makefile      |  4 +-
 drivers/usb/host/xhci-dbgcap.h |  4 --
 drivers/usb/host/xhci-dbgtty.c | 81 ++++++++++++++++++++++++++++++----
 4 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d809671c5fea..c29ed8a61dcb 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -30,13 +30,26 @@ config USB_XHCI_HCD
 if USB_XHCI_HCD
 config USB_XHCI_DBGCAP
 	bool "xHCI support for debug capability"
-	depends on TTY
 	---help---
 	  Say 'Y' to enable the support for the xHCI debug capability. Make
 	  sure that your xHCI host supports the extended debug capability and
 	  you want a TTY serial device based on the xHCI debug capability
 	  before enabling this option. If unsure, say 'N'.
 
+choice
+	prompt "Select function for debug capability"
+	depends on USB_XHCI_DBGCAP
+
+config USB_XHCI_DBGCAP_TTY
+	tristate "xHCI DbC tty driver support"
+	depends on USB_XHCI_HCD && USB_XHCI_DBGCAP && TTY
+	help
+	  Say 'Y' to enable the support for the tty driver interface to xHCI
+	  debug capability. This will expose a /dev/ttyDBC* device node on device
+	  which may be used by the usb-debug driver on the debug host.
+	  If unsure, say 'N'.
+endchoice
+
 config USB_XHCI_PCI
        tristate
        depends on USB_PCI
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 84514f71ae44..b21b0ea9e966 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -16,9 +16,11 @@ xhci-hcd-y += xhci-ring.o xhci-hub.o xhci-dbg.o
 xhci-hcd-y += xhci-trace.o
 
 ifneq ($(CONFIG_USB_XHCI_DBGCAP), )
-	xhci-hcd-y += xhci-dbgcap.o xhci-dbgtty.o
+	xhci-hcd-y += xhci-dbgcap.o
 endif
 
+obj-$(CONFIG_USB_XHCI_DBGCAP_TTY) += xhci-dbgtty.o
+
 ifneq ($(CONFIG_USB_XHCI_MTK), )
 	xhci-hcd-y += xhci-mtk-sch.o
 endif
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index b4d5622a9030..302e6ca72370 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -218,10 +218,6 @@ static inline struct dbc_ep *get_out_ep(struct xhci_hcd *xhci)
 #ifdef CONFIG_USB_XHCI_DBGCAP
 int xhci_dbc_init(struct xhci_hcd *xhci);
 void xhci_dbc_exit(struct xhci_hcd *xhci);
-int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci);
-void xhci_dbc_tty_unregister_driver(void);
-int xhci_dbc_tty_register_device(struct xhci_hcd *xhci);
-void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci);
 struct dbc_request *dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags);
 void xhci_dbc_flush_reqests(struct xhci_dbc *dbc);
 void dbc_free_request(struct dbc_ep *dep, struct dbc_request *req);
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index aff79ff5aba4..f75a95006c51 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -7,13 +7,15 @@
  * Author: Lu Baolu <baolu.lu@linux.intel.com>
  */
 
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
-
 #include "xhci.h"
 #include "xhci-dbgcap.h"
 
+#define DBC_STR_FUNC_TTY    "TTY"
+
 static unsigned int
 dbc_send_packet(struct dbc_port *port, char *packet, unsigned int size)
 {
@@ -279,12 +281,11 @@ static const struct tty_operations dbc_tty_ops = {
 	.unthrottle		= dbc_tty_unthrottle,
 };
 
-static struct tty_driver *dbc_tty_driver;
-
-int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
+static int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
 {
 	int			status;
 	struct xhci_dbc		*dbc = xhci->dbc;
+	struct tty_driver	*dbc_tty_driver;
 
 	dbc_tty_driver = tty_alloc_driver(1, TTY_DRIVER_REAL_RAW |
 					  TTY_DRIVER_DYNAMIC_DEV);
@@ -296,7 +297,6 @@ int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
 
 	dbc_tty_driver->driver_name = "dbc_serial";
 	dbc_tty_driver->name = "ttyDBC";
-
 	dbc_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
 	dbc_tty_driver->subtype = SERIAL_TYPE_NORMAL;
 	dbc_tty_driver->init_termios = tty_std_termios;
@@ -315,16 +315,19 @@ int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
 		put_tty_driver(dbc_tty_driver);
 		dbc_tty_driver = NULL;
 	}
+	dbc->func_priv = dbc_tty_driver;
 
 	return status;
 }
 
-void xhci_dbc_tty_unregister_driver(void)
+static void xhci_dbc_tty_unregister_driver(struct xhci_dbc *dbc)
 {
+	struct tty_driver	*dbc_tty_driver =
+					(struct tty_driver *) dbc->func_priv;
 	if (dbc_tty_driver) {
 		tty_unregister_driver(dbc_tty_driver);
 		put_tty_driver(dbc_tty_driver);
-		dbc_tty_driver = NULL;
+		dbc->func_priv = NULL;
 	}
 }
 
@@ -440,12 +443,14 @@ xhci_dbc_tty_exit_port(struct dbc_port *port)
 	tty_port_destroy(&port->port);
 }
 
-int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
+static int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
 {
 	int			ret;
 	struct device		*tty_dev;
 	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
+	struct tty_driver	*dbc_tty_driver =
+					(struct tty_driver *) dbc->func_priv;
 
 	xhci_dbc_tty_init_port(xhci, port);
 	tty_dev = tty_port_register_device(&port->port,
@@ -493,6 +498,8 @@ void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci)
 {
 	struct xhci_dbc		*dbc = xhci->dbc;
 	struct dbc_port		*port = &dbc->port;
+	struct tty_driver	*dbc_tty_driver =
+					(struct tty_driver *) dbc->func_priv;
 
 	tty_unregister_device(dbc_tty_driver, 0);
 	xhci_dbc_tty_exit_port(port);
@@ -503,3 +510,61 @@ void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci)
 	xhci_dbc_free_requests(get_out_ep(xhci), &port->read_queue);
 	xhci_dbc_free_requests(get_in_ep(xhci), &port->write_pool);
 }
+
+static int dbc_tty_post_config(struct xhci_dbc *dbc)
+{
+	return xhci_dbc_tty_register_device(dbc->xhci);
+}
+
+static int dbc_tty_post_disconnect(struct xhci_dbc *dbc)
+{
+	xhci_dbc_tty_unregister_device(dbc->xhci);
+	return 0;
+}
+
+static int dbc_tty_run(struct xhci_dbc *dbc)
+{
+	return  xhci_dbc_tty_register_driver(dbc->xhci);
+}
+
+static int dbc_tty_stop(struct xhci_dbc *dbc)
+{
+	xhci_dbc_tty_unregister_driver(dbc);
+	return 0;
+}
+
+static struct dbc_function tty_func = {
+	.owner = THIS_MODULE,
+	.string = {
+		.manufacturer = DBC_STR_MANUFACTURER,
+		.product = DBC_STR_PRODUCT,
+		.serial = DBC_STR_SERIAL,
+	},
+	.protocol = DBC_PROTOCOL,
+	.vid =     DBC_VENDOR_ID,
+	.pid =     DBC_PRODUCT_ID,
+	.device_rev = DBC_DEVICE_REV,
+	.func_name = DBC_STR_FUNC_TTY,
+
+	.post_config = dbc_tty_post_config,
+	.post_disconnect = dbc_tty_post_disconnect,
+	.run = dbc_tty_run,
+	.stop = dbc_tty_stop,
+};
+
+static int __init xhci_dbc_tty_init(void)
+{
+	return xhci_dbc_register_function(&tty_func);
+}
+
+static void __exit xhci_dbc_tty_fini(void)
+{
+	xhci_dbc_unregister_function();
+}
+
+late_initcall(xhci_dbc_tty_init);
+module_exit(xhci_dbc_tty_fini);
+
+MODULE_DESCRIPTION("xHCI DbC tty driver");
+MODULE_AUTHOR("Baoulu Lu");
+MODULE_LICENSE("GPL");
-- 
2.21.0

