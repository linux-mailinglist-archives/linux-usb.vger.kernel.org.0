Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418E6256974
	for <lists+linux-usb@lfdr.de>; Sat, 29 Aug 2020 19:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgH2Rhc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Aug 2020 13:37:32 -0400
Received: from mxout04.lancloud.ru ([89.108.124.63]:48212 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgH2Rhb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Aug 2020 13:37:31 -0400
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 Aug 2020 13:37:31 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 3B28020A0DC7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH] usb: core: driver: fix stray tabs in error messages
Organization: Open Mobile Platform, LLC
Message-ID: <4beb55c4-eb34-7744-155f-033b8f527e23@omprussia.ru>
Date:   Sat, 29 Aug 2020 20:30:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.133.185]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 8bb54ab573ec ("usbcore: add usb_device_driver definition") added
the printk() calls with the error massages spoilt due to the stray tabs
in the middle. Remove these tabs and convert printk() calls to pr_err()
for consistency with the other code, while at it.

Fixes: 8bb54ab573ec ("usbcore: add usb_device_driver definition")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

---
The patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...

 drivers/usb/core/driver.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

Index: usb/drivers/usb/core/driver.c
===================================================================
--- usb.orig/drivers/usb/core/driver.c
+++ usb/drivers/usb/core/driver.c
@@ -973,8 +973,7 @@ int usb_register_device_driver(struct us
 		bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
 				 __usb_bus_reprobe_drivers);
 	} else {
-		printk(KERN_ERR "%s: error %d registering device "
-			"	driver %s\n",
+		pr_err("%s: error %d registering device driver %s\n",
 			usbcore_name, retval, new_udriver->name);
 	}
 
@@ -1050,9 +1049,8 @@ out:
 out_newid:
 	driver_unregister(&new_driver->drvwrap.driver);
 
-	printk(KERN_ERR "%s: error %d registering interface "
-			"	driver %s\n",
-			usbcore_name, retval, new_driver->name);
+	pr_err("%s: error %d registering interface driver %s\n",
+		usbcore_name, retval, new_driver->name);
 	goto out;
 }
 EXPORT_SYMBOL_GPL(usb_register_driver);
