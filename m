Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CD983037
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 13:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbfHFLBP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 07:01:15 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:52197 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730844AbfHFLBP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 07:01:15 -0400
Received: by mail-qk1-f202.google.com with SMTP id s25so75138238qkj.18
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=m1oxubkb5sUeQrONJL23Fzd3XHKz8084tnl932atwQk=;
        b=C8XZF1RjRqPE1SjM+//fTT61M7BZzMwS9prgL32z1ObcRV1jhEyMIULUV9h5HcSSU0
         mhoF70yhV6zgpfYLd0qMFl+7tBZCnXW6kLWQhfk/dlT96rhEf7lIWtHbV2Ja6bDUojxe
         KV6tBP0EuqU7qiaZvHRCYfXrdT2xmLle2Pp3EL9XHe2SYYZRPr1YGThsrJaU7KwbTDBy
         +OVI6OdgkwBuaXQDJTTnOv8Xm0C+j32QAD4x+LPiUo6r15JsynP5NehZJaHYVoLAar7E
         vqjteOcPkPNqlwGEVDh0lNERvw7mIWHl7KN624yOi5BvgyTk4AdZ0y6WqCb4K7l9Y00T
         aMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=m1oxubkb5sUeQrONJL23Fzd3XHKz8084tnl932atwQk=;
        b=YBwp7x/0JHWQWCHBRzzXQpWnOexzAyyJrYYeChf2gdci3jEIIVwB5ImvsDZ+VkLS6G
         SuytYip0ADf5Y7Vp2w000/S4Ieu+qE+xlF+ebGYup1JjCpoWCw9vkVnO2X/MED4VK6th
         bBXfr9sm6Za1FFjTkCIq023kyMOLTwSSh48SCsBWZea/VLLoWXrNPQ3QZeEHeZ0hbffN
         wRn9YurHfRuyqWshfGHc7T2v3kDce+a0lkapdQfb5RKie/PqM8klUTMvBbV+UednKNep
         kMXQCyridibMK5XIDtvLyjBWq3LUldY5HjC1lTDzZyShgrF02yUtLcT65ieZoSid67d3
         E5SQ==
X-Gm-Message-State: APjAAAXsd9KqeU36g7hMDTCH57GsTfyUaDf+1B0WZFsOr7SG3qLvQCFA
        c5wf5jOSpQ+6CGoz4zOYaT9jsromziwC5k6v2w2FG8lKW0JPXBvk6KzwZE8e0R+Pg9x+KccB3Pn
        OqQJdXb2K2gTZly8Y8+wQ7TSzxQxKOoEhGTXlIItX2ZStEHKaGGgkQsSst+hlgts=
X-Google-Smtp-Source: APXvYqyv0D6aH1OS8vyQKXqVceKuvWO0q1YD88VNw2xFaecAZ+jFDplQdXyukV9PJsjSKIXTgvY6xQ+p3g==
X-Received: by 2002:a37:9bca:: with SMTP id d193mr2569852qke.122.1565089274095;
 Tue, 06 Aug 2019 04:01:14 -0700 (PDT)
Date:   Tue,  6 Aug 2019 13:00:50 +0200
Message-Id: <20190806110050.38918-1-tweek@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH] usb: setup authorized_default using usb_bus_notify
From:   "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
To:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "=?UTF-8?q?Thi=C3=A9baud=20Weksteen?=" <tweek@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, the authorized_default and interface_authorized_default
attributes for HCD are set up after the uevent has been sent to userland.
This creates a race condition where userland may fail to access this
file when processing the event. Move the appending of these attributes
earlier relying on the usb_bus_notify dispatcher.

Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
---
 drivers/usb/core/hcd.c   | 123 ---------------------------------------
 drivers/usb/core/sysfs.c | 121 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h   |   5 ++
 3 files changed, 126 insertions(+), 123 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 9320787ac2e6..2ccbc2f83570 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -103,11 +103,6 @@ static DEFINE_SPINLOCK(hcd_urb_unlink_lock);
 /* wait queue for synchronous unlinks */
 DECLARE_WAIT_QUEUE_HEAD(usb_kill_urb_queue);
