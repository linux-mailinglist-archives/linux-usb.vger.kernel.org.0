Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29E55EA9FD
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 17:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbiIZPPC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 11:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbiIZPOR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 11:14:17 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2CC186CD
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 06:57:14 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MbkjQ6MVcz1P73m;
        Mon, 26 Sep 2022 21:52:58 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 21:57:12 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 21:57:12 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next 4/5] usb: musb: jz4740: Switch to use dev_err_probe() helper
Date:   Mon, 26 Sep 2022 22:03:47 +0800
Message-ID: <20220926140348.2028052-5-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926140348.2028052-1-yangyingliang@huawei.com>
References: <20220926140348.2028052-1-yangyingliang@huawei.com>
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
 drivers/usb/musb/jz4740.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 417c30bff9ca..d1e4e0deb753 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -105,7 +105,6 @@ static int jz4740_musb_init(struct musb *musb)
 		.driver_data = glue,
 		.fwnode = dev_fwnode(dev),
 	};
-	int err;
 
 	glue->musb = musb;
 
@@ -113,12 +112,9 @@ static int jz4740_musb_init(struct musb *musb)
 		musb->xceiv = devm_usb_get_phy_by_phandle(dev, "phys", 0);
 	else
 		musb->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
-	if (IS_ERR(musb->xceiv)) {
-		err = PTR_ERR(musb->xceiv);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "No transceiver configured: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(musb->xceiv))
+		return dev_err_probe(dev, PTR_ERR(musb->xceiv),
+				     "No transceiver configured\n");
 
 	glue->role_sw = usb_role_switch_register(dev, &role_sw_desc);
 	if (IS_ERR(glue->role_sw)) {
-- 
2.25.1

