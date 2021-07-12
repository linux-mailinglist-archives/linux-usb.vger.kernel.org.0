Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B163E3C628D
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 20:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbhGLSZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 14:25:09 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:49176 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbhGLSZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 14:25:08 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Jul 2021 14:25:07 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 4E2EE20C0085
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: ohci-spear: simplify calling usb_add_hcd()
Organization: Open Mobile Platform
Message-ID: <3e4ad969-f2ae-32f7-53fd-ea369f140703@omp.ru>
Date:   Mon, 12 Jul 2021 21:16:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to call platform_get_irq() when the driver's probe()
method calls usb_add_hcd() -- the platform_get_irq()'s result will have
been stored already in the 'irq' local variable...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...

 drivers/usb/host/ohci-spear.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb/drivers/usb/host/ohci-spear.c
===================================================================
--- usb.orig/drivers/usb/host/ohci-spear.c
+++ usb/drivers/usb/host/ohci-spear.c
@@ -84,7 +84,7 @@ static int spear_ohci_hcd_drv_probe(stru
 
 	clk_prepare_enable(sohci_p->clk);
 
-	retval = usb_add_hcd(hcd, platform_get_irq(pdev, 0), 0);
+	retval = usb_add_hcd(hcd, irq, 0);
 	if (retval == 0) {
 		device_wakeup_enable(hcd->self.controller);
 		return retval;
