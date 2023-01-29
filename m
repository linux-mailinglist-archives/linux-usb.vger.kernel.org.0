Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C57667FD62
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jan 2023 08:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjA2He1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Jan 2023 02:34:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjA2He0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Jan 2023 02:34:26 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C8619F35
        for <linux-usb@vger.kernel.org>; Sat, 28 Jan 2023 23:34:25 -0800 (PST)
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4P4NLc4PjXz16Mjq;
        Sun, 29 Jan 2023 15:32:24 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 29 Jan
 2023 15:34:22 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] usb: fotg210: fix return value check in fotg210_probe()
Date:   Sun, 29 Jan 2023 15:52:04 +0800
Message-ID: <20230129075204.297725-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
 drivers/usb/fotg210/fotg210-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 202d80adca2c..fad49f523dee 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -136,7 +136,7 @@ static int fotg210_probe(struct platform_device *pdev)
 	fotg->dev = dev;
 
 	fotg->base = devm_platform_get_and_ioremap_resource(pdev, 0, &fotg->res);
-	if (!fotg->base)
+	if (IS_ERR(fotg->base))
 		return -ENOMEM;
 
 	fotg->pclk = devm_clk_get_optional_enabled(dev, "PCLK");
-- 
2.25.1

