Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BBD46DC01
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 20:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhLHTZR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 14:25:17 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:33734 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239919AbhLHTY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 14:24:57 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru A1A1B20A77AD
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 01/10] usb: gadget: udc: bcm63xx: fix deferred probing
Date:   Wed, 8 Dec 2021 22:21:09 +0300
Message-ID: <20211208192118.7483-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211208192118.7483-1-s.shtylyov@omp.ru>
References: <20211208192118.7483-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver overrides the error codes returned by platform_get_irq() to
-ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/gadget/udc/bcm63xx_udc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index a9f07c59fc37..2cdb07905bde 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -2321,8 +2321,10 @@ static int bcm63xx_udc_probe(struct platform_device *pdev)
 
 	/* IRQ resource #0: control interrupt (VBUS, speed, etc.) */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		rc = irq;
 		goto out_uninit;
+	}
 	if (devm_request_irq(dev, irq, &bcm63xx_udc_ctrl_isr, 0,
 			     dev_name(dev), udc) < 0)
 		goto report_request_failure;
@@ -2330,8 +2332,10 @@ static int bcm63xx_udc_probe(struct platform_device *pdev)
 	/* IRQ resources #1-6: data interrupts for IUDMA channels 0-5 */
 	for (i = 0; i < BCM63XX_NUM_IUDMA; i++) {
 		irq = platform_get_irq(pdev, i + 1);
-		if (irq < 0)
+		if (irq < 0) {
+			rc = irq;
 			goto out_uninit;
+		}
 		if (devm_request_irq(dev, irq, &bcm63xx_udc_data_isr, 0,
 				     dev_name(dev), &udc->iudma[i]) < 0)
 			goto report_request_failure;
-- 
2.26.3

