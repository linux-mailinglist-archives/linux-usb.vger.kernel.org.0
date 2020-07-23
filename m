Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CCE22B8B4
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 23:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgGWVam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 17:30:42 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:37855 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgGWVam (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 17:30:42 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 27F1DC0008;
        Thu, 23 Jul 2020 21:30:39 +0000 (UTC)
Message-ID: <a3cd9c51f215be37ac9bb44083ab8b3280f9359f.camel@hadess.net>
Subject: [PATCH v3] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Thu, 23 Jul 2020 23:30:39 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a new device with a specialised device driver is plugged in, the
new driver will be modprobe()'d but the driver core will attach the
"generic" driver to the device.

After that, nothing will trigger a reprobe when the modprobe()'d device
driver has finished initialising, as the device has the "generic"
driver attached to it.

Trigger a reprobe ourselves when new specialised drivers get registered.

Fixes: 88b7381a939d
Signed-off-by: Bastien Nocera <hadess@hadess.net>
---

Changes since v2:
- Fix formatting

Changes since v1:
- Simplified after Alan Stern's comments and some clarifications from
Benjamin Tissoires.

 drivers/usb/core/driver.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f81606c6a35b..44531910637c 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -905,6 +905,25 @@ static int usb_uevent(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
+{
+	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
+	struct usb_device *udev = to_usb_device(dev);
+
+	if (dev->driver) {
+		struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
+
+		if (udriver == NULL || udriver == &usb_generic_driver) {
+			udev->use_generic_driver = false;
+			device_reprobe(dev);
+		}
+	} else {
+		device_reprobe(dev);
+	}
+
+	return 0;
+}
+
 /**
  * usb_register_device_driver - register a USB device (not interface) driver
  * @new_udriver: USB operations for the device driver
@@ -934,13 +953,19 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
 
 	retval = driver_register(&new_udriver->drvwrap.driver);
 
-	if (!retval)
+	if (!retval) {
+		/* Check whether any device could be better served with
+		 * this new driver
+		 */
+		bus_for_each_dev(&usb_bus_type, NULL, NULL,
+				 __usb_bus_reprobe_drivers);
 		pr_info("%s: registered new device driver %s\n",
 			usbcore_name, new_udriver->name);
-	else
+	} else {
 		printk(KERN_ERR "%s: error %d registering device "
 			"	driver %s\n",
 			usbcore_name, retval, new_udriver->name);
+	}
 
 	return retval;
 }

