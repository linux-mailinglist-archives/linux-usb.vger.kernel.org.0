Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B6D2758F7
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgIWNoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:33442 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgIWNoT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=vfC9XPNad+kdZK1rgemg6BP3RZYWacVZU0lxrppC9Lc=;
        b=s51Yd8db9ccRb+7WiAuENgjo0NO8v5sWqPXOGDt8T1034qClHC5HFIi07AGWDBM6Luoto/
        f2s5LujxYG+JFRYnrb9HbA95t2V96kPy6H4rtym0ACJdoECx14jFGV2Rvi5oU3E75522mW
        qFzS581omUDJk0vSk8HlDvFVnq0UVvI=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4A17EB164;
        Wed, 23 Sep 2020 13:44:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 07/14] Revert "USB: legousbtower: use usb_control_msg_recv()"
Date:   Wed, 23 Sep 2020 15:43:41 +0200
Message-Id: <20200923134348.23862-8-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit be40c366416bf6ff74b25fd02e38cb6eaba497d1.
The API has to be changed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/legousbtower.c | 60 ++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index c3583df4c324..f922544056de 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -308,9 +308,15 @@ static int tower_open(struct inode *inode, struct file *file)
 	int subminor;
 	int retval = 0;
 	struct usb_interface *interface;
-	struct tower_reset_reply reset_reply;
+	struct tower_reset_reply *reset_reply;
 	int result;
 
+	reset_reply = kmalloc(sizeof(*reset_reply), GFP_KERNEL);
+	if (!reset_reply) {
+		retval = -ENOMEM;
+		goto exit;
+	}
+
 	nonseekable_open(inode, file);
 	subminor = iminor(inode);
 
@@ -341,11 +347,15 @@ static int tower_open(struct inode *inode, struct file *file)
 	}
 
 	/* reset the tower */
-	result = usb_control_msg_recv(dev->udev, 0,
-				      LEGO_USB_TOWER_REQUEST_RESET,
-				      USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				      0, 0,
-				      &reset_reply, sizeof(reset_reply), 1000);
+	result = usb_control_msg(dev->udev,
+				 usb_rcvctrlpipe(dev->udev, 0),
+				 LEGO_USB_TOWER_REQUEST_RESET,
+				 USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
+				 0,
+				 0,
+				 reset_reply,
+				 sizeof(*reset_reply),
+				 1000);
 	if (result < 0) {
 		dev_err(&dev->udev->dev,
 			"LEGO USB Tower reset control request failed\n");
@@ -384,6 +394,7 @@ static int tower_open(struct inode *inode, struct file *file)
 	mutex_unlock(&dev->lock);
 
 exit:
+	kfree(reset_reply);
 	return retval;
 }
 
@@ -742,7 +753,7 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	struct device *idev = &interface->dev;
 	struct usb_device *udev = interface_to_usbdev(interface);
 	struct lego_usb_tower *dev;
-	struct tower_get_version_reply get_version_reply;
+	struct tower_get_version_reply *get_version_reply = NULL;
 	int retval = -ENOMEM;
 	int result;
 
@@ -787,25 +798,34 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	dev->interrupt_in_interval = interrupt_in_interval ? interrupt_in_interval : dev->interrupt_in_endpoint->bInterval;
 	dev->interrupt_out_interval = interrupt_out_interval ? interrupt_out_interval : dev->interrupt_out_endpoint->bInterval;
 
+	get_version_reply = kmalloc(sizeof(*get_version_reply), GFP_KERNEL);
+	if (!get_version_reply) {
+		retval = -ENOMEM;
+		goto error;
+	}
+
 	/* get the firmware version and log it */
-	result = usb_control_msg_recv(udev, 0,
-				      LEGO_USB_TOWER_REQUEST_GET_VERSION,
-				      USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				      0,
-				      0,
-				      &get_version_reply,
-				      sizeof(get_version_reply),
-				      1000);
-	if (!result) {
+	result = usb_control_msg(udev,
+				 usb_rcvctrlpipe(udev, 0),
+				 LEGO_USB_TOWER_REQUEST_GET_VERSION,
+				 USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
+				 0,
+				 0,
+				 get_version_reply,
+				 sizeof(*get_version_reply),
+				 1000);
+	if (result != sizeof(*get_version_reply)) {
+		if (result >= 0)
+			result = -EIO;
 		dev_err(idev, "get version request failed: %d\n", result);
 		retval = result;
 		goto error;
 	}
 	dev_info(&interface->dev,
 		 "LEGO USB Tower firmware version is %d.%d build %d\n",
-		 get_version_reply.major,
-		 get_version_reply.minor,
-		 le16_to_cpu(get_version_reply.build_no));
+		 get_version_reply->major,
+		 get_version_reply->minor,
+		 le16_to_cpu(get_version_reply->build_no));
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(interface, dev);
@@ -824,9 +844,11 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 		 USB_MAJOR, dev->minor);
 
 exit:
+	kfree(get_version_reply);
 	return retval;
 
 error:
+	kfree(get_version_reply);
 	tower_delete(dev);
 	return retval;
 }
-- 
2.16.4

