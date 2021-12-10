Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72252470C07
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 21:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242920AbhLJUuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 15:50:16 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:41048 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236414AbhLJUuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 15:50:15 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 10556208D329
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/6] usb: host: ehci-atmel: fix deferred probing
Date:   Fri, 10 Dec 2021 23:46:30 +0300
Message-ID: <20211210204634.8182-3-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211210204634.8182-1-s.shtylyov@omp.ru>
References: <20211210204634.8182-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver overrides the error codes and IRQ0 returned by platform_get_irq()
to -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
permanently instead of the deferred probing. Switch to propagating the error
codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
can safely ignore it...

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in version 3:
- corrected the "Fixes:" tag;
- added Alan's ACK.

Changes in version 2:
- removed the check for IRQ0, updated the patch description accordingly.

 drivers/usb/host/ehci-atmel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 05d41fd65f25..bc3fdb588e6b 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -104,8 +104,8 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
 	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		retval = -ENODEV;
+	if (irq < 0) {
+		retval = irq;
 		goto fail_create_hcd;
 	}
 
-- 
2.26.3

