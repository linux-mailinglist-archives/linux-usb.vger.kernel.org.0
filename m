Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96E87708B4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 21:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjHDTM0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 15:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjHDTMY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 15:12:24 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 82F2ECC
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 12:12:22 -0700 (PDT)
Received: (qmail 43354 invoked by uid 1000); 4 Aug 2023 15:12:21 -0400
Date:   Fri, 4 Aug 2023 15:12:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 2/3] USB: core: Change usb_get_device_descriptor() API
Message-ID: <d0111bb6-56c1-4f90-adf2-6cfe152f6561@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <495cb5d4-f956-4f4a-a875-1e67e9489510@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The usb_get_device_descriptor() routine reads the device descriptor
from the udev device and stores it directly in udev->descriptor.  This
interface is error prone, because the USB subsystem expects in-memory
copies of a device's descriptors to be immutable once the device has
been initialized.

The interface is changed so that the device descriptor is left in a
kmalloc-ed buffer, not copied into the usb_device structure.  A
pointer to the buffer is returned to the caller, who is then
responsible for kfree-ing it.  The corresponding changes needed in the
various callers are fairly small.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/core/hcd.c     |   10 +++++++---
 drivers/usb/core/hub.c     |   44 +++++++++++++++++++++++---------------------
 drivers/usb/core/message.c |   29 ++++++++++++-----------------
 drivers/usb/core/usb.h     |    4 ++--
 4 files changed, 44 insertions(+), 43 deletions(-)

