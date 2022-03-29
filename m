Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F3E4EB0E8
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 17:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238937AbiC2PqB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 11:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238935AbiC2Pp7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 11:45:59 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8964313D5C
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648568656; x=1680104656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eYM+PXwO6L9Py1XrjSadrSJdskCV0rJv7lc7XU2JVO4=;
  b=ia0okGPsgQkCpDCRxzD2tIees3+Vx3g+jSpue/+pfGqw9zfdLvzJ1g7p
   5JIEQKXVBWz6Y9M9oKTM7OfFWha+vJalZjMSsqYwGDWtS0kNfiHWExgqn
   LnUxuE1TBs85skmReMdVu6bT2x9ybigh4ICbbaw4KF8EKmmnFIY2qjNsb
   yLEeH/9tZSxjbq9fL8j0fDrEyt1G/HirNh+NZELyCEQNBSxZyR9ftnC6J
   1AR7tcLmiO8z6ggQ9258oSmWWKrkLlVDLW+hDFhRdtbEsUaxpoVFDa2xm
   AAFQC/m3yIz5kMwm6YRN5jTdXvepmZunxv9+N1foakeK+5afOoVrPNUp9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259466656"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259466656"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:44:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="834845716"
Received: from kvenkat1-mobl.amr.corp.intel.com (HELO josuedhx-mobl1.intel.com) ([10.209.85.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:44:15 -0700
From:   Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@linux.intel.com,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
Subject: [PATCH 2/2] usb: host: xhci: Move msi/msi-x functions to xhci-pci
Date:   Tue, 29 Mar 2022 09:44:06 -0600
Message-Id: <20220329154406.5485-2-josue.d.hernandez.gutierrez@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
References: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There were sync and cleanup msi/msix functions in xhci inside a #ifdef
macro to check if PCI module is being compiling. These functions has
been moved to xhci-pci where they belong.

Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
---
 drivers/usb/host/xhci-pci.c | 55 +++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c     | 64 ++-----------------------------------
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 58 insertions(+), 62 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index f5a942ca65fd..2e771f9c147c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -92,6 +92,45 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.start = xhci_pci_run,
 };
 
+/* Free any IRQs and disable MSI-X */
+static void xhci_cleanup_msix(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+
+	if (xhci->quirks & XHCI_PLAT)
+		return;
+
+	/* return if using legacy interrupt */
+	if (hcd->irq > 0)
+		return;
+
+	if (hcd->msix_enabled) {
+		int i;
+
+		for (i = 0; i < xhci->msix_count; i++)
+			free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
+	} else {
+		free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+	}
+
+	pci_free_irq_vectors(pdev);
+	hcd->msix_enabled = 0;
+}
+
+static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+
+	if (hcd->msix_enabled) {
+		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+		int i;
+
+		for (i = 0; i < xhci->msix_count; i++)
+			synchronize_irq(pci_irq_vector(pdev, i));
+	}
+}
+
 /*
  * Set up MSI
  */
@@ -233,6 +272,16 @@ static int xhci_pci_run(struct usb_hcd *hcd)
 	return xhci_run(hcd);
 }
 
+static void xhci_pci_stop(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	if (usb_hcd_is_primary_hcd(hcd))
+		xhci_cleanup_msix(xhci);
+
+	xhci_stop(hcd);
+}
+
 /* called after powerup, by probe or system-pm "wakeup" */
 static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
 {
@@ -725,6 +774,10 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 		xhci_sparse_control_quirk(hcd);
 
 	ret = xhci_suspend(xhci, do_wakeup);
+
+	/* synchronize irq when using MSI-X */
+	xhci_msix_sync_irqs(xhci);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -776,6 +829,7 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
 
 	xhci_shutdown(hcd);
+	xhci_cleanup_msix(xhci);
 
 	/* Yet another workaround for spurious wakeups at shutdown with HSW */
 	if (xhci->quirks & XHCI_SPURIOUS_WAKEUP)
@@ -838,6 +892,7 @@ static int __init xhci_pci_init(void)
 	xhci_pci_hc_driver.pci_resume = xhci_pci_resume;
 	xhci_pci_hc_driver.shutdown = xhci_pci_shutdown;
 #endif
+	xhci_pci_hc_driver.stop = xhci_pci_stop;
 	return pci_register_driver(&xhci_pci_driver);
 }
 module_init(xhci_pci_init);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1d9cb04301bf..5dd60d50acef 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -290,59 +290,6 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci)
 		xhci_info(xhci, "Fault detected\n");
 }
 
