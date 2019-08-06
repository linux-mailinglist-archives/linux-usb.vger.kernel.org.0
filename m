Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC4683430
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733076AbfHFOpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:45:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733066AbfHFOpV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 10:45:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6359F214C6;
        Tue,  6 Aug 2019 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565102719;
        bh=OlzchSyzpfZZvUBliJZhV89r2LswcZ3288cZR19mPlg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jWnRuePtMBkqEfgVddVuL3FNs0xQrpVzEBMqGJ8W9rTt/+cIjKpLSUjl97nUcLwkP
         dyxU+X8SvFlPwabWQ12nyapc6D3TNgNRVVzq3R/2lwHeEhUJ+d1ex6scz9LzRCkJ2D
         3ul8FzBbs2mw6fN/kQSAJvj4/ZDWYZToxDwqamuc=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Subject: [PATCH 12/12] USB: usbip: convert to use dev_groups
Date:   Tue,  6 Aug 2019 16:45:02 +0200
Message-Id: <20190806144502.17792-13-gregkh@linuxfoundation.org>
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

Cc: Valentina Manea <valentina.manea.m@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/usbip/stub_dev.c | 50 ++++++------------------------------
 1 file changed, 8 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 7931e6cecc70..2305d425e6c9 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -106,38 +106,13 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
 }
 static DEVICE_ATTR_WO(usbip_sockfd);
 
-static int stub_add_files(struct device *dev)
-{
-	int err = 0;
-
-	err = device_create_file(dev, &dev_attr_usbip_status);
-	if (err)
-		goto err_status;
-
-	err = device_create_file(dev, &dev_attr_usbip_sockfd);
-	if (err)
-		goto err_sockfd;
-
-	err = device_create_file(dev, &dev_attr_usbip_debug);
-	if (err)
-		goto err_debug;
-
-	return 0;
-
-err_debug:
-	device_remove_file(dev, &dev_attr_usbip_sockfd);
-err_sockfd:
-	device_remove_file(dev, &dev_attr_usbip_status);
-err_status:
-	return err;
-}
-
-static void stub_remove_files(struct device *dev)
-{
-	device_remove_file(dev, &dev_attr_usbip_status);
-	device_remove_file(dev, &dev_attr_usbip_sockfd);
-	device_remove_file(dev, &dev_attr_usbip_debug);
-}
+static struct attribute *usbip_attrs[] = {
+	&dev_attr_usbip_status.attr,
+	&dev_attr_usbip_sockfd.attr,
+	&dev_attr_usbip_debug.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(usbip);
 
 static void stub_shutdown_connection(struct usbip_device *ud)
 {
@@ -379,17 +354,8 @@ static int stub_probe(struct usb_device *udev)
 		goto err_port;
 	}
 
-	rc = stub_add_files(&udev->dev);
-	if (rc) {
-		dev_err(&udev->dev, "stub_add_files for %s\n", udev_busid);
-		goto err_files;
-	}
-
 	return 0;
 
-err_files:
-	usb_hub_release_port(udev->parent, udev->portnum,
-			     (struct usb_dev_state *) udev);
 err_port:
 	dev_set_drvdata(&udev->dev, NULL);
 	usb_put_dev(udev);
@@ -457,7 +423,6 @@ static void stub_disconnect(struct usb_device *udev)
 	/*
 	 * NOTE: rx/tx threads are invoked for each usb_device.
 	 */
-	stub_remove_files(&udev->dev);
 
 	/* release port */
 	rc = usb_hub_release_port(udev->parent, udev->portnum,
@@ -526,4 +491,5 @@ struct usb_device_driver stub_driver = {
 	.resume		= stub_resume,
 #endif
 	.supports_autosuspend	=	0,
+	.dev_groups	= usbip_groups,
 };
-- 
2.22.0

