Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E8AD1073
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 15:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731229AbfJINnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 09:43:46 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54387 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731037AbfJINnq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 09:43:46 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3DDA11BF213;
        Wed,  9 Oct 2019 13:43:45 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 2/5] USB: Make it possible to "subclass" usb_device_driver
Date:   Wed,  9 Oct 2019 15:43:39 +0200
Message-Id: <20191009134342.6476-3-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009134342.6476-1-hadess@hadess.net>
References: <20191009134342.6476-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The kernel currenly has only 2 usb_device_drivers, one generic one, one
that completely replaces the generic one to make USB devices usable over
a network.

Use the newly exported generic driver functions when a driver declares
to want them run, in addition to its own code. This makes it possible to
write drivers that extend the generic USB driver.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/driver.c | 36 ++++++++++++++++++++++++++++++------
 include/linux/usb.h       |  1 +
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2b27d232d7a7..863e380a272b 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -261,10 +261,17 @@ static int usb_probe_device(struct device *dev)
 	 */
 	if (!udriver->supports_autosuspend)
 		error = usb_autoresume_device(udev);
+	if (error)
+		return error;
 
-	if (!error)
-		error = udriver->probe(udev);
-	return error;
+	if (udriver->generic_init)
+		error = usb_generic_driver_probe(udev);
+	if (error)
+		return error;
+
+	if (udriver->probe)
+		return udriver->probe(udev);
+	return 0;
 }
 
 /* called from driver core with dev locked */
@@ -273,7 +280,10 @@ static int usb_unbind_device(struct device *dev)
 	struct usb_device *udev = to_usb_device(dev);
 	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
 
-	udriver->disconnect(udev);
+	if (udriver->generic_init)
+		usb_generic_driver_disconnect(udev);
+	if (udriver->disconnect)
+		udriver->disconnect(udev);
 	if (!udriver->supports_autosuspend)
 		usb_autosuspend_device(udev);
 	return 0;
@@ -886,6 +896,14 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
 	if (usb_disabled())
 		return -ENODEV;
 
+	if (new_udriver->probe == NULL &&
+	    !new_udriver->generic_init) {
+		printk(KERN_ERR "%s: error %d registering device "
+		       "	driver %s, no probe() function\n",
+		       usbcore_name, retval, new_udriver->name);
+		return -EINVAL;
+	}
+
 	new_udriver->drvwrap.for_devices = 1;
 	new_udriver->drvwrap.driver.name = new_udriver->name;
 	new_udriver->drvwrap.driver.bus = &usb_bus_type;
@@ -1149,7 +1167,10 @@ static int usb_suspend_device(struct usb_device *udev, pm_message_t msg)
 		udev->do_remote_wakeup = 0;
 		udriver = &usb_generic_driver;
 	}
-	status = udriver->suspend(udev, msg);
+	if (udriver->generic_init)
+		status = usb_generic_driver_suspend (udev, msg);
+	if (status == 0 && udriver->suspend)
+		status = udriver->suspend(udev, msg);
 
  done:
 	dev_vdbg(&udev->dev, "%s: status %d\n", __func__, status);
@@ -1181,7 +1202,10 @@ static int usb_resume_device(struct usb_device *udev, pm_message_t msg)
 		udev->reset_resume = 1;
 
 	udriver = to_usb_device_driver(udev->dev.driver);
-	status = udriver->resume(udev, msg);
+	if (udriver->generic_init)
+		status = usb_generic_driver_resume (udev, msg);
+	if (status == 0 && udriver->resume)
+		status = udriver->resume(udev, msg);
 
  done:
 	dev_vdbg(&udev->dev, "%s: status %d\n", __func__, status);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e656e7b4b1e4..fb9ad3511e55 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1242,6 +1242,7 @@ struct usb_device_driver {
 	const struct attribute_group **dev_groups;
 	struct usbdrv_wrap drvwrap;
 	unsigned int supports_autosuspend:1;
+	unsigned int generic_init:1;
 };
 #define	to_usb_device_driver(d) container_of(d, struct usb_device_driver, \
 		drvwrap.driver)
-- 
2.21.0

