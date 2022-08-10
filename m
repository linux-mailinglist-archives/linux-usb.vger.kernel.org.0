Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C0458F337
	for <lists+linux-usb@lfdr.de>; Wed, 10 Aug 2022 21:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbiHJTdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Aug 2022 15:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbiHJTdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Aug 2022 15:33:03 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E75627539A
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 12:33:01 -0700 (PDT)
Received: (qmail 849138 invoked by uid 1000); 10 Aug 2022 15:33:00 -0400
Date:   Wed, 10 Aug 2022 15:33:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
 <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
 <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
 <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
> On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
> > Hi Alan,
> 
> Hi.
> 
> > This patch landed recently in linux-next as commit 2191c00855b0 ("USB: 
> > gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it 
> > fixes the issue by introducing another one. It doesn't look very 
> > probable, but it would be nice to fix it to make the lock dependency 
> > checker happy.
> 
> Indeed.

> I suspect the problem is that udc_lock is held for too long.  Probably it 
> should be released during the calls to udc->driver->bind and 
> udc->driver->unbind.
> 
> Getting this right will require some careful study.  Marek, if I send you 
> a patch later, will you be able to test it?

Here's a patch for you to try, when you have the chance.  It reduces the 
scope of udc_lock to cover only the fields it's supposed to protect and 
changes the locking in a few other places.

There's still the possibility of a locking cycle, because udc_lock is 
held in the ->disconnect pathway.  It's very hard to know whether that 
might cause any trouble; it depends on how the function drivers handle 
disconnections.

Alan Stern



Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -736,7 +736,10 @@ int usb_gadget_disconnect(struct usb_gad
 	ret = gadget->ops->pullup(gadget, 0);
 	if (!ret) {
 		gadget->connected = 0;
-		gadget->udc->driver->disconnect(gadget);
+		mutex_lock(&udc_lock);
+		if (gadget->udc->driver)
+			gadget->udc->driver->disconnect(gadget);
+		mutex_unlock(&udc_lock);
 	}
 
 out:
@@ -1489,7 +1492,6 @@ static int gadget_bind_driver(struct dev
 
 	usb_gadget_udc_set_speed(udc, driver->max_speed);
 
-	mutex_lock(&udc_lock);
 	ret = driver->bind(udc->gadget, driver);
 	if (ret)
 		goto err_bind;
@@ -1499,7 +1501,6 @@ static int gadget_bind_driver(struct dev
 		goto err_start;
 	usb_gadget_enable_async_callbacks(udc);
 	usb_udc_connect_control(udc);
-	mutex_unlock(&udc_lock);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 	return 0;
@@ -1512,6 +1513,7 @@ static int gadget_bind_driver(struct dev
 		dev_err(&udc->dev, "failed to start %s: %d\n",
 			driver->function, ret);
 
+	mutex_lock(&udc_lock);
 	udc->driver = NULL;
 	driver->is_bound = false;
 	mutex_unlock(&udc_lock);
@@ -1529,7 +1531,6 @@ static void gadget_unbind_driver(struct
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 
-	mutex_lock(&udc_lock);
 	usb_gadget_disconnect(gadget);
 	usb_gadget_disable_async_callbacks(udc);
 	if (gadget->irq)
@@ -1537,6 +1538,7 @@ static void gadget_unbind_driver(struct
 	udc->driver->unbind(gadget);
 	usb_gadget_udc_stop(udc);
 
+	mutex_lock(&udc_lock);
 	driver->is_bound = false;
 	udc->driver = NULL;
 	mutex_unlock(&udc_lock);
@@ -1612,7 +1614,7 @@ static ssize_t soft_connect_store(struct
 	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
 	ssize_t			ret;
 
-	mutex_lock(&udc_lock);
+	device_lock(&udc->gadget->dev);
 	if (!udc->driver) {
 		dev_err(dev, "soft-connect without a gadget driver\n");
 		ret = -EOPNOTSUPP;
@@ -1633,7 +1635,7 @@ static ssize_t soft_connect_store(struct
 
 	ret = n;
 out:
-	mutex_unlock(&udc_lock);
+	device_unlock(&udc->gadget->dev);
 	return ret;
 }
 static DEVICE_ATTR_WO(soft_connect);
@@ -1652,11 +1654,15 @@ static ssize_t function_show(struct devi
 			     char *buf)
 {
 	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
-	struct usb_gadget_driver *drv = udc->driver;
+	struct usb_gadget_driver *drv;
+	int			rc = 0;
 
-	if (!drv || !drv->function)
-		return 0;
-	return scnprintf(buf, PAGE_SIZE, "%s\n", drv->function);
+	mutex_lock(&udc_lock);
+	drv = udc->driver;
+	if (drv && drv->function)
+		rc = scnprintf(buf, PAGE_SIZE, "%s\n", drv->function);
+	mutex_unlock(&udc_lock);
+	return rc;
 }
 static DEVICE_ATTR_RO(function);
 
