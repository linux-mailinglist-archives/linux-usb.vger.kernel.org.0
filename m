Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E206D24F398
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 10:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgHXIFL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 04:05:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47698 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbgHXIFH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 04:05:07 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2D530FF44ED5593B640C;
        Mon, 24 Aug 2020 16:05:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
 16:04:53 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <leoyang.li@nxp.com>, <linux-usb@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>
CC:     Ye Bin <yebin10@huawei.com>
Subject: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with zero in fsl_udc_probe
Date:   Mon, 24 Aug 2020 16:04:37 +0800
Message-ID: <20200824080437.229826-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index a6f7b2594c09..3e98740b8cfc 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2439,11 +2439,12 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	/* DEN is bidirectional ep number, max_ep doubles the number */
 	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
 
-	udc_controller->irq = platform_get_irq(pdev, 0);
-	if (udc_controller->irq <= 0) {
-		ret = udc_controller->irq ? : -ENODEV;
+	ret = platform_get_irq(pdev, 0);
+	if (ret <= 0) {
+		ret = ret ? : -ENODEV;
 		goto err_iounmap;
 	}
+	udc_controller->irq = ret;
 
 	ret = request_irq(udc_controller->irq, fsl_udc_irq, IRQF_SHARED,
 			driver_name, udc_controller);
-- 
2.25.4

