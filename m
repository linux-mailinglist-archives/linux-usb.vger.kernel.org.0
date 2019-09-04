Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF3CAA7EC3
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 11:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfIDJEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 05:04:15 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38600 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727348AbfIDJEP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 05:04:15 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B7284D2997AFA66EF863;
        Wed,  4 Sep 2019 17:04:12 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 17:04:02 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <hariprasad.kelam@gmail.com>,
        <yuehaibing@huawei.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: at91_udc: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 17:02:39 +0800
Message-ID: <20190904090239.23920-1-yuehaibing@huawei.com>
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
 drivers/usb/gadget/udc/at91_udc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 194ffb1..1b2b548 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1808,7 +1808,6 @@ static int at91udc_probe(struct platform_device *pdev)
 	struct device	*dev = &pdev->dev;
 	struct at91_udc	*udc;
 	int		retval;
-	struct resource	*res;
 	struct at91_ep	*ep;
 	int		i;
 
@@ -1839,8 +1838,7 @@ static int at91udc_probe(struct platform_device *pdev)
 			ep->is_pingpong = 1;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	udc->udp_baseaddr = devm_ioremap_resource(dev, res);
+	udc->udp_baseaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->udp_baseaddr))
 		return PTR_ERR(udc->udp_baseaddr);
 
-- 
2.7.4


