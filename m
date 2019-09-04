Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D01A7FC2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 11:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729496AbfIDJvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 05:51:00 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37354 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725840AbfIDJvA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 05:51:00 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2F27C1FEC3B03BC2C546;
        Wed,  4 Sep 2019 17:50:59 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 17:50:51 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <yuehaibing@huawei.com>, <swboyd@chromium.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: s3c-hsudc: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 17:50:22 +0800
Message-ID: <20190904095022.24528-1-yuehaibing@huawei.com>
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
 drivers/usb/gadget/udc/s3c-hsudc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
index 858993c..21252fb 100644
--- a/drivers/usb/gadget/udc/s3c-hsudc.c
+++ b/drivers/usb/gadget/udc/s3c-hsudc.c
@@ -1263,7 +1263,6 @@ static const struct usb_gadget_ops s3c_hsudc_gadget_ops = {
 static int s3c_hsudc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct s3c_hsudc *hsudc;
 	struct s3c24xx_hsudc_platdata *pd = dev_get_platdata(&pdev->dev);
 	int ret, i;
@@ -1290,9 +1289,7 @@ static int s3c_hsudc_probe(struct platform_device *pdev)
 		goto err_supplies;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	hsudc->regs = devm_ioremap_resource(&pdev->dev, res);
+	hsudc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hsudc->regs)) {
 		ret = PTR_ERR(hsudc->regs);
 		goto err_res;
-- 
2.7.4


