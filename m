Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3706577271A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 16:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjHGOJv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 10:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbjHGOJu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 10:09:50 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D35D9E
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 07:09:48 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKJ5M6qcLzNmcC;
        Mon,  7 Aug 2023 22:06:15 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 22:09:43 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>,
        <yuehaibing@huawei.com>, <lukas.bulwahn@gmail.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -next] usb: musb: Remove unused function declarations
Date:   Mon, 7 Aug 2023 22:09:28 +0800
Message-ID: <20230807140928.35932-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 32fee1df5110 ("usb: musb: remove unused davinci support")
removed these implementations but leave declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/usb/musb/cppi_dma.h | 3 ---
 drivers/usb/musb/musb_dma.h | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/usb/musb/cppi_dma.h b/drivers/usb/musb/cppi_dma.h
index 16dd1ed44bb5..3606be897cb2 100644
--- a/drivers/usb/musb/cppi_dma.h
+++ b/drivers/usb/musb/cppi_dma.h
@@ -121,9 +121,6 @@ struct cppi {
 	struct list_head		tx_complete;
 };
 
-/* CPPI IRQ handler */
-extern irqreturn_t cppi_interrupt(int, void *);
-
 struct cppi41_dma_channel {
 	struct dma_channel channel;
 	struct cppi41_dma_controller *controller;
diff --git a/drivers/usb/musb/musb_dma.h b/drivers/usb/musb/musb_dma.h
index e2445ca3356d..0cd7fc468de8 100644
--- a/drivers/usb/musb/musb_dma.h
+++ b/drivers/usb/musb/musb_dma.h
@@ -198,10 +198,6 @@ extern struct dma_controller *
 tusb_dma_controller_create(struct musb *musb, void __iomem *base);
 extern void tusb_dma_controller_destroy(struct dma_controller *c);
 
-extern struct dma_controller *
-cppi_dma_controller_create(struct musb *musb, void __iomem *base);
-extern void cppi_dma_controller_destroy(struct dma_controller *c);
-
 extern struct dma_controller *
 cppi41_dma_controller_create(struct musb *musb, void __iomem *base);
 extern void cppi41_dma_controller_destroy(struct dma_controller *c);
-- 
2.34.1

