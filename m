Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3039F3E4E09
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 22:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbhHIUmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 16:42:22 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:50846 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbhHIUmW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 16:42:22 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 40E0122EF73D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 5/9] usb: host: ohci-tmio: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
Organization: Open Mobile Platform
Message-ID: <9bfa4edb-6852-d948-3f57-9c486e79a208@omp.ru>
Date:   Mon, 9 Aug 2021 23:41:59 +0300
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

The driver neglects to check the  result of platform_get_irq()'s call and
blithely passes the negative error codes to usb_add_hcd() (which takes
*unsigned* IRQ #), causing request_irq() that it calls to fail with
-EINVAL, overriding an original error code. Stop calling usb_add_hcd()
with the invalid IRQ #s.

Fixes: 78c73414f4f6 ("USB: ohci: add support for tmio-ohci cell")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/host/ohci-tmio.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb/drivers/usb/host/ohci-tmio.c
===================================================================
--- usb.orig/drivers/usb/host/ohci-tmio.c
+++ usb/drivers/usb/host/ohci-tmio.c
@@ -242,6 +242,8 @@ static int ohci_hcd_tmio_drv_probe(struc
 	if (ret < 0)
 		goto err_enable;
 
+	if (irq < 0)
+		goto err_enable;
 	ret = usb_add_hcd(hcd, irq, 0);
 	if (ret)
 		goto err_add_hcd;
