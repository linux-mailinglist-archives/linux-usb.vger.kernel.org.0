Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 364C9CF272
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 08:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbfJHGJd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 02:09:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41966 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbfJHGJd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 02:09:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id q9so17832878wrm.8
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 23:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKAvbyg6nIph8rb1+uPilZlVSUi3nPRSzDY9b3NWOag=;
        b=Jw1pMAkvBXs7hHBXmLvZL/AJlwTFDO5pHZ3N/RpaxNkBUJ/CTf/GDs60YzzOUReexk
         yHkjuqBv5P8JAnOKy88+u7L7t6HKx8jvpXS57z1fl5j1prML/ZPj2t4h6qAcoZ4TF+sp
         wTsLlrn6RsGbIsY37R7WXAb04Oiq4NvwTKnyxx3Pdpw/Mgpdhk+nT9YtBipktaQCZDaH
         8a81nxJw4ElsgsJApUV5ViOShP5qLY7L270kVVcQptmNVuQo9nNzMVFpbb53+cTP81MF
         m7on27ktTX0U1sPXXxs8iYYyCK8WjnZ00E9IyMh5vy1wXdAYjVrClMCHslb0skXoJoQd
         izKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKAvbyg6nIph8rb1+uPilZlVSUi3nPRSzDY9b3NWOag=;
        b=TGC5/TWP6NBfyVAHNCC131QYfyoBwh0FrowodDMFt0ipzOrvm4QoctMgVrounGp6hO
         Aw/+Hwsl3VdsFi6Y6wIxgTZ0k4oNPi3Zgpmek4kj8hH3ZOAvANGTs8K2Dy6IFDE5UHta
         oofqM0aiU9J50V3eLv8KXnXRcfLC809y3/FrySyZ2RVN6Nym6Yw7/fi8KBkMnWu8Pwcf
         Ah1s/USO6FlejLU+D7I9iEglWL4h0Plp0RBMMyVMhN+3DBnkVJPCQmdSze3VEVSuCSKQ
         W+Y1TLgbB3vlggwCn6AavmQjr6gDAOe1FXQxHSvLSqefOdkx7rlkHQCLChzCBd0Se476
         +Hxw==
X-Gm-Message-State: APjAAAXtg0lkqrUcLVQ5hgzgUokQe+qSELvi4X2qwyLD0DO6xOFr/qdX
        cn+d+mhogUvbwIvwxWZorkrUAorr/9xYmA==
X-Google-Smtp-Source: APXvYqzPnwxA9huv4Hzqpy5BFnbGNCmkjXY+H1RSZ/DkREG+xetYlLe7/QpNbZ4kqpYdFPJ4yISevQ==
X-Received: by 2002:a5d:5688:: with SMTP id f8mr27393792wrv.79.1570514970486;
        Mon, 07 Oct 2019 23:09:30 -0700 (PDT)
Received: from dhe-pc.product_development.local (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.googlemail.com with ESMTPSA id o18sm2934753wrw.90.2019.10.07.23.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 23:09:29 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        David Heinzelmann <heinzelmann.david@gmail.com>
Subject: [PATCH v4] usb: hub: Check device descriptor before resusciation
Date:   Tue,  8 Oct 2019 10:09:01 +0200
Message-Id: <20191008080901.17628-1-heinzelmann.david@gmail.com>
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
---
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

