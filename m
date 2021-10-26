Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189C743B85E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 19:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237924AbhJZRmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 13:42:20 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:51758 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237834AbhJZRmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 13:42:15 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 8B454209033C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 08/22] usb: host: ohci-at91: deny IRQ0
Date:   Tue, 26 Oct 2021 20:39:29 +0300
Message-ID: <20211026173943.6829-9-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211026173943.6829-1-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: fb5f1834c322 ("usb: ohci-at91: fix irq and iomem resource retrieval")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in version 2:
- added Alan's ACK.

 drivers/usb/host/ohci-at91.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index a24aea3d2759..6a7276a730d1 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -181,6 +181,8 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
 		dev_dbg(dev, "hcd probe: missing irq resource\n");
 		return irq;
 	}
+	if (!irq)
+		return -EINVAL;
 
 	hcd = usb_create_hcd(driver, dev, "at91");
 	if (!hcd)
-- 
2.26.3

