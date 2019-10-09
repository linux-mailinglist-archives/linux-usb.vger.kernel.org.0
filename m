Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E07D1077
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 15:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731343AbfJINnt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 09:43:49 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34351 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731072AbfJINnt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 09:43:49 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EDD831BF20F;
        Wed,  9 Oct 2019 13:43:46 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 4/5] USB: Select better matching USB drivers when available
Date:   Wed,  9 Oct 2019 15:43:41 +0200
Message-Id: <20191009134342.6476-5-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009134342.6476-1-hadess@hadess.net>
References: <20191009134342.6476-1-hadess@hadess.net>
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
---
 drivers/usb/core/driver.c  | 15 +++++++++++++--
 drivers/usb/core/generic.c | 29 +++++++++++++++++++++++++++++
 include/linux/usb.h        |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 50f92da8afcf..27ce63ed902d 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -819,13 +819,24 @@ static int usb_device_match(struct device *dev, struct device_driver *drv)
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
diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 7454c74d43ee..89f9c026a4d1 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
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
+        /*
+         * If any other driver wants the device, leave the device to this other
+         * driver.
+         */
+        if (bus_for_each_drv(&usb_bus_type, NULL, udev, __check_usb_generic))
+                return false;
+
+        return true;
+}
+
 int usb_generic_driver_probe(struct usb_device *udev)
 {
 	int err, c;
@@ -289,6 +317,7 @@ EXPORT_SYMBOL_GPL(usb_generic_driver_resume);
 
 struct usb_device_driver usb_generic_driver = {
 	.name =	"usb",
+	.match = usb_generic_driver_match,
 	.probe = usb_generic_driver_probe,
 	.disconnect = usb_generic_driver_disconnect,
 #ifdef	CONFIG_PM
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 66bd4344e298..df5604f41118 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1236,6 +1236,7 @@ struct usb_driver {
 struct usb_device_driver {
 	const char *name;
 
+	bool (*match) (struct usb_device *udev);
 	int (*probe) (struct usb_device *udev);
 	void (*disconnect) (struct usb_device *udev);
 
@@ -1243,6 +1244,7 @@ struct usb_device_driver {
 	int (*resume) (struct usb_device *udev, pm_message_t message);
 	const struct attribute_group **dev_groups;
 	struct usbdrv_wrap drvwrap;
+	const struct usb_device_id *id_table;
 	unsigned int supports_autosuspend:1;
 	unsigned int generic_init:1;
 };
-- 
2.21.0

