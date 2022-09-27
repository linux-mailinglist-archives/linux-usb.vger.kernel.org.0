Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E565EBB5D
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 09:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiI0HTy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 03:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiI0HTx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 03:19:53 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D3E5602E
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 00:19:52 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mc9rS2RDNz1P6n6;
        Tue, 27 Sep 2022 15:15:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:19:50 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 15:19:50 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <sergei.shtylyov@gmail.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next v2 2/5] usb: musb: da8xx: Switch to use dev_err_probe() helper
Date:   Tue, 27 Sep 2022 15:26:13 +0800
Message-ID: <20220927072616.913672-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927072616.913672-1-yangyingliang@huawei.com>
References: <20220927072616.913672-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs. It's more simple in error path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/musb/da8xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index fd4ae2dd24e5..a4e55b0c52cf 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -523,11 +523,9 @@ static int da8xx_probe(struct platform_device *pdev)
 	}
 
 	glue->phy = devm_phy_get(&pdev->dev, "usb-phy");
-	if (IS_ERR(glue->phy)) {
-		if (PTR_ERR(glue->phy) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get phy\n");
-		return PTR_ERR(glue->phy);
-	}
+	if (IS_ERR(glue->phy))
+		return dev_err_probe(&pdev->dev, PTR_ERR(glue->phy),
+				     "failed to get phy\n");
 
 	glue->dev			= &pdev->dev;
 	glue->clk			= clk;
-- 
2.25.1

