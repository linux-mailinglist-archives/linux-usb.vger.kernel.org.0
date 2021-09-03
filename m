Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40794400750
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 23:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbhICVNm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 17:13:42 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:56862 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbhICVNl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 17:13:41 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru CE0B320AD28C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: hcd: fix strings in usb_hcd_request_irqs()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <266e454f-0288-9992-807f-1c6489375460@omp.ru>
Date:   Sat, 4 Sep 2021 00:12:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Two dev_info() calls in usb_hcd_request_irqs() mistreat the I/O base
address, calling it "io base".  While fixing this, make indenataion
of the argument lists more sane... 

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...

 drivers/usb/core/hcd.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: usb/drivers/usb/core/hcd.c
===================================================================
--- usb.orig/drivers/usb/core/hcd.c
+++ usb/drivers/usb/core/hcd.c
@@ -2732,14 +2732,14 @@ static int usb_hcd_request_irqs(struct u
 		hcd->irq = irqnum;
 		dev_info(hcd->self.controller, "irq %d, %s 0x%08llx\n", irqnum,
 				(hcd->driver->flags & HCD_MEMORY) ?
-					"io mem" : "io base",
-					(unsigned long long)hcd->rsrc_start);
+					"io mem" : "io port",
+				(unsigned long long)hcd->rsrc_start);
 	} else {
 		hcd->irq = 0;
 		if (hcd->rsrc_start)
 			dev_info(hcd->self.controller, "%s 0x%08llx\n",
 					(hcd->driver->flags & HCD_MEMORY) ?
-					"io mem" : "io base",
+						"io mem" : "io port",
 					(unsigned long long)hcd->rsrc_start);
 	}
 	return 0;
