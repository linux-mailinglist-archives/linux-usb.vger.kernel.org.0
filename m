Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2838FA7FA6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 11:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbfIDJqn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 05:46:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33024 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725840AbfIDJqn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 05:46:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A41B6469D31384F761E5;
        Wed,  4 Sep 2019 17:46:40 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 17:46:34 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
        <robert.jarzmik@free.fr>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: gadget: pxa27x_udc: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 17:45:57 +0800
Message-ID: <20190904094557.22884-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 0142332..5f107f2 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2356,7 +2356,6 @@ MODULE_DEVICE_TABLE(of, udc_pxa_dt_ids);
  */
 static int pxa_udc_probe(struct platform_device *pdev)
 {
-	struct resource *regs;
 	struct pxa_udc *udc = &memory;
 	int retval = 0, gpio;
 	struct pxa2xx_udc_mach_info *mach = dev_get_platdata(&pdev->dev);
@@ -2378,8 +2377,7 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	udc->regs = devm_ioremap_resource(&pdev->dev, regs);
+	udc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->regs))
 		return PTR_ERR(udc->regs);
 	udc->irq = platform_get_irq(pdev, 0);
-- 
2.7.4


