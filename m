Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E5F3E4DEE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 22:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236295AbhHIUfi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 16:35:38 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:34102 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhHIUfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 16:35:38 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 1CDFE20CB558
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 4/9] usb: gadget: udc: s3c2410: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
Organization: Open Mobile Platform
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Message-ID: <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
Date:   Mon, 9 Aug 2021 23:35:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to request_irq() (which takes
*unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
error code. Stop calling request_irq() with the invalid IRQ #s.

Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/gadget/udc/s3c2410_udc.c |    4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

Index: usb/drivers/usb/gadget/udc/s3c2410_udc.c
===================================================================
--- usb.orig/drivers/usb/gadget/udc/s3c2410_udc.c
+++ usb/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -1784,6 +1784,10 @@ static int s3c2410_udc_probe(struct plat
 	s3c2410_udc_reinit(udc);
 
 	irq_usbd = platform_get_irq(pdev, 0);
+	if (irq_usbd < 0) {
+		retval = irq_usbd;
+		goto err_udc_clk;
+	}
 
 	/* irq setup after old hardware state is cleaned up */
 	retval = request_irq(irq_usbd, s3c2410_udc_irq,
