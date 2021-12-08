Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0416E46DC03
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 20:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbhLHTZS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 14:25:18 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:44974 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239929AbhLHTY6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 14:24:58 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 18130206004A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 07/10] usb: host: ohci-da8xx: fix deferred probing
Date:   Wed, 8 Dec 2021 22:21:15 +0300
Message-ID: <20211208192118.7483-8-s.shtylyov@omp.ru>
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
-ENODEV for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: efe7daf2231a ("USB: OHCI: DA8xx/OMAP-L1x glue layer")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
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

