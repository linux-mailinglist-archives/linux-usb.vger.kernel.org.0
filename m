Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC3E3D702A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 09:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbhG0HR4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 03:17:56 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:12267 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbhG0HRz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 03:17:55 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GYnzM0qzQz1CPKn;
        Tue, 27 Jul 2021 15:11:59 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 15:17:51 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 27
 Jul 2021 15:17:50 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -next v2] usb: gadget: remove leaked entry from udc driver list
Date:   Tue, 27 Jul 2021 15:31:42 +0800
Message-ID: <20210727073142.84666-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The usb_add_gadget_udc will add a new gadget to the udc class
driver list. Not calling usb_del_gadget_udc in error branch
will result in residual gadget entry in the udc driver list.
We fix it by calling usb_del_gadget_udc to clean it when error
return.

Fixes:48ba02b2e2b1a ("usb: gadget: add udc driver for max3420")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/gadget/udc/max3420_udc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 34f4db554977..d2a2b20cc1ad 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -1255,12 +1255,14 @@ static int max3420_probe(struct spi_device *spi)
 	err = devm_request_irq(&spi->dev, irq, max3420_irq_handler, 0,
 			       "max3420", udc);
 	if (err < 0)
-		return err;
+		goto del_gadget;
 
 	udc->thread_task = kthread_create(max3420_thread, udc,
 					  "max3420-thread");
-	if (IS_ERR(udc->thread_task))
-		return PTR_ERR(udc->thread_task);
+	if (IS_ERR(udc->thread_task)) {
+		err = PTR_ERR(udc->thread_task);
+		goto del_gadget;
+	}
 
 	irq = of_irq_get_byname(spi->dev.of_node, "vbus");
 	if (irq <= 0) { /* no vbus irq implies self-powered design */
@@ -1280,10 +1282,14 @@ static int max3420_probe(struct spi_device *spi)
 		err = devm_request_irq(&spi->dev, irq,
 				       max3420_vbus_handler, 0, "vbus", udc);
 		if (err < 0)
-			return err;
+			goto del_gadget;
 	}
 
 	return 0;
+
+del_gadget:
+	usb_del_gadget_udc(&udc->gadget);
+	return err;
 }
 
 static int max3420_remove(struct spi_device *spi)
-- 
2.31.1