=20
-static inline int is_root_hub(struct usb_device *udev)
-{
-	return (udev->parent =3D=3D NULL);
-}
-
 /*------------------------------------------------------------------------=
-*/
=20
 /*
@@ -880,101 +875,6 @@ static int usb_rh_urb_dequeue(struct usb_hcd *hcd, st=
ruct urb *urb, int status)
 }
=20
=20
-
-/*
- * Show & store the current value of authorized_default
- */
-static ssize_t authorized_default_show(struct device *dev,
-				       struct device_attribute *attr, char *buf)
-{
-	struct usb_device *rh_usb_dev =3D to_usb_device(dev);
-	struct usb_bus *usb_bus =3D rh_usb_dev->bus;
-	struct usb_hcd *hcd;
-
-	hcd =3D bus_to_hcd(usb_bus);
-	return snprintf(buf, PAGE_SIZE, "%u\n", hcd->dev_policy);
-}
-
-static ssize_t authorized_default_store(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t size)
-{
-	ssize_t result;
-	unsigned val;
-	struct usb_device *rh_usb_dev =3D to_usb_device(dev);
-	struct usb_bus *usb_bus =3D rh_usb_dev->bus;
-	struct usb_hcd *hcd;
-
-	hcd =3D bus_to_hcd(usb_bus);
-	result =3D sscanf(buf, "%u\n", &val);
-	if (result =3D=3D 1) {
-		hcd->dev_policy =3D val <=3D USB_DEVICE_AUTHORIZE_INTERNAL ?
-			val : USB_DEVICE_AUTHORIZE_ALL;
-		result =3D size;
-	} else {
-		result =3D -EINVAL;
-	}
-	return result;
-}
-static DEVICE_ATTR_RW(authorized_default);
-
-/*
- * interface_authorized_default_show - show default authorization status
- * for USB interfaces
- *
- * note: interface_authorized_default is the default value
- *       for initializing the authorized attribute of interfaces
- */
-static ssize_t interface_authorized_default_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	struct usb_device *usb_dev =3D to_usb_device(dev);
-	struct usb_hcd *hcd =3D bus_to_hcd(usb_dev->bus);
-
-	return sprintf(buf, "%u\n", !!HCD_INTF_AUTHORIZED(hcd));
-}
-
-/*
- * interface_authorized_default_store - store default authorization status
- * for USB interfaces
- *
- * note: interface_authorized_default is the default value
- *       for initializing the authorized attribute of interfaces
- */
-static ssize_t interface_authorized_default_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t count)
-{
-	struct usb_device *usb_dev =3D to_usb_device(dev);
-	struct usb_hcd *hcd =3D bus_to_hcd(usb_dev->bus);
-	int rc =3D count;
-	bool val;
-
-	if (strtobool(buf, &val) !=3D 0)
-		return -EINVAL;
-
-	if (val)
-		set_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags);
-	else
-		clear_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags);
-
-	return rc;
-}
-static DEVICE_ATTR_RW(interface_authorized_default);
-
-/* Group all the USB bus attributes */
-static struct attribute *usb_bus_attrs[] =3D {
-		&dev_attr_authorized_default.attr,
-		&dev_attr_interface_authorized_default.attr,
-		NULL,
-};
-
-static const struct attribute_group usb_bus_attr_group =3D {
-	.name =3D NULL,	/* we want them in the same directory */
-	.attrs =3D usb_bus_attrs,
-};
-
-
-
 /*------------------------------------------------------------------------=
-*/
=20
 /**
@@ -2894,32 +2794,11 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	if (retval !=3D 0)
 		goto err_register_root_hub;
=20
-	retval =3D sysfs_create_group(&rhdev->dev.kobj, &usb_bus_attr_group);
-	if (retval < 0) {
-		printk(KERN_ERR "Cannot register USB bus sysfs attributes: %d\n",
-		       retval);
-		goto error_create_attr_group;
-	}
 	if (hcd->uses_new_polling && HCD_POLL_RH(hcd))
 		usb_hcd_poll_rh_status(hcd);
=20
 	return retval;
=20
-error_create_attr_group:
-	clear_bit(HCD_FLAG_RH_RUNNING, &hcd->flags);
-	if (HC_IS_RUNNING(hcd->state))
-		hcd->state =3D HC_STATE_QUIESCING;
-	spin_lock_irq(&hcd_root_hub_lock);
-	hcd->rh_registered =3D 0;
-	spin_unlock_irq(&hcd_root_hub_lock);
-
-#ifdef CONFIG_PM
-	cancel_work_sync(&hcd->wakeup_work);
-#endif
-	cancel_work_sync(&hcd->died_work);
-	mutex_lock(&usb_bus_idr_lock);
-	usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
-	mutex_unlock(&usb_bus_idr_lock);
 err_register_root_hub:
 	hcd->rh_pollable =3D 0;
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
@@ -2963,8 +2842,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	dev_info(hcd->self.controller, "remove, state %x\n", hcd->state);
=20
 	usb_get_dev(rhdev);
-	sysfs_remove_group(&rhdev->dev.kobj, &usb_bus_attr_group);
-
 	clear_bit(HCD_FLAG_RH_RUNNING, &hcd->flags);
 	if (HC_IS_RUNNING (hcd->state))
 		hcd->state =3D HC_STATE_QUIESCING;
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index 7e88fdfe3cf5..f19694e69f5c 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 #include <linux/usb/quirks.h>
 #include <linux/of.h>
 #include "usb.h"
@@ -922,6 +923,116 @@ static struct bin_attribute dev_bin_attr_descriptors =
=3D {
 	.size =3D 18 + 65535,	/* dev descr + max-size raw descriptor */
 };
