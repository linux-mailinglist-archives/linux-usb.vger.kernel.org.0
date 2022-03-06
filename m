Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA41C4CE853
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 03:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbiCFCsP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Mar 2022 21:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiCFCsP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Mar 2022 21:48:15 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0303D5AA7E
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 18:47:23 -0800 (PST)
Received: (qmail 1370238 invoked by uid 1000); 5 Mar 2022 21:47:22 -0500
Date:   Sat, 5 Mar 2022 21:47:22 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Zhang, Qiang1" <qiang1.zhang@intel.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] usb: gadget: Fix use-after-free bug by not setting
 udc->dev.driver
Message-ID: <YiQgukfFFbBnwJ/9@rowland.harvard.edu>
References: <YiOy73F0J31b8uPj@rowland.harvard.edu>
 <000000000000050b5705d97d731e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000050b5705d97d731e@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer found a use-after-free bug:

BUG: KASAN: use-after-free in dev_uevent+0x712/0x780 drivers/base/core.c:2320
Read of size 8 at addr ffff88802b934098 by task udevd/3689

CPU: 2 PID: 3689 Comm: udevd Not tainted 5.17.0-rc4-syzkaller-00229-g4f12b742eb2b #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0x8d/0x303 mm/kasan/report.c:255
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 dev_uevent+0x712/0x780 drivers/base/core.c:2320
 uevent_show+0x1b8/0x380 drivers/base/core.c:2391
 dev_attr_show+0x4b/0x90 drivers/base/core.c:2094

Although the bug manifested in the driver core, the real cause was a
race with the gadget core.  dev_uevent() does:

	if (dev->driver)
		add_uevent_var(env, "DRIVER=%s", dev->driver->name);

and between the test and the dereference of dev->driver, the gadget
core sets dev->driver to NULL.

The race wouldn't occur if the gadget core registered its devices on
a real bus, using the standard synchronization techniques of the
driver core.  However, it's not necessary to make such a large change
in order to fix this bug; all we need to do is make sure that
udc->dev.driver is always NULL.

In fact, there is no reason for udc->dev.driver ever to be set to
anything, let alone to the value it currently gets: the address of the
gadget's driver.  After all, a gadget driver only knows how to manage
a gadget, not how to manage a UDC.

This patch simply removes the statements in the gadget core that touch
udc->dev.driver.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+348b571beb5eeb70a582@syzkaller.appspotmail.com
Fixes: 2ccea03a8f7e ("usb: gadget: introduce UDC Class")
CC: <stable@vger.kernel.org>

---


[as1974]


 drivers/usb/gadget/udc/core.c |    3 ---
 1 file changed, 3 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1436,7 +1436,6 @@ static void usb_gadget_remove_driver(str
 	usb_gadget_udc_stop(udc);
 
 	udc->driver = NULL;
-	udc->dev.driver = NULL;
 	udc->gadget->dev.driver = NULL;
 }
 
@@ -1498,7 +1497,6 @@ static int udc_bind_to_driver(struct usb
 			driver->function);
 
 	udc->driver = driver;
-	udc->dev.driver = &driver->driver;
 	udc->gadget->dev.driver = &driver->driver;
 
 	usb_gadget_udc_set_speed(udc, driver->max_speed);
@@ -1521,7 +1519,6 @@ err1:
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			udc->driver->function, ret);
 	udc->driver = NULL;
-	udc->dev.driver = NULL;
 	udc->gadget->dev.driver = NULL;
 	return ret;
 }