-#ifdef CONFIG_USB_PCI
-
-/* Free any IRQs and disable MSI-X */
-static void xhci_cleanup_msix(struct xhci_hcd *xhci)
-{
-	struct usb_hcd *hcd = xhci_to_hcd(xhci);
-	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-
-	if (xhci->quirks & XHCI_PLAT)
-		return;
-
-	/* return if using legacy interrupt */
-	if (hcd->irq > 0)
-		return;
-
-	if (hcd->msix_enabled) {
-		int i;
-
-		for (i = 0; i < xhci->msix_count; i++)
-			free_irq(pci_irq_vector(pdev, i), xhci_to_hcd(xhci));
-	} else {
-		free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
-	}
-
-	pci_free_irq_vectors(pdev);
-	hcd->msix_enabled = 0;
-}
-
-static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
-{
-	struct usb_hcd *hcd = xhci_to_hcd(xhci);
-
-	if (hcd->msix_enabled) {
-		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-		int i;
-
-		for (i = 0; i < xhci->msix_count; i++)
-			synchronize_irq(pci_irq_vector(pdev, i));
-	}
-}
-
-#else
-
-static inline void xhci_cleanup_msix(struct xhci_hcd *xhci)
-{
-}
-
-static inline void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
-{
-}
-
-#endif
-
 static void compliance_mode_recovery(struct timer_list *t)
 {
 	struct xhci_hcd *xhci;
@@ -576,7 +523,7 @@ EXPORT_SYMBOL_GPL(xhci_run);
  * Disable device contexts, disable IRQs, and quiesce the HC.
  * Reset the HC, finish any completed transactions, and cleanup memory.
  */
-static void xhci_stop(struct usb_hcd *hcd)
+void xhci_stop(struct usb_hcd *hcd)
 {
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
@@ -598,8 +545,6 @@ static void xhci_stop(struct usb_hcd *hcd)
 	xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
 	spin_unlock_irq(&xhci->lock);
 
-	xhci_cleanup_msix(xhci);
-
 	/* Deleting Compliance Mode Recovery Timer */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 			(!(xhci_all_ports_seen_u0(xhci)))) {
@@ -627,6 +572,7 @@ static void xhci_stop(struct usb_hcd *hcd)
 			readl(&xhci->op_regs->status));
 	mutex_unlock(&xhci->mutex);
 }
+EXPORT_SYMBOL_GPL(xhci_stop);
 
 /*
  * Shutdown HC (not bus-specific)
@@ -651,8 +597,6 @@ void xhci_shutdown(struct usb_hcd *hcd)
 		xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
 	spin_unlock_irq(&xhci->lock);
 
-	xhci_cleanup_msix(xhci);
-
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"xhci_shutdown completed - status = %x",
 			readl(&xhci->op_regs->status));
@@ -933,10 +877,6 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 				__func__);
 	}
 
-	/* step 5: remove core well power */
-	/* synchronize irq when using MSI-X */
-	xhci_msix_sync_irqs(xhci);
-
 	return rc;
 }
 EXPORT_SYMBOL_GPL(xhci_suspend);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 473a33ce299e..1ab641d175b3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2092,6 +2092,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us);
 int xhci_run(struct usb_hcd *hcd);
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks);
 void xhci_shutdown(struct usb_hcd *hcd);
+void xhci_stop(struct usb_hcd *hcd);
 void xhci_init_driver(struct hc_driver *drv,
 		      const struct xhci_driver_overrides *over);
 int xhci_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
-- 
2.35.1

