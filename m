Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9894050CE41
	for <lists+linux-usb@lfdr.de>; Sun, 24 Apr 2022 03:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236917AbiDXBiw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Apr 2022 21:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiDXBiv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Apr 2022 21:38:51 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A2E6034B83
        for <linux-usb@vger.kernel.org>; Sat, 23 Apr 2022 18:35:52 -0700 (PDT)
Received: (qmail 755784 invoked by uid 1000); 23 Apr 2022 21:35:51 -0400
Date:   Sat, 23 Apr 2022 21:35:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 4/4] USB: gadget: Add a new bus for gadgets
Message-ID: <YmSpdxaDNeC2BBOf@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YmKt3kH+85kjzdbL@kroah.com>
 <YmSc29YZvxgT5fEJ@rowland.harvard.edu>
 <YmSo6fU1FlNq8cOZ@rowland.harvard.edu>
 <YmSpKpnWR8WWEk/p@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmSpKpnWR8WWEk/p@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a "gadget" bus and uses it for registering gadgets and
their drivers.  From now on, bindings will be managed by the driver
core rather than through ad-hoc manipulations in the UDC core.

As part of this change, the driver_pending_list is removed.  The UDC
core won't need to keep track of unbound drivers for later binding,
because the driver core handles all of that for us.

However, we do need one new feature: a way to prevent gadget drivers
from being bound to more than one gadget at a time.  The existing code
does this automatically, but the driver core doesn't -- it's perfectly
happy to bind a single driver to all the matching devices on the bus.
The patch adds a new bitflag to the usb_gadget_driver structure for
this purpose.

A nice side effect of this change is a reduction in the total lines of
code, since now the driver core will do part of the work that the UDC
used to do.

A possible future patch could add udc devices to the gadget bus, say
as a separate device type.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1979]


 drivers/usb/gadget/udc/core.c |  256 ++++++++++++++++++++----------------------
 include/linux/usb/gadget.h    |   26 ++--
 2 files changed, 139 insertions(+), 143 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -23,6 +23,8 @@
 
 #include "trace.h"
 
+static struct bus_type gadget_bus_type;
+
 /**
  * struct usb_udc - describes one usb device controller
  * @driver: the gadget driver pointer. For use by the class code
@@ -47,11 +49,9 @@ struct usb_udc {
 
 static struct class *udc_class;
 static LIST_HEAD(udc_list);
-static LIST_HEAD(gadget_driver_pending_list);
-static DEFINE_MUTEX(udc_lock);
 
-static int udc_bind_to_driver(struct usb_udc *udc,
-		struct usb_gadget_driver *driver);
+/* Protects udc_list, udc->driver, driver->is_bound, and related calls */
+static DEFINE_MUTEX(udc_lock);
 
 /* ------------------------------------------------------------------------- */
 
@@ -1238,24 +1238,6 @@ static void usb_udc_nop_release(struct d
 	dev_vdbg(dev, "%s\n", __func__);
 }
 
-/* should be called with udc_lock held */
-static int check_pending_gadget_drivers(struct usb_udc *udc)
-{
-	struct usb_gadget_driver *driver;
-	int ret = 0;
-
-	list_for_each_entry(driver, &gadget_driver_pending_list, pending)
-		if (!driver->udc_name || strcmp(driver->udc_name,
-						dev_name(&udc->dev)) == 0) {
-			ret = udc_bind_to_driver(udc, driver);
-			if (ret != -EPROBE_DEFER)
-				list_del_init(&driver->pending);
-			break;
-		}
-
-	return ret;
-}
-
 /**
  * usb_initialize_gadget - initialize a gadget and its embedded struct device
  * @parent: the parent device to this udc. Usually the controller driver's
@@ -1276,6 +1258,7 @@ void usb_initialize_gadget(struct device
 		gadget->dev.release = usb_udc_nop_release;
 
 	device_initialize(&gadget->dev);
+	gadget->dev.bus = &gadget_bus_type;
 }
 EXPORT_SYMBOL_GPL(usb_initialize_gadget);
 
@@ -1312,6 +1295,7 @@ int usb_add_gadget(struct usb_gadget *ga
 
 	mutex_lock(&udc_lock);
 	list_add_tail(&udc->list, &udc_list);
+	mutex_unlock(&udc_lock);
 
 	ret = device_add(&udc->dev);
 	if (ret)
@@ -1324,23 +1308,14 @@ int usb_add_gadget(struct usb_gadget *ga
 	if (ret)
 		goto err_del_udc;
 
-	/* pick up one of pending gadget drivers */
-	ret = check_pending_gadget_drivers(udc);
-	if (ret)
-		goto err_del_gadget;
-
-	mutex_unlock(&udc_lock);
-
 	return 0;
 
