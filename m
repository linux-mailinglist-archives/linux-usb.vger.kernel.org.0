Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A49137F5
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2019 08:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfEDGyb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 May 2019 02:54:31 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42946 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726605AbfEDGyb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 May 2019 02:54:31 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 085F011DB492C2F31232;
        Sat,  4 May 2019 14:54:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Sat, 4 May 2019 14:54:21 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "Sylvain Lemieux" <slemieux.tyco@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: udc: lpc32xx: fix return value check in lpc32xx_udc_probe()
Date:   Sat, 4 May 2019 07:04:07 +0000
Message-ID: <20190504070407.56915-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

This issue was detected by using the Coccinelle software.

Fixes: 408b56ca5c8e ("usb: gadget: udc: lpc32xx: simplify probe")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index d8f1c60793ed..00fb79c6d025 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3070,9 +3070,9 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	}
 
 	udc->udp_baseaddr = devm_ioremap_resource(dev, res);
-	if (!udc->udp_baseaddr) {
+	if (IS_ERR(udc->udp_baseaddr)) {
 		dev_err(udc->dev, "IO map failure\n");
-		return -ENOMEM;
+		return PTR_ERR(udc->udp_baseaddr);
 	}
 
 	/* Get USB device clock */



