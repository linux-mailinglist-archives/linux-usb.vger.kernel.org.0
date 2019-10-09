Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CD4D06BF
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 06:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfJIEty (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 00:49:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39040 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbfJIEty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 00:49:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id r3so931135wrj.6
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 21:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GB13OXScJEcqzjyQZ1NBr9EE56wlbKuTYrNv/Sb2q4g=;
        b=XW+sIBEf8RkqXTZns/zP5cOmWzbiIdntngX5mnVjrG3HV2tT8iR5kOVpoH4YJKO8+o
         Yqess0E/cTUBFTEP7Ls/KXvju8hOHPpczWGK3uKF0eRWbQwxHRCDmI4cR5tMLzuSc8nU
         8JBNPS2hncTUV7K0g/hOFjUUn2DiRmsdUCiSCaAKv4EJ0yQEApS9GvwrU5PbIXH+pWih
         AE9dFZMtCoXdPB+MotOvRW0ID0BnU9QFJHGeD1rrCsnI6mPiKwo+vluTYwK6Q7g+9uHd
         buDi7XHeOf1tSqyEh0mw2gSI0PtYyUyQuvuwmA1tvxEJlwz3yBuw3YTRhbeWGBk/MKXd
         w/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GB13OXScJEcqzjyQZ1NBr9EE56wlbKuTYrNv/Sb2q4g=;
        b=SofBRta1A1IvVqCFc7XXd3aMy7EXMmpt5VVCmBLotz+6I98Sn6phZ29q80Vck+ZHWV
         pkSsq0+MXhr9iAyEgu+yuXWM3pZJWsV19VIT6+I2LetGrC11NiI3ZsilshafJLcmKRwJ
         1YRC/0pN3QmivdM/Z6sbroGAtz0NuetCi+NNt7Mka8KbIeMUmviUc9fQlUeSGXkxTP+C
         XDR00K1HD5pRdne0Ik4wQuAteTlRotAQTVsniW+3VzWWO0/PVWBP5Rr/SsuXOcMZn5A3
         1wHrHhw++ZD/OuKfrwSzS7R/uw7DjBlQY5gwQwieGJdysdf9bJpoXctaPARF/XvOev5d
         uiaA==
X-Gm-Message-State: APjAAAUQf1SGVf1wjHNEOQh9mjpM9sJytz1zG6X7ssYpw4hLaEHQi22z
        mcvPaCmQQrReLDwX0Ph65YE=
X-Google-Smtp-Source: APXvYqy8ewh2aKEuN5s50ol+dT+zakYeJXt+WJVWTwaFZbcIHj7T2TBZODsrVNXSKFsw0OziZR7Bpg==
X-Received: by 2002:adf:e646:: with SMTP id b6mr1037069wrn.373.1570596591135;
        Tue, 08 Oct 2019 21:49:51 -0700 (PDT)
Received: from dhe-pc.product_development.local (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.googlemail.com with ESMTPSA id y18sm2034599wro.36.2019.10.08.21.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 21:49:50 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org,
        David Heinzelmann <heinzelmann.david@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5] usb: hub: Check device descriptor before resusciation
Date:   Wed,  9 Oct 2019 06:46:47 +0200
Message-Id: <20191009044647.24536-1-heinzelmann.david@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007153538.GA985210@kroah.com>
References: <20191007153538.GA985210@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a device connected to an xHCI host controller disconnects from the USB bus
and then reconnects, e.g. triggered by a firmware update, then the host
controller automatically activates the connection and the port is enabled. The
implementation of hub_port_connect_change() assumes that if the port is
enabled then nothing has changed. There is no check if the USB descriptors
have changed. As a result, the kernel's internal copy of the descriptors ends
up being incorrect and the device doesn't work properly anymore.

The solution to the problem is for hub_port_connect_change() always to
check whether the device's descriptors have changed before resuscitating
an enabled port.

Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in v5:
 - added Acked-by
Changes in v4:
 - changed commit description
Changes in v3:
 - changed commit message and description
 - fix code style
Changes in v2:
 - fix logic error to handle return code from usb_get_device_descriptor()
   properly
 - fix line endings
---
 drivers/usb/core/hub.c | 196 +++++++++++++++++++++++------------------
 1 file changed, 111 insertions(+), 85 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 236313f41f4a..fdcfa85b5b12 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4930,6 +4930,91 @@ hub_power_remaining(struct usb_hub *hub)
 	return remaining;
 }
 
