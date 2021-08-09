Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269D43E4E1A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 22:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236304AbhHIUun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 16:50:43 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:48106 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhHIUum (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 16:50:42 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 2BFC5206094F
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 7/9] usb: phy: fsl-usb: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Ran Wang <ran.wang_1@nxp.com>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
CC:     <linuxppc-dev@lists.ozlabs.org>
Organization: Open Mobile Platform
Message-ID: <b0a86089-8b8b-122e-fd6d-73e8c2304964@omp.ru>
Date:   Mon, 9 Aug 2021 23:50:18 +0300
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
blithely passes the negative error codes to request_irq() (which takes
*unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
error code. Stop calling request_irq() with the invalid IRQ #s.

Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/phy/phy-fsl-usb.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb/drivers/usb/phy/phy-fsl-usb.c
===================================================================
--- usb.orig/drivers/usb/phy/phy-fsl-usb.c
+++ usb/drivers/usb/phy/phy-fsl-usb.c
@@ -873,6 +873,8 @@ int usb_otg_start(struct platform_device
 
 	/* request irq */
 	p_otg->irq = platform_get_irq(pdev, 0);
+	if (p_otg->irq < 0)
+		return p_otg->irq;
 	status = request_irq(p_otg->irq, fsl_otg_isr,
 				IRQF_SHARED, driver_name, p_otg);
 	if (status) {
