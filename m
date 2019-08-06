Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721D683438
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733122AbfHFOpi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:46144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6813B216F4;
        Tue,  6 Aug 2019 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102737;
        bh=weLGk/2GgTtDvPcWpOgMkCZKqbrbEYpScoiDM2AdE9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aAVKJYqnWnH2IFSZHdqof8fnlb/puB7uAjKR5hV17QZ1YMpbCuQFrhCeMnbIimpwi
         XLXcXtnh8blUCcFxcRgkIwEmTFto6yqsAhguofo7LO5LHSW74ktpe/zYYFqqNeHseS
         ArSbqnk11uX+4T5Q7+62h5dQflVIzpA6muVLbpSw=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 08/12] USB: cytherm: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:58 +0200
Message-Id: <20190806144502.17792-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806144502.17792-1-gregkh@linuxfoundation.org>
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB drivers now support the ability for the driver core to handle the
creation and removal of device-specific sysfs files in a race-free
manner.  Take advantage of that by converting the driver to use this by
moving the sysfs attributes into a group and assigning the dev_groups
pointer to it.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/cytherm.c | 64 +++++++++++---------------------------
 1 file changed, 19 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index 8b15ab5e1450..3e3802aaefa3 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -36,20 +36,6 @@ struct usb_cytherm {
 };
 
 
-/* local function prototypes */
-static int cytherm_probe(struct usb_interface *interface, 
-			 const struct usb_device_id *id);
-static void cytherm_disconnect(struct usb_interface *interface);
-
-
-/* usb specific object needed to register this driver with the usb subsystem */
-static struct usb_driver cytherm_driver = {
-	.name =		"cytherm",
-	.probe =	cytherm_probe,
-	.disconnect =	cytherm_disconnect,
-	.id_table =	id_table,
-};
-
 /* Vendor requests */
 /* They all operate on one byte at a time */
 #define PING       0x00
@@ -304,6 +290,15 @@ static ssize_t port1_store(struct device *dev, struct device_attribute *attr, co
 }
 static DEVICE_ATTR_RW(port1);
 
+static struct attribute *cytherm_attrs[] = {
+	&dev_attr_brightness.attr,
+	&dev_attr_temp.attr,
+	&dev_attr_button.attr,
+	&dev_attr_port0.attr,
+	&dev_attr_port1.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(cytherm);
 
 static int cytherm_probe(struct usb_interface *interface, 
 			 const struct usb_device_id *id)
@@ -322,34 +317,10 @@ static int cytherm_probe(struct usb_interface *interface,
 
 	dev->brightness = 0xFF;
 
-	retval = device_create_file(&interface->dev, &dev_attr_brightness);
-	if (retval)
-		goto error;
-	retval = device_create_file(&interface->dev, &dev_attr_temp);
-	if (retval)
-		goto error;
-	retval = device_create_file(&interface->dev, &dev_attr_button);
-	if (retval)
-		goto error;
-	retval = device_create_file(&interface->dev, &dev_attr_port0);
-	if (retval)
-		goto error;
-	retval = device_create_file(&interface->dev, &dev_attr_port1);
-	if (retval)
-		goto error;
-
 	dev_info (&interface->dev,
 		  "Cypress thermometer device now attached\n");
 	return 0;
-error:
-	device_remove_file(&interface->dev, &dev_attr_brightness);
-	device_remove_file(&interface->dev, &dev_attr_temp);
-	device_remove_file(&interface->dev, &dev_attr_button);
-	device_remove_file(&interface->dev, &dev_attr_port0);
-	device_remove_file(&interface->dev, &dev_attr_port1);
-	usb_set_intfdata (interface, NULL);
-	usb_put_dev(dev->udev);
-	kfree(dev);
+
 error_mem:
 	return retval;
 }
@@ -360,12 +331,6 @@ static void cytherm_disconnect(struct usb_interface *interface)
 
 	dev = usb_get_intfdata (interface);
 
-	device_remove_file(&interface->dev, &dev_attr_brightness);
-	device_remove_file(&interface->dev, &dev_attr_temp);
-	device_remove_file(&interface->dev, &dev_attr_button);
-	device_remove_file(&interface->dev, &dev_attr_port0);
-	device_remove_file(&interface->dev, &dev_attr_port1);
-
 	/* first remove the files, then NULL the pointer */
 	usb_set_intfdata (interface, NULL);
 
@@ -376,6 +341,15 @@ static void cytherm_disconnect(struct usb_interface *interface)
 	dev_info(&interface->dev, "Cypress thermometer now disconnected\n");
 }
 
+/* usb specific object needed to register this driver with the usb subsystem */
+static struct usb_driver cytherm_driver = {
+	.name =		"cytherm",
+	.probe =	cytherm_probe,
+	.disconnect =	cytherm_disconnect,
+	.id_table =	id_table,
+	.dev_groups =	cytherm_groups,
+};
+
 module_usb_driver(cytherm_driver);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
-- 
2.22.0

