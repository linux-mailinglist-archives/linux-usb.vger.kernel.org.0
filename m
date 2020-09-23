Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D6C2758FC
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgIWNoZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:33520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgIWNoV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=A0SLqdQOgt7r1yxVF4MnON32ZU4vIOB9jRiWgTSt+L4=;
        b=esDU2k41bvxKjjzDDZsqXmy+Riu2rJ0TkOfRRs7gS1p0iNuJr5Nbchp164DX9Gfx3DxKCq
        K3R8d3qMGXd9ElYelsoSuvPbkN/TqLRlb/7+RSLlGAjIiRKQmrRD0tB8YAXNDvztl7yVIg
        VBLzUzoAdwFmYRE/j/YR2rJk2FzOOCw=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7C833AD2C;
        Wed, 23 Sep 2020 13:44:55 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [RFC 12/14] sound: line6: move to use usb_control_msg_send() and usb_control_msg_recv()
Date:   Wed, 23 Sep 2020 15:43:46 +0200
Message-Id: <20200923134348.23862-13-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The usb_control_msg_send() and usb_control_msg_recv() calls can return
an error if a "short" write/read happens, and they can handle data off
of the stack, so move the driver over to using those calls instead,
saving some logic when dynamically allocating memory.

v2: API change of use usb_control_msg_send() and usb_control_msg_recv()

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200914153756.3412156-9-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/line6/driver.c   | 72 +++++++++++++++++++---------------------------
 sound/usb/line6/podhd.c    | 23 ++++++---------
 sound/usb/line6/toneport.c |  9 +++---
 3 files changed, 44 insertions(+), 60 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 60674ce4879b..a030dd65eb28 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -337,23 +337,18 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 {
 	struct usb_device *usbdev = line6->usbdev;
 	int ret;
-	unsigned char *len;
+	u8 len;
 	unsigned count;
 
 	if (address > 0xffff || datalen > 0xff)
 		return -EINVAL;
 
-	len = kmalloc(1, GFP_KERNEL);
-	if (!len)
-		return -ENOMEM;
-
 	/* query the serial number: */
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      (datalen << 8) | 0x21, address,
-			      NULL, 0, LINE6_TIMEOUT * HZ);
-
-	if (ret < 0) {
+	ret = usb_control_msg_send(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+				   (datalen << 8) | 0x21, address, NULL, 0,
+				   LINE6_TIMEOUT * HZ, GFP_KERNEL);
+	if (ret) {
 		dev_err(line6->ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
 	}
@@ -362,45 +357,42 @@ int line6_read_data(struct usb_line6 *line6, unsigned address, void *data,
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
 		mdelay(LINE6_READ_WRITE_STATUS_DELAY);
 
-		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
-				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
-				      USB_DIR_IN,
-				      0x0012, 0x0000, len, 1,
-				      LINE6_TIMEOUT * HZ);
-		if (ret < 0) {
+		ret = usb_control_msg_recv(usbdev, 0, 0x67,
+					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+					   0x0012, 0x0000, &len, 1,
+					   LINE6_TIMEOUT * HZ, GFP_KERNEL);
+		if (ret) {
 			dev_err(line6->ifcdev,
 				"receive length failed (error %d)\n", ret);
 			goto exit;
 		}
 
-		if (*len != 0xff)
+		if (len != 0xff)
 			break;
 	}
 
 	ret = -EIO;
-	if (*len == 0xff) {
+	if (len == 0xff) {
 		dev_err(line6->ifcdev, "read failed after %d retries\n",
 			count);
 		goto exit;
-	} else if (*len != datalen) {
+	} else if (len != datalen) {
 		/* should be equal or something went wrong */
 		dev_err(line6->ifcdev,
 			"length mismatch (expected %d, got %d)\n",
-			(int)datalen, (int)*len);
+			(int)datalen, len);
 		goto exit;
 	}
 
 	/* receive the result: */
-	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-			      0x0013, 0x0000, data, datalen,
-			      LINE6_TIMEOUT * HZ);
-
-	if (ret < 0)
+	ret = usb_control_msg_recv(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+				   0x0013, 0x0000, data, datalen, LINE6_TIMEOUT * HZ,
+				   GFP_KERNEL);
+	if (ret)
 		dev_err(line6->ifcdev, "read failed (error %d)\n", ret);
 
 exit:
-	kfree(len);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(line6_read_data);
@@ -423,12 +415,11 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 	if (!status)
 		return -ENOMEM;
 
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      0x0022, address, data, datalen,
-			      LINE6_TIMEOUT * HZ);
-
-	if (ret < 0) {
+	ret = usb_control_msg_send(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+				   0x0022, address, data, datalen, LINE6_TIMEOUT * HZ,
+				   GFP_KERNEL);
+	if (ret) {
 		dev_err(line6->ifcdev,
 			"write request failed (error %d)\n", ret);
 		goto exit;
@@ -437,14 +428,11 @@ int line6_write_data(struct usb_line6 *line6, unsigned address, void *data,
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
 		mdelay(LINE6_READ_WRITE_STATUS_DELAY);
 
-		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
-				      0x67,
-				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
-				      USB_DIR_IN,
-				      0x0012, 0x0000,
-				      status, 1, LINE6_TIMEOUT * HZ);
-
-		if (ret < 0) {
+		ret = usb_control_msg_recv(usbdev, 0, 0x67,
+					   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
+					   0x0012, 0x0000, status, 1, LINE6_TIMEOUT * HZ,
+					   GFP_KERNEL);
+		if (ret) {
 			dev_err(line6->ifcdev,
 				"receiving status failed (error %d)\n", ret);
 			goto exit;
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index eef45f7fef0d..28794a35949d 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -183,29 +183,25 @@ static const struct attribute_group podhd_dev_attr_group = {
 static int podhd_dev_start(struct usb_line6_podhd *pod)
 {
 	int ret;
-	u8 *init_bytes;
+	u8 init_bytes[8];
 	int i;
 	struct usb_device *usbdev = pod->line6.usbdev;
 
-	init_bytes = kmalloc(8, GFP_KERNEL);
-	if (!init_bytes)
-		return -ENOMEM;
-
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
+	ret = usb_control_msg_send(usbdev, 0,
 					0x67, USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 					0x11, 0,
-					NULL, 0, LINE6_TIMEOUT * HZ);
-	if (ret < 0) {
+					NULL, 0, LINE6_TIMEOUT * HZ, GFP_KERNEL);
+	if (ret) {
 		dev_err(pod->line6.ifcdev, "read request failed (error %d)\n", ret);
 		goto exit;
 	}
 
 	/* NOTE: looks like some kind of ping message */
-	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
+	ret = usb_control_msg_recv(usbdev, 0, 0x67,
 					USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 					0x11, 0x0,
-					init_bytes, 3, LINE6_TIMEOUT * HZ);
-	if (ret < 0) {
+					init_bytes, 3, LINE6_TIMEOUT * HZ, GFP_KERNEL);
+	if (ret) {
 		dev_err(pod->line6.ifcdev,
 			"receive length failed (error %d)\n", ret);
 		goto exit;
@@ -220,13 +216,12 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 			goto exit;
 	}
 
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
+	ret = usb_control_msg_send(usbdev, 0,
 					USB_REQ_SET_FEATURE,
 					USB_TYPE_STANDARD | USB_RECIP_DEVICE | USB_DIR_OUT,
 					1, 0,
-					NULL, 0, LINE6_TIMEOUT * HZ);
+					NULL, 0, LINE6_TIMEOUT * HZ, GFP_KERNEL);
 exit:
-	kfree(init_bytes);
 	return ret;
 }
 
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index 94dd5e7ab2e6..4e5693c97aa4 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -126,11 +126,12 @@ static int toneport_send_cmd(struct usb_device *usbdev, int cmd1, int cmd2)
 {
 	int ret;
 
-	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
-			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			      cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ);
+	ret = usb_control_msg_send(usbdev, 0, 0x67,
+				   USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
+				   cmd1, cmd2, NULL, 0, LINE6_TIMEOUT * HZ,
+				   GFP_KERNEL);
 
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&usbdev->dev, "send failed (error %d)\n", ret);
 		return ret;
 	}
-- 
2.16.4

