Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226C4680D89
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 13:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236659AbjA3MXE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 07:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236674AbjA3MXD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 07:23:03 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10DBBBA
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 04:23:02 -0800 (PST)
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4P56Hb3nMCzJqd4;
        Mon, 30 Jan 2023 20:02:19 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 20:06:46 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next v2] usb: fotg210: fix return value check in fotg210_probe()
Date:   Mon, 30 Jan 2023 20:06:33 +0800
Message-ID: <20230130120633.3342285-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

devm_platform_get_and_ioremap_resource() never returns NULL pointer,
it will return ERR_PTR() when it fails, so replace the check with
IS_ERR().

Fixes: baef5330d35b ("usb: fotg210: Acquire memory resource in core")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Change the return value to PTR_ERR().
---
 drivers/usb/fotg210/fotg210-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 202d80adca2c..cb75464ab290 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -136,8 +136,8 @@ static int fotg210_probe(struct platform_device *pdev)
 	fotg->dev = dev;
 
 	fotg->base = devm_platform_get_and_ioremap_resource(pdev, 0, &fotg->res);
-	if (!fotg->base)
-		return -ENOMEM;
+	if (IS_ERR(fotg->base))
+		return PTR_ERR(fotg->base);
 
 	fotg->pclk = devm_clk_get_optional_enabled(dev, "PCLK");
 	if (IS_ERR(fotg->pclk))
-- 
2.25.1

