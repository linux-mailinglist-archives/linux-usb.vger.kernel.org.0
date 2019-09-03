Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62BE1A6CBB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 17:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbfICPSh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 11:18:37 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5735 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727107AbfICPSh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Sep 2019 11:18:37 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 5B8CD39A87045D9D68BD;
        Tue,  3 Sep 2019 23:18:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Sep 2019 23:18:25 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Pawel Laszczak <pawell@cadence.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: cdns3: Remove redundant dev_err call in cdns3_probe()
Date:   Tue, 3 Sep 2019 15:36:25 +0000
Message-ID: <20190903153625.85691-1-weiyongjun1@huawei.com>
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

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/cdns3/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 300df58a190b..9b1d8fed4e5a 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -462,10 +462,8 @@ static int cdns3_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dev");
 	regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(regs)) {
-		dev_err(dev, "couldn't iomap dev resource\n");
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-	}
 	cdns->dev_regs	= regs;
 
 	cdns->otg_irq = platform_get_irq_byname(pdev, "otg");



