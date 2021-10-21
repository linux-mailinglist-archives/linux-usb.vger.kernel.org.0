Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D80436B25
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhJUTQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:16:59 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:48172 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhJUTQ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:16:58 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru CADE420A4B54
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Daniel Mack <daniel@zonque.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 03/10] usb: gadget: udc: pxa25x: fix deferred probing
Date:   Thu, 21 Oct 2021 22:14:30 +0300
Message-ID: <20211021191437.8737-4-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211021191437.8737-1-s.shtylyov@omp.ru>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver overrides the error codes returned by platform_get_irq() to
-ENODEV for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: 34ebcd28235d ("pxa2xx_udc: cleanups, use platform_get_irq")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/gadget/udc/pxa25x_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 52cdfd8212d6..b38747fd3bb0 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -2364,7 +2364,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	dev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->regs))
-- 
2.26.3

