Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B0C523FE1
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345018AbiEKWDq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234242AbiEKWDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:45 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD22F10C8
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306623; x=1683842623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NZUhXqKb4XcbyuMlLBdjent84f4219IeitqoHUs3jeY=;
  b=J7w6Ag9U1gMIfO63mjXS/38r8Wlp55YhoOVGIwxqXCmfpe6Qz/jCazvh
   N4+SSVc3bfVgc+FsLBZyAn1i02W89iM6VpfYKx01oO1YO+8jPcMQAXRcy
   DDW+zAZKAPGf4/CEpl4cX+2ToeaT3C1/5cNxuvnh43fN+ENhFTMua23YQ
   Jt+dQ+YG1apuoMZgmx2m9Nv6aW31PJttY6c2i8GTEQI3uc6MARrs9rk/C
   rHtsWx77tcCFStDEmxJH8CcoOUvYy38aD7AXof4rFE5o8WdEIsaoSC/zA
   12eJZrRy+Wu7KnHLPO3j0d+THhgZp5+h8KhekorgRLa8Zp7JR/RqpYPEX
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427426"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427426"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496200"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:37 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/9] xhci: factor out parts of xhci_gen_setup()
Date:   Thu, 12 May 2022 01:04:42 +0300
Message-Id: <20220511220450.85367-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
References: <20220511220450.85367-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

Factoring out parts of xhci_gen_setup() has two motivations:
- When adding functionaliy to omit shared hcd if not needed in a
  subsequent patch, we'll have to call xhci_hcd_init_usb3_data()
  from two places.
- It reduces size of xhci_gen_setup() and makes it better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 104 +++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 25b87e99b4dd..92ae4ec531ff 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5207,6 +5207,57 @@ static int xhci_get_frame(struct usb_hcd *hcd)
 	return readl(&xhci->run_regs->microframe_index) >> 3;
 }
 
+static void xhci_hcd_init_usb2_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
+{
+	xhci->usb2_rhub.hcd = hcd;
+	hcd->speed = HCD_USB2;
+	hcd->self.root_hub->speed = USB_SPEED_HIGH;
+	/*
+	 * USB 2.0 roothub under xHCI has an integrated TT,
+	 * (rate matching hub) as opposed to having an OHCI/UHCI
+	 * companion controller.
+	 */
+	hcd->has_tt = 1;
+}
+
+static void xhci_hcd_init_usb3_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
+{
+	unsigned int minor_rev;
+
+	/*
+	 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
+	 * should return 0x31 for sbrn, or that the minor revision
+	 * is a two digit BCD containig minor and sub-minor numbers.
+	 * This was later clarified in xHCI 1.2.
+	 *
+	 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
+	 * minor revision set to 0x1 instead of 0x10.
+	 */
+	if (xhci->usb3_rhub.min_rev == 0x1)
+		minor_rev = 1;
+	else
+		minor_rev = xhci->usb3_rhub.min_rev / 0x10;
+
+	switch (minor_rev) {
+	case 2:
+		hcd->speed = HCD_USB32;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+		hcd->self.root_hub->rx_lanes = 2;
+		hcd->self.root_hub->tx_lanes = 2;
+		hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
+		break;
+	case 1:
+		hcd->speed = HCD_USB31;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+		hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
+		break;
+	}
+	xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
+		  minor_rev, minor_rev ? "Enhanced " : "");
+
+	xhci->usb3_rhub.hcd = hcd;
+}
+
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 {
 	struct xhci_hcd		*xhci;
@@ -5215,7 +5266,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * quirks
 	 */
 	struct device		*dev = hcd->self.sysdev;
-	unsigned int		minor_rev;
 	int			retval;
 
 	/* Accept arbitrarily long scatter-gather lists */
@@ -5230,60 +5280,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci = hcd_to_xhci(hcd);
 
 	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci->main_hcd = hcd;
-		xhci->usb2_rhub.hcd = hcd;
-		/* Mark the first roothub as being USB 2.0.
-		 * The xHCI driver will register the USB 3.0 roothub.
-		 */
-		hcd->speed = HCD_USB2;
-		hcd->self.root_hub->speed = USB_SPEED_HIGH;
-		/*
-		 * USB 2.0 roothub under xHCI has an integrated TT,
-		 * (rate matching hub) as opposed to having an OHCI/UHCI
-		 * companion controller.
-		 */
-		hcd->has_tt = 1;
+		xhci_hcd_init_usb2_data(xhci, hcd);
 	} else {
-		/*
-		 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
-		 * should return 0x31 for sbrn, or that the minor revision
-		 * is a two digit BCD containig minor and sub-minor numbers.
-		 * This was later clarified in xHCI 1.2.
-		 *
-		 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
-		 * minor revision set to 0x1 instead of 0x10.
-		 */
-		if (xhci->usb3_rhub.min_rev == 0x1)
-			minor_rev = 1;
-		else
-			minor_rev = xhci->usb3_rhub.min_rev / 0x10;
-
-		switch (minor_rev) {
-		case 2:
-			hcd->speed = HCD_USB32;
-			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
-			hcd->self.root_hub->rx_lanes = 2;
-			hcd->self.root_hub->tx_lanes = 2;
-			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
-			break;
-		case 1:
-			hcd->speed = HCD_USB31;
-			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
-			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
-			break;
-		}
-		xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
-			  minor_rev,
-			  minor_rev ? "Enhanced " : "");
-
-		xhci->usb3_rhub.hcd = hcd;
-		/* xHCI private pointer was set in xhci_pci_probe for the second
-		 * registered roothub.
-		 */
+		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
 
 	mutex_init(&xhci->mutex);
+	xhci->main_hcd = hcd;
 	xhci->cap_regs = hcd->regs;
 	xhci->op_regs = hcd->regs +
 		HC_LENGTH(readl(&xhci->cap_regs->hc_capbase));
-- 
2.25.1

