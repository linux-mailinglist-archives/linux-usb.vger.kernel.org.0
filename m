Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A55D72049E
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbjFBOjd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236056AbjFBOj3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:39:29 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D231A7
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716768; x=1717252768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C10LHrMOU7i8EyGeecYwaHg1yr0j9pLyC13iU7avK0s=;
  b=lQBkSp8Fbp963ZrNkafmHotaePgiKDtNb8pP4xsdrwz5WUDkdoWd3D+c
   wY0QTKtn7Fm1JnA2jat/RS04cvcqY2KXI4MIjc0G8mjmbE7F4x9IpbLZg
   psCOQ46NGWpqoDXYE75lAmqb78ZLNjldaBsAt7QW3DBWB2ceNDUyJT+XU
   F2el2fHevz4Zqz3+i0cgA41LoZk97v1yHJaCuaC5vwhOyTxoDW8FuRkQL
   g7fNQlOyJdOJgH8fHFmPktXBAq0i3wu4iM1gku8iV0Dzc3sXSmbwTWVP3
   ErIeUSVEKwbjNr7miMqvrWcKbjGoE/qtN3f/Is2uLIorf5LfWIr/lPTCF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311330"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311330"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877469"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877469"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:39:10 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/11] xhci: Add ZHAOXIN xHCI host U1/U2 feature support
Date:   Fri,  2 Jun 2023 17:40:09 +0300
Message-Id: <20230602144009.1225632-12-mathias.nyman@linux.intel.com>
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

From: Weitao Wang <WeitaoWang-oc@zhaoxin.com>

Add U1/U2 feature support of xHCI for ZHAOXIN.
Since both INTEL and ZHAOXIN need to check the tier where the device is
located to determine whether to enabled U1/U2, remove the previous INTEL
U1/U2 tier policy and add common policy in xhci_check_tier_policy.
If vendor has specific U1/U2 enable policy,quirks can be add to declare.

Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c |  1 +
 drivers/usb/host/xhci.c     | 43 ++++++++++++++++---------------------
 2 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 88c16d91fb69..c6742bae41c0 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -523,6 +523,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 
 	if (pdev->vendor == PCI_VENDOR_ID_ZHAOXIN) {
 		xhci->quirks |= XHCI_ZHAOXIN_HOST;
+		xhci->quirks |= XHCI_LPM_SUPPORT;
 
 		if (pdev->device == 0x9202) {
 			xhci->quirks |= XHCI_RESET_ON_RESUME;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 176969bf2d5c..5b73a7d281ed 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4605,7 +4605,7 @@ static u16 xhci_calculate_u1_timeout(struct xhci_hcd *xhci,
 		}
 	}
 
-	if (xhci->quirks & XHCI_INTEL_HOST)
+	if (xhci->quirks & (XHCI_INTEL_HOST | XHCI_ZHAOXIN_HOST))
 		timeout_ns = xhci_calculate_intel_u1_timeout(udev, desc);
 	else
 		timeout_ns = udev->u1_params.sel;
@@ -4669,7 +4669,7 @@ static u16 xhci_calculate_u2_timeout(struct xhci_hcd *xhci,
 		}
 	}
 
-	if (xhci->quirks & XHCI_INTEL_HOST)
+	if (xhci->quirks & (XHCI_INTEL_HOST | XHCI_ZHAOXIN_HOST))
 		timeout_ns = xhci_calculate_intel_u2_timeout(udev, desc);
 	else
 		timeout_ns = udev->u2_params.sel;
@@ -4741,37 +4741,30 @@ static int xhci_update_timeout_for_interface(struct xhci_hcd *xhci,
 	return 0;
 }
 
-static int xhci_check_intel_tier_policy(struct usb_device *udev,
+static int xhci_check_tier_policy(struct xhci_hcd *xhci,
+		struct usb_device *udev,
 		enum usb3_link_state state)
 {
-	struct usb_device *parent;
-	unsigned int num_hubs;
+	struct usb_device *parent = udev->parent;
+	int tier = 1; /* roothub is tier1 */
 
-	/* Don't enable U1 if the device is on a 2nd tier hub or lower. */
-	for (parent = udev->parent, num_hubs = 0; parent->parent;
-			parent = parent->parent)
-		num_hubs++;
+	while (parent) {
+		parent = parent->parent;
+		tier++;
+	}
 
-	if (num_hubs < 2)
-		return 0;
+	if (xhci->quirks & XHCI_INTEL_HOST && tier > 3)
+		goto fail;
+	if (xhci->quirks & XHCI_ZHAOXIN_HOST && tier > 2)
+		goto fail;
 
-	dev_dbg(&udev->dev, "Disabling U1/U2 link state for device"
-			" below second-tier hub.\n");
-	dev_dbg(&udev->dev, "Plug device into first-tier hub "
-			"to decrease power consumption.\n");
+	return 0;
+fail:
+	dev_dbg(&udev->dev, "Tier policy prevents U1/U2 LPM states for devices at tier %d\n",
+			tier);
 	return -E2BIG;
 }
 
-static int xhci_check_tier_policy(struct xhci_hcd *xhci,
-		struct usb_device *udev,
-		enum usb3_link_state state)
-{
-	if (xhci->quirks & XHCI_INTEL_HOST)
-		return xhci_check_intel_tier_policy(udev, state);
-	else
-		return 0;
-}
-
 /* Returns the U1 or U2 timeout that should be enabled.
  * If the tier check or timeout setting functions return with a non-zero exit
  * code, that means the timeout value has been finalized and we shouldn't look
-- 
2.25.1

