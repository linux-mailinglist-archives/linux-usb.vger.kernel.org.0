Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D10470C0B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 21:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243162AbhLJUuS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 15:50:18 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:59508 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239651AbhLJUuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 15:50:16 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 9DBEA20A9795
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v3 5/6] usb: host: ohci-nxp: fix deferred probing
Date:   Fri, 10 Dec 2021 23:46:33 +0300
Message-ID: <20211210204634.8182-6-s.shtylyov@omp.ru>
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
-ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Acked-by: Vladimir Zapolskiy <vz@mleia.com>
---
Changes in version 3:
- corrected the "Fixes:" tag;
- added Alan's and Vladimir's ACKs.

Changes in version 2:
- refreshed the patch;
- removed the eliipsis in the patch description.

 drivers/usb/host/ohci-nxp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 85878e8ad331..a84c5e714372 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -212,7 +212,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		ret = -ENXIO;
+		ret = irq;
 		goto fail_resource;
 	}
 
-- 
2.26.3

