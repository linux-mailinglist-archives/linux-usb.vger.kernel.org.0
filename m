Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477033E4E12
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 22:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236053AbhHIUpk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 16:45:40 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:34326 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbhHIUpj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 16:45:39 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 61DA320CDD74
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 6/9] usb: misc: brcmstb-usb-pinmap: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
CC:     Al Cooper <alcooperx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>
Organization: Open Mobile Platform
Message-ID: <806d0b1a-365b-93d9-3fc1-922105ca5e61@omp.ru>
Date:   Mon, 9 Aug 2021 23:45:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to devm_request_irq() (which takes
*unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
error code.  Stop calling devm_request_irq() with the invalid IRQ #s.

Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/misc/brcmstb-usb-pinmap.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb/drivers/usb/misc/brcmstb-usb-pinmap.c
===================================================================
--- usb.orig/drivers/usb/misc/brcmstb-usb-pinmap.c
+++ usb/drivers/usb/misc/brcmstb-usb-pinmap.c
@@ -293,6 +293,8 @@ static int __init brcmstb_usb_pinmap_pro
 
 		/* Enable interrupt for out pins */
 		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
 		err = devm_request_irq(&pdev->dev, irq,
 				       brcmstb_usb_pinmap_ovr_isr,
 				       IRQF_TRIGGER_RISING,
