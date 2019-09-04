Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490D3A7F74
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 11:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbfIDJc5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 05:32:57 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44976 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725840AbfIDJc5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 05:32:57 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E6614287EB2AD6177276;
        Wed,  4 Sep 2019 17:32:55 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 17:32:47 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <cernekee@gmail.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <f.fainelli@gmail.com>
CC:     <bcm-kernel-feedback-list@broadcom.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: gadget: bcm63xx_udc: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 17:32:27 +0800
Message-ID: <20190904093227.23304-1-yuehaibing@huawei.com>
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
 drivers/usb/gadget/udc/bcm63xx_udc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index 97b1646..7fcf4a8 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -2282,7 +2282,6 @@ static int bcm63xx_udc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm63xx_usbd_platform_data *pd = dev_get_platdata(dev);
 	struct bcm63xx_udc *udc;
-	struct resource *res;
 	int rc = -ENOMEM, i, irq;
 
 	udc = devm_kzalloc(dev, sizeof(*udc), GFP_KERNEL);
@@ -2298,13 +2297,11 @@ static int bcm63xx_udc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	udc->usbd_regs = devm_ioremap_resource(dev, res);
+	udc->usbd_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->usbd_regs))
 		return PTR_ERR(udc->usbd_regs);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	udc->iudma_regs = devm_ioremap_resource(dev, res);
+	udc->iudma_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(udc->iudma_regs))
 		return PTR_ERR(udc->iudma_regs);
 
-- 
2.7.4


