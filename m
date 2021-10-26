Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F1D43B867
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 19:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237925AbhJZRmY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 13:42:24 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:56852 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237869AbhJZRmS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 13:42:18 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 9C85420A74B7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH v2 13/22] usb: host: ohci-platform: deny IRQ0
Date:   Tue, 26 Oct 2021 20:39:34 +0300
Message-ID: <20211026173943.6829-14-s.shtylyov@omp.ru>
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

Fixes: fa3364b5a2d7 ("USB: OHCI: Add a generic platform device driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in version 2:
- added Alan's ACK.

 drivers/usb/host/ohci-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 4a8456f12a73..ec1d38d5d140 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -113,6 +113,8 @@ static int ohci_platform_probe(struct platform_device *dev)
 	irq = platform_get_irq(dev, 0);
 	if (irq < 0)
 		return irq;
+	if (!irq)
+		return -EINVAL;
 
 	hcd = usb_create_hcd(&ohci_platform_hc_driver, &dev->dev,
 			dev_name(&dev->dev));
-- 
2.26.3

