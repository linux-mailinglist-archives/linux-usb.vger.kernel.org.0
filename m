Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A358C631842
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 02:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiKUBq2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 20:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKUBq1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 20:46:27 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F192FFF2
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 17:46:26 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NFqsV6NrJzFqRw;
        Mon, 21 Nov 2022 09:43:10 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 09:46:24 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <gregkh@linuxfoundation.org>, <cuigaosheng1@huawei.com>,
        <yhchen@faraday-tech.com>, <mudongliangabcd@gmail.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v2] usb: gadget: fusb300_udc: free irq on the error path in fusb300_probe()
Date:   Mon, 21 Nov 2022 09:46:23 +0800
Message-ID: <20221121014623.769014-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When request_irq(ires1->start) failed in w5300_hw_probe(), irq ires->start
has not been freed, and on the clean_up3 error path, we also need to free
ires1->start irq.

In addition, We need to add free_irq in fusb300_remove(), fix it.

Fixes: 0fe6f1d1f612 ("usb: udc: add Faraday fusb300 driver")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
v2:
- Add free_irq in fusb300_remove(), thanks!
 drivers/usb/gadget/udc/fusb300_udc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index 9af8b415f303..d6b2f76d2662 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1347,6 +1347,7 @@ static int fusb300_remove(struct platform_device *pdev)
 	usb_del_gadget_udc(&fusb300->gadget);
 	iounmap(fusb300->reg);
 	free_irq(platform_get_irq(pdev, 0), fusb300);
+	free_irq(platform_get_irq(pdev, 1), fusb300);
 
 	fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
 	for (i = 0; i < FUSB300_MAX_NUM_EP; i++)
@@ -1432,7 +1433,7 @@ static int fusb300_probe(struct platform_device *pdev)
 			IRQF_SHARED, udc_name, fusb300);
 	if (ret < 0) {
 		pr_err("request_irq1 error (%d)\n", ret);
-		goto clean_up;
+		goto clean_up2;
 	}
 
 	INIT_LIST_HEAD(&fusb300->gadget.ep_list);
@@ -1487,8 +1488,9 @@ static int fusb300_probe(struct platform_device *pdev)
 	fusb300_free_request(&fusb300->ep[0]->ep, fusb300->ep0_req);
 
 clean_up3:
+	free_irq(ires1->start, fusb300);
+clean_up2:
 	free_irq(ires->start, fusb300);
-
 clean_up:
 	if (fusb300) {
 		if (fusb300->ep0_req)
-- 
2.25.1

