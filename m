Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA44436B27
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhJUTRA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:17:00 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:36212 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhJUTQ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:16:58 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 669EF2090F6B
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 02/10] usb: gadget: udc: gr: fix deferred probing
Date:   Thu, 21 Oct 2021 22:14:29 +0300
Message-ID: <20211021191437.8737-3-s.shtylyov@omp.ru>
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

The driver overrides the error codes (and also IRQ0) returned by
platform_get_irq() to -ENODEV, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream, considering IRQ0 valid for simplicity
devm_request_threaded_irq() can always override that decision...

Fixes: 196800da39a1 ("usb: gadget: gr_udc: Use platform_get_irq instead of irq_of_parse_and_map")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/gadget/udc/gr_udc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 4b35739d3695..4aa5246a77e5 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -2136,15 +2136,15 @@ static int gr_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	dev->irq = platform_get_irq(pdev, 0);
-	if (dev->irq <= 0)
-		return -ENODEV;
+	if (dev->irq < 0)
+		return dev->irq;
 
 	/* Some core configurations has separate irqs for IN and OUT events */
 	dev->irqi = platform_get_irq(pdev, 1);
 	if (dev->irqi > 0) {
 		dev->irqo = platform_get_irq(pdev, 2);
-		if (dev->irqo <= 0)
-			return -ENODEV;
+		if (dev->irqo < 0)
+			return dev->irqo;
 	} else {
 		dev->irqi = 0;
 	}
-- 
2.26.3

