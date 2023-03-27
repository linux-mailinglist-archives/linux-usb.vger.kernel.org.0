Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7646CA604
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 15:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjC0NfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 09:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjC0NfV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 09:35:21 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A35A1BC6
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679924121; x=1711460121;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6b+JZbgMIdH+86rT3ucg7q7CshE9iTeKyV7ukqf9I+k=;
  b=K2lnPpj3wBgqhs2EElXeNfVnOuaOKKu+lxZhB4QllXYpMX3LNahzAWJ8
   LmSzcJ9Dogo0vdREiKYLVKM3hAfe7Xiaj8Zorq+eT5pxRwCbmT56dZNUh
   NHJw1dPaJlcnZu9JRBmcZHHbzC8kBHnJKYQX8Dgx6IPpQw2Fo2jiwXUkz
   XJFRLxxr5tM6fFfD28JipHpeIeWe0C0ixTOj003QLHKi98B2oGuy6U4Rk
   nLAKgJ0OOWLfxhqZX8aJxkDfUBTSApoh+55p43OlvIHtzjq3hvC+hLTpS
   9QTHBtr2kA7DEkykG69XzE8Qq2oG6ytxYB7tezQFXzJ7fDk2ASCGVadA2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="337764640"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="337764640"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 06:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="676969689"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="676969689"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2023 06:35:18 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     greg@kroah.com
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH] xhci: only define xhci_msix_sync_irqs() when CONFIG_PM is set
Date:   Mon, 27 Mar 2023 16:36:34 +0300
Message-Id: <20230327133634.1063940-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci_msic_sync_irqs() function is only called during suspend, when
CONFIG_PM is set, so don't define it unconditionally.

Fixes: 9abe15d55dcc ("xhci: Move xhci MSI sync function to to xhci-pci")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a53ecc8ff8c5..1e826a159b96 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -88,19 +88,6 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.update_hub_device = xhci_pci_update_hub_device,
 };
 
-static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
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
 /* Free any IRQs and disable MSI-X */
 static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
@@ -729,6 +716,20 @@ static void xhci_pci_remove(struct pci_dev *dev)
 }
 
 #ifdef CONFIG_PM
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
  * In some Intel xHCI controllers, in order to get D3 working,
  * through a vendor specific SSIC CONFIG register at offset 0x883c,
-- 
2.25.1

