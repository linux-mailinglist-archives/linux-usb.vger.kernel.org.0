Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E0F2758F9
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIWNoW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:33436 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgIWNoT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=jWlZzVcLaX5SUMbRVSLkTMFn2o+DHHEtT5myBaffZPA=;
        b=NYKRF1l9vD5AdXT+5F5iSUK+FTgS09gjtQCuLHWufj0hu9vM0eaBNIS7u+l3fR/+efnPqw
        AsTNQURplOGq6L3tKpFqwyTUGSYQfniZaxaukDP/QXcG/VE0fVP0AV/L7AYi1LlIRxKMxU
        Z76l/8t+LtkRG8wq/OLCUWCfb+RxYEU=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D2954AC55;
        Wed, 23 Sep 2020 13:44:53 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 05/14] Revert "sound: 6fire: move to use usb_control_msg_send() and usb_control_msg_recv()"
Date:   Wed, 23 Sep 2020 15:43:39 +0200
Message-Id: <20200923134348.23862-6-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit aea67cc1418252d07b9b56688f1b5fa70fcae813.
The API has to be changed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 sound/usb/6fire/firmware.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 5b8994070c96..69137c14d0dc 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -158,17 +158,29 @@ static int usb6fire_fw_ihex_init(const struct firmware *fw,
 static int usb6fire_fw_ezusb_write(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	return usb_control_msg_send(device, 0, type,
-				    USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-				    value, 0, data, len, HZ);
+	int ret;
+
+	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0), type,
+			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			value, 0, data, len, HZ);
+	if (ret < 0)
+		return ret;
+	else if (ret != len)
+		return -EIO;
+	return 0;
 }
 
 static int usb6fire_fw_ezusb_read(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	return usb_control_msg_recv(device, 0, type,
-				    USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-				    value, 0, data, len, HZ);
+	int ret = usb_control_msg(device, usb_rcvctrlpipe(device, 0), type,
+			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE, value,
+			0, data, len, HZ);
+	if (ret < 0)
+		return ret;
+	else if (ret != len)
+		return -EIO;
+	return 0;
 }
 
 static int usb6fire_fw_fpga_write(struct usb_device *device,
@@ -218,7 +230,7 @@ static int usb6fire_fw_ezusb_upload(
 	/* upload firmware image */
 	data = 0x01; /* stop ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
-	if (ret) {
+	if (ret < 0) {
 		kfree(rec);
 		release_firmware(fw);
 		dev_err(&intf->dev,
@@ -230,7 +242,7 @@ static int usb6fire_fw_ezusb_upload(
 	while (usb6fire_fw_ihex_next_record(rec)) { /* write firmware */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, rec->address,
 				rec->data, rec->len);
-		if (ret) {
+		if (ret < 0) {
 			kfree(rec);
 			release_firmware(fw);
 			dev_err(&intf->dev,
@@ -245,7 +257,7 @@ static int usb6fire_fw_ezusb_upload(
 	if (postdata) { /* write data after firmware has been uploaded */
 		ret = usb6fire_fw_ezusb_write(device, 0xa0, postaddr,
 				postdata, postlen);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(&intf->dev,
 				"unable to upload ezusb firmware %s: post urb.\n",
 				fwname);
@@ -255,7 +267,7 @@ static int usb6fire_fw_ezusb_upload(
 
 	data = 0x00; /* resume ezusb cpu */
 	ret = usb6fire_fw_ezusb_write(device, 0xa0, 0xe600, &data, 1);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(&intf->dev,
 			"unable to upload ezusb firmware %s: end message.\n",
 			fwname);
@@ -290,7 +302,7 @@ static int usb6fire_fw_fpga_upload(
 	end = fw->data + fw->size;
 
 	ret = usb6fire_fw_ezusb_write(device, 8, 0, NULL, 0);
-	if (ret) {
+	if (ret < 0) {
 		kfree(buffer);
 		release_firmware(fw);
 		dev_err(&intf->dev,
@@ -315,7 +327,7 @@ static int usb6fire_fw_fpga_upload(
 	kfree(buffer);
 
 	ret = usb6fire_fw_ezusb_write(device, 9, 0, NULL, 0);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(&intf->dev,
 			"unable to upload fpga firmware: end urb.\n");
 		return ret;
@@ -351,7 +363,7 @@ int usb6fire_fw_init(struct usb_interface *intf)
 	u8 buffer[12];
 
 	ret = usb6fire_fw_ezusb_read(device, 1, 0, buffer, 8);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(&intf->dev,
 			"unable to receive device firmware state.\n");
 		return ret;
-- 
2.16.4

