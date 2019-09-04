Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEC7A7EB1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 11:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729324AbfIDJBt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 05:01:49 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35298 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726045AbfIDJBt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 05:01:49 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E6BE3B719FA4BBEAA3B2;
        Wed,  4 Sep 2019 17:01:47 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 17:01:37 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <gregkh@linuxfoundation.org>, <yoshihiro.shimoda.uh@renesas.com>,
        <horms+renesas@verge.net.au>, <felipe.balbi@linux.intel.com>,
        <chris.brandt@renesas.com>, <jarkko.nikula@linux.intel.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: renesas_usbhs: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 16:50:45 +0800
Message-ID: <20190904085045.24204-1-yuehaibing@huawei.com>
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
 drivers/usb/renesas_usbhs/common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 4c3de77..18d5d1a 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -590,7 +590,7 @@ static int usbhs_probe(struct platform_device *pdev)
 {
 	const struct renesas_usbhs_platform_info *info;
 	struct usbhs_priv *priv;
-	struct resource *res, *irq_res;
+	struct resource *irq_res;
 	struct device *dev = &pdev->dev;
 	int ret, gpio;
 	u32 tmp;
@@ -619,8 +619,7 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.7.4


