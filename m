Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83A48342E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733065AbfHFOpS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730289AbfHFOpS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6DDA214C6;
        Tue,  6 Aug 2019 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102717;
        bh=vjl9pO5XLhUt6+WXZ1MT+7E4/kI123d72qUOkAyx8uE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DMPsvcgfn1+Kk+R+bGQ9by+poTu05AtHebdrE+iaKSMqU71ogIyL+tL4+b9CIlTwv
         ZaT2uF0eVRqhXGtgcIQQ0tTAnkbhwUsVVV0Lu10hPMdU3clhbyGMlA5Unz4sR5hGtr
         /GOj7eMZGisuexJLo4IbXRbnvnZinbHRPlV0wGJk=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 11/12] USB: usbsevseg: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:45:01 +0200
Message-Id: <20190806144502.17792-12-gregkh@linuxfoundation.org>
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
 drivers/usb/misc/usbsevseg.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index 1923d5b6d9c9..551074f5b7ad 100644
--- a/drivers/usb/misc/usbsevseg.c
+++ b/drivers/usb/misc/usbsevseg.c
@@ -316,7 +316,7 @@ MYDEV_ATTR_SIMPLE_UNSIGNED(powered, update_display_powered);
 MYDEV_ATTR_SIMPLE_UNSIGNED(mode_msb, update_display_mode);
 MYDEV_ATTR_SIMPLE_UNSIGNED(mode_lsb, update_display_mode);
 
-static struct attribute *dev_attrs[] = {
+static struct attribute *sevseg_attrs[] = {
 	&dev_attr_powered.attr,
 	&dev_attr_text.attr,
 	&dev_attr_textmode.attr,
@@ -325,10 +325,7 @@ static struct attribute *dev_attrs[] = {
 	&dev_attr_mode_lsb.attr,
 	NULL
 };
-
-static const struct attribute_group dev_attr_grp = {
-	.attrs = dev_attrs,
-};
+ATTRIBUTE_GROUPS(sevseg);
 
 static int sevseg_probe(struct usb_interface *interface,
 	const struct usb_device_id *id)
@@ -354,17 +351,9 @@ static int sevseg_probe(struct usb_interface *interface,
 	mydev->mode_msb = 0x06; /* 6 characters */
 	mydev->mode_lsb = 0x3f; /* scanmode for 6 chars */
 
-	rc = sysfs_create_group(&interface->dev.kobj, &dev_attr_grp);
-	if (rc)
-		goto error;
-
 	dev_info(&interface->dev, "USB 7 Segment device now attached\n");
 	return 0;
 
-error:
-	usb_set_intfdata(interface, NULL);
-	usb_put_dev(mydev->udev);
-	kfree(mydev);
 error_mem:
 	return rc;
 }
@@ -374,7 +363,6 @@ static void sevseg_disconnect(struct usb_interface *interface)
 	struct usb_sevsegdev *mydev;
 
 	mydev = usb_get_intfdata(interface);
-	sysfs_remove_group(&interface->dev.kobj, &dev_attr_grp);
 	usb_set_intfdata(interface, NULL);
 	usb_put_dev(mydev->udev);
 	kfree(mydev);
@@ -423,6 +411,7 @@ static struct usb_driver sevseg_driver = {
 	.resume =	sevseg_resume,
 	.reset_resume =	sevseg_reset_resume,
 	.id_table =	id_table,
+	.dev_groups =	sevseg_groups,
 	.supports_autosuspend = 1,
 };
 
-- 
2.22.0

