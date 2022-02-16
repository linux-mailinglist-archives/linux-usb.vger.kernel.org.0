Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD3964B83A3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiBPJIm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:08:42 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiBPJIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:08:41 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6621ADB6
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645002502; x=1676538502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PBLkYmXgLBPWb45Aq4s73UkFNW9PvYkS1NLym+UDp10=;
  b=mIv0K4NA7LLH4dMinNXR6zLTk4eY1Lfc4GfmBfMQluarbHFOX2z41f8x
   0ILeMnTQdRaaEmm9lwEYaxtm2PXYd+Lef74SwyURfEmJbO12hzKYHyW0z
   yUzd/Z3olGx/C+2ZqcxjsxD5SZ64jMXG9G0w1kZb/QgljwE2h4W5yGLos
   dP3wKGO6+SGfnVaA2mll0an+f/Y4G/SRHJHt/Zg4yR49gVI+TS5BW58sn
   vMCWlKnKIewH6sgP119rveiEuCDGpqw6Mw3gkE2rMBtOGbtGp2R5A2CE7
   +ZoBbNWuBvFKNuDDHdj43fzWjBFEiMcGOP5HUuSy3kaF8h279hciXEeJQ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275138033"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="275138033"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571190350"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2022 01:08:13 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 5/9] xhci: dbgtty: use IDR to support several dbc instances.
Date:   Wed, 16 Feb 2022 11:09:34 +0200
Message-Id: <20220216090938.1260899-6-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
References: <20220216090938.1260899-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To support systems with several xhci controllers with active
dbc on each xhci we need to use IDR to identify and give
an index to each port.

Avoid using global struct tty_driver.driver_state for storing
dbc port pointer as it won't work with several dbc ports

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.h |  1 +
 drivers/usb/host/xhci-dbgtty.c | 46 ++++++++++++++++++++++++++++------
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 5f3304a06591..ca04192fdab1 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -100,6 +100,7 @@ struct dbc_ep {
 struct dbc_port {
 	struct tty_port			port;
 	spinlock_t			port_lock;	/* port access */
+	int				minor;
 
 	struct list_head		read_pool;
 	struct list_head		read_queue;
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index ad1db371e38d..39a71bdc8d32 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -10,11 +10,14 @@
 #include <linux/slab.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
+#include <linux/idr.h>
 
 #include "xhci.h"
 #include "xhci-dbgcap.h"
 
 static struct tty_driver *dbc_tty_driver;
+static struct idr dbc_tty_minors;
+static DEFINE_MUTEX(dbc_tty_minors_lock);
 
 static inline struct dbc_port *dbc_to_port(struct xhci_dbc *dbc)
 {
@@ -177,7 +180,14 @@ xhci_dbc_free_requests(struct list_head *head)
 
 static int dbc_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 {
-	struct dbc_port		*port = driver->driver_state;
+	struct dbc_port		*port;
+
+	mutex_lock(&dbc_tty_minors_lock);
+	port = idr_find(&dbc_tty_minors, tty->index);
+	mutex_unlock(&dbc_tty_minors_lock);
+
+	if (!port)
+		return -ENXIO;
 
 	tty->driver_data = port;
 
@@ -406,6 +416,15 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 
 	xhci_dbc_tty_init_port(dbc, port);
 
+	mutex_lock(&dbc_tty_minors_lock);
+	port->minor = idr_alloc(&dbc_tty_minors, port, 0, 64, GFP_KERNEL);
+	mutex_unlock(&dbc_tty_minors_lock);
+
+	if (port->minor < 0) {
+		ret = port->minor;
+		goto err_idr;
+	}
+
 	ret = kfifo_alloc(&port->write_fifo, DBC_WRITE_BUF_SIZE, GFP_KERNEL);
 	if (ret)
 		goto err_exit_port;
@@ -421,7 +440,7 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 		goto err_free_requests;
 
 	tty_dev = tty_port_register_device(&port->port,
-					   dbc_tty_driver, 0, NULL);
+					   dbc_tty_driver, port->minor, NULL);
 	if (IS_ERR(tty_dev)) {
 		ret = PTR_ERR(tty_dev);
 		goto err_free_requests;
@@ -437,6 +456,8 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 err_free_fifo:
 	kfifo_free(&port->write_fifo);
 err_exit_port:
+	idr_remove(&dbc_tty_minors, port->minor);
+err_idr:
 	xhci_dbc_tty_exit_port(port);
 
 	dev_err(dbc->dev, "can't register tty port, err %d\n", ret);
@@ -450,10 +471,14 @@ static void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 
 	if (!port->registered)
 		return;
-	tty_unregister_device(dbc_tty_driver, 0);
+	tty_unregister_device(dbc_tty_driver, port->minor);
 	xhci_dbc_tty_exit_port(port);
 	port->registered = false;
 
+	mutex_lock(&dbc_tty_minors_lock);
+	idr_remove(&dbc_tty_minors, port->minor);
+	mutex_unlock(&dbc_tty_minors_lock);
+
 	kfifo_free(&port->write_fifo);
 	xhci_dbc_free_requests(&port->read_pool);
 	xhci_dbc_free_requests(&port->read_queue);
@@ -478,9 +503,8 @@ int xhci_dbc_tty_probe(struct device *dev, void __iomem *base, struct xhci_hcd *
 	if (!port)
 		return -ENOMEM;
 
-	dbc_tty_driver->driver_state = port;
-
 	dbc = xhci_alloc_dbc(dev, base, &dbc_driver);
+
 	if (!dbc) {
 		status = -ENOMEM;
 		goto out2;
@@ -514,10 +538,14 @@ int dbc_tty_init(void)
 {
 	int		ret;
 
-	dbc_tty_driver = tty_alloc_driver(1, TTY_DRIVER_REAL_RAW |
+	idr_init(&dbc_tty_minors);
+
+	dbc_tty_driver = tty_alloc_driver(64, TTY_DRIVER_REAL_RAW |
 					  TTY_DRIVER_DYNAMIC_DEV);
-	if (IS_ERR(dbc_tty_driver))
+	if (IS_ERR(dbc_tty_driver)) {
+		idr_destroy(&dbc_tty_minors);
 		return PTR_ERR(dbc_tty_driver);
+	}
 
 	dbc_tty_driver->driver_name = "dbc_serial";
 	dbc_tty_driver->name = "ttyDBC";
@@ -536,7 +564,9 @@ int dbc_tty_init(void)
 	if (ret) {
 		pr_err("Can't register dbc tty driver\n");
 		tty_driver_kref_put(dbc_tty_driver);
+		idr_destroy(&dbc_tty_minors);
 	}
+
 	return ret;
 }
 
@@ -547,4 +577,6 @@ void dbc_tty_exit(void)
 		tty_driver_kref_put(dbc_tty_driver);
 		dbc_tty_driver = NULL;
 	}
+
+	idr_destroy(&dbc_tty_minors);
 }
-- 
2.25.1