+
+static int descriptors_changed(struct usb_device *udev,
+		struct usb_device_descriptor *old_device_descriptor,
+		struct usb_host_bos *old_bos)
+{
+	int		changed = 0;
+	unsigned	index;
+	unsigned	serial_len = 0;
+	unsigned	len;
+	unsigned	old_length;
+	int		length;
+	char		*buf;
+
+	if (memcmp(&udev->descriptor, old_device_descriptor,
+			sizeof(*old_device_descriptor)) != 0)
+		return 1;
+
+	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
+		return 1;
+	if (udev->bos) {
+		len = le16_to_cpu(udev->bos->desc->wTotalLength);
+		if (len != le16_to_cpu(old_bos->desc->wTotalLength))
+			return 1;
+		if (memcmp(udev->bos->desc, old_bos->desc, len))
+			return 1;
+	}
+
+	/* Since the idVendor, idProduct, and bcdDevice values in the
+	 * device descriptor haven't changed, we will assume the
+	 * Manufacturer and Product strings haven't changed either.
+	 * But the SerialNumber string could be different (e.g., a
+	 * different flash card of the same brand).
+	 */
+	if (udev->serial)
+		serial_len = strlen(udev->serial) + 1;
+
+	len = serial_len;
+	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
+		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
+		len = max(len, old_length);
+	}
+
+	buf = kmalloc(len, GFP_NOIO);
+	if (!buf)
+		/* assume the worst */
+		return 1;
+
+	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
+		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
+		length = usb_get_descriptor(udev, USB_DT_CONFIG, index, buf,
+				old_length);
+		if (length != old_length) {
+			dev_dbg(&udev->dev, "config index %d, error %d\n",
+					index, length);
+			changed = 1;
+			break;
+		}
+		if (memcmp(buf, udev->rawdescriptors[index], old_length)
+				!= 0) {
+			dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
+				index,
+				((struct usb_config_descriptor *) buf)->
+					bConfigurationValue);
+			changed = 1;
+			break;
+		}
+	}
+
+	if (!changed && serial_len) {
+		length = usb_string(udev, udev->descriptor.iSerialNumber,
+				buf, serial_len);
+		if (length + 1 != serial_len) {
+			dev_dbg(&udev->dev, "serial string error %d\n",
+					length);
+			changed = 1;
+		} else if (memcmp(buf, udev->serial, length) != 0) {
+			dev_dbg(&udev->dev, "serial string changed\n");
+			changed = 1;
+		}
+	}
+
+	kfree(buf);
+	return changed;
+}
+
 static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		u16 portchange)
 {
@@ -5167,7 +5252,9 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 {
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_device *udev = port_dev->child;
+	struct usb_device_descriptor descriptor;
 	int status = -ENODEV;
+	int retval;
 
 	dev_dbg(&port_dev->dev, "status %04x, change %04x, %s\n", portstatus,
 			portchange, portspeed(hub, portstatus));
@@ -5188,7 +5275,30 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 	if ((portstatus & USB_PORT_STAT_CONNECTION) && udev &&
 			udev->state != USB_STATE_NOTATTACHED) {
 		if (portstatus & USB_PORT_STAT_ENABLE) {
-			status = 0;		/* Nothing to do */
+			/*
+			 * USB-3 connections are initialized automatically by
+			 * the hostcontroller hardware. Therefore check for
+			 * changed device descriptors before resuscitating the
+			 * device.
+			 */
+			descriptor = udev->descriptor;
+			retval = usb_get_device_descriptor(udev,
+					sizeof(udev->descriptor));
+			if (retval < 0) {
+				dev_dbg(&udev->dev,
+						"can't read device descriptor %d\n",
+						retval);
+			} else {
+				if (descriptors_changed(udev, &descriptor,
+						udev->bos)) {
+					dev_dbg(&udev->dev,
+							"device descriptor has changed\n");
+					/* for disconnect() calls */
+					udev->descriptor = descriptor;
+				} else {
+					status = 0; /* Nothing to do */
+				}
+			}
 #ifdef CONFIG_PM
 		} else if (udev->state == USB_STATE_SUSPENDED &&
 				udev->persist_enabled) {
@@ -5550,90 +5660,6 @@ void usb_hub_cleanup(void)
 	usb_deregister(&hub_driver);
 } /* usb_hub_cleanup() */
 
-static int descriptors_changed(struct usb_device *udev,
-		struct usb_device_descriptor *old_device_descriptor,
-		struct usb_host_bos *old_bos)
-{
-	int		changed = 0;
-	unsigned	index;
-	unsigned	serial_len = 0;
-	unsigned	len;
-	unsigned	old_length;
-	int		length;
-	char		*buf;
-
-	if (memcmp(&udev->descriptor, old_device_descriptor,
-			sizeof(*old_device_descriptor)) != 0)
-		return 1;
-
-	if ((old_bos && !udev->bos) || (!old_bos && udev->bos))
-		return 1;
-	if (udev->bos) {
-		len = le16_to_cpu(udev->bos->desc->wTotalLength);
-		if (len != le16_to_cpu(old_bos->desc->wTotalLength))
-			return 1;
-		if (memcmp(udev->bos->desc, old_bos->desc, len))
-			return 1;
-	}
-
-	/* Since the idVendor, idProduct, and bcdDevice values in the
-	 * device descriptor haven't changed, we will assume the
-	 * Manufacturer and Product strings haven't changed either.
-	 * But the SerialNumber string could be different (e.g., a
-	 * different flash card of the same brand).
-	 */
-	if (udev->serial)
-		serial_len = strlen(udev->serial) + 1;
-
-	len = serial_len;
-	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
-		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
-		len = max(len, old_length);
-	}
-
-	buf = kmalloc(len, GFP_NOIO);
-	if (!buf)
-		/* assume the worst */
-		return 1;
-
-	for (index = 0; index < udev->descriptor.bNumConfigurations; index++) {
-		old_length = le16_to_cpu(udev->config[index].desc.wTotalLength);
-		length = usb_get_descriptor(udev, USB_DT_CONFIG, index, buf,
-				old_length);
-		if (length != old_length) {
-			dev_dbg(&udev->dev, "config index %d, error %d\n",
-					index, length);
-			changed = 1;
-			break;
-		}
-		if (memcmp(buf, udev->rawdescriptors[index], old_length)
-				!= 0) {
-			dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
-				index,
-				((struct usb_config_descriptor *) buf)->
-					bConfigurationValue);
-			changed = 1;
-			break;
-		}
-	}
-
-	if (!changed && serial_len) {
-		length = usb_string(udev, udev->descriptor.iSerialNumber,
-				buf, serial_len);
-		if (length + 1 != serial_len) {
-			dev_dbg(&udev->dev, "serial string error %d\n",
-					length);
-			changed = 1;
-		} else if (memcmp(buf, udev->serial, length) != 0) {
-			dev_dbg(&udev->dev, "serial string changed\n");
-			changed = 1;
-		}
-	}
-
-	kfree(buf);
-	return changed;
-}
-
 /**
  * usb_reset_and_verify_device - perform a USB port reset to reinitialize a device
  * @udev: device to reset (not in SUSPENDED or NOTATTACHED state)
-- 
2.20.1

