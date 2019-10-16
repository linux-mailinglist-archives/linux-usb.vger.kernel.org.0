Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40317D8CB1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392036AbfJPJjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:39:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54013 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392030AbfJPJjl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:39:41 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D13DB20012;
        Wed, 16 Oct 2019 09:39:38 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 4/6] USB: Select better matching USB drivers when available
Date:   Wed, 16 Oct 2019 11:39:31 +0200
Message-Id: <20191016093933.693-5-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016093933.693-1-hadess@hadess.net>
References: <20191016093933.693-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that USB device drivers can reuse code from the generic USB device
driver, we need to make sure that they get selected rather than the
generic driver. Add an id_table and match vfunc to the usb_device_driver
struct, which will get used to select a better matching driver at
->probe time.

This is a similar mechanism to that used in the HID drivers, with the
generic driver being selected unless there's a better matching one found
in the registered drivers (see hid_generic_match() in
drivers/hid/hid-generic.c).

Signed-off-by: Bastien Nocera <hadess@hadess.net>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/driver.c  | 15 +++++++++++++--
 drivers/usb/core/generic.c | 29 +++++++++++++++++++++++++++++
 include/linux/usb.h        |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git drivers/usb/core/driver.c drivers/usb/core/driver.c
index 697898327b44..9d1502a9571d 100644
--- drivers/usb/core/driver.c
+++ drivers/usb/core/driver.c
@@ -818,13 +818,24 @@ static int usb_device_match(struct device *dev, struct device_driver *drv)
 {
 	/* devices and interfaces are handled separately */
 	if (is_usb_device(dev)) {
+		struct usb_device *udev;
+		struct usb_device_driver *udrv;
 
 		/* interface drivers never match devices */
 		if (!is_usb_device_driver(drv))
 			return 0;
 
-		/* TODO: Add real matching code */
-		return 1;
+		udev = to_usb_device(dev);
+		udrv = to_usb_device_driver(drv);
+
+		if (udrv->id_table &&
+		    usb_device_match_id(udev, udrv->id_table) != NULL) {
+			return 1;
+		}
+
+		if (udrv->match)
+			return udrv->match(udev);
+		return 0;
 
 	} else if (is_usb_interface(dev)) {
 		struct usb_interface *intf;
diff --git drivers/usb/core/generic.c drivers/usb/core/generic.c
index 28ece4d77749..84da85c13825 100644
--- drivers/usb/core/generic.c
+++ drivers/usb/core/generic.c
@@ -195,6 +195,34 @@ int usb_choose_configuration(struct usb_device *udev)
 }
 EXPORT_SYMBOL_GPL(usb_choose_configuration);
 
+static int __check_usb_generic(struct device_driver *drv, void *data)
+{
+	struct usb_device *udev = data;
+	struct usb_device_driver *udrv;
+
+	if (!is_usb_device_driver(drv))
+		return 0;
+	udrv = to_usb_device_driver(drv);
+	if (udrv == &usb_generic_driver)
+		return 0;
+	if (!udrv->id_table)
+		return 0;
+
+	return usb_device_match_id(udev, udrv->id_table) != NULL;
+}
+
+static bool usb_generic_driver_match(struct usb_device *udev)
+{
+	/*
+	 * If any other driver wants the device, leave the device to this other
+	 * driver.
+	 */
+	if (bus_for_each_drv(&usb_bus_type, NULL, udev, __check_usb_generic))
+		return false;
+
+	return true;
+}
+
 int usb_generic_driver_probe(struct usb_device *udev)
 {
 	int err, c;
@@ -285,6 +313,7 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 
 struct usb_device_driver usb_generic_driver = {
 	.name =	"usb",
+	.match = usb_generic_driver_match,
 	.probe = usb_generic_driver_probe,
 	.disconnect = usb_generic_driver_disconnect,
 #ifdef	CONFIG_PM
diff --git include/linux/usb.h include/linux/usb.h
index 94bd3b48a485..3663bd7b1fa4 100644
--- include/linux/usb.h
+++ include/linux/usb.h
@@ -1237,6 +1237,7 @@ struct usb_driver {
 struct usb_device_driver {
 	const char *name;
 
+	bool (*match) (struct usb_device *udev);
 	int (*probe) (struct usb_device *udev);
 	void (*disconnect) (struct usb_device *udev);
 
@@ -1244,6 +1245,7 @@ struct usb_device_driver {
 	int (*resume) (struct usb_device *udev, pm_message_t message);
 	const struct attribute_group **dev_groups;
 	struct usbdrv_wrap drvwrap;
+	const struct usb_device_id *id_table;
 	unsigned int supports_autosuspend:1;
 	unsigned int generic_subclass:1;
 };
-- 
2.21.0

