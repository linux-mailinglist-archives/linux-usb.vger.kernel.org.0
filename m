Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F89E5EBB60
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 09:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiI0HT5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 03:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiI0HTy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 03:19:54 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB09158515
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 00:19:52 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mc9tl3h93zHqMr;
        Tue, 27 Sep 2022 15:17:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:19:51 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 15:19:50 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <sergei.shtylyov@gmail.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next v2 3/5] usb: musb: cppi41: Switch to use dev_err_probe() helper
Date:   Tue, 27 Sep 2022 15:26:14 +0800
Message-ID: <20220927072616.913672-4-yangyingliang@huawei.com>
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
 drivers/usb/musb/musb_cppi41.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_cppi41.c b/drivers/usb/musb/musb_cppi41.c
index c963cb8565f2..9589243e8951 100644
--- a/drivers/usb/musb/musb_cppi41.c
+++ b/drivers/usb/musb/musb_cppi41.c
@@ -718,10 +718,8 @@ static int cppi41_dma_controller_start(struct cppi41_dma_controller *controller)
 
 		dc = dma_request_chan(dev->parent, str);
 		if (IS_ERR(dc)) {
-			ret = PTR_ERR(dc);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to request %s: %d.\n",
-					str, ret);
+			ret = dev_err_probe(dev, PTR_ERR(dc),
+					    "Failed to request %s.\n", str);
 			goto err;
 		}
 
-- 
2.25.1

