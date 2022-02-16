Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAEF4B83AB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbiBPJIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:08:34 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiBPJId (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:08:33 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF9B1C91A
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645002492; x=1676538492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gNEJB2Uc7tBrG9pOwxF9bnal5WRJiIURinEqgb4vCVs=;
  b=Fx7JUYNweZIxaFyFoc3oFrtJ57ZJVRG6ha0psPnhYgaPb/L6fZ7sigz3
   9p/aiXPasmmP+M4VhGRIOziBwIWqgcIukhWyduiGd2f/T7S7q12tuCgyn
   u5cDLWW2cHHXn86ywtU7EyzGpZvdG7cgHAB/X/f22lZPIRbOSH9Lnu+vX
   JynHUu+c0XnPiOBSG9K9OFG/6SaGaWjexYeAidKb/1vdHb8UzMPIYHbuR
   Bki7/9XKCoMb0RvvlJBy1NGKljqRoF1ejb2qdbO+6CSGaDdeItjAfju/m
   fzANtdvP9giKTweOJTEy9CQWkiO/xuZ86mqkcMP8LuuUVYjiC93tg21yC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275138023"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="275138023"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="571190311"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 16 Feb 2022 01:08:08 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/9] xhci: dbc: create and remove dbc structure in dbgtty driver.
Date:   Wed, 16 Feb 2022 11:09:31 +0200
Message-Id: <20220216090938.1260899-3-mathias.nyman@linux.intel.com>
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

Turn the dbgtty closer to a device driver by allocating the dbc
structure in its own xhci_dbc_tty_probe() function, and freeing it
in xhci_dbc_tty_remove()

Remove xhci_do_dbc_exit() as its no longer needed.

allocate and create the dbc strcuture in xhci_dbc_tty_probe()

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 26 +++-----------------------
 drivers/usb/host/xhci-dbgcap.h |  5 ++++-
 drivers/usb/host/xhci-dbgtty.c | 22 +++++++++++++++-------
 3 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 6a437862b498..f4da5708a40f 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -914,16 +914,6 @@ static void xhci_dbc_handle_events(struct work_struct *work)
 	mod_delayed_work(system_wq, &dbc->event_work, 1);
 }
 
-static void xhci_do_dbc_exit(struct xhci_hcd *xhci)
-{
-	unsigned long		flags;
-
-	spin_lock_irqsave(&xhci->lock, flags);
-	kfree(xhci->dbc);
-	xhci->dbc = NULL;
-	spin_unlock_irqrestore(&xhci->lock, flags);
-}
-
 static ssize_t dbc_show(struct device *dev,
 			struct device_attribute *attr,
 			char *buf)
@@ -984,7 +974,7 @@ static ssize_t dbc_store(struct device *dev,
 static DEVICE_ATTR_RW(dbc);
 
 struct xhci_dbc *
-xhci_alloc_dbc(struct device *dev, void __iomem *base)
+xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *driver)
 {
 	struct xhci_dbc		*dbc;
 	int			ret;
@@ -995,6 +985,7 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base)
 
 	dbc->regs = base;
 	dbc->dev = dev;
+	dbc->driver = driver;
 
 	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
 		return NULL;
@@ -1045,18 +1036,8 @@ int xhci_dbc_init(struct xhci_hcd *xhci)
 	if (xhci->dbc)
 		return -EBUSY;
 
-	xhci->dbc = xhci_alloc_dbc(dev, base);
-	if (!xhci->dbc)
-		return -ENOMEM;
-
-	ret = xhci_dbc_tty_probe(xhci);
-	if (ret)
-		goto init_err2;
-
-	return 0;
+	ret = xhci_dbc_tty_probe(dev, base + dbc_cap_offs, xhci);
 
-init_err2:
-	xhci_do_dbc_exit(xhci);
 	return ret;
 }
 
@@ -1068,7 +1049,6 @@ void xhci_dbc_exit(struct xhci_hcd *xhci)
 		return;
 
 	xhci_dbc_tty_remove(xhci->dbc);
-	xhci_dbc_remove(xhci->dbc);
 	spin_lock_irqsave(&xhci->lock, flags);
 	xhci->dbc = NULL;
 	spin_unlock_irqrestore(&xhci->lock, flags);
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index c70b78d504eb..5d8c7815491c 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -196,8 +196,11 @@ static inline struct dbc_ep *get_out_ep(struct xhci_dbc *dbc)
 #ifdef CONFIG_USB_XHCI_DBGCAP
 int xhci_dbc_init(struct xhci_hcd *xhci);
 void xhci_dbc_exit(struct xhci_hcd *xhci);
-int xhci_dbc_tty_probe(struct xhci_hcd *xhci);
+int xhci_dbc_tty_probe(struct device *dev, void __iomem *res, struct xhci_hcd *xhci);
 void xhci_dbc_tty_remove(struct xhci_dbc *dbc);
+struct xhci_dbc *xhci_alloc_dbc(struct device *dev, void __iomem *res,
+				 const struct dbc_driver *driver);
+void xhci_dbc_remove(struct xhci_dbc *dbc);
 struct dbc_request *dbc_alloc_request(struct xhci_dbc *dbc,
 				      unsigned int direction,
 				      gfp_t flags);
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index eb46e642e87a..18bcc96853ae 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -468,9 +468,9 @@ static const struct dbc_driver dbc_driver = {
 	.disconnect		= xhci_dbc_tty_unregister_device,
 };
 
-int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
+int xhci_dbc_tty_probe(struct device *dev, void __iomem *base, struct xhci_hcd *xhci)
 {
-	struct xhci_dbc		*dbc = xhci->dbc;
+	struct xhci_dbc		*dbc;
 	struct dbc_port		*port;
 	int			status;
 
@@ -485,13 +485,22 @@ int xhci_dbc_tty_probe(struct xhci_hcd *xhci)
 		goto out;
 	}
 
-	dbc->driver = &dbc_driver;
-	dbc->priv = port;
+	dbc_tty_driver->driver_state = port;
+
+	dbc = xhci_alloc_dbc(dev, base, &dbc_driver);
+	if (!dbc) {
+		status = -ENOMEM;
+		goto out2;
+	}
 
+	dbc->priv = port;
 
-	dbc_tty_driver->driver_state = port;
+	/* get rid of xhci once this is a real driver binding to a device */
+	xhci->dbc = dbc;
 
 	return 0;
+out2:
+	kfree(port);
 out:
 	/* dbc_tty_exit will be called by module_exit() in the future */
 	dbc_tty_exit();
@@ -506,8 +515,7 @@ void xhci_dbc_tty_remove(struct xhci_dbc *dbc)
 {
 	struct dbc_port         *port = dbc_to_port(dbc);
 
-	dbc->driver = NULL;
-	dbc->priv = NULL;
+	xhci_dbc_remove(dbc);
 	kfree(port);
 
 	/* dbc_tty_exit will be called by  module_exit() in the future */
-- 
2.25.1

