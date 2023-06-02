Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F74720497
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236037AbjFBOjC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235983AbjFBOjC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:39:02 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BF7BC
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716740; x=1717252740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2pSxjpyjgRloB577VdJRXEiElOZoR1fwgdiCAS06D0k=;
  b=As18JRUEs/VrZ1mtLPt7Tm4Qr9FhR1MIj7FJoouyFVhF6F3uuXkyUO2Q
   7fY0NNcXYH1ghMTshy6+QaPpIDAiEfmVRCHYD8h2cbQ9A1lzLaOb1c4C7
   w3peSBSovjDhAnW4uIbG7BemqNSYJBg08u/gfxGlrnNeiHHZZXEUGa3na
   2esyDVBDRbqLikAXZpX2eI1zPFPrpNMrk7HqQ3hGHeCHMX1KcHCyqefgK
   Ia2+PaUC1Of9S5I9herAocZeePTlX0BZM5sN237jThc5b1ARe5djIkuwW
   Efyj/uKCK/28AzWKwm8C5ljhBfT/pglLvKfxeqOue6aen9fGTHfYAYUSb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311245"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311245"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877448"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877448"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:38:58 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 04/11] xhci: get rid of XHCI_PLAT quirk that used to prevent MSI setup
Date:   Fri,  2 Jun 2023 17:40:02 +0300
Message-Id: <20230602144009.1225632-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
References: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The XHCI_PLAT quirk was only needed to ensure non-PCI xHC host avoided
setting up MSI interrupts in generic xhci codepaths.

The MSI setup code is now moved to PCI specific xhci-pci.c file so
the quirk is no longer needed.

Remove setting the XHCI_PLAT quirk for HiSilocon SoC xHC, NVIDIA Tegra xHC,
MediaTek xHC, the generic xhci-plat driver, and the checks for XHCI_PLAT
in xhci-pci.c MSI setup code.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-histb.c | 12 +-----------
 drivers/usb/host/xhci-mtk.c   |  6 ------
 drivers/usb/host/xhci-pci.c   |  7 -------
 drivers/usb/host/xhci-plat.c  |  7 +------
 drivers/usb/host/xhci-tegra.c |  1 -
 drivers/usb/host/xhci.h       |  2 +-
 6 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index d8aba07e802d..f9a4a4b0eb57 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -164,16 +164,6 @@ static void xhci_histb_host_disable(struct xhci_hcd_histb *histb)
 	clk_disable_unprepare(histb->bus_clk);
 }
 
-static void xhci_histb_quirks(struct device *dev, struct xhci_hcd *xhci)
-{
-	/*
-	 * As of now platform drivers don't provide MSI support so we ensure
-	 * here that the generic code does not try to make a pci_dev from our
-	 * dev struct in order to setup MSI
-	 */
-	xhci->quirks |= XHCI_PLAT;
-}
-
 /* called during probe() after chip reset completes */
 static int xhci_histb_setup(struct usb_hcd *hcd)
 {
@@ -186,7 +176,7 @@ static int xhci_histb_setup(struct usb_hcd *hcd)
 			return ret;
 	}
 
-	return xhci_gen_setup(hcd, xhci_histb_quirks);
+	return xhci_gen_setup(hcd, NULL);
 }
 
 static const struct xhci_driver_overrides xhci_histb_overrides __initconst = {
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 8d9a55b0281b..51d9d4d4f6a5 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -418,12 +418,6 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct xhci_hcd_mtk *mtk = hcd_to_mtk(hcd);
 
-	/*
-	 * As of now platform drivers don't provide MSI support so we ensure
-	 * here that the generic code does not try to make a pci_dev from our
-	 * dev struct in order to setup MSI
-	 */
-	xhci->quirks |= XHCI_PLAT;
 	xhci->quirks |= XHCI_MTK_HOST;
 	/*
 	 * MTK host controller gives a spurious successful event after a
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 69a5cb7eba38..611703f863e0 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -108,9 +108,6 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 
-	if (xhci->quirks & XHCI_PLAT)
-		return;
-
 	/* return if using legacy interrupt */
 	if (hcd->irq > 0)
 		return;
@@ -208,10 +205,6 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct pci_dev  *pdev;
 	int ret;
 
-	/* The xhci platform device has set up IRQs through usb_add_hcd. */
-	if (xhci->quirks & XHCI_PLAT)
-		return 0;
-
 	pdev = to_pci_dev(xhci_to_hcd(xhci)->self.controller);
 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index a52d73c2cd80..1d902d1513bc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -78,12 +78,7 @@ static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
 
-	/*
-	 * As of now platform drivers don't provide MSI support so we ensure
-	 * here that the generic code does not try to make a pci_dev from our
-	 * dev struct in order to setup MSI
-	 */
-	xhci->quirks |= XHCI_PLAT | priv->quirks;
+	xhci->quirks |= priv->quirks;
 }
 
 /* called during probe() after chip reset completes */
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index f124483044a2..6ca8a37e53e1 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2663,7 +2663,6 @@ static void tegra_xhci_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 
-	xhci->quirks |= XHCI_PLAT;
 	if (tegra && tegra->soc->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f845c15073ba..56e318c384ff 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1874,7 +1874,7 @@ struct xhci_hcd {
 #define XHCI_SPURIOUS_REBOOT	BIT_ULL(13)
 #define XHCI_COMP_MODE_QUIRK	BIT_ULL(14)
 #define XHCI_AVOID_BEI		BIT_ULL(15)
-#define XHCI_PLAT		BIT_ULL(16)
+#define XHCI_PLAT		BIT_ULL(16) /* Deprecated */
 #define XHCI_SLOW_SUSPEND	BIT_ULL(17)
 #define XHCI_SPURIOUS_WAKEUP	BIT_ULL(18)
 /* For controllers with a broken beyond repair streams implementation */
-- 
2.25.1

