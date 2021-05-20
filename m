Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B5F38B84A
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 22:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236045AbhETUXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 16:23:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55363 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236062AbhETUXG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 16:23:06 -0400
Received: (qmail 1217337 invoked by uid 1000); 20 May 2021 16:21:44 -0400
Date:   Thu, 20 May 2021 16:21:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 1/4] USB: UDC core: Add udc_async_callbacks gadget op
Message-ID: <20210520202144.GC1216852@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Gadget API has a theoretical race when a gadget driver is unbound.
Although the pull-up is turned off before the driver's ->unbind
callback runs, if the USB cable were to be unplugged at just the wrong
moment there would be nothing to prevent the UDC driver from invoking
the ->disconnect callback after the unbind has finished.  In theory,
other asynchronous callbacks could also happen during the time before
the UDC driver's udc_stop routine is called, and the gadget driver
would not be prepared to handle any of them.

We need a way to tell UDC drivers to stop issuing asynchronous (that is,
->suspend, ->resume, ->disconnect, ->reset, or ->setup) callbacks at
some point after the pull-up has been turned off and before the
->unbind callback runs.  This patch adds a new ->udc_async_callbacks
callback to the usb_gadget_ops structure for precisely this purpose,
and it adds the corresponding support to the UDC core.

Later patches in this series add support for udc_async_callbacks to
several UDC drivers.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1956]


 drivers/usb/gadget/udc/core.c |   49 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/gadget.h    |    1 
 2 files changed, 50 insertions(+)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1148,6 +1148,53 @@ static inline void usb_gadget_udc_set_sp
 }
 
 /**
+ * usb_gadget_enable_async_callbacks - tell usb device controller to enable asynchronous callbacks
+ * @udc: The UDC which should enable async callbacks
+ *
+ * This routine is used when binding gadget drivers.  It undoes the effect
+ * of usb_gadget_disable_async_callbacks(); the UDC driver should enable IRQs
+ * (if necessary) and resume issuing callbacks.
+ *
+ * This routine will always be called in process context.
+ */
+static inline void usb_gadget_enable_async_callbacks(struct usb_udc *udc)
+{
+	struct usb_gadget *gadget = udc->gadget;
+
+	if (gadget->ops->udc_async_callbacks)
+		gadget->ops->udc_async_callbacks(gadget, true);
+}
+
+/**
+ * usb_gadget_disable_async_callbacks - tell usb device controller to disable asynchronous callbacks
+ * @udc: The UDC which should disable async callbacks
+ *
+ * This routine is used when unbinding gadget drivers.  It prevents a race:
+ * The UDC driver doesn't know when the gadget driver's ->unbind callback
+ * runs, so unless it is told to disable asynchronous callbacks, it might
+ * issue a callback (such as ->disconnect) after the unbind has completed.
+ *
+ * After this function runs, the UDC driver must suppress all ->suspend,
+ * ->resume, ->disconnect, ->reset, and ->setup callbacks to the gadget driver
+ * until async callbacks are again enabled.  A simple-minded but effective
+ * way to accomplish this is to tell the UDC hardware not to generate any
+ * more IRQs.
+ *
+ * Request completion callbacks must still be issued.  However, it's okay
+ * to defer them until the request is cancelled, since the pull-up will be
+ * turned off during the time period when async callbacks are disabled.
+ *
+ * This routine will always be called in process context.
+ */
+static inline void usb_gadget_disable_async_callbacks(struct usb_udc *udc)
+{
+	struct usb_gadget *gadget = udc->gadget;
+
+	if (gadget->ops->udc_async_callbacks)
+		gadget->ops->udc_async_callbacks(gadget, false);
+}
+
+/**
  * usb_udc_release - release the usb_udc struct
  * @dev: the dev member within usb_udc
  *
@@ -1361,6 +1408,7 @@ static void usb_gadget_remove_driver(str
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 
 	usb_gadget_disconnect(udc->gadget);
+	usb_gadget_disable_async_callbacks(udc);
 	if (udc->gadget->irq)
 		synchronize_irq(udc->gadget->irq);
 	udc->driver->unbind(udc->gadget);
@@ -1442,6 +1490,7 @@ static int udc_bind_to_driver(struct usb
 		driver->unbind(udc->gadget);
 		goto err1;
 	}
+	usb_gadget_enable_async_callbacks(udc);
 	usb_udc_connect_control(udc);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
Index: usb-devel/include/linux/usb/gadget.h
===================================================================
--- usb-devel.orig/include/linux/usb/gadget.h
+++ usb-devel/include/linux/usb/gadget.h
@@ -325,6 +325,7 @@ struct usb_gadget_ops {
 	void	(*udc_set_speed)(struct usb_gadget *, enum usb_device_speed);
 	void	(*udc_set_ssp_rate)(struct usb_gadget *gadget,
 			enum usb_ssp_rate rate);
+	void	(*udc_async_callbacks)(struct usb_gadget *gadget, bool enable);
 	struct usb_ep *(*match_ep)(struct usb_gadget *,
 			struct usb_endpoint_descriptor *,
 			struct usb_ss_ep_comp_descriptor *);
