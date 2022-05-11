Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A14523FE8
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 00:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346654AbiEKWDs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 18:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbiEKWDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 18:03:45 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B613B7
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652306625; x=1683842625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0kdjLHCG6/4UOkQsZdTcWHOJMA7WArP93pjicLWMjWw=;
  b=bfx4+xHiURHlAQer5E+MGR+sx+uKS3AehShOiJwQiHQLxDYjokBFbD6D
   E7VTxnCSkDLo/cL0vx0qeBh/US1C/KclSDqVkjuPc+Iw/GoRlFr47mXnC
   JuGnY5JZgiNuctt+H28q5viCOYoCxAV4PjAo+j1GI8VubH+hhCUEFdc1u
   lou4hICc5irBzVus02nYuWV5u+eO+KxSeS1KdLs4N3t4MHe+eA0aq8oW7
   s9R1Cl71A7lNBbjqZBIP6c4QIk/6WToaOr6yVN0uTgqFgvcbCnLg6/b6o
   Ymf+8IkFQLJzDShWXYhRFVek2JWEUiIC/A7fm4EScdT9FbXXQSw2DsF9p
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330427439"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="330427439"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 15:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542496221"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2022 15:03:41 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/9] usb: host: xhci-plat: create shared hcd after having added main hcd
Date:   Thu, 12 May 2022 01:04:44 +0300
Message-Id: <20220511220450.85367-4-mathias.nyman@linux.intel.com>
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

This patch is in preparation of an extension where in case of a
root hub with no ports no shared hcd will be created.
Whether one of the root hubs has no ports we figure our in
usb_add_hcd() for the primary hcd. Therefore create the shared hcd
only after this call.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 649ffd861b44..5d752b384de2 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -283,12 +283,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	device_set_wakeup_capable(&pdev->dev, true);
 
 	xhci->main_hcd = hcd;
-	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-			dev_name(&pdev->dev), hcd);
-	if (!xhci->shared_hcd) {
-		ret = -ENOMEM;
-		goto disable_clk;
-	}
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
@@ -313,16 +307,16 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(hcd->usb_phy)) {
 		ret = PTR_ERR(hcd->usb_phy);
 		if (ret == -EPROBE_DEFER)
-			goto put_usb3_hcd;
+			goto disable_clk;
 		hcd->usb_phy = NULL;
 	} else {
 		ret = usb_phy_init(hcd->usb_phy);
 		if (ret)
-			goto put_usb3_hcd;
+			goto disable_clk;
 	}
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
-	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+
 	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
 		hcd->skip_phy_initialization = 1;
 
@@ -333,12 +327,21 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_usb_phy;
 
+	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
+			dev_name(&pdev->dev), hcd);
+	if (!xhci->shared_hcd) {
+		ret = -ENOMEM;
+		goto dealloc_usb2_hcd;
+	}
+
+	xhci->shared_hcd->tpl_support = hcd->tpl_support;
+
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
 
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
 	if (ret)
-		goto dealloc_usb2_hcd;
+		goto put_usb3_hcd;
 
 	device_enable_async_suspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -352,15 +355,15 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	return 0;
 
 
+put_usb3_hcd:
+	usb_put_hcd(xhci->shared_hcd);
+
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
 disable_usb_phy:
 	usb_phy_shutdown(hcd->usb_phy);
 
-put_usb3_hcd:
-	usb_put_hcd(xhci->shared_hcd);
-
 disable_clk:
 	clk_disable_unprepare(xhci->clk);
 
-- 
2.25.1

