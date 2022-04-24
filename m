Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4E150CE2A
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 02:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbiDXApE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Apr 2022 20:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234617AbiDXApD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Apr 2022 20:45:03 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E58393586B
        for <linux-usb@vger.kernel.org>; Sat, 23 Apr 2022 17:42:04 -0700 (PDT)
Received: (qmail 754853 invoked by uid 1000); 23 Apr 2022 20:42:03 -0400
Date:   Sat, 23 Apr 2022 20:42:03 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 1/4] USB: gadget: Rename usb_gadget_probe_driver()
Message-ID: <YmSc29YZvxgT5fEJ@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YmKt3kH+85kjzdbL@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmKt3kH+85kjzdbL@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for adding a "gadget" bus, this patch renames
usb_gadget_probe_driver() to usb_gadget_register_driver().  The new
name will be more accurate, since gadget drivers will be registered on
the gadget bus and the probing will be done by the driver core, not
the UDC core.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1976]


 drivers/usb/gadget/composite.c         |    2 +-
 drivers/usb/gadget/configfs.c          |    2 +-
 drivers/usb/gadget/legacy/dbgp.c       |    2 +-
 drivers/usb/gadget/legacy/inode.c      |    2 +-
 drivers/usb/gadget/legacy/raw_gadget.c |    4 ++--
 drivers/usb/gadget/udc/core.c          |    4 ++--
 include/linux/usb/gadget.h             |    4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

Index: usb-devel/drivers/usb/gadget/composite.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/composite.c
+++ usb-devel/drivers/usb/gadget/composite.c
@@ -2505,7 +2505,7 @@ int usb_composite_probe(struct usb_compo
 	gadget_driver->driver.name = driver->name;
 	gadget_driver->max_speed = driver->max_speed;
 
-	return usb_gadget_probe_driver(gadget_driver);
+	return usb_gadget_register_driver(gadget_driver);
 }
 EXPORT_SYMBOL_GPL(usb_composite_probe);
 
Index: usb-devel/drivers/usb/gadget/legacy/dbgp.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/dbgp.c
+++ usb-devel/drivers/usb/gadget/legacy/dbgp.c
@@ -422,7 +422,7 @@ static struct usb_gadget_driver dbgp_dri
 
 static int __init dbgp_init(void)
 {
-	return usb_gadget_probe_driver(&dbgp_driver);
+	return usb_gadget_register_driver(&dbgp_driver);
 }
 
 static void __exit dbgp_exit(void)
Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -1873,7 +1873,7 @@ dev_config (struct file *fd, const char
 	else
 		gadgetfs_driver.max_speed = USB_SPEED_FULL;
 
-	value = usb_gadget_probe_driver(&gadgetfs_driver);
+	value = usb_gadget_register_driver(&gadgetfs_driver);
 	if (value != 0) {
 		spin_lock_irq(&dev->lock);
 		goto fail;
Index: usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/raw_gadget.c
+++ usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
@@ -510,12 +510,12 @@ static int raw_ioctl_run(struct raw_dev
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	ret = usb_gadget_probe_driver(&dev->driver);
+	ret = usb_gadget_register_driver(&dev->driver);
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (ret) {
 		dev_err(dev->dev,
-			"fail, usb_gadget_probe_driver returned %d\n", ret);
+			"fail, usb_gadget_register_driver returned %d\n", ret);
 		dev->state = STATE_DEV_FAILED;
 		goto out_unlock;
 	}
Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1523,7 +1523,7 @@ err1:
 	return ret;
 }
 
-int usb_gadget_probe_driver(struct usb_gadget_driver *driver)
+int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 {
 	struct usb_udc		*udc = NULL, *iter;
 	int			ret = -ENODEV;
@@ -1572,7 +1572,7 @@ found:
 	mutex_unlock(&udc_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(usb_gadget_probe_driver);
+EXPORT_SYMBOL_GPL(usb_gadget_register_driver);
 
 int usb_gadget_unregister_driver(struct usb_gadget_driver *driver)
 {
Index: usb-devel/include/linux/usb/gadget.h
===================================================================
--- usb-devel.orig/include/linux/usb/gadget.h
+++ usb-devel/include/linux/usb/gadget.h
@@ -745,7 +745,7 @@ struct usb_gadget_driver {
  */
 
 /**
- * usb_gadget_probe_driver - probe a gadget driver
+ * usb_gadget_register_driver - register a gadget driver
  * @driver: the driver being registered
  * Context: can sleep
  *
@@ -755,7 +755,7 @@ struct usb_gadget_driver {
  * registration call returns.  It's expected that the @bind() function will
  * be in init sections.
  */
-int usb_gadget_probe_driver(struct usb_gadget_driver *driver);
+int usb_gadget_register_driver(struct usb_gadget_driver *driver);
 
 /**
  * usb_gadget_unregister_driver - unregister a gadget driver
Index: usb-devel/drivers/usb/gadget/configfs.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/configfs.c
+++ usb-devel/drivers/usb/gadget/configfs.c
@@ -284,7 +284,7 @@ static ssize_t gadget_dev_desc_UDC_store
 			goto err;
 		}
 		gi->composite.gadget_driver.udc_name = name;
-		ret = usb_gadget_probe_driver(&gi->composite.gadget_driver);
+		ret = usb_gadget_register_driver(&gi->composite.gadget_driver);
 		if (ret) {
 			gi->composite.gadget_driver.udc_name = NULL;
 			goto err;
