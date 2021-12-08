Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C42546DC00
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 20:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhLHTZR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 14:25:17 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:33746 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239920AbhLHTY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 14:24:57 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 219C820A77B2
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 05/10] usb: host: ehci-orion: fix deferred probing
Date:   Wed, 8 Dec 2021 22:21:13 +0300
Message-ID: <20211208192118.7483-6-s.shtylyov@omp.ru>
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

The driver overrides the error codes and IRQ0 returned by platform_get_irq()
to -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
permanently instead of the deferred probing. Switch to propagating the error
codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
can safely ignore it...

Fixes: e96ffe2f9deb ("USB: add Marvell Orion USB host support")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
Changes in version 2:
- removed the check for IRQ0, updated the patch description accordingly.

 drivers/usb/host/ehci-orion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 3626758b3e2a..36ea4febe29b 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -222,8 +222,8 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	pr_debug("Initializing Orion-SoC USB Host Controller\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		err = -ENODEV;
+	if (irq < 0) {
+		err = irq;
 		goto err;
 	}
 
-- 
2.26.3

