Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831454B84DC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiBPJvK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:51:10 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbiBPJvJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:51:09 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2A82A0D4C
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645005044; x=1676541044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZuvDnbFqESmsABnpoIdbu94q6Dz8Ge7QduTLnsIR4ys=;
  b=WW7FKxJNgaomJDRex9YCsmchZWK1f8qN3UI2UPoZ4OGv7VKh5hYKvQMW
   wp0i//b9rmNmXFiehxs3R9ySItBThAp3Ny/P+qudl42oO789ytmuSx/Hi
   JkAU3QxQJsYl/wkGtbeRJn+LOIh/vyl7kmnvWrYERqruvsh3uhvBc39Mq
   bacFsReHoILW0IKA7DIA13mSQ/aDnqegWjfX1+k8Bf4mvXQ2B8T9Ht7Xu
   /PykdKwQyjnWCjKWMTMQHtjbrl26tZwPJtjvsBNhESF+sUm0YbnEOkp3j
   HivyHuWXyYLUDA/R/+dEc2HmYfiwPR3PxUepHw/4VjiJnqGJp3bb2ui8F
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249396955"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="249396955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 01:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="636410319"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2022 01:50:24 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 3/9] xhci: dbc: Rename xhci_dbc_init and xhci_dbc_exit
Date:   Wed, 16 Feb 2022 11:51:47 +0200
Message-Id: <20220216095153.1303105-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These names give the impression the functions are related to
module init calls, but are in fact creating and removing the dbc
fake device

Rename them to xhci_create_dbc_dev() and xhci_remove_dbc_dev().

We will need the _init and _exit names for actual dbc module init
and exit calls.

No functional changes

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 5 +++--
 drivers/usb/host/xhci-dbgcap.h | 8 ++++----
 drivers/usb/host/xhci.c        | 4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index f4da5708a40f..46c8f3c187f7 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1017,7 +1017,8 @@ void xhci_dbc_remove(struct xhci_dbc *dbc)
 	kfree(dbc);
 }
 
-int xhci_dbc_init(struct xhci_hcd *xhci)
+
+int xhci_create_dbc_dev(struct xhci_hcd *xhci)
 {
 	struct device		*dev;
 	void __iomem		*base;
@@ -1041,7 +1042,7 @@ int xhci_dbc_init(struct xhci_hcd *xhci)
 	return ret;
 }
 
-void xhci_dbc_exit(struct xhci_hcd *xhci)
+void xhci_remove_dbc_dev(struct xhci_hcd *xhci)
 {
 	unsigned long		flags;
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 5d8c7815491c..8b5b363a0719 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -194,8 +194,8 @@ static inline struct dbc_ep *get_out_ep(struct xhci_dbc *dbc)
 }
 
 #ifdef CONFIG_USB_XHCI_DBGCAP
-int xhci_dbc_init(struct xhci_hcd *xhci);
-void xhci_dbc_exit(struct xhci_hcd *xhci);
+int xhci_create_dbc_dev(struct xhci_hcd *xhci);
+void xhci_remove_dbc_dev(struct xhci_hcd *xhci);
 int xhci_dbc_tty_probe(struct device *dev, void __iomem *res, struct xhci_hcd *xhci);
 void xhci_dbc_tty_remove(struct xhci_dbc *dbc);
 struct xhci_dbc *xhci_alloc_dbc(struct device *dev, void __iomem *res,
@@ -211,12 +211,12 @@ int xhci_dbc_suspend(struct xhci_hcd *xhci);
 int xhci_dbc_resume(struct xhci_hcd *xhci);
 #endif /* CONFIG_PM */
 #else
-static inline int xhci_dbc_init(struct xhci_hcd *xhci)
+static inline int xhci_create_dbc_dev(struct xhci_hcd *xhci)
 {
 	return 0;
 }
 
-static inline void xhci_dbc_exit(struct xhci_hcd *xhci)
+static inline void xhci_remove_dbc_dev(struct xhci_hcd *xhci)
 {
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dc357cabb265..ab1b5ff3fc99 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -695,7 +695,7 @@ int xhci_run(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Finished xhci_run for USB2 roothub");
 
-	xhci_dbc_init(xhci);
+	xhci_create_dbc_dev(xhci);
 
 	xhci_debugfs_init(xhci);
 
@@ -725,7 +725,7 @@ static void xhci_stop(struct usb_hcd *hcd)
 		return;
 	}
 
-	xhci_dbc_exit(xhci);
+	xhci_remove_dbc_dev(xhci);
 
 	spin_lock_irq(&xhci->lock);
 	xhci->xhc_state |= XHCI_STATE_HALTED;
-- 
2.25.1

