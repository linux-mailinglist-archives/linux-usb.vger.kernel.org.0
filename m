Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A39CA7E3F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 10:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbfIDIqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 04:46:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5754 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726358AbfIDIqe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 04:46:34 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 51BDD35D8587737A1EBA;
        Wed,  4 Sep 2019 16:46:30 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 16:46:21 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: phy: keystone: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 16:45:58 +0800
Message-ID: <20190904084558.24484-1-yuehaibing@huawei.com>
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
 drivers/usb/phy/phy-keystone.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-keystone.c b/drivers/usb/phy/phy-keystone.c
index 1987126..110e6e9 100644
--- a/drivers/usb/phy/phy-keystone.c
+++ b/drivers/usb/phy/phy-keystone.c
@@ -66,15 +66,13 @@ static int keystone_usbphy_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
 	struct keystone_usbphy	*k_phy;
-	struct resource		*res;
 	int ret;
 
 	k_phy = devm_kzalloc(dev, sizeof(*k_phy), GFP_KERNEL);
 	if (!k_phy)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	k_phy->phy_ctrl = devm_ioremap_resource(dev, res);
+	k_phy->phy_ctrl = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(k_phy->phy_ctrl))
 		return PTR_ERR(k_phy->phy_ctrl);
 
-- 
2.7.4


