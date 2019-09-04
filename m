Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB67FA7EDD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 11:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbfIDJHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 05:07:10 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42046 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727144AbfIDJHJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 05:07:09 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D006A3AF71769D996D23;
        Wed,  4 Sep 2019 17:07:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 17:06:58 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <gregkh@linuxfoundation.org>, <yuehaibing@huawei.com>,
        <tiny.windzz@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: isp1362-hcd: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 17:05:49 +0800
Message-ID: <20190904090549.24456-1-yuehaibing@huawei.com>
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
 drivers/usb/host/isp1362-hcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index 96f8daa..4a3a285 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -2627,7 +2627,7 @@ static int isp1362_probe(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd;
 	struct isp1362_hcd *isp1362_hcd;
-	struct resource *addr, *data, *irq_res;
+	struct resource *data, *irq_res;
 	void __iomem *addr_reg;
 	void __iomem *data_reg;
 	int irq;
@@ -2651,8 +2651,7 @@ static int isp1362_probe(struct platform_device *pdev)
 
 	irq = irq_res->start;
 
-	addr = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	addr_reg = devm_ioremap_resource(&pdev->dev, addr);
+	addr_reg = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(addr_reg))
 		return PTR_ERR(addr_reg);
 
-- 
2.7.4


