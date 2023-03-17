Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8B66BED40
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjCQPq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjCQPq2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FFEB79DD
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067980; x=1710603980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y5e09OcR3ivWyw3yRMqU275NTPXC7+fYHPLkfbKUXdY=;
  b=CVeZncjnV+KgUUnIF3Xm1Rw6ComoNQoVON4ZcEcoXmFh1wJVrZMiDngP
   fnGWVIO1iV3isJ3TcNcmA6RMW1eeu6MnD6quatWYz6EJ6xomtGbi54ABv
   F9jUFsffxoC2XoMFLZBzdMMen0aqKVm2HCaAtD8k7dCf1Iso+EtdZL7n2
   ojjYQHw9YuXyuGcYNd0tv9Q8QTIDjKrBhZkVs6wh/K8vtY+d923RTQYyh
   pfNCGb+Rq/WCOE9TdxS/pF0YNwNPEX8K+XsIF/fWw48mDu9qs8ColKeGD
   n367xmpP/6GV0KJaIw/k0dW0GNOiHTs5yVODafUiCrW7Oeb0OsLnwrimN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309879"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309879"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312019"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312019"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:18 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/14] xhci: move PCI specific MSI/MSIX cleanup away from generic xhci functions
Date:   Fri, 17 Mar 2023 17:47:12 +0200
Message-Id: <20230317154715.535523-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
References: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>

Call the PCI specific MSI/MSIX interrupt freeing code from the xhci-pci
callbacks instead of generic xhci code, decoupling PCI parts from
generic xhci functions.

Adds xhci_pci_stop() that overrides xhci_stop() for PCI xHC controllers.

This will free MSIX interrupts a bit later in the hc_driver stop
callback, but is still earlier than usb core frees "legacy" interrupts,
or interrupts for other hosts.

Signed-off-by: Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 12 ++++++++++++
 drivers/usb/host/xhci.c     | 10 ++++------
 drivers/usb/host/xhci.h     |  2 ++
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2d56b7477fcd..b6cfc028f8f7 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -230,6 +230,16 @@ static int xhci_pci_run(struct usb_hcd *hcd)
 	return xhci_run(hcd);
 }
 
+static void xhci_pci_stop(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	xhci_stop(hcd);
+
+	if (usb_hcd_is_primary_hcd(hcd))
+		xhci_cleanup_msix(xhci);
+}
+
 /* called after powerup, by probe or system-pm "wakeup" */
 static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
 {
@@ -868,6 +878,7 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
 
 	xhci_shutdown(hcd);
+	xhci_cleanup_msix(xhci);
 
 	/* Yet another workaround for spurious wakeups at shutdown with HSW */
 	if (xhci->quirks & XHCI_SPURIOUS_WAKEUP)
@@ -932,6 +943,7 @@ static int __init xhci_pci_init(void)
 	xhci_pci_hc_driver.pci_poweroff_late = xhci_pci_poweroff_late;
 	xhci_pci_hc_driver.shutdown = xhci_pci_shutdown;
 #endif
+	xhci_pci_hc_driver.stop = xhci_pci_stop;
 	return pci_register_driver(&xhci_pci_driver);
 }
 module_init(xhci_pci_init);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9be84e635e1b..cf90751125ed 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -321,7 +321,7 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 #ifdef CONFIG_USB_PCI
 
 /* Free any IRQs and disable MSI-X */
-static void xhci_cleanup_msix(struct xhci_hcd *xhci)
+void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
@@ -345,6 +345,7 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
+EXPORT_SYMBOL_GPL(xhci_cleanup_msix);
 
 static void __maybe_unused xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
@@ -617,7 +618,7 @@ EXPORT_SYMBOL_GPL(xhci_run);
  * Disable device contexts, disable IRQs, and quiesce the HC.
  * Reset the HC, finish any completed transactions, and cleanup memory.
  */
-static void xhci_stop(struct usb_hcd *hcd)
+void xhci_stop(struct usb_hcd *hcd)
 {
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
@@ -640,8 +641,6 @@ static void xhci_stop(struct usb_hcd *hcd)
 	xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
 	spin_unlock_irq(&xhci->lock);
 
-	xhci_cleanup_msix(xhci);
-
 	/* Deleting Compliance Mode Recovery Timer */
 	if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 			(!(xhci_all_ports_seen_u0(xhci)))) {
@@ -668,6 +667,7 @@ static void xhci_stop(struct usb_hcd *hcd)
 			readl(&xhci->op_regs->status));
 	mutex_unlock(&xhci->mutex);
 }
+EXPORT_SYMBOL_GPL(xhci_stop);
 
 /*
  * Shutdown HC (not bus-specific)
@@ -709,8 +709,6 @@ void xhci_shutdown(struct usb_hcd *hcd)
 
 	spin_unlock_irq(&xhci->lock);
 
-	xhci_cleanup_msix(xhci);
-
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"xhci_shutdown completed - status = %x",
 			readl(&xhci->op_regs->status));
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 786002bb35db..a9111260632c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2125,6 +2125,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us);
 int xhci_run(struct usb_hcd *hcd);
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks);
 void xhci_shutdown(struct usb_hcd *hcd);
+void xhci_stop(struct usb_hcd *hcd);
 void xhci_init_driver(struct hc_driver *drv,
 		      const struct xhci_driver_overrides *over);
 int xhci_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
@@ -2143,6 +2144,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);
+void xhci_cleanup_msix(struct xhci_hcd *xhci);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.25.1

