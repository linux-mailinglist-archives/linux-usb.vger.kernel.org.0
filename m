Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D8157CE98
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jul 2022 17:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbiGUPHT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jul 2022 11:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbiGUPHM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jul 2022 11:07:12 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1275787223
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 08:07:10 -0700 (PDT)
Received: (qmail 233545 invoked by uid 1000); 21 Jul 2022 11:07:10 -0400
Date:   Thu, 21 Jul 2022 11:07:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YtlrnhHyrHsSky9m@rowland.harvard.edu>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000acc0e905e4517fa0@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The syzbot fuzzer found a race between uevent callbacks and gadget
driver unregistration that can cause a use-after-free bug:

---------------------------------------------------------------
BUG: KASAN: use-after-free in usb_udc_uevent+0x11f/0x130
drivers/usb/gadget/udc/core.c:1732
Read of size 8 at addr ffff888078ce2050 by task udevd/2968

CPU: 1 PID: 2968 Comm: udevd Not tainted 5.19.0-rc4-next-20220628-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google
06/29/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:317 [inline]
 print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
 kasan_report+0xbe/0x1f0 mm/kasan/report.c:495
 usb_udc_uevent+0x11f/0x130 drivers/usb/gadget/udc/core.c:1732
 dev_uevent+0x290/0x770 drivers/base/core.c:2424
---------------------------------------------------------------

The bug occurs because usb_udc_uevent() dereferences udc->driver but
does so without acquiring the udc_lock mutex, which protects this
field.  If the gadget driver is unbound from the udc concurrently with
uevent processing, the driver structure may be accessed after it has
been deallocated.

To prevent the race, we make sure that the routine holds the mutex
around the racing accesses.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+b0de012ceb1e2a97891b@syzkaller.appspotmail.com
CC: stable@vger.kernel.org
Link: <https://lore.kernel.org/all/0000000000004de90405a719c951@google.com>

---

As far as I can tell, this bug has always been present.  However, the
udc_lock mutex used by the patch was added in commit fc274c1e9973
("USB: gadget: Add a new bus for gadgets"), so this patch won't apply
to trees which don't include that commit or a backport of it.  I don't
know what tag, if any, can express this requirement.


[as1983]


 drivers/usb/gadget/udc/core.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1728,13 +1728,14 @@ static int usb_udc_uevent(struct device
 		return ret;
 	}
 
-	if (udc->driver) {
+	mutex_lock(&udc_lock);
+	if (udc->driver)
 		ret = add_uevent_var(env, "USB_UDC_DRIVER=%s",
 				udc->driver->function);
-		if (ret) {
-			dev_err(dev, "failed to add uevent USB_UDC_DRIVER\n");
-			return ret;
-		}
+	mutex_unlock(&udc_lock);
+	if (ret) {
+		dev_err(dev, "failed to add uevent USB_UDC_DRIVER\n");
+		return ret;
 	}
 
 	return 0;
