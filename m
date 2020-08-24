Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC824F4F9
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 10:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgHXInH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 04:43:07 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:10259 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728692AbgHXInD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 04:43:03 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2B01A17E80A9002BAE17;
        Mon, 24 Aug 2020 16:43:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
 16:42:49 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <leoyang.li@nxp.com>, <linux-usb@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>
CC:     Ye Bin <yebin10@huawei.com>
Subject: [PATCH v2] usb: gadget: fsl: Fix unsigned expression compared with zero in fsl_udc_probe
Date:   Mon, 24 Aug 2020 16:42:34 +0800
Message-ID: <20200824084234.232179-1-yebin10@huawei.com>
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

udc_controller->irq is "unsigned int" always >= 0, but platform_get_irq may
return little than zero. So "dc_controller->irq < 0" condition is never
accessible.

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

