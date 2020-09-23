Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554C2275901
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgIWNoa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:33286 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgIWNoS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=V6JRcipxax8FcSm4zmu9Qp+/xjOsZSxBR9zTTxqihxc=;
        b=rEQ7U6urZ0rygxvWqor5CT7txptNaEWAWL7zyQAFZaCI2UC9i53x2wOgT+HfdwLiUoJAFw
        mewRR9OvnfgKg144HLipECuuyFI7Q9IMN5wGSEP8Cqlr8CagBdPrFaCbi8wJrxX4/H8Vks
        yN2052oBOr9ra+k/MAm4Ay+Gywfine8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9C6B7ADBB;
        Wed, 23 Sep 2020 13:44:53 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 04/14] Revert "sound: line6: move to use usb_control_msg_send() and usb_control_msg_recv()"
Date:   Wed, 23 Sep 2020 15:43:38 +0200
Message-Id: <20200923134348.23862-5-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit f7ef7614f89e943d7511ee121b0b849f27b60cb2.
The API has to be changed.
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 sound/usb/line6/driver.c   | 69 ++++++++++++++++++++++++++++------------------
 sound/usb/line6/podhd.c    | 17 ++++++++----
 sound/usb/line6/toneport.c |  8 +++---
 3 files changed, 57 insertions(+), 37 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 601292c51491..60674ce4879b 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -337,18 +337,23 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 {
 	struct usb_device *usbdev = line6->usbdev;
 	int ret;
-	u8 len;
+	unsigned char *len;
 	unsigned count;
 
 	if (address > 0xffff || datalen > 0xff)
 		return -EINVAL;
 
+	len = kmalloc(1, GFP_KERNEL);
+	if (!len)
+		return -ENOMEM;
+
 	/* query the serial number: */
-	ret = usb_control_msg_send(usbdev, 0, 0x67,
-				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-				   (datalen << 8) | 0x21, address, NULL, 0,
-				   LINE6_TIMEOUT * HZ);
-	if (ret) {
+	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      (datalen << 8) | 0x21, address,
+			      NULL, 0, LINE6_TIMEOUT * HZ);
+
+	if (ret < 0) {
 		dev_err(line6->ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
 	}
@@ -357,41 +362,45 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
 		mdelay(LINE6_READ_WRITE_STATUS_DELAY);
 
-		ret = usb_control_msg_recv(usbdev, 0, 0x67,
-					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-					   0x0012, 0x0000, &len, 1,
-					   LINE6_TIMEOUT * HZ);
-		if (ret) {
+		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
+				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
+				      USB_DIR_IN,
+				      0x0012, 0x0000, len, 1,
+				      LINE6_TIMEOUT * HZ);
+		if (ret < 0) {
 			dev_err(line6->ifcdev,
 				"receive length failed (error %d)\n", ret);
 			goto exit;
 		}
 
-		if (len != 0xff)
+		if (*len != 0xff)
 			break;
 	}
 
 	ret = -EIO;
-	if (len == 0xff) {
+	if (*len == 0xff) {
 		dev_err(line6->ifcdev, "read failed after %d retries\n",
 			count);
 		goto exit;
-	} else if (len != datalen) {
+	} else if (*len != datalen) {
 		/* should be equal or something went wrong */
 		dev_err(line6->ifcdev,
 			"length mismatch (expected %d, got %d)\n",
-			(int)datalen, len);
+			(int)datalen, (int)*len);
 		goto exit;
 	}
 
 	/* receive the result: */
-	ret = usb_control_msg_recv(usbdev, 0, 0x67,
-				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-				   0x0013, 0x0000, data, datalen, LINE6_TIMEOUT * HZ);
-	if (ret)
+	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+			      0x0013, 0x0000, data, datalen,
+			      LINE6_TIMEOUT * HZ);
+
+	if (ret < 0)
 		dev_err(line6->ifcdev, "read failed (error %d)\n", ret);
 
 exit:
+	kfree(len);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(line6_read_data);
@@ -414,10 +423,12 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 	if (!status)
 		return -ENOMEM;
 
-	ret = usb_control_msg_send(usbdev, 0, 0x67,
-				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-				   0x0022, address, data, datalen, LINE6_TIMEOUT * HZ);
-	if (ret) {
+	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      0x0022, address, data, datalen,
+			      LINE6_TIMEOUT * HZ);
+
+	if (ret < 0) {
 		dev_err(line6->ifcdev,
 			"write request failed (error %d)\n", ret);
 		goto exit;
@@ -426,10 +437,14 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
 		mdelay(LINE6_READ_WRITE_STATUS_DELAY);
 
-		ret = usb_control_msg_recv(usbdev, 0, 0x67,
-					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-					   0x0012, 0x0000, status, 1, LINE6_TIMEOUT * HZ);
-		if (ret) {
+		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
+				      0x67,
+				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
+				      USB_DIR_IN,
+				      0x0012, 0x0000,
+				      status, 1, LINE6_TIMEOUT * HZ);
+
+		if (ret < 0) {
 			dev_err(line6->ifcdev,
 				"receiving status failed (error %d)\n", ret);
 			goto exit;
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index a1261f55d62b..eef45f7fef0d 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -183,25 +183,29 @@ static const struct attribute_group podhd_dev_attr_group = {
 static int podhd_dev_start(struct usb_line6_podhd *pod)
 {
 	int ret;
-	u8 init_bytes[8];
+	u8 *init_bytes;
 	int i;
 	struct usb_device *usbdev = pod->line6.usbdev;
 
-	ret = usb_control_msg_send(usbdev, 0,
+	init_bytes = kmalloc(8, GFP_KERNEL);
+	if (!init_bytes)
+		return -ENOMEM;
+
+	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
 					0x67, USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 					0x11, 0,
 					NULL, 0, LINE6_TIMEOUT * HZ);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(pod->line6.ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
 	}
 
 	/* NOTE: looks like some kind of ping message */
-	ret = usb_control_msg_recv(usbdev, 0, 0x67,
+	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
 					USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 					0x11, 0x0,
 					init_bytes, 3, LINE6_TIMEOUT * HZ);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(pod->line6.ifcdev,
 			"receive length failed (error %d)\n", ret);
 		goto exit;
@@ -216,12 +220,13 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 			goto exit;
 	}
 
-	ret = usb_control_msg_send(usbdev, 0,
+	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
 					USB_REQ_SET_FEATURE,
 					USB_TYPE_STANDARD | USB_RECIP_DEVICE | USB_DIR_OUT,
 					1, 0,
 					NULL, 0, LINE6_TIMEOUT * HZ);
 exit:
+	kfree(init_bytes);
 	return ret;
 }
 
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index a9b56085b76a..94dd5e7ab2e6 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -126,11 +126,11 @@ static int toneport_send_cmd(struct usb_device *usbdev, int cmd1, int cmd2)
 {
 	int ret;
 
-	ret = usb_control_msg_send(usbdev, 0, 0x67,
-				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-				   cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ);
+	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
+			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+			      cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ);
 
-	if (ret) {
+	if (ret < 0) {
 		dev_err(&usbdev->dev, "send failed (error %d)\n", ret);
 		return ret;
 	}
-- 
2.16.4

