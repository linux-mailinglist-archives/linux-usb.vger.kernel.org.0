Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021CC470C06
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 21:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242454AbhLJUuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 15:50:16 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:46502 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhLJUuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 15:50:14 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 2732B209B9A7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 4/6] usb: host: ohci-da8xx: fix deferred probing
Date:   Fri, 10 Dec 2021 23:46:32 +0300
Message-ID: <20211210204634.8182-5-s.shtylyov@omp.ru>
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

The driver overrides the error codes returned by platform_get_irq() to 
-ENODEV for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in version 3:
- corrected the "Fixes:" tag;
- added Alan's ACK.

Changes in version 2:
- removed the wrong "From:" tag and wrong sign-off.

 drivers/usb/host/ohci-da8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 1371b0c249ec..d1326c6ccade 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -446,7 +446,7 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
 
 	hcd_irq = platform_get_irq(pdev, 0);
 	if (hcd_irq < 0) {
-		error = -ENODEV;
+		error = hcd_irq;
 		goto err;
 	}
 
-- 
2.26.3

