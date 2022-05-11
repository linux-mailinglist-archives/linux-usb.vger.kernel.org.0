Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A98523FE0
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345878AbiEKWDr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344076AbiEKWDq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:46 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0D210C8
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306625; x=1683842625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oDWOoxeqqrSuEHt32wYXUhQgSYtCRGObFFIn/kG8/VU=;
  b=WaT9e1fEmv16nfn6qDcJOtlMxZmwNZS7o2Hr3VO1wfaZLZB7RQtAZMKQ
   FgWiLSPZo/1f3vu5XP85VGWWrrnXhSq7LkubiZUprGGBbPpUD4RDat80B
   6o9J/Sh3XTJSptgFstoDmOIDeMDsJQuD8Xz/GIrWp+DfwSlyqOYzxRkLZ
   byKEhfaoasWkvCROrpPfCl2x9OpyOpVUrNBDKYQI/3WivlIfJhfUbfMni
   pIf+NO3anEnND1ZkBqiUwTS7n2Fj8ThlMPTIa5XruqdrQnfH8uZNdWgAC
   LGStOwnxUhHgPs/9oC/QvaKPUA80lCtC/7Qq1t/tqnKEmxR3Vue5fxkNw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427446"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496228"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:43 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/9] usb: host: xhci-plat: prepare operation w/o shared hcd
Date:   Thu, 12 May 2022 01:04:45 +0300
Message-Id: <20220511220450.85367-5-mathias.nyman@linux.intel.com>
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

This patch prepares xhci-plat for the following scenario
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5d752b384de2..c512ec2148ae 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -180,7 +180,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	struct device		*sysdev, *tmpdev;
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
-	struct usb_hcd		*hcd;
+	struct usb_hcd		*hcd, *usb3_hcd;
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
@@ -327,21 +327,26 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto dealloc_usb2_hcd;
-	}
+	if (!xhci_has_one_roothub(xhci)) {
+		xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
+						    dev_name(&pdev->dev), hcd);
+		if (!xhci->shared_hcd) {
+			ret = -ENOMEM;
+			goto dealloc_usb2_hcd;
+		}
 
-	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+		xhci->shared_hcd->tpl_support = hcd->tpl_support;
+	}
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
-		xhci->shared_hcd->can_do_streams = 1;
+	usb3_hcd = xhci_get_usb3_hcd(xhci);
+	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4)
+		usb3_hcd->can_do_streams = 1;
 
-	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-	if (ret)
-		goto put_usb3_hcd;
+	if (xhci->shared_hcd) {
+		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
+		if (ret)
+			goto put_usb3_hcd;
+	}
 
 	device_enable_async_suspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.25.1

