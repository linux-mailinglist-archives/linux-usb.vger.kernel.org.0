Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77E2D7872
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 16:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732708AbfJOO1u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 10:27:50 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55951 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732676AbfJOO1u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 10:27:50 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0A3C760012;
        Tue, 15 Oct 2019 14:27:46 +0000 (UTC)
Message-ID: <6275ac3e6b789c901e8814c79bbb50fa4723ae03.camel@hadess.net>
Subject: [PATCH v2 2/6] USB: Make it possible to "subclass" usb_device_driver
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 15 Oct 2019 16:27:46 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The kernel currenly has only 2 usb_device_drivers, one generic one, one
that completely replaces the generic one to make USB devices usable
over
a network.

Use the newly exported generic driver functions when a driver declares
to want them run, in addition to its own code. This makes it possible
to
write drivers that extend the generic USB driver.

Note that this patch is not enough for another driver to automatically
get selected.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/usb/core/driver.c | 26 +++++++++++++++++++++-----
 include/linux/usb.h       |  4 ++++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2b27d232d7a7..d3787d084937 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -261,9 +261,16 @@ static int usb_probe_device(struct device *dev)
 	 */
 	if (!udriver->supports_autosuspend)
 		error = usb_autoresume_device(udev);
+	if (error)
+		return error;
 
-	if (!error)
-		error = udriver->probe(udev);
+	if (udriver->generic_subclass)
+		error = usb_generic_driver_probe(udev);
+	if (error)
+		return error;
+
+	error = udriver->probe(udev);
+	/* TODO: fallback to generic driver in case of error */
 	return error;
 }
 
@@ -273,7 +280,10 @@ static int usb_unbind_device(struct device *dev)
 	struct usb_device *udev = to_usb_device(dev);
 	struct usb_device_driver *udriver = to_usb_device_driver(dev-
>driver);
 
-	udriver->disconnect(udev);
+	if (udriver->disconnect)
+		udriver->disconnect(udev);
+	if (udriver->generic_subclass)
+		usb_generic_driver_disconnect(udev);
 	if (!udriver->supports_autosuspend)
 		usb_autosuspend_device(udev);
 	return 0;
@@ -1149,7 +1159,10 @@ static int usb_suspend_device(struct usb_device
*udev, pm_message_t msg)
 		udev->do_remote_wakeup = 0;
 		udriver = &usb_generic_driver;
 	}
-	status = udriver->suspend(udev, msg);
+	if (udriver->suspend)
+		status = udriver->suspend(udev, msg);
+	if (status == 0 && udriver->generic_subclass)
+		status = usb_generic_driver_suspend(udev, msg);
 
  done:
 	dev_vdbg(&udev->dev, "%s: status %d\n", __func__, status);
@@ -1181,7 +1194,10 @@ static int usb_resume_device(struct usb_device
*udev, pm_message_t msg)
 		udev->reset_resume = 1;
 
 	udriver = to_usb_device_driver(udev->dev.driver);
-	status = udriver->resume(udev, msg);
+	if (udriver->generic_subclass)
+		status = usb_generic_driver_resume(udev, msg);
+	if (status == 0 && udriver->resume)
+		status = udriver->resume(udev, msg);
 
  done:
 	dev_vdbg(&udev->dev, "%s: status %d\n", __func__, status);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e656e7b4b1e4..94bd3b48a485 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1228,6 +1228,9 @@ struct usb_driver {
  * @drvwrap: Driver-model core structure wrapper.
  * @supports_autosuspend: if set to 0, the USB core will not allow
autosuspend
  *	for devices bound to this driver.
+ * @generic_subclass: if set to 1, the generic USB driver's probe,
disconnect,
+ *	resume and suspend functions will be called in addition to the
driver's
+ *	own, so this part of the setup does not need to be replicated.
  *
  * USB drivers must provide all the fields listed above except
drvwrap.
  */
@@ -1242,6 +1245,7 @@ struct usb_device_driver {
 	const struct attribute_group **dev_groups;
 	struct usbdrv_wrap drvwrap;
 	unsigned int supports_autosuspend:1;
+	unsigned int generic_subclass:1;
 };
 #define	to_usb_device_driver(d) container_of(d, struct
usb_device_driver, \
 		drvwrap.driver)