- err_del_gadget:
-	device_del(&gadget->dev);
-
  err_del_udc:
 	flush_work(&gadget->work);
 	device_del(&udc->dev);
 
  err_unlist_udc:
+	mutex_lock(&udc_lock);
 	list_del(&udc->list);
 	mutex_unlock(&udc_lock);
 
@@ -1419,24 +1394,6 @@ int usb_add_gadget_udc(struct device *pa
 }
 EXPORT_SYMBOL_GPL(usb_add_gadget_udc);
 
-static void usb_gadget_remove_driver(struct usb_udc *udc)
-{
-	dev_dbg(&udc->dev, "unregistering UDC driver [%s]\n",
-			udc->driver->function);
-
-	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
-
-	usb_gadget_disconnect(udc->gadget);
-	usb_gadget_disable_async_callbacks(udc);
-	if (udc->gadget->irq)
-		synchronize_irq(udc->gadget->irq);
-	udc->driver->unbind(udc->gadget);
-	usb_gadget_udc_stop(udc);
-
-	udc->driver = NULL;
-	udc->gadget->dev.driver = NULL;
-}
-
 /**
  * usb_del_gadget - deletes a gadget and unregisters its udc
  * @gadget: the gadget to be deleted.
@@ -1455,13 +1412,6 @@ void usb_del_gadget(struct usb_gadget *g
 
 	mutex_lock(&udc_lock);
 	list_del(&udc->list);
-
-	if (udc->driver) {
-		struct usb_gadget_driver *driver = udc->driver;
-
-		usb_gadget_remove_driver(udc);
-		list_add(&driver->pending, &gadget_driver_pending_list);
-	}
 	mutex_unlock(&udc_lock);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
@@ -1486,123 +1436,147 @@ EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
 /* ------------------------------------------------------------------------- */
 
-static int udc_bind_to_driver(struct usb_udc *udc, struct usb_gadget_driver *driver)
+static int gadget_match_driver(struct device *dev, struct device_driver *drv)
 {
-	int ret;
+	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
+	struct usb_udc *udc = gadget->udc;
+	struct usb_gadget_driver *driver = container_of(drv,
+			struct usb_gadget_driver, driver);
+
+	/* If the driver specifies a udc_name, it must match the UDC's name */
+	if (driver->udc_name &&
+			strcmp(driver->udc_name, dev_name(&udc->dev)) != 0)
+		return 0;
+
+	/* If the driver is already bound to a gadget, it doesn't match */
+	if (driver->is_bound)
+		return 0;
+
+	/* Otherwise any gadget driver matches any UDC */
+	return 1;
+}
 
-	dev_dbg(&udc->dev, "registering UDC driver [%s]\n",
-			driver->function);
+static int gadget_bind_driver(struct device *dev)
+{
+	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
+	struct usb_udc *udc = gadget->udc;
+	struct usb_gadget_driver *driver = container_of(dev->driver,
+			struct usb_gadget_driver, driver);
+	int ret = 0;
 
+	mutex_lock(&udc_lock);
+	if (driver->is_bound) {
+		mutex_unlock(&udc_lock);
+		return -ENXIO;		/* Driver binds to only one gadget */
+	}
+	driver->is_bound = true;
 	udc->driver = driver;
-	udc->gadget->dev.driver = &driver->driver;
+	mutex_unlock(&udc_lock);
+
+	dev_dbg(&udc->dev, "binding gadget driver [%s]\n", driver->function);
 
 	usb_gadget_udc_set_speed(udc, driver->max_speed);
 
+	mutex_lock(&udc_lock);
 	ret = driver->bind(udc->gadget, driver);
 	if (ret)
-		goto err1;
+		goto err_bind;
+
 	ret = usb_gadget_udc_start(udc);
-	if (ret) {
-		driver->unbind(udc->gadget);
-		goto err1;
-	}
+	if (ret)
+		goto err_start;
 	usb_gadget_enable_async_callbacks(udc);
 	usb_udc_connect_control(udc);
+	mutex_unlock(&udc_lock);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 	return 0;
-err1:
+
+ err_start:
+	driver->unbind(udc->gadget);
+
+ err_bind:
 	if (ret != -EISNAM)
 		dev_err(&udc->dev, "failed to start %s: %d\n",
-			udc->driver->function, ret);
+			driver->function, ret);
+
 	udc->driver = NULL;
