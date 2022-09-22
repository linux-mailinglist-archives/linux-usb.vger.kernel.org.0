Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448465E6389
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 15:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiIVN0s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 09:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiIVN0q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:26:46 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AEADE0C1
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 06:26:44 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYGDP033DzWgv2;
        Thu, 22 Sep 2022 21:22:45 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:26:42 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:26:41 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next 2/2] USB: PHY: JZ4770: Switch to use dev_err_probe() helper
Date:   Thu, 22 Sep 2022 21:33:23 +0800
Message-ID: <20220922133323.2135494-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922133323.2135494-1-yangyingliang@huawei.com>
References: <20220922133323.2135494-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
 drivers/usb/phy/phy-jz4770.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/phy/phy-jz4770.c b/drivers/usb/phy/phy-jz4770.c
index 4025da20b3fd..f16adcacdce3 100644
--- a/drivers/usb/phy/phy-jz4770.c
+++ b/drivers/usb/phy/phy-jz4770.c
@@ -321,27 +321,18 @@ static int jz4770_phy_probe(struct platform_device *pdev)
 	}
 
 	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		err = PTR_ERR(priv->clk);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clock\n");
-		return err;
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "Failed to get clock\n");
 
 	priv->vcc_supply = devm_regulator_get(dev, "vcc");
-	if (IS_ERR(priv->vcc_supply)) {
-		err = PTR_ERR(priv->vcc_supply);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get regulator\n");
-		return err;
-	}
+	if (IS_ERR(priv->vcc_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
+				     "Failed to get regulator\n");
 
 	err = usb_add_phy(&priv->phy, USB_PHY_TYPE_USB2);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Unable to register PHY\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Unable to register PHY\n");
 
 	return devm_add_action_or_reset(dev, ingenic_usb_phy_remove, &priv->phy);
 }
-- 
2.25.1

