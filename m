Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CEA3EBD6E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 22:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234037AbhHMUdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 16:33:08 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:51504 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbhHMUdI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 16:33:08 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru F0FFE208EBFD
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v3 2/2] usb: phy: tahvo: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
Organization: Open Mobile Platform
Message-ID: <8280d6a4-8e9a-7cfe-1aa9-db586dc9afdf@omp.ru>
Date:   Fri, 13 Aug 2021 23:32:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
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
blithely passes the negative error codes to request_threaded_irq() (which
takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an
original error code.  Stop calling request_threaded_irq() with the invalid
IRQ #s.

Fixes: 9ba96ae5074c ("usb: omap1: Tahvo USB transceiver driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/phy/phy-tahvo.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: usb/drivers/usb/phy/phy-tahvo.c
===================================================================
--- usb.orig/drivers/usb/phy/phy-tahvo.c
+++ usb/drivers/usb/phy/phy-tahvo.c
@@ -393,7 +393,9 @@ static int tahvo_usb_probe(struct platfo
 
 	dev_set_drvdata(&pdev->dev, tu);
 
-	tu->irq = platform_get_irq(pdev, 0);
+	tu->irq = ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
 	ret = request_threaded_irq(tu->irq, NULL, tahvo_usb_vbus_interrupt,
 				   IRQF_ONESHOT,
 				   "tahvo-vbus", tu);
