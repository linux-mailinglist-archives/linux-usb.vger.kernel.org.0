Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B25B63824D
	for <lists+linux-usb@lfdr.de>; Fri, 25 Nov 2022 03:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiKYCOO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Nov 2022 21:14:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKYCON (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Nov 2022 21:14:13 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BCC23E84
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 18:14:11 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJJLm2GMyzmW8p;
        Fri, 25 Nov 2022 10:13:36 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 10:14:09 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <vincent.sunplus@gmail.com>, <kishon@ti.com>, <vkoul@kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH] phy: usb: sunplus: Fix potential null-ptr-deref in sp_usb_phy_probe()
Date:   Fri, 25 Nov 2022 10:12:22 +0800
Message-ID: <20221125021222.25687-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

sp_usb_phy_probe() will call platform_get_resource_byname() that may fail
and return NULL. devm_ioremap() will use usbphy->moon4_res_mem->start as
input, which may causes null-ptr-deref. Check the ret value of
platform_get_resource_byname() to avoid the null-ptr-deref.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index b932087c55b2..6816b7d2318d 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -254,6 +254,9 @@ static int sp_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(usbphy->phy_regs);
 
 	usbphy->moon4_res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "moon4");
+	if (!usbphy->moon4_res_mem)
+		return -EINVAL;
+
 	usbphy->moon4_regs = devm_ioremap(&pdev->dev, usbphy->moon4_res_mem->start,
 					  resource_size(usbphy->moon4_res_mem));
 	if (IS_ERR(usbphy->moon4_regs))
-- 
2.17.1

