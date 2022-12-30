Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767A465958C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 07:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbiL3G5b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 01:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbiL3G52 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 01:57:28 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AA7183BF
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 22:57:26 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Njwtq0SknzqTKm;
        Fri, 30 Dec 2022 14:52:51 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 30 Dec
 2022 14:57:24 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH] usb: fotg210-udc: fix error return code in fotg210_udc_probe()
Date:   Fri, 30 Dec 2022 14:54:27 +0800
Message-ID: <20221230065427.944586-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After commit  5f217ccd520f ("fotg210-udc: Support optional external PHY"),
the error code is re-assigned to 0 in fotg210_udc_probe(), if allocate or
map memory fails after the assignment, it can't return an error code. Set
the error code to -ENOMEM to fix this problem.

Fixes: 5f217ccd520f ("fotg210-udc: Support optional external PHY")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/fotg210/fotg210-udc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 66e1b7ee3346..87cca81bf4ac 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1201,6 +1201,8 @@ int fotg210_udc_probe(struct platform_device *pdev)
 		dev_info(dev, "found and initialized PHY\n");
 	}
 
+	ret = -ENOMEM;
+
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++) {
 		fotg210->ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
 		if (!fotg210->ep[i])
-- 
2.25.1

