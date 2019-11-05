Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50467EFB7F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 11:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388752AbfKEKgr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 05:36:47 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41732 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388643AbfKEKgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 05:36:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id m9so21167629ljh.8
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 02:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ioe9GPDGvuZyKn6ebVigNEF06QTE8TyNHyGBEUos8jo=;
        b=McCyO1wP2e/IGgnfWvRv563CQvrUOHdzDJPUljhuaxRBrr2ulpkyq/OguyXBfY0CGm
         NoOOFpV9KbfWSRkiQPHVk0XN8lkzKhEwvufM7EvKZmUsiXrs2TqLV2lXY/OwMO+q7Tz9
         7/h40oZilprcxf4plE6gA5ny6NDq0CJK91DAyL1WFeYMsaMnGEOAN9UMp6Y0OmTbDYag
         INSdRi2itWcxIBBSusZtSaGoO0OGTMpw4oBhKblLpm+xQrs/f7fugvY+VqpfGHBDhPhm
         A+rsZnfRiOyhTGnYADh4p0E6mZ/AHuywZa+HAtIPC2IoIpHZo196FvxJ62rh8bu7YJ7c
         vidQ==
X-Gm-Message-State: APjAAAU1t6P3o2uj9uqXaIIWTMgyVbcxzMTcrKFQyEcc6FJytcx/7xMd
        atGSxkGZ9VrDdM3Trdly1ks=
X-Google-Smtp-Source: APXvYqwDlfmOtngNsOlIZgMmd4GovJcs/EwZwJTcPYLQ9UsRGTjEFKIL/Bityk4IMnS9q9dd8lTFqQ==
X-Received: by 2002:a2e:994f:: with SMTP id r15mr7221092ljj.18.1572950204482;
        Tue, 05 Nov 2019 02:36:44 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id k19sm8809547ljg.18.2019.11.05.02.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:36:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRwCZ-0001IL-3l; Tue, 05 Nov 2019 11:36:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/3] USB: idmouse: simplify disconnect handling
Date:   Tue,  5 Nov 2019 11:36:36 +0100
Message-Id: <20191105103638.4929-2-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105103638.4929-1-johan@kernel.org>
References: <20191105103638.4929-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit d4ead16f50f9 ("USB: prevent char device open/deregister
race") core prevents further calls to open() after usb_deregister_dev()
returns so there's no need to use the interface data for
synchronisation.

This effectively reverts commit 54d2bc068fd2 ("USB: fix locking in
idmouse") with respect to the open-disconnect race.

Note that the driver already uses a present flag to suppress I/O post
disconnect (even if all USB I/O take place at open).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/idmouse.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/misc/idmouse.c b/drivers/usb/misc/idmouse.c
index 20b0f91a5d9b..0386bac224c4 100644
--- a/drivers/usb/misc/idmouse.c
+++ b/drivers/usb/misc/idmouse.c
@@ -60,7 +60,6 @@ static const struct usb_device_id idmouse_table[] = {
 	USB_TYPE_VENDOR | USB_RECIP_ENDPOINT | USB_DIR_OUT, value, index, NULL, 0, 1000)
 
 MODULE_DEVICE_TABLE(usb, idmouse_table);
-static DEFINE_MUTEX(open_disc_mutex);
 
 /* structure to hold all of our device specific stuff */
 struct usb_idmouse {
@@ -227,17 +226,13 @@ static int idmouse_open(struct inode *inode, struct file *file)
 	if (!interface)
 		return -ENODEV;
 
-	mutex_lock(&open_disc_mutex);
 	/* get the device information block from the interface */
 	dev = usb_get_intfdata(interface);
-	if (!dev) {
-		mutex_unlock(&open_disc_mutex);
+	if (!dev)
 		return -ENODEV;
-	}
 
 	/* lock this device */
 	mutex_lock(&dev->lock);
-	mutex_unlock(&open_disc_mutex);
 
 	/* check if already open */
 	if (dev->open) {
@@ -280,14 +275,12 @@ static int idmouse_release(struct inode *inode, struct file *file)
 	if (dev == NULL)
 		return -ENODEV;
 
-	mutex_lock(&open_disc_mutex);
 	/* lock our device */
 	mutex_lock(&dev->lock);
 
 	/* are we really open? */
 	if (dev->open <= 0) {
 		mutex_unlock(&dev->lock);
-		mutex_unlock(&open_disc_mutex);
 		return -ENODEV;
 	}
 
@@ -296,11 +289,9 @@ static int idmouse_release(struct inode *inode, struct file *file)
 	if (!dev->present) {
 		/* the device was unplugged before the file was released */
 		mutex_unlock(&dev->lock);
-		mutex_unlock(&open_disc_mutex);
 		idmouse_delete(dev);
 	} else {
 		mutex_unlock(&dev->lock);
-		mutex_unlock(&open_disc_mutex);
 	}
 	return 0;
 }
@@ -379,7 +370,6 @@ static int idmouse_probe(struct usb_interface *interface,
 	if (result) {
 		/* something prevented us from registering this device */
 		dev_err(&interface->dev, "Unable to allocate minor number.\n");
-		usb_set_intfdata(interface, NULL);
 		idmouse_delete(dev);
 		return result;
 	}
@@ -392,19 +382,13 @@ static int idmouse_probe(struct usb_interface *interface,
 
 static void idmouse_disconnect(struct usb_interface *interface)
 {
-	struct usb_idmouse *dev;
-
-	/* get device structure */
-	dev = usb_get_intfdata(interface);
+	struct usb_idmouse *dev = usb_get_intfdata(interface);
 
 	/* give back our minor */
 	usb_deregister_dev(interface, &idmouse_class);
 
-	mutex_lock(&open_disc_mutex);
-	usb_set_intfdata(interface, NULL);
 	/* lock the device */
 	mutex_lock(&dev->lock);
-	mutex_unlock(&open_disc_mutex);
 
 	/* prevent device read, write and ioctl */
 	dev->present = 0;
-- 
2.23.0