-	udc->gadget->dev.driver = NULL;
+	driver->is_bound = false;
+	mutex_unlock(&udc_lock);
+
 	return ret;
 }
 
-int usb_gadget_register_driver(struct usb_gadget_driver *driver)
+static void gadget_unbind_driver(struct device *dev)
+{
+	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
+	struct usb_udc *udc = gadget->udc;
+	struct usb_gadget_driver *driver = udc->driver;
+
+	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
+
+	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
+
+	mutex_lock(&udc_lock);
+	usb_gadget_disconnect(gadget);
+	usb_gadget_disable_async_callbacks(udc);
+	if (gadget->irq)
+		synchronize_irq(gadget->irq);
+	udc->driver->unbind(gadget);
+	usb_gadget_udc_stop(udc);
+
+	driver->is_bound = false;
+	udc->driver = NULL;
+	mutex_unlock(&udc_lock);
+}
+
+/* ------------------------------------------------------------------------- */
+
+int usb_gadget_register_driver_owner(struct usb_gadget_driver *driver,
+		struct module *owner, const char *mod_name)
 {
-	struct usb_udc		*udc = NULL, *iter;
-	int			ret = -ENODEV;
+	int ret;
 
 	if (!driver || !driver->bind || !driver->setup)
 		return -EINVAL;
 
+	driver->driver.bus = &gadget_bus_type;
+	driver->driver.owner = owner;
+	driver->driver.mod_name = mod_name;
+	ret = driver_register(&driver->driver);
+	if (ret) {
+		pr_warn("%s: driver registration failed: %d\n",
+				driver->function, ret);
+		return ret;
+	}
+
 	mutex_lock(&udc_lock);
-	if (driver->udc_name) {
-		list_for_each_entry(iter, &udc_list, list) {
-			ret = strcmp(driver->udc_name, dev_name(&iter->dev));
-			if (ret)
-				continue;
-			udc = iter;
-			break;
-		}
-		if (ret)
-			ret = -ENODEV;
-		else if (udc->driver)
+	if (!driver->is_bound) {
+		if (driver->match_existing_only) {
+			pr_warn("%s: couldn't find an available UDC or it's busy\n",
+					driver->function);
 			ret = -EBUSY;
-		else
-			goto found;
-	} else {
-		list_for_each_entry(iter, &udc_list, list) {
-			/* For now we take the first one */
-			if (iter->driver)
-				continue;
-			udc = iter;
-			goto found;
+		} else {
+			pr_info("%s: couldn't find an available UDC\n",
+					driver->function);
 		}
-	}
-
-	if (!driver->match_existing_only) {
-		list_add_tail(&driver->pending, &gadget_driver_pending_list);
-		pr_info("couldn't find an available UDC - added [%s] to list of pending drivers\n",
-			driver->function);
 		ret = 0;
 	}
-
 	mutex_unlock(&udc_lock);
+
 	if (ret)
-		pr_warn("couldn't find an available UDC or it's busy: %d\n", ret);
-	return ret;
-found:
-	ret = udc_bind_to_driver(udc, driver);
-	mutex_unlock(&udc_lock);
+		driver_unregister(&driver->driver);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(usb_gadget_register_driver);
+EXPORT_SYMBOL_GPL(usb_gadget_register_driver_owner);
 
 int usb_gadget_unregister_driver(struct usb_gadget_driver *driver)
 {
-	struct usb_udc		*udc = NULL;
-	int			ret = -ENODEV;
-
 	if (!driver || !driver->unbind)
 		return -EINVAL;
 
-	mutex_lock(&udc_lock);
-	list_for_each_entry(udc, &udc_list, list) {
-		if (udc->driver == driver) {
-			usb_gadget_remove_driver(udc);
-			usb_gadget_set_state(udc->gadget,
-					     USB_STATE_NOTATTACHED);
-
-			/* Maybe there is someone waiting for this UDC? */
-			check_pending_gadget_drivers(udc);
-			/*
-			 * For now we ignore bind errors as probably it's
-			 * not a valid reason to fail other's gadget unbind
-			 */
-			ret = 0;
-			break;
-		}
-	}
-
-	if (ret) {
-		list_del(&driver->pending);
-		ret = 0;
-	}
-	mutex_unlock(&udc_lock);
-	return ret;
+	driver_unregister(&driver->driver);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(usb_gadget_unregister_driver);
 
@@ -1754,8 +1728,17 @@ static int usb_udc_uevent(struct device
 	return 0;
 }
 
+static struct bus_type gadget_bus_type = {
+	.name = "gadget",
+	.probe = gadget_bind_driver,
+	.remove = gadget_unbind_driver,
+	.match = gadget_match_driver,
+};
+
 static int __init usb_udc_init(void)
 {
+	int rc;
+
 	udc_class = class_create(THIS_MODULE, "udc");
 	if (IS_ERR(udc_class)) {
 		pr_err("failed to create udc class --> %ld\n",
@@ -1764,12 +1747,17 @@ static int __init usb_udc_init(void)
 	}
 
 	udc_class->dev_uevent = usb_udc_uevent;
-	return 0;
+
+	rc = bus_register(&gadget_bus_type);
+	if (rc)
+		class_destroy(udc_class);
+	return rc;
 }
 subsys_initcall(usb_udc_init);
 
 static void __exit usb_udc_exit(void)
 {
+	bus_unregister(&gadget_bus_type);
 	class_destroy(udc_class);
 }
 module_exit(usb_udc_exit);
Index: usb-devel/include/linux/usb/gadget.h
===================================================================
--- usb-devel.orig/include/linux/usb/gadget.h
+++ usb-devel/include/linux/usb/gadget.h
@@ -664,9 +664,9 @@ static inline int usb_gadget_check_confi
  * @driver: Driver model state for this driver.
  * @udc_name: A name of UDC this driver should be bound to. If udc_name is NULL,
  *	this driver will be bound to any available UDC.
- * @pending: UDC core private data used for deferred probe of this driver.
- * @match_existing_only: If udc is not found, return an error and don't add this
- *      gadget driver to list of pending driver
+ * @match_existing_only: If udc is not found, return an error and fail
+ *	the driver registration
+ * @is_bound: Allow a driver to be bound to only one gadget
  *
  * Devices are disabled till a gadget driver successfully bind()s, which
  * means the driver will handle setup() requests needed to enumerate (and
@@ -729,8 +729,8 @@ struct usb_gadget_driver {
 	struct device_driver	driver;
 
 	char			*udc_name;
-	struct list_head	pending;
 	unsigned                match_existing_only:1;
+	bool			is_bound:1;
 };
 
 
@@ -740,22 +740,30 @@ struct usb_gadget_driver {
 /* driver modules register and unregister, as usual.
  * these calls must be made in a context that can sleep.
  *
- * these will usually be implemented directly by the hardware-dependent
- * usb bus interface driver, which will only support a single driver.
+ * A gadget driver can be bound to only one gadget at a time.
  */
 
 /**
- * usb_gadget_register_driver - register a gadget driver
+ * usb_gadget_register_driver_owner - register a gadget driver
  * @driver: the driver being registered
+ * @owner: the driver module
+ * @mod_name: the driver module's build name
  * Context: can sleep
  *
  * Call this in your gadget driver's module initialization function,
- * to tell the underlying usb controller driver about your driver.
+ * to tell the underlying UDC controller driver about your driver.
  * The @bind() function will be called to bind it to a gadget before this
  * registration call returns.  It's expected that the @bind() function will
  * be in init sections.
+ *
+ * Use the macro defined below instead of calling this directly.
  */
-int usb_gadget_register_driver(struct usb_gadget_driver *driver);
+int usb_gadget_register_driver_owner(struct usb_gadget_driver *driver,
+		struct module *owner, const char *mod_name);
+
+/* use a define to avoid include chaining to get THIS_MODULE & friends */
+#define usb_gadget_register_driver(driver) \
+	usb_gadget_register_driver_owner(driver, THIS_MODULE, KBUILD_MODNAME)
 
 /**
  * usb_gadget_unregister_driver - unregister a gadget driver
