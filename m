Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C1883432
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733087AbfHFOpX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEB05217D9;
        Tue,  6 Aug 2019 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102722;
        bh=fb+mzvlEhDrgHKPgRykgtR4zgEogYkeAAkZVBQzTQMI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OZdU3PorYhKQxUQPE5aBTKMJT4wihfqzaVTOt/BrjbjbJ19Xz4/CDV6B7hSES+ytu
         j3i6FgiKbnpIzR+v7OWQe2GuP1Kg5w8m4e6c00PwGyA444SbfX4hHph+u09LzKvbjp
         rRLYTQOEsH+XL+KKG44/BEn82YVtwde9LuzJZfZs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 02/12] USB: add support for dev_groups to struct usb_device_driver
Date:   Tue,  6 Aug 2019 16:44:52 +0200
Message-Id: <20190806144502.17792-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806144502.17792-1-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that the driver core supports dev_groups for individual drivers,
expose that pointer to struct usb_device_driver to make it easier for USB
drivers to also use it.

Yes, users of usb_device_driver are much rare, but there are instances
already that use custom sysfs files, so adding this support will make
things easier for those drivers.  usbip is one example, hubs might be
another one.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/driver.c | 1 +
 include/linux/usb.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 687fc5df4c17..2b27d232d7a7 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -892,6 +892,7 @@ int usb_register_device_driver(struct usb_device_driver *new_udriver,
 	new_udriver->drvwrap.driver.probe = usb_probe_device;
 	new_udriver->drvwrap.driver.remove = usb_unbind_device;
 	new_udriver->drvwrap.driver.owner = owner;
+	new_udriver->drvwrap.driver.dev_groups = new_udriver->dev_groups;
 
 	retval = driver_register(&new_udriver->drvwrap.driver);
 
diff --git a/include/linux/usb.h b/include/linux/usb.h
index af4eb6419ae8..57f667cad3ec 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1224,6 +1224,8 @@ struct usb_driver {
  *	module is being unloaded.
  * @suspend: Called when the device is going to be suspended by the system.
  * @resume: Called when the device is being resumed by the system.
+ * @dev_groups: Attributes attached to the device that will be created once it
+ *	is bound to the driver.
  * @drvwrap: Driver-model core structure wrapper.
  * @supports_autosuspend: if set to 0, the USB core will not allow autosuspend
  *	for devices bound to this driver.
@@ -1238,6 +1240,7 @@ struct usb_device_driver {
 
 	int (*suspend) (struct usb_device *udev, pm_message_t message);
 	int (*resume) (struct usb_device *udev, pm_message_t message);
+	const struct attribute_group **dev_groups;
 	struct usbdrv_wrap drvwrap;
 	unsigned int supports_autosuspend:1;
 };
-- 
2.22.0