=20
+/*
+ * Show & store the current value of authorized_default
+ */
+static ssize_t authorized_default_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct usb_device *rh_usb_dev =3D to_usb_device(dev);
+	struct usb_bus *usb_bus =3D rh_usb_dev->bus;
+	struct usb_hcd *hcd;
+
+	hcd =3D bus_to_hcd(usb_bus);
+	return snprintf(buf, PAGE_SIZE, "%u\n", hcd->dev_policy);
+}
+
+static ssize_t authorized_default_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t size)
+{
+	ssize_t result;
+	unsigned int val;
+	struct usb_device *rh_usb_dev =3D to_usb_device(dev);
+	struct usb_bus *usb_bus =3D rh_usb_dev->bus;
+	struct usb_hcd *hcd;
+
+	hcd =3D bus_to_hcd(usb_bus);
+	result =3D sscanf(buf, "%u\n", &val);
+	if (result =3D=3D 1) {
+		hcd->dev_policy =3D val <=3D USB_DEVICE_AUTHORIZE_INTERNAL ?
+			val : USB_DEVICE_AUTHORIZE_ALL;
+		result =3D size;
+	} else {
+		result =3D -EINVAL;
+	}
+	return result;
+}
+static DEVICE_ATTR_RW(authorized_default);
+
+/*
+ * interface_authorized_default_show - show default authorization status
+ * for USB interfaces
+ *
+ * note: interface_authorized_default is the default value
+ *       for initializing the authorized attribute of interfaces
+ */
+static ssize_t interface_authorized_default_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct usb_device *usb_dev =3D to_usb_device(dev);
+	struct usb_hcd *hcd =3D bus_to_hcd(usb_dev->bus);
+
+	return sprintf(buf, "%u\n", !!HCD_INTF_AUTHORIZED(hcd));
+}
+
+/*
+ * interface_authorized_default_store - store default authorization status
+ * for USB interfaces
+ *
+ * note: interface_authorized_default is the default value
+ *       for initializing the authorized attribute of interfaces
+ */
+static ssize_t interface_authorized_default_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct usb_device *usb_dev =3D to_usb_device(dev);
+	struct usb_hcd *hcd =3D bus_to_hcd(usb_dev->bus);
+	int rc =3D count;
+	bool val;
+
+	if (strtobool(buf, &val) !=3D 0)
+		return -EINVAL;
+
+	if (val)
+		set_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags);
+	else
+		clear_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags);
+
+	return rc;
+}
+static DEVICE_ATTR_RW(interface_authorized_default);
+
+/* Group all the USB bus attributes */
+static struct attribute *usb_bus_attrs[] =3D {
+		&dev_attr_authorized_default.attr,
+		&dev_attr_interface_authorized_default.attr,
+		NULL,
+};
+
+static const struct attribute_group usb_bus_attr_group =3D {
+	.name =3D NULL,	/* we want them in the same directory */
+	.attrs =3D usb_bus_attrs,
+};
+
+
+static int add_default_authorized_attributes(struct device *dev)
+{
+	int rc =3D 0;
+
+	if (is_usb_device(dev))
+		rc =3D sysfs_create_group(&dev->kobj, &usb_bus_attr_group);
+
+	return rc;
+}
+
+static void remove_default_authorized_attributes(struct device *dev)
+{
+	if (is_usb_device(dev)) {
+		sysfs_remove_group(&dev->kobj, &usb_bus_attr_group);
+	}
+}
+
 int usb_create_sysfs_dev_files(struct usb_device *udev)
 {
 	struct device *dev =3D &udev->dev;
@@ -938,7 +1049,14 @@ int usb_create_sysfs_dev_files(struct usb_device *ude=
v)
 	retval =3D add_power_attributes(dev);
 	if (retval)
 		goto error;
+
+	if (is_root_hub(udev)) {
+		retval =3D add_default_authorized_attributes(dev);
+		if (retval)
+			goto error;
+	}
 	return retval;
+
 error:
 	usb_remove_sysfs_dev_files(udev);
 	return retval;
@@ -948,6 +1066,9 @@ void usb_remove_sysfs_dev_files(struct usb_device *ude=
v)
 {
 	struct device *dev =3D &udev->dev;
=20
+	if (is_root_hub(udev))
+		remove_default_authorized_attributes(dev);
+
 	remove_power_attributes(dev);
 	remove_persist_attributes(dev);
 	device_remove_bin_file(dev, &dev_bin_attr_descriptors);
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index bd8d01f85a13..0c9fde5ad052 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -153,6 +153,11 @@ static inline int is_usb_port(const struct device *dev=
)
 	return dev->type =3D=3D &usb_port_device_type;
 }
=20
+static inline int is_root_hub(struct usb_device *udev)
+{
+	return (udev->parent =3D=3D NULL);
+}
+
 /* Do the same for device drivers and interface drivers. */
=20
 static inline int is_usb_device_driver(struct device_driver *drv)
--=20
2.22.0.770.g0f2c4a37fd-goog

