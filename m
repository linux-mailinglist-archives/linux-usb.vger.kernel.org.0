Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67C9C83437
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733118AbfHFOpg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D95F4214C6;
        Tue,  6 Aug 2019 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102735;
        bh=fMTTJ97G/mUnj4BdI42YClaN06AMwAKfvjDVUD3gKZQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q5bupg7/5gVea8egyutBoNUNec+TDCnoysZ5O3af4LoXICkGR+eAxeVZhQi/96kJW
         jXxhp7TmsR3U1p0ZluxjXxPN89CE6ZfpTKiVVgbTC4l2KzijbyE4MIak0KsoPjIwAq
         jmvqr2qiLTbMzCb6ehOpY6j5cyZctnM2w7UAkweQ=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/12] USB: cypress_cy7c63: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:44:57 +0200
Message-Id: <20190806144502.17792-8-gregkh@linuxfoundation.org>
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
 drivers/usb/misc/cypress_cy7c63.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 9d780b77314b..14faec51d7a5 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -183,6 +183,7 @@ static ssize_t port0_show(struct device *dev,
 {
 	return read_port(dev, attr, buf, 0, CYPRESS_READ_PORT_ID0);
 }
+static DEVICE_ATTR_RW(port0);
 
 /* attribute callback handler (read) */
 static ssize_t port1_show(struct device *dev,
@@ -190,11 +191,14 @@ static ssize_t port1_show(struct device *dev,
 {
 	return read_port(dev, attr, buf, 1, CYPRESS_READ_PORT_ID1);
 }
-
-static DEVICE_ATTR_RW(port0);
-
 static DEVICE_ATTR_RW(port1);
 
+static struct attribute *cypress_attrs[] = {
+	&dev_attr_port0.attr,
+	&dev_attr_port1.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(cypress);
 
 static int cypress_probe(struct usb_interface *interface,
 			 const struct usb_device_id *id)
@@ -212,26 +216,11 @@ static int cypress_probe(struct usb_interface *interface,
 	/* save our data pointer in this interface device */
 	usb_set_intfdata(interface, dev);
 
-	/* create device attribute files */
-	retval = device_create_file(&interface->dev, &dev_attr_port0);
-	if (retval)
-		goto error;
-	retval = device_create_file(&interface->dev, &dev_attr_port1);
-	if (retval)
-		goto error;
-
 	/* let the user know that the device is now attached */
 	dev_info(&interface->dev,
 		 "Cypress CY7C63xxx device now attached\n");
 	return 0;
 
-error:
-	device_remove_file(&interface->dev, &dev_attr_port0);
-	device_remove_file(&interface->dev, &dev_attr_port1);
-	usb_set_intfdata(interface, NULL);
-	usb_put_dev(dev->udev);
-	kfree(dev);
-
 error_mem:
 	return retval;
 }
@@ -242,9 +231,6 @@ static void cypress_disconnect(struct usb_interface *interface)
 
 	dev = usb_get_intfdata(interface);
 
-	/* remove device attribute files */
-	device_remove_file(&interface->dev, &dev_attr_port0);
-	device_remove_file(&interface->dev, &dev_attr_port1);
 	/* the intfdata can be set to NULL only after the
 	 * device files have been removed */
 	usb_set_intfdata(interface, NULL);
@@ -262,6 +248,7 @@ static struct usb_driver cypress_driver = {
 	.probe = cypress_probe,
 	.disconnect = cypress_disconnect,
 	.id_table = cypress_table,
+	.dev_groups = cypress_groups,
 };
 
 module_usb_driver(cypress_driver);
-- 
2.22.0

