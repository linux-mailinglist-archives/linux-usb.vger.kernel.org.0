Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E323EBD51
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 22:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbhHMUat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 16:30:49 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:44094 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbhHMUas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 16:30:48 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 92C8420CFEA8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v3 1/2] usb: host: ohci-tmio: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
Organization: Open Mobile Platform
Message-ID: <402e1a45-a0a4-0e08-566a-7ca1331506b1@omp.ru>
Date:   Fri, 13 Aug 2021 23:30:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver neglects to check the  result of platform_get_irq()'s call and
blithely passes the negative error codes to usb_add_hcd() (which takes
*unsigned* IRQ #), causing request_irq() that it calls to fail with
-EINVAL, overriding an original error code. Stop calling usb_add_hcd()
with the invalid IRQ #s.

Fixes: 78c73414f4f6 ("USB: ohci: add support for tmio-ohci cell")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
Changes in version 3:
- move the IRQ check higher in ohci_hcd_tmio_drv_probe(), to be closer to
  platfrom_get_irq()'s call.

 drivers/usb/host/ohci-tmio.c |    3 +++
 1 file changed, 3 insertions(+)

Index: usb/drivers/usb/host/ohci-tmio.c
===================================================================
--- usb.orig/drivers/usb/host/ohci-tmio.c
+++ usb/drivers/usb/host/ohci-tmio.c
@@ -202,6 +202,9 @@ static int ohci_hcd_tmio_drv_probe(struc
 	if (!cell)
 		return -EINVAL;
 
+	if (irq < 0)
+		return irq;
+
 	hcd = usb_create_hcd(&ohci_tmio_hc_driver, &dev->dev, dev_name(&dev->dev));
 	if (!hcd) {
 		ret = -ENOMEM;
