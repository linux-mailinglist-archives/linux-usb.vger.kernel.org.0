Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632C252203F
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 17:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346873AbiEJP67 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 11:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347979AbiEJP62 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 11:58:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3677DE7320
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 08:51:29 -0700 (PDT)
Received: (qmail 165588 invoked by uid 1000); 10 May 2022 11:51:29 -0400
Date:   Tue, 10 May 2022 11:51:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: Add ID numbers to gadget names
Message-ID: <YnqKAXKyp9Vq/pbn@rowland.harvard.edu>
References: <CAMuHMdVDK0W0T3=+2c1E6wtwy5JTUemTGYyj3PFuVUhK++AzrA@mail.gmail.com>
 <YnFO0Qr8RY7peFCg@rowland.harvard.edu>
 <YnaR8LaaPTdLTiok@rowland.harvard.edu>
 <CAMuHMdUpOiHHMktPk_-NauDW2ufvGThnkFU7Pok376pM6OEyYw@mail.gmail.com>
 <Ynkh5eKtfxU+AyZX@rowland.harvard.edu>
 <CAMuHMdVi6jCi=tRBNjBodVcA48ygiqPACQcmHx+1HRYnArJ9tQ@mail.gmail.com>
 <YnktokC8Uk9j53yO@rowland.harvard.edu>
 <YnlAAxT5Lq0NvxX0@kroah.com>
 <YnlFl0M0FRzhxwpK@rowland.harvard.edu>
 <YnoZva+tZa8Ix+aI@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnoZva+tZa8Ix+aI@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Putting USB gadgets on a new bus of their own encounters a problem
when multiple gadgets are present: They all have the same name!  The
driver core fails with a "sys: cannot create duplicate filename" error
when creating any of the /sys/bus/gadget/devices/<gadget-name>
symbolic links after the first.

This patch fixes the problem by adding a ".N" suffix to each gadget's
name when the gadget is registered (where N is a unique ID number),
thus making the names distinct.

Reported-and-tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")

---


[as1980]


 drivers/usb/gadget/udc/core.c |   16 ++++++++++++++--
 include/linux/usb/gadget.h    |    2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/list.h>
+#include <linux/idr.h>
 #include <linux/err.h>
 #include <linux/dma-mapping.h>
 #include <linux/sched/task_stack.h>
@@ -23,6 +24,8 @@
 
 #include "trace.h"
 
+static DEFINE_IDA(gadget_id_numbers);
+
 static struct bus_type gadget_bus_type;
 
 /**
@@ -1248,7 +1251,6 @@ static void usb_udc_nop_release(struct d
 void usb_initialize_gadget(struct device *parent, struct usb_gadget *gadget,
 		void (*release)(struct device *dev))
 {
-	dev_set_name(&gadget->dev, "gadget");
 	INIT_WORK(&gadget->work, usb_gadget_state_work);
 	gadget->dev.parent = parent;
 
@@ -1304,12 +1306,21 @@ int usb_add_gadget(struct usb_gadget *ga
 	usb_gadget_set_state(gadget, USB_STATE_NOTATTACHED);
 	udc->vbus = true;
 
+	ret = ida_alloc(&gadget_id_numbers, GFP_KERNEL);
+	if (ret < 0)
+		goto err_del_udc;
+	gadget->id_number = ret;
+	dev_set_name(&gadget->dev, "gadget.%d", ret);
+
 	ret = device_add(&gadget->dev);
 	if (ret)
-		goto err_del_udc;
+		goto err_free_id;
 
 	return 0;
 
+ err_free_id:
+	ida_free(&gadget_id_numbers, gadget->id_number);
+
  err_del_udc:
 	flush_work(&gadget->work);
 	device_del(&udc->dev);
@@ -1417,6 +1428,7 @@ void usb_del_gadget(struct usb_gadget *g
 	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
 	flush_work(&gadget->work);
 	device_del(&gadget->dev);
+	ida_free(&gadget_id_numbers, gadget->id_number);
 	device_unregister(&udc->dev);
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget);
Index: usb-devel/include/linux/usb/gadget.h
===================================================================
--- usb-devel.orig/include/linux/usb/gadget.h
+++ usb-devel/include/linux/usb/gadget.h
@@ -386,6 +386,7 @@ struct usb_gadget_ops {
  * @lpm_capable: If the gadget max_speed is FULL or HIGH, this flag
  *	indicates that it supports LPM as per the LPM ECN & errata.
  * @irq: the interrupt number for device controller.
+ * @id_number: a unique ID number for ensuring that gadget names are distinct
  *
  * Gadgets have a mostly-portable "gadget driver" implementing device
  * functions, handling all usb configurations and interfaces.  Gadget
@@ -446,6 +447,7 @@ struct usb_gadget {
 	unsigned			connected:1;
 	unsigned			lpm_capable:1;
 	int				irq;
+	int				id_number;
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
