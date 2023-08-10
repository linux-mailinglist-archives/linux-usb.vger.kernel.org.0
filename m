Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2AB97779E8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 15:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbjHJNuN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 09:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjHJNuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 09:50:12 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3CA212B
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 06:50:11 -0700 (PDT)
Received: from dggpemm100018.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RM7Y65FMwzTmgR;
        Thu, 10 Aug 2023 21:48:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100018.china.huawei.com (7.185.36.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 21:50:07 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 21:50:06 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
        <oss-lists@triops.cz>, <yangyingliang@huawei.com>
Subject: [PATCH -next] usb: dwc3: remove unnecessary platform_set_drvdata()
Date:   Thu, 10 Aug 2023 21:47:10 +0800
Message-ID: <20230810134710.114356-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
the driver_data will be cleared in device_unbind_cleanup() after
calling ->remove() in driver call code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/dwc3/dwc3-am62.c     | 2 --
 drivers/usb/dwc3/dwc3-imx8mp.c   | 1 -
 drivers/usb/dwc3/dwc3-keystone.c | 2 --
 drivers/usb/dwc3/dwc3-octeon.c   | 1 -
 4 files changed, 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 94dcbc443cf2..90a587bc29b7 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -292,8 +292,6 @@ static void dwc3_ti_remove(struct platform_device *pdev)
 	clk_disable_unprepare(am62->usb2_refclk);
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
-
-	platform_set_drvdata(pdev, NULL);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 4285bde58d2e..a1e15f2fffdb 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -280,7 +280,6 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-	platform_set_drvdata(pdev, NULL);
 }
 
 static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 4155e8d5a559..8899348b6276 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -197,8 +197,6 @@ static void kdwc3_remove(struct platform_device *pdev)
 	phy_power_off(kdwc->usb3_phy);
 	phy_exit(kdwc->usb3_phy);
 	phy_pm_runtime_put_sync(kdwc->usb3_phy);
-
-	platform_set_drvdata(pdev, NULL);
 }
 
 static const struct of_device_id kdwc3_of_match[] = {
diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 6b6581057345..356347780c15 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -517,7 +517,6 @@ static void dwc3_octeon_remove(struct platform_device *pdev)
 	struct dwc3_octeon *octeon = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(octeon->dev);
-	platform_set_drvdata(pdev, NULL);
 }
 
 static const struct of_device_id dwc3_octeon_of_match[] = {
-- 
2.25.1

