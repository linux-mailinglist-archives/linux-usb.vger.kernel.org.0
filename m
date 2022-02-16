Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E26D4B83A2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbiBPJIm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:08:42 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiBPJIk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:08:40 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803791A836
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645002502; x=1676538502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oJSWtIz8d7tUh3Uf0MeeJZJ2cPHy0AoHK4uCJu9ayS0=;
  b=BLAsi+B8CJ1lGZ15kgGoiHKvCGg535dGe9novUWkCSqYKeRe//25TbNM
   jDitjTNX4v2TbVfyt66w+flzyeARm5mITiD/ikRnYkUqbBkpJ66JRO0LP
   oBLK4CyGWTgEBhPpbn1MSVChoxgt2jp94hmSWED37trns4dYMuMnA4F8/
   X7do7bYsBwUKQWOkEs/uMtJcXm11Q9p0UqmTuEdsH1Ura58nzR6/jNrf0
   xwkqHwJVti/aWX9tpNUEFtoKm7oInU8Nysid4HG2Y+DqEfaU97kTJjF24
   iLWGl/PbFH0W1iozdB8+VQvmcbNaeCbrVrV9Gi8jstf7qKgNYsSrTOWcn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275138028"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="275138028"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571190341"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2022 01:08:12 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/9] xhci: dbc: Don't call dbc_tty_init() on every dbc tty probe
Date:   Wed, 16 Feb 2022 11:09:33 +0200
Message-Id: <20220216090938.1260899-5-mathias.nyman@linux.intel.com>
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

The current workaround to call the dbc_tty_init() in probe is
not working in case we have several xhci devices with dbc enabled.

dbc_tty_init() should be called only once by a module init call when
module is loaded.

until dbgtty is its own module call dbc_tty_init() from xhci
module init call.

Same is true for unloading and dbc_tty_exit()

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 10 ++++++++++
 drivers/usb/host/xhci-dbgcap.h | 12 +++++++++++-
 drivers/usb/host/xhci-dbgtty.c | 26 +++++++-------------------
 drivers/usb/host/xhci.c        |  2 ++
 4 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 46c8f3c187f7..e61155fa6379 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1087,3 +1087,13 @@ int xhci_dbc_resume(struct xhci_hcd *xhci)
 	return ret;
 }
 #endif /* CONFIG_PM */
+
+int xhci_dbc_init(void)
+{
+	return dbc_tty_init();
+}
+
+void xhci_dbc_exit(void)
+{
+	dbc_tty_exit();
+}
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 8b5b363a0719..5f3304a06591 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -196,6 +196,10 @@ static inline struct dbc_ep *get_out_ep(struct xhci_dbc *dbc)
 #ifdef CONFIG_USB_XHCI_DBGCAP
 int xhci_create_dbc_dev(struct xhci_hcd *xhci);
 void xhci_remove_dbc_dev(struct xhci_hcd *xhci);
+int xhci_dbc_init(void);
+void xhci_dbc_exit(void);
+int dbc_tty_init(void);
+void dbc_tty_exit(void);
 int xhci_dbc_tty_probe(struct device *dev, void __iomem *res, struct xhci_hcd *xhci);
 void xhci_dbc_tty_remove(struct xhci_dbc *dbc);
 struct xhci_dbc *xhci_alloc_dbc(struct device *dev, void __iomem *res,
@@ -219,7 +223,13 @@ static inline int xhci_create_dbc_dev(struct xhci_hcd *xhci)
 static inline void xhci_remove_dbc_dev(struct xhci_hcd *xhci)
 {
 }
-
+static inline int xhci_dbc_init(void)
+{
+	return 0;
+}
+static inline void xhci_dbc_exit(void)
+{
+}
 static inline int xhci_dbc_suspend(struct xhci_hcd *xhci)
 {
 	return 0;
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 18bcc96853ae..ad1db371e38d 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -14,9 +14,6 @@
 #include "xhci.h"
 #include "xhci-dbgcap.h"
 
-static int dbc_tty_init(void);
-static void dbc_tty_exit(void);
-
 static struct tty_driver *dbc_tty_driver;
 
 static inline struct dbc_port *dbc_to_port(struct xhci_dbc *dbc)
@@ -474,16 +471,12 @@ int xhci_dbc_tty_probe(struct device *dev, void __iomem *base, struct xhci_hcd *
 	struct dbc_port		*port;
 	int			status;
 
-	/* dbc_tty_init will be called by module init() in the future */
-	status = dbc_tty_init();
-	if (status)
-		return status;
+	if (!dbc_tty_driver)
+		return -ENODEV; // MATTU FIXME is this ok??
 
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
-	if (!port) {
-		status = -ENOMEM;
-		goto out;
-	}
+	if (!port)
+		return -ENOMEM;
 
 	dbc_tty_driver->driver_state = port;
 
@@ -501,9 +494,7 @@ int xhci_dbc_tty_probe(struct device *dev, void __iomem *base, struct xhci_hcd *
 	return 0;
 out2:
 	kfree(port);
-out:
-	/* dbc_tty_exit will be called by module_exit() in the future */
-	dbc_tty_exit();
+
 	return status;
 }
 
@@ -517,12 +508,9 @@ void xhci_dbc_tty_remove(struct xhci_dbc *dbc)
 
 	xhci_dbc_remove(dbc);
 	kfree(port);
-
-	/* dbc_tty_exit will be called by  module_exit() in the future */
-	dbc_tty_exit();
 }
 
-static int dbc_tty_init(void)
+int dbc_tty_init(void)
 {
 	int		ret;
 
@@ -552,7 +540,7 @@ static int dbc_tty_init(void)
 	return ret;
 }
 
-static void dbc_tty_exit(void)
+void dbc_tty_exit(void)
 {
 	if (dbc_tty_driver) {
 		tty_unregister_driver(dbc_tty_driver);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ab1b5ff3fc99..17a561abfab7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5495,6 +5495,7 @@ static int __init xhci_hcd_init(void)
 		return -ENODEV;
 
 	xhci_debugfs_create_root();
+	xhci_dbc_init();
 
 	return 0;
 }
@@ -5506,6 +5507,7 @@ static int __init xhci_hcd_init(void)
 static void __exit xhci_hcd_fini(void)
 {
 	xhci_debugfs_remove_root();
+	xhci_dbc_exit();
 }
 
 module_init(xhci_hcd_init);
-- 
2.25.1

