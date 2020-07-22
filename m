Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2080229554
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 11:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731875AbgGVJqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 05:46:34 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:59691 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731833AbgGVJqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 05:46:31 -0400
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EAAA1200008;
        Wed, 22 Jul 2020 09:46:28 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 1/2] USB: Fix device driver race
Date:   Wed, 22 Jul 2020 11:46:27 +0200
Message-Id: <20200722094628.4236-1-hadess@hadess.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/driver.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f81606c6a35b..a6187dd2186c 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -905,6 +905,30 @@ static int usb_uevent(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
+{
+	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
+	struct usb_device *udev = to_usb_device(dev);
+
+	if (udriver == &usb_generic_driver &&
+	    !udev->use_generic_driver)
+		return device_reprobe(dev);
+
+	return 0;
+}
+
+static int __usb_device_driver_added(struct device_driver *drv, void *data)
+{
+	struct usb_device_driver *udrv = to_usb_device_driver(drv);
+
+	if (udrv->match) {
+		bus_for_each_dev(&usb_bus_type, NULL, udrv,
+				 __usb_bus_reprobe_drivers);
+	}
+
+	return 0;
+}
+
 /**
  * usb_register_device_driver - register a USB device (not interface) driver
  * @new_udriver: USB operations for the device driver
@@ -934,13 +958,16 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
 
 	retval = driver_register(&new_udriver->drvwrap.driver);
 
-	if (!retval)
+	if (!retval) {
+		bus_for_each_drv(&usb_bus_type, NULL, NULL,
+				 __usb_device_driver_added);
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
-- 
2.26.2

