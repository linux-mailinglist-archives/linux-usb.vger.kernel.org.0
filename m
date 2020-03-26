Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DBE193970
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 08:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgCZHOh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 03:14:37 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12137 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbgCZHOh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 03:14:37 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B8AB893BEE20643D0650;
        Thu, 26 Mar 2020 15:14:32 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Mar 2020
 15:14:23 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <leoyang.li@nxp.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] usb: gadget: fsl: remove unused variable 'driver_desc'
Date:   Thu, 26 Mar 2020 15:14:19 +0800
Message-ID: <20200326071419.19240-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

drivers/usb/gadget/udc/fsl_udc_core.c:56:19:
 warning: 'driver_desc' defined but not used [-Wunused-const-variable=]

It is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index ec6eda426223..febabde62f71 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -53,7 +53,6 @@
 #define	DMA_ADDR_INVALID	(~(dma_addr_t)0)
 
 static const char driver_name[] = "fsl-usb2-udc";
-static const char driver_desc[] = DRIVER_DESC;
 
 static struct usb_dr_device __iomem *dr_regs;
 
-- 
2.17.1