Index: usb-devel/drivers/usb/core/hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hcd.c
+++ usb-devel/drivers/usb/core/hcd.c
@@ -983,6 +983,7 @@ static int register_root_hub(struct usb_
 {
 	struct device *parent_dev = hcd->self.controller;
 	struct usb_device *usb_dev = hcd->self.root_hub;
+	struct usb_device_descriptor *descr;
 	const int devnum = 1;
 	int retval;
 
@@ -994,13 +995,16 @@ static int register_root_hub(struct usb_
 	mutex_lock(&usb_bus_idr_lock);
 
 	usb_dev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
-	retval = usb_get_device_descriptor(usb_dev, USB_DT_DEVICE_SIZE);
-	if (retval != sizeof usb_dev->descriptor) {
+	descr = usb_get_device_descriptor(usb_dev);
+	if (IS_ERR(descr)) {
+		retval = PTR_ERR(descr);
 		mutex_unlock(&usb_bus_idr_lock);
 		dev_dbg (parent_dev, "can't read %s device descriptor %d\n",
 				dev_name(&usb_dev->dev), retval);
-		return (retval < 0) ? retval : -EMSGSIZE;
+		return retval;
 	}
+	usb_dev->descriptor = *descr;
+	kfree(descr);
 
 	if (le16_to_cpu(usb_dev->descriptor.bcdUSB) >= 0x0201) {
 		retval = usb_get_bos_descriptor(usb_dev);
Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2671,12 +2671,17 @@ int usb_authorize_device(struct usb_devi
 	}
 
 	if (usb_dev->wusb) {
-		result = usb_get_device_descriptor(usb_dev, sizeof(usb_dev->descriptor));
-		if (result < 0) {
+		struct usb_device_descriptor *descr;
+
+		descr = usb_get_device_descriptor(usb_dev);
+		if (IS_ERR(descr)) {
+			result = PTR_ERR(descr);
 			dev_err(&usb_dev->dev, "can't re-read device descriptor for "
 				"authorization: %d\n", result);
 			goto error_device_descriptor;
 		}
+		usb_dev->descriptor = *descr;
+		kfree(descr);
 	}
 
 	usb_dev->authorized = 1;
@@ -4804,7 +4809,7 @@ hub_port_init(struct usb_hub *hub, struc
 	const char		*driver_name;
 	bool			do_new_scheme;
 	int			maxp0;
-	struct usb_device_descriptor	*buf;
+	struct usb_device_descriptor	*buf, *descr;
 
 	buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
 	if (!buf)
@@ -5046,15 +5051,16 @@ hub_port_init(struct usb_hub *hub, struc
 		usb_ep0_reinit(udev);
 	}
 
-	retval = usb_get_device_descriptor(udev, USB_DT_DEVICE_SIZE);
-	if (retval < (signed)sizeof(udev->descriptor)) {
+	descr = usb_get_device_descriptor(udev);
+	if (IS_ERR(descr)) {
+		retval = PTR_ERR(descr);
 		if (retval != -ENODEV)
 			dev_err(&udev->dev, "device descriptor read/all, error %d\n",
 					retval);
-		if (retval >= 0)
-			retval = -ENOMSG;
 		goto fail;
 	}
+	udev->descriptor = *descr;
+	kfree(descr);
 
 	/*
 	 * Some superspeed devices have finished the link training process
@@ -5173,7 +5179,7 @@ hub_power_remaining(struct usb_hub *hub)
 
 
 static int descriptors_changed(struct usb_device *udev,
-		struct usb_device_descriptor *old_device_descriptor,
+		struct usb_device_descriptor *new_device_descriptor,
 		struct usb_host_bos *old_bos)
 {
 	int		changed = 0;
@@ -5184,8 +5190,8 @@ static int descriptors_changed(struct us
 	int		length;
 	char		*buf;
 
-	if (memcmp(&udev->descriptor, old_device_descriptor,
-			sizeof(*old_device_descriptor)) != 0)
+	if (memcmp(&udev->descriptor, new_device_descriptor,
+			sizeof(*new_device_descriptor)) != 0)
 		return 1;
 
 	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
@@ -5510,9 +5516,8 @@ static void hub_port_connect_change(stru
 {
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_device *udev = port_dev->child;
-	struct usb_device_descriptor descriptor;
+	struct usb_device_descriptor *descr;
 	int status = -ENODEV;
-	int retval;
 
 	dev_dbg(&port_dev->dev, "status %04x, change %04x, %s\n", portstatus,
 			portchange, portspeed(hub, portstatus));
@@ -5539,23 +5544,20 @@ static void hub_port_connect_change(stru
 			 * changed device descriptors before resuscitating the
 			 * device.
 			 */
-			descriptor = udev->descriptor;
-			retval = usb_get_device_descriptor(udev,
-					sizeof(udev->descriptor));
-			if (retval < 0) {
+			descr = usb_get_device_descriptor(udev);
+			if (IS_ERR(descr)) {
 				dev_dbg(&udev->dev,
-						"can't read device descriptor %d\n",
-						retval);
+						"can't read device descriptor %ld\n",
+						PTR_ERR(descr));
 			} else {
-				if (descriptors_changed(udev, &descriptor,
+				if (descriptors_changed(udev, descr,
 						udev->bos)) {
 					dev_dbg(&udev->dev,
 							"device descriptor has changed\n");
-					/* for disconnect() calls */
-					udev->descriptor = descriptor;
 				} else {
 					status = 0; /* Nothing to do */
 				}
+				kfree(descr);
 			}
 #ifdef CONFIG_PM
 		} else if (udev->state == USB_STATE_SUSPENDED &&
Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -1040,40 +1040,35 @@ char *usb_cache_string(struct usb_device
 EXPORT_SYMBOL_GPL(usb_cache_string);
 
 /*
- * usb_get_device_descriptor - (re)reads the device descriptor (usbcore)
- * @dev: the device whose device descriptor is being updated
- * @size: how much of the descriptor to read
+ * usb_get_device_descriptor - read the device descriptor
+ * @udev: the device whose device descriptor should be read
  *
  * Context: task context, might sleep.
  *
- * Updates the copy of the device descriptor stored in the device structure,
- * which dedicates space for this purpose.
- *
  * Not exported, only for use by the core.  If drivers really want to read
  * the device descriptor directly, they can call usb_get_descriptor() with
  * type = USB_DT_DEVICE and index = 0.
  *
- * This call is synchronous, and may not be used in an interrupt context.
- *
- * Return: The number of bytes received on success, or else the status code
- * returned by the underlying usb_control_msg() call.
+ * Returns: a pointer to a dynamically allocated usb_device_descriptor
+ * structure (which the caller must deallocate), or an ERR_PTR value.
  */
-int usb_get_device_descriptor(struct usb_device *dev, unsigned int size)
+struct usb_device_descriptor *usb_get_device_descriptor(struct usb_device *udev)
 {
 	struct usb_device_descriptor *desc;
 	int ret;
 
-	if (size > sizeof(*desc))
-		return -EINVAL;
 	desc = kmalloc(sizeof(*desc), GFP_NOIO);
 	if (!desc)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
+	ret = usb_get_descriptor(udev, USB_DT_DEVICE, 0, desc, sizeof(*desc));
+	if (ret == sizeof(*desc))
+		return desc;
 
-	ret = usb_get_descriptor(dev, USB_DT_DEVICE, 0, desc, size);
 	if (ret >= 0)
-		memcpy(&dev->descriptor, desc, size);
+		ret = -EMSGSIZE;
 	kfree(desc);
-	return ret;
+	return ERR_PTR(ret);
 }
 
 /*
Index: usb-devel/drivers/usb/core/usb.h
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.h
+++ usb-devel/drivers/usb/core/usb.h
@@ -43,8 +43,8 @@ extern bool usb_endpoint_is_ignored(stru
 		struct usb_endpoint_descriptor *epd);
 extern int usb_remove_device(struct usb_device *udev);
 
-extern int usb_get_device_descriptor(struct usb_device *dev,
-		unsigned int size);
+extern struct usb_device_descriptor *usb_get_device_descriptor(
+		struct usb_device *udev);
 extern int usb_set_isoch_delay(struct usb_device *dev);
 extern int usb_get_bos_descriptor(struct usb_device *dev);
 extern void usb_release_bos_descriptor(struct usb_device *dev);
