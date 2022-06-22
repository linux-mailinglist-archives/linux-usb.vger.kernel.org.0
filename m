Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 609BA554DBE
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 16:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239923AbiFVOqj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 10:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238207AbiFVOqe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 10:46:34 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D0AE53D1FA
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 07:46:32 -0700 (PDT)
Received: (qmail 910933 invoked by uid 1000); 22 Jun 2022 10:46:31 -0400
Date:   Wed, 22 Jun 2022 10:46:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Andrey Konovalov <andreyknvl@gmail.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: Fix double-free bug in raw_gadget driver
Message-ID: <YrMrRw5AyIZghN0v@rowland.harvard.edu>
References: <165580149211221@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165580149211221@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Re-reading a recently merged fix to the raw_gadget driver showed that
it inadvertently introduced a double-free bug in a failure pathway.
If raw_ioctl_init() encounters an error after the driver ID number has
been allocated, it deallocates the ID number before returning.  But
when dev_free() runs later on, it will then try to deallocate the ID
number a second time.

Closely related to this issue is another error in the recent fix: The
ID number is stored in the raw_dev structure before the code checks to
see whether the structure has already been initialized, in which case
the new ID number would overwrite the earlier value.

The solution to both bugs is to keep the new ID number in a local
variable, and store it in the raw_dev structure only after the check
for prior initialization.  No errors can occur after that point, so
the double-free will never happen.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: f2d8c2606825 ("usb: gadget: Fix non-unique driver names in raw-gadget driver")
CC: Andrey Konovalov <andreyknvl@gmail.com>
CC: <stable@vger.kernel.org>

---

I just noticed this while scanning the email message that f2d8c2606825 
had been merged.  I'm marking this fix for -stable because the commit it 
fixes is also marked that way.


[as1982]


 drivers/usb/gadget/legacy/raw_gadget.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

Index: usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/raw_gadget.c
+++ usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
@@ -430,6 +430,7 @@ out_put:
 static int raw_ioctl_init(struct raw_dev *dev, unsigned long value)
 {
 	int ret = 0;
+	int driver_id_number;
 	struct usb_raw_init arg;
 	char *udc_driver_name;
 	char *udc_device_name;
@@ -452,10 +453,9 @@ static int raw_ioctl_init(struct raw_dev
 		return -EINVAL;
 	}
 
-	ret = ida_alloc(&driver_id_numbers, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-	dev->driver_id_number = ret;
+	driver_id_number = ida_alloc(&driver_id_numbers, GFP_KERNEL);
+	if (driver_id_number < 0)
+		return driver_id_number;
 
 	driver_driver_name = kmalloc(DRIVER_DRIVER_NAME_LENGTH_MAX, GFP_KERNEL);
 	if (!driver_driver_name) {
@@ -463,7 +463,7 @@ static int raw_ioctl_init(struct raw_dev
 		goto out_free_driver_id_number;
 	}
 	snprintf(driver_driver_name, DRIVER_DRIVER_NAME_LENGTH_MAX,
-				DRIVER_NAME ".%d", dev->driver_id_number);
+				DRIVER_NAME ".%d", driver_id_number);
 
 	udc_driver_name = kmalloc(UDC_NAME_LENGTH_MAX, GFP_KERNEL);
 	if (!udc_driver_name) {
@@ -507,6 +507,7 @@ static int raw_ioctl_init(struct raw_dev
 	dev->driver.driver.name = driver_driver_name;
 	dev->driver.udc_name = udc_device_name;
 	dev->driver.match_existing_only = 1;
+	dev->driver_id_number = driver_id_number;
 
 	dev->state = STATE_DEV_INITIALIZED;
 	spin_unlock_irqrestore(&dev->lock, flags);
@@ -521,7 +522,7 @@ out_free_udc_driver_name:
 out_free_driver_driver_name:
 	kfree(driver_driver_name);
 out_free_driver_id_number:
-	ida_free(&driver_id_numbers, dev->driver_id_number);
+	ida_free(&driver_id_numbers, driver_id_number);
 	return ret;
 }
 
