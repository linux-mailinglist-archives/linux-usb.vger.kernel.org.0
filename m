Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97AB7390B4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 22:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjFUUZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 16:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjFUUZV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 16:25:21 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE961994
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 13:25:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f9085f97a4so12685005e9.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687379118; x=1689971118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLeJEMF3SAC5QUEAZd6kFpId/4VIA39eRUuxW79/9rw=;
        b=GKb8tE0SyWvNIPyvEh3V+typT+tJp3vyB6qN2kBmGgbUHij10ed9EwTzObfK7c3Pig
         jMkP+jZX45lIXXtdee4Uhik1yufDA39ygz7rtw8CL8BlrY7dGARRIhvN/Kebj3KS2Qu8
         7aOWI0UUzwb1MmlffiM/qLtlEPAzXG1iNrh/4YL8F89yC2USRViji4+lObZxNLEFBRLJ
         zH2Z/NZs0YWYmCnyK9he12jJL3AOISNPSGOLdF8qYnxOKHraRWdjzCru/JVcOl4MP2aI
         c0mgtECKa7cQkzkjR8Pe5TC7L1TTag6tuJlY0xq+3EXVxaTSY2o+yhZY6rXvYEKaGzVA
         acPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687379118; x=1689971118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLeJEMF3SAC5QUEAZd6kFpId/4VIA39eRUuxW79/9rw=;
        b=aU33Eb9VYf2qHPks/Z6KX935I/4D3r+La8VRwA+PPYbUcNsaC4ScImsHsUXljzKcRO
         yxlKPmJwFqfgnDslNnjRTIbeOWclNA9QBOsbEUO99OqwkRIixGk5Zr/2E9VHkYnO7j6v
         WdFdGOBzEEAMTnTrTnuhNMxpf4cvYvXTYaaXTZbCXD/OBMWpzNqZuysNKHRDgdiyZJkD
         Gw8JWlcoSUdkpO/CcBCM1rLGbQvMsiOCfDbeGYg3z12cv7N47C6KRRWLt1l01QUnR06w
         yS2CmJjbwFcQG8RMz9iBZ4BOwCk6NZMD0RcOvvUMRelYCEFj7QcqkX72rYIrPWjNix3x
         5/aQ==
X-Gm-Message-State: AC+VfDyZXfKe37n1gr6ABa1SrWMuychEx7uU+ZNaZ7FNFu0lrD0nOo/Z
        sM+tOqgKKIoUe97awMm99AxOlgnptadE48Wb
X-Google-Smtp-Source: ACHHUZ7lc/8I7aoM0fKXwdjP4y6JGQQRGWm0Zv/37N3aiWP0D/L6X8ua9D2iPqyJMKHhygTQIPOFXQ==
X-Received: by 2002:a05:600c:1e12:b0:3f9:92e:4d99 with SMTP id ay18-20020a05600c1e1200b003f9092e4d99mr10184297wmb.0.1687379117878;
        Wed, 21 Jun 2023 13:25:17 -0700 (PDT)
Received: from ivan-B550MH.. ([141.136.95.75])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003f7f249e7dfsm16137978wma.4.2023.06.21.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 13:25:17 -0700 (PDT)
From:   Ivan Orlov <ivan.orlov0322@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     Ivan Orlov <ivan.orlov0322@gmail.com>, linux-usb@vger.kernel.org
Subject: [PATCH v4] USB: make usb class a const structure
Date:   Thu, 22 Jun 2023 00:25:14 +0400
Message-Id: <20230621202514.1223670-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that the driver core allows for struct class to be in read-only
memory, remove the usb_class structure and create the usbmisc_class
const class structure declared at build time which places it into
read-only memory, instead of having it to be dynamically allocated
at load time.

Additionally, now we register usb class at startup and unregister it
when shutting down, so we don't have to count uses of the class.
Therefore we don't need the 'usb_class' structure anymore. Due to this
fact, remove all static functions related to class initialization and
deinitialization. We can't use them in 'usb.c' since they are static
and we don't really need them anymore.

Since we have to register the class in usb_init function in 'usb.c'
and use it in 'file.c' as well, declare the usbmisc_class structure
as 'export' in the 'usb.h' file.

Debatable moment: the class registration and unregistration functions
could be extracted to the 'file.c'. I think we don't want to do this
since it would be one-line functions. They would make the code paths
more confusing and add calling overhead.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Remove kref field of usb_class structure
- Remove usb_class structure
- Remove class initialization and cleaning functions
- Add usbmisc_class declaration to usb.h file
- Move class registration to usb init function
- Move class unregistration to usb exit function
V2 -> V3:
- Remove redundant retval comparison found by 0-day bot
V3 -> V4:
- Initialize retval to 0 in the 'usb_register_dev' function.

 drivers/usb/core/file.c | 68 +++++------------------------------------
 drivers/usb/core/usb.c  |  6 ++++
 drivers/usb/core/usb.h  |  1 +
 3 files changed, 14 insertions(+), 61 deletions(-)

diff --git a/drivers/usb/core/file.c b/drivers/usb/core/file.c
index c4ed3310e069..a88ced93b5e7 100644
--- a/drivers/usb/core/file.c
+++ b/drivers/usb/core/file.c
@@ -29,7 +29,6 @@
 #define MAX_USB_MINORS	256
 static const struct file_operations *usb_minors[MAX_USB_MINORS];
 static DECLARE_RWSEM(minor_rwsem);
