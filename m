Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E365B4C48
	for <lists+linux-usb@lfdr.de>; Sun, 11 Sep 2022 08:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiIKGDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Sep 2022 02:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiIKGDG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Sep 2022 02:03:06 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB74928E3A;
        Sat, 10 Sep 2022 23:03:05 -0700 (PDT)
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MQJvv0TFRzmV91;
        Sun, 11 Sep 2022 13:59:23 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500023.china.huawei.com
 (7.221.188.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sun, 11 Sep
 2022 14:03:02 +0800
From:   Peng Wu <wupeng58@huawei.com>
To:     <vincent.sunplus@gmail.com>, <kishon@ti.com>, <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <liwei391@huawei.com>, <wupeng58@huawei.com>
Subject: [PATCH] phy: sunplus: Fix an IS_ERR() vs NULL bug in sp_usb_phy_probe
Date:   Sun, 11 Sep 2022 06:00:53 +0000
Message-ID: <20220911060053.123594-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The devm_ioremap() function returns NULL on error, it doesn't return
error pointers.

Fixes: 99d9ccd973852 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Peng Wu <wupeng58@huawei.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 5269968b3060..0e64eb3e6db5 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -256,8 +256,8 @@ static int sp_usb_phy_probe(struct platform_device *pdev)
 	usbphy->moon4_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "moon4");
 	usbphy->moon4_regs = devm_ioremap(&pdev->dev, usbphy->moon4_res_mem->start,
 					  resource_size(usbphy->moon4_res_mem));
-	if (IS_ERR(usbphy->moon4_regs))
-		return PTR_ERR(usbphy->moon4_regs);
+	if (!usbphy->moon4_regs)
+		return -ENOMEM;
 
 	usbphy->phy_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(usbphy->phy_clk))
-- 
2.17.1

