Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7E725FD99
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 17:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgIGPxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 11:53:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:58686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730015AbgIGOvt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:51:49 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02F9621924;
        Mon,  7 Sep 2020 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599490279;
        bh=bOtNvPKd1buomuDeBpZzqGRO3R6GMfbAEg8/sDVnLbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1MHmCQfOr4X3wWjX6IQ3rwja05HHJTOw+UvuGXj0aN6axRPVil/jBk5r/UJEAR4aO
         Ssbim/0ObmcFTIK+FT6ffbI0q1Xr0aQYGv6PpRiWAJcwz7wCDbppmvBgjycqVqWR4J
         V5iFfXj0xM9h7kuUXf4PoM2CFpwjAufNO9gR0z9k=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org
Cc:     perex@perex.cz, tiwai@suse.com, stern@rowland.harvard.ed,
        linux-kernel@vger.kernel.org, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net
Subject: [PATCH v2 05/11] USB: legousbtower: use usb_control_msg_recv()
Date:   Mon,  7 Sep 2020 16:51:02 +0200
Message-Id: <20200907145108.3766613-6-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The usb_control_msg_recv() function can handle data on the stack, as
well as properly detecting short reads, so move to use that function
instead of the older usb_control_msg() call.  This ends up removing a
lot of extra lines in the driver.

Cc: Juergen Stuber <starblue@users.sourceforge.net>
Cc: legousb-devel@lists.sourceforge.net
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
 - no change from v1

 drivers/usb/misc/legousbtower.c | 60 +++++++++++----------------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index f922544056de..c3583df4c324 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -308,15 +308,9 @@ static int tower_open(struct inode *inode, struct file *file)
 	int subminor;
 	int retval = 0;
 	struct usb_interface *interface;
-	struct tower_reset_reply *reset_reply;
+	struct tower_reset_reply reset_reply;
 	int result;
 
-	reset_reply = kmalloc(sizeof(*reset_reply), GFP_KERNEL);
-	if (!reset_reply) {
-		retval = -ENOMEM;
-		goto exit;
-	}
-
 	nonseekable_open(inode, file);
 	subminor = iminor(inode);
 
@@ -347,15 +341,11 @@ static int tower_open(struct inode *inode, struct file *file)
 	}
 
 	/* reset the tower */
-	result = usb_control_msg(dev->udev,
-				 usb_rcvctrlpipe(dev->udev, 0),
-				 LEGO_USB_TOWER_REQUEST_RESET,
-				 USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				 0,
-				 0,
-				 reset_reply,
-				 sizeof(*reset_reply),
-				 1000);
+	result = usb_control_msg_recv(dev->udev, 0,
+				      LEGO_USB_TOWER_REQUEST_RESET,
+				      USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
+				      0, 0,
+				      &reset_reply, sizeof(reset_reply), 1000);
 	if (result < 0) {
 		dev_err(&dev->udev->dev,
 			"LEGO USB Tower reset control request failed\n");
@@ -394,7 +384,6 @@ static int tower_open(struct inode *inode, struct file *file)
 	mutex_unlock(&dev->lock);
 
 exit:
-	kfree(reset_reply);
 	return retval;
 }
 
@@ -753,7 +742,7 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	struct device *idev = &interface->dev;
 	struct usb_device *udev = interface_to_usbdev(interface);
 	struct lego_usb_tower *dev;
-	struct tower_get_version_reply *get_version_reply = NULL;
+	struct tower_get_version_reply get_version_reply;
 	int retval = -ENOMEM;
 	int result;
 
@@ -798,34 +787,25 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 	dev->interrupt_in_interval = interrupt_in_interval ? interrupt_in_interval : dev->interrupt_in_endpoint->bInterval;
 	dev->interrupt_out_interval = interrupt_out_interval ? interrupt_out_interval : dev->interrupt_out_endpoint->bInterval;
 
-	get_version_reply = kmalloc(sizeof(*get_version_reply), GFP_KERNEL);
-	if (!get_version_reply) {
-		retval = -ENOMEM;
-		goto error;
-	}
-
 	/* get the firmware version and log it */
-	result = usb_control_msg(udev,
-				 usb_rcvctrlpipe(udev, 0),
-				 LEGO_USB_TOWER_REQUEST_GET_VERSION,
-				 USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				 0,
-				 0,
-				 get_version_reply,
-				 sizeof(*get_version_reply),
-				 1000);
-	if (result != sizeof(*get_version_reply)) {
-		if (result >= 0)
-			result = -EIO;
+	result = usb_control_msg_recv(udev, 0,
+				      LEGO_USB_TOWER_REQUEST_GET_VERSION,
+				      USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
+				      0,
+				      0,
+				      &get_version_reply,
+				      sizeof(get_version_reply),
+				      1000);
+	if (!result) {
 		dev_err(idev, "get version request failed: %d\n", result);
 		retval = result;
 		goto error;
 	}
 	dev_info(&interface->dev,
 		 "LEGO USB Tower firmware version is %d.%d build %d\n",
-		 get_version_reply->major,
-		 get_version_reply->minor,
-		 le16_to_cpu(get_version_reply->build_no));
+		 get_version_reply.major,
+		 get_version_reply.minor,
+		 le16_to_cpu(get_version_reply.build_no));
 
 	/* we can register the device now, as it is ready */
 	usb_set_intfdata(interface, dev);
@@ -844,11 +824,9 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_
 		 USB_MAJOR, dev->minor);
 
 exit:
-	kfree(get_version_reply);
 	return retval;
 
 error:
-	kfree(get_version_reply);
 	tower_delete(dev);
 	return retval;
 }
-- 
2.28.0

