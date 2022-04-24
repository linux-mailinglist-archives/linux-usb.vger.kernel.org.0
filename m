Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5919C50CE39
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 03:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbiDXBga (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Apr 2022 21:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiDXBg3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Apr 2022 21:36:29 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 602A41AFF51
        for <linux-usb@vger.kernel.org>; Sat, 23 Apr 2022 18:33:30 -0700 (PDT)
Received: (qmail 755697 invoked by uid 1000); 23 Apr 2022 21:33:29 -0400
Date:   Sat, 23 Apr 2022 21:33:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 2/4] USB: gadget: Register udc before gadget
Message-ID: <YmSo6fU1FlNq8cOZ@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YmKt3kH+85kjzdbL@kroah.com>
 <YmSc29YZvxgT5fEJ@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmSc29YZvxgT5fEJ@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for adding a "gadget" bus, this patch reverses the
order of registration of udc and gadget devices in usb_add_gadget().

The current code adds the gadget device first, probably because that
was more convenient at the time and the order didn't really matter.
But with the upcoming change, adding the gadget will cause driver
probing to occur.  Unwinding that on the error pathway will become
much more obtrusive, not to mention the fact that a gadget driver
might not work properly before the udc is registered.  It's better to
register the udc device first, particularly since that doesn't involve
a bus or driver binding and therefore is simpler to unwind.

For symmetry, the order of unregistration in usb_del_gadget() is
likewise reversed.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1977]


 drivers/usb/gadget/udc/core.c |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1308,10 +1308,6 @@ int usb_add_gadget(struct usb_gadget *ga
 	if (ret)
 		goto err_put_udc;
 
-	ret = device_add(&gadget->dev);
-	if (ret)
-		goto err_put_udc;
-
 	udc->gadget = gadget;
 	gadget->udc = udc;
 
@@ -1327,15 +1323,22 @@ int usb_add_gadget(struct usb_gadget *ga
 	usb_gadget_set_state(gadget, USB_STATE_NOTATTACHED);
 	udc->vbus = true;
 
+	ret = device_add(&gadget->dev);
+	if (ret)
+		goto err_del_udc;
+
 	/* pick up one of pending gadget drivers */
 	ret = check_pending_gadget_drivers(udc);
 	if (ret)
-		goto err_del_udc;
+		goto err_del_gadget;
 
 	mutex_unlock(&udc_lock);
 
 	return 0;
 
+ err_del_gadget:
+	device_del(&gadget->dev);
+
  err_del_udc:
 	flush_work(&gadget->work);
 	device_del(&udc->dev);
@@ -1344,8 +1347,6 @@ int usb_add_gadget(struct usb_gadget *ga
 	list_del(&udc->list);
 	mutex_unlock(&udc_lock);
 
-	device_del(&gadget->dev);
-
  err_put_udc:
 	put_device(&udc->dev);
 
@@ -1469,8 +1470,8 @@ void usb_del_gadget(struct usb_gadget *g
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
 	flush_work(&gadget->work);
-	device_unregister(&udc->dev);
 	device_del(&gadget->dev);
+	device_unregister(&udc->dev);
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget);
 

