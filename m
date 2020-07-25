Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9378122D660
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 11:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgGYJQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 05:16:50 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41215 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGYJQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 05:16:50 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1698E240007;
        Sat, 25 Jul 2020 09:16:47 +0000 (UTC)
Message-ID: <ab1fcd9c7e8f4aecd1f709a74a763bcc239fe6c4.camel@hadess.net>
Subject: [PATCH 3/3 v5] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Sat, 25 Jul 2020 11:16:47 +0200
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

Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
Changes since v4:
- Add commit subject to "fixes" section
- Clarify conditional that checks for generic driver
- Remove check duplicated inside the loop

Changes since v3:
- Only reprobe devices that could use the new driver
- Many code fixes

Changes since v2:
- Fix formatting

Changes since v1:
- Simplified after Alan Stern's comments and some clarifications from
Benjamin Tissoires.


 drivers/usb/core/driver.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f81606c6a35b..7d3878aa8090 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -905,6 +905,32 @@ static int usb_uevent(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+static bool is_dev_usb_generic_driver(struct device *dev)
+{
+	struct usb_device_driver *udd = dev->driver ?
+		to_usb_device_driver(dev->driver) : NULL;
+
+	return udd == &usb_generic_driver;
+}
+
+static int __usb_bus_reprobe_drivers(struct device *dev, void *data)
+{
+	struct usb_device_driver *new_udriver = data;
+	struct usb_device *udev;
+
+	if (!is_dev_usb_generic_driver(dev))
+		return 0;
+
+	udev = to_usb_device(dev);
+	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
+	    (!new_udriver->match || new_udriver->match(udev) != 0))
+		return 0;
+
+	(void)!device_reprobe(dev);
+
+	return 0;
+}
+
 /**
  * usb_register_device_driver - register a USB device (not interface) driver
  * @new_udriver: USB operations for the device driver
@@ -934,13 +960,20 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
 
 	retval = driver_register(&new_udriver->drvwrap.driver);
 
-	if (!retval)
+	if (!retval) {
 		pr_info("%s: registered new device driver %s\n",
 			usbcore_name, new_udriver->name);
-	else
+		/*
+		 * Check whether any device could be better served with
+		 * this new driver
+		 */
+		bus_for_each_dev(&usb_bus_type, NULL, new_udriver,
+				 __usb_bus_reprobe_drivers);
+	} else {
 		printk(KERN_ERR "%s: error %d registering device "
 			"	driver %s\n",
 			usbcore_name, retval, new_udriver->name);
+	}
 
 	return retval;
 }

