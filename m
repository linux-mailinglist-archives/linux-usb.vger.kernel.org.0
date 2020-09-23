Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F958275900
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgIWNo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:33506 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgIWNoU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=bF/M6kO+6HGy/pk4qX7hm30BYO7RKvsPIUtHc1S91pU=;
        b=jpf0lZ2OuXtLq6Z04fQeVD3tQz8wyp46hWX2mXvByJrQv4nl2O7jTHKqXMov2ktGpJJwgs
        PMsnZ0tdOhp0aJhiDvJtWGYGCiLaPLu+xkNX1GDiJ4nGarMbikNGtvz/QE+RU6b+z81i6m
        rFpMyBRz56jb+FqK5ES74CvbvTMQd2M=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F2111B1AB;
        Wed, 23 Sep 2020 13:44:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>
Subject: [RFC 10/14] sound: 6fire: move to use usb_control_msg_send() and usb_control_msg_recv()
Date:   Wed, 23 Sep 2020 15:43:44 +0200
Message-Id: <20200923134348.23862-11-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The usb_control_msg_send() and usb_control_msg_recv() calls can return
an error if a "short" write/read happens, so move the driver over to
using those calls instead, saving some logic in the wrapper functions
that were being used in this driver.

This also resolves a long-staging bug where data on the stack was being
sent in a USB control message, which was not allowed.

v2: API change of usb_control_msg_send()

Cc: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200914153756.3412156-8-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/6fire/firmware.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 69137c14d0dc..8981e61f2da4 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -158,29 +158,17 @@ static int usb6fire_fw_ihex_init(const struct firmware *fw,
 static int usb6fire_fw_ezusb_write(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	int ret;
-
-	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0), type,
-			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-			value, 0, data, len, HZ);
-	if (ret < 0)
-		return ret;
-	else if (ret != len)
-		return -EIO;
-	return 0;
+	return usb_control_msg_send(device, 0, type,
+				    USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				    value, 0, data, len, HZ, GFP_KERNEL);
 }
 
 static int usb6fire_fw_ezusb_read(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	int ret = usb_control_msg(device, usb_rcvctrlpipe(device, 0), type,
-			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE, value,
-			0, data, len, HZ);
-	if (ret < 0)
-		return ret;
-	else if (ret != len)
-		return -EIO;
-	return 0;
+	return usb_control_msg_recv(device, 0, type,
+				    USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				    value, 0, data, len, HZ, GFP_KERNEL);
 }
 
 static int usb6fire_fw_fpga_write(struct usb_device *device,
@@ -230,7 +218,7 @@ static int usb6fire_fw_ezusb_upload(
 	/* upload firmware image */
 	data = 0x01; /* stop ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
-	if (ret < 0) {
+	if (ret) {
 		kfree(rec);
 		release_firmware(fw);
 		dev_err(&intf->dev,
@@ -242,7 +230,7 @@ static int usb6fire_fw_ezusb_upload(
 	while (usb6fire_fw_ihex_next_record(rec)) { /* write firmware */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, rec->address,
 				rec->data, rec->len);
-		if (ret < 0) {
+		if (ret) {
 			kfree(rec);
 			release_firmware(fw);
 			dev_err(&intf->dev,
@@ -257,7 +245,7 @@ static int usb6fire_fw_ezusb_upload(
 	if (postdata) { /* write data after firmware has been uploaded */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, postaddr,
 				postdata, postlen);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(&intf->dev,
 				"unable to upload ezusb firmware %s: post urb.\n",
 				fwname);
@@ -267,7 +255,7 @@ static int usb6fire_fw_ezusb_upload(
 
 	data = 0x00; /* resume ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&intf->dev,
 			"unable to upload ezusb firmware %s: end message.\n",
 			fwname);
@@ -302,7 +290,7 @@ static int usb6fire_fw_fpga_upload(
 	end = fw->data + fw->size;
 
 	ret = usb6fire_fw_ezusb_write(device, 8, 0, NULL, 0);
-	if (ret < 0) {
+	if (ret) {
 		kfree(buffer);
 		release_firmware(fw);
 		dev_err(&intf->dev,
@@ -327,7 +315,7 @@ static int usb6fire_fw_fpga_upload(
 	kfree(buffer);
 
 	ret = usb6fire_fw_ezusb_write(device, 9, 0, NULL, 0);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&intf->dev,
 			"unable to upload fpga firmware: end urb.\n");
 		return ret;
@@ -363,7 +351,7 @@ int usb6fire_fw_init(struct usb_interface *intf)
 	u8 buffer[12];
 
 	ret = usb6fire_fw_ezusb_read(device, 1, 0, buffer, 8);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&intf->dev,
 			"unable to receive device firmware state.\n");
 		return ret;
-- 
2.16.4

