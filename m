Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615C54326AE
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 20:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbhJRSl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 14:41:57 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:55496 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbhJRSlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 14:41:52 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru CB22C20A8F97
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH 14/22] usb: host: ohci-pxa27x: deny IRQ0
Date:   Mon, 18 Oct 2021 21:39:22 +0300
Message-ID: <20211018183930.8448-15-s.shtylyov@omp.ru>
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

Fixes: 84bab7393b0d ("[ARM] ohci-pxa27x: use platform_get_{irq,resource} for the resource")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/ohci-pxa27x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 54aa5c77e549..336437277fd0 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -443,6 +443,8 @@ static int ohci_hcd_pxa27x_probe(struct platform_device *pdev)
 		pr_err("no resource of IORESOURCE_IRQ");
 		return irq;
 	}
+	if (!irq)
+		return -EINVAL;
 
 	usb_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(usb_clk))
-- 
2.26.3