-static DEFINE_MUTEX(init_usb_class_mutex);
 
 static int usb_open(struct inode *inode, struct file *file)
 {
@@ -57,11 +56,6 @@ static const struct file_operations usb_fops = {
 	.llseek =	noop_llseek,
 };
 
-static struct usb_class {
-	struct kref kref;
-	struct class *class;
-} *usb_class;
-
 static char *usb_devnode(const struct device *dev, umode_t *mode)
 {
 	struct usb_class_driver *drv;
@@ -72,50 +66,10 @@ static char *usb_devnode(const struct device *dev, umode_t *mode)
 	return drv->devnode(dev, mode);
 }
 
-static int init_usb_class(void)
-{
-	int result = 0;
-
-	if (usb_class != NULL) {
-		kref_get(&usb_class->kref);
-		goto exit;
-	}
-
-	usb_class = kmalloc(sizeof(*usb_class), GFP_KERNEL);
-	if (!usb_class) {
-		result = -ENOMEM;
-		goto exit;
-	}
-
-	kref_init(&usb_class->kref);
-	usb_class->class = class_create("usbmisc");
-	if (IS_ERR(usb_class->class)) {
-		result = PTR_ERR(usb_class->class);
-		printk(KERN_ERR "class_create failed for usb devices\n");
-		kfree(usb_class);
-		usb_class = NULL;
-		goto exit;
-	}
-	usb_class->class->devnode = usb_devnode;
-
-exit:
-	return result;
-}
-
-static void release_usb_class(struct kref *kref)
-{
-	/* Ok, we cheat as we know we only have one usb_class */
-	class_destroy(usb_class->class);
-	kfree(usb_class);
-	usb_class = NULL;
-}
-
-static void destroy_usb_class(void)
-{
-	mutex_lock(&init_usb_class_mutex);
-	kref_put(&usb_class->kref, release_usb_class);
-	mutex_unlock(&init_usb_class_mutex);
-}
+const struct class usbmisc_class = {
+	.name		= "usbmisc",
+	.devnode	= usb_devnode,
+};
 
 int usb_major_init(void)
 {
@@ -156,7 +110,7 @@ void usb_major_cleanup(void)
 int usb_register_dev(struct usb_interface *intf,
 		     struct usb_class_driver *class_driver)
 {
-	int retval;
+	int retval = 0;
 	int minor_base = class_driver->minor_base;
 	int minor;
 	char name[20];
@@ -175,13 +129,6 @@ int usb_register_dev(struct usb_interface *intf,
 	if (intf->minor >= 0)
 		return -EADDRINUSE;
 
-	mutex_lock(&init_usb_class_mutex);
-	retval = init_usb_class();
-	mutex_unlock(&init_usb_class_mutex);
-
-	if (retval)
-		return retval;
-
 	dev_dbg(&intf->dev, "looking for a minor, starting at %d\n", minor_base);
 
 	down_write(&minor_rwsem);
@@ -200,7 +147,7 @@ int usb_register_dev(struct usb_interface *intf,
 
 	/* create a usb class device for this usb interface */
 	snprintf(name, sizeof(name), class_driver->name, minor - minor_base);
-	intf->usb_dev = device_create(usb_class->class, &intf->dev,
+	intf->usb_dev = device_create(&usbmisc_class, &intf->dev,
 				      MKDEV(USB_MAJOR, minor), class_driver,
 				      "%s", kbasename(name));
 	if (IS_ERR(intf->usb_dev)) {
@@ -234,7 +181,7 @@ void usb_deregister_dev(struct usb_interface *intf,
 		return;
 
 	dev_dbg(&intf->dev, "removing %d minor\n", intf->minor);
-	device_destroy(usb_class->class, MKDEV(USB_MAJOR, intf->minor));
+	device_destroy(&usbmisc_class, MKDEV(USB_MAJOR, intf->minor));
 
 	down_write(&minor_rwsem);
 	usb_minors[intf->minor] = NULL;
@@ -242,6 +189,5 @@ void usb_deregister_dev(struct usb_interface *intf,
 
 	intf->usb_dev = NULL;
 	intf->minor = -1;
-	destroy_usb_class();
 }
 EXPORT_SYMBOL_GPL(usb_deregister_dev);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 901ec732321c..39bdf9589b06 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1101,6 +1101,9 @@ static int __init usb_init(void)
 	retval = usb_major_init();
 	if (retval)
 		goto major_init_failed;
+	retval = class_register(&usbmisc_class);
+	if (retval)
+		goto class_register_failed;
 	retval = usb_register(&usbfs_driver);
 	if (retval)
 		goto driver_register_failed;
@@ -1120,6 +1123,8 @@ static int __init usb_init(void)
 usb_devio_init_failed:
 	usb_deregister(&usbfs_driver);
 driver_register_failed:
+	class_unregister(&usbmisc_class);
+class_register_failed:
 	usb_major_cleanup();
 major_init_failed:
 	bus_unregister_notifier(&usb_bus_type, &usb_bus_nb);
@@ -1147,6 +1152,7 @@ static void __exit usb_exit(void)
 	usb_deregister(&usbfs_driver);
 	usb_devio_cleanup();
 	usb_hub_cleanup();
+	class_unregister(&usbmisc_class);
 	bus_unregister_notifier(&usb_bus_type, &usb_bus_nb);
 	bus_unregister(&usb_bus_type);
 	usb_acpi_unregister();
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index ffe3f6818e9c..69ca59841083 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -141,6 +141,7 @@ static inline int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
 
 #endif
 
+extern const struct class usbmisc_class;
 extern const struct bus_type usb_bus_type;
 extern struct mutex usb_port_peer_mutex;
 extern struct device_type usb_device_type;
-- 
2.34.1

