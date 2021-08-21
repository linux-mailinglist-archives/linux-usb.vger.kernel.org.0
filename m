Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383073F3C72
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 22:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhHUUtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Aug 2021 16:49:24 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:50228 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhHUUtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Aug 2021 16:49:23 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 049DB22F1230
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: hcd: merge repetitive strings in
 usb_hcd_request_irqs()
Organization: Open Mobile Platform
Message-ID: <f6ee0fdf-097b-797f-3f8c-beea7c73496e@omp.ru>
Date:   Sat, 21 Aug 2021 23:48:38 +0300
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

Two dev_info() calls in usb_hcd_request_irqs() have the same "io " strings
needlessly repeated. Merge these strings into the format strings of those
dev_info() calls...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo...

 drivers/usb/core/hcd.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Index: usb/drivers/usb/core/hcd.c
===================================================================
--- usb.orig/drivers/usb/core/hcd.c
+++ usb/drivers/usb/core/hcd.c
@@ -2730,16 +2730,16 @@ static int usb_hcd_request_irqs(struct u
 			return retval;
 		}
 		hcd->irq = irqnum;
-		dev_info(hcd->self.controller, "irq %d, %s 0x%08llx\n", irqnum,
-				(hcd->driver->flags & HCD_MEMORY) ?
-					"io mem" : "io base",
-					(unsigned long long)hcd->rsrc_start);
+		dev_info(hcd->self.controller, "irq %d, io %s 0x%08llx\n",
+				irqnum, (hcd->driver->flags & HCD_MEMORY) ?
+					"mem" : "base",
+				(unsigned long long)hcd->rsrc_start);
 	} else {
 		hcd->irq = 0;
 		if (hcd->rsrc_start)
-			dev_info(hcd->self.controller, "%s 0x%08llx\n",
+			dev_info(hcd->self.controller, "io %s 0x%08llx\n",
 					(hcd->driver->flags & HCD_MEMORY) ?
-					"io mem" : "io base",
+						"mem" : "base",
 					(unsigned long long)hcd->rsrc_start);
 	}
 	return 0;
