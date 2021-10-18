Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5504326B3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 20:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbhJRSmB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 14:42:01 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:36184 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbhJRSly (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 14:41:54 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 0FEA2206F60C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH 19/22] usb: host: xhci-histb: deny IRQ0
Date:   Mon, 18 Oct 2021 21:39:27 +0300
Message-ID: <20211018183930.8448-20-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: c508f41da078 ("xhci: hisilicon: support HiSilicon STB xHCI host controller")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/xhci-histb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index 08369857686e..581952dcefe8 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -218,6 +218,8 @@ static int xhci_histb_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	if (!irq)
+		return -EINVAL;
 
 	histb->ctrl = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(histb->ctrl))
-- 
2.26.3

