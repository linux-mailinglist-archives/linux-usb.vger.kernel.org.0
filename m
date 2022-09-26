Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E945EAA8A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 17:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbiIZPWo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 11:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbiIZPVm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 11:21:42 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E606857C0
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 07:08:33 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MbkyT71Mgz1P6jl;
        Mon, 26 Sep 2022 22:04:17 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:08:31 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 22:08:31 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next resend 5/5] usb: musb: sunxi: Switch to use dev_err_probe() helper
Date:   Mon, 26 Sep 2022 22:15:10 +0800
Message-ID: <20220926141510.2265523-6-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926141510.2265523-1-yangyingliang@huawei.com>
References: <20220926141510.2265523-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
 drivers/usb/musb/sunxi.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index 961c858fb349..7f9a999cd5ff 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -743,31 +743,20 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 
 	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
 		glue->rst = devm_reset_control_get(&pdev->dev, NULL);
-		if (IS_ERR(glue->rst)) {
-			if (PTR_ERR(glue->rst) == -EPROBE_DEFER)
-				return -EPROBE_DEFER;
-			dev_err(&pdev->dev, "Error getting reset %ld\n",
-				PTR_ERR(glue->rst));
-			return PTR_ERR(glue->rst);
-		}
+		if (IS_ERR(glue->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(glue->rst),
+					     "Error getting reset\n");
 	}
 
 	glue->extcon = extcon_get_edev_by_phandle(&pdev->dev, 0);
-	if (IS_ERR(glue->extcon)) {
-		if (PTR_ERR(glue->extcon) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_err(&pdev->dev, "Invalid or missing extcon\n");
-		return PTR_ERR(glue->extcon);
-	}
+	if (IS_ERR(glue->extcon))
+		return dev_err_probe(&pdev->dev, PTR_ERR(glue->extcon),
+				     "Invalid or missing extcon\n");
 
 	glue->phy = devm_phy_get(&pdev->dev, "usb");
-	if (IS_ERR(glue->phy)) {
-		if (PTR_ERR(glue->phy) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_err(&pdev->dev, "Error getting phy %ld\n",
-			PTR_ERR(glue->phy));
-		return PTR_ERR(glue->phy);
-	}
+	if (IS_ERR(glue->phy))
+		return dev_err_probe(&pdev->dev, PTR_ERR(glue->phy),
+				     "Error getting phy\n");
 
 	glue->usb_phy = usb_phy_generic_register();
 	if (IS_ERR(glue->usb_phy)) {
-- 
2.25.1

