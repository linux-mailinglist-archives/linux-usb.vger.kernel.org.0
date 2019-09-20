Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47789B8CFF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 10:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405173AbfITIgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 04:36:42 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51479 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404933AbfITIgm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 04:36:42 -0400
Received: by mail-wm1-f67.google.com with SMTP id 7so1459171wme.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tm6elfu2USw/1A7ExW2dm+z1B2BM6VuDf2IP276+YRI=;
        b=hy13nHOoDE7PjIUvJxWgqRE//+MABct1mlRlbBDdppcFWBLaekAmBqDh7fJ/V4RTbD
         1ZnvQMtySKUlenjrbt3IMNrU/0prPifgrBZPLTpwqqaVv2V651UwGzsg0IxjbItG+8Wq
         5MNljjz9bfEeQvdSBzh58Mo00XQSTJKWUIYMbHlxA+hUJg/azlhl9yBTBlrGOxkjAKmc
         H/3G9ApxiE0SEMmCMMSGI55vJeOwkqMVfd+KugWOLfeaFXHfqET3HeO3BcHaZpMkuV8H
         twkVf/HlDO9aBnUX+Jgpn1ivOaa0bA/c+F/cPGFlKwNPvx3XGbXid+nqIvCbA+SZfuc6
         ceZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tm6elfu2USw/1A7ExW2dm+z1B2BM6VuDf2IP276+YRI=;
        b=BdmgYz039dL2CYhLu6Er7G6yDNQBnVh0Gu0YHambYN4QtqOJIgDyU+W/x3iSx9l2rQ
         4VDMiKfzqPHLcYX4/AkCcu3E45q+YCMDpx8WrA2Zizji6hs0cA+cN70Nf1/NGgaKTZwI
         QodMz6Vq78SaDbJ5rl+kx1//lzx49CU0LOIojdnVyW/4r+CoZeiNBrtfpQlu3gp+9UZH
         /KP3W5PVx/nIARrHLC7bYJ8j+tpM5x1Ny0zThNC5i95ytsHDzuxUUSCMP4D9lW+3FYV7
         ZlbP2afclrNgHlgpb+ZH6TQEYA0E96p2bY0pBdYnMcj6AWFc6lPiICmOVy0zVTudYqbt
         +LcQ==
X-Gm-Message-State: APjAAAVgVxPjJbMkmcL+WkOfvJxE2Q0+ADV3i2f3QnMS8KvfiFxcTcPk
        RJWPH7w5Peu2BlnRL8ukYE4JSDb6
X-Google-Smtp-Source: APXvYqz8dQmkCpXs41vLWWheU4VWWQMRJ3ByK5ZuVojb8E2quuW2RoyVGYIBH2QutJyKesDrVVjGuw==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr2533388wmi.8.1568968598629;
        Fri, 20 Sep 2019 01:36:38 -0700 (PDT)
Received: from dhe-pc.product_development.local (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.googlemail.com with ESMTPSA id u68sm1545242wmu.12.2019.09.20.01.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 01:36:37 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     David Heinzelmann <heinzelmann.david@gmail.com>
Subject: [PATCH] Check for changed device descriptors when a connection-change occurs before validating the connection.
Date:   Fri, 20 Sep 2019 12:36:28 +0200
Message-Id: <20190920103628.5432-1-heinzelmann.david@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a port connection-change occurs the hub driver tries to resuscitate an existing device.
Activated from a firmware download a usb device can re-enumerate with new or changed device
descriptors. Therefore it will be checked for changed device descriptors before the connection
is resuscitated and the connection-change event is ignored.

Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>
---
 drivers/usb/core/hub.c | 181 ++++++++++++++++++++++-------------------
 1 file changed, 96 insertions(+), 85 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 236313f41f4a..a7c0ada6eec4 100644
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
@@ -5167,6 +5252,7 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 {
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_device *udev = port_dev->child;
+	struct usb_device_descriptor descriptor;
 	int status = -ENODEV;
 
 	dev_dbg(&port_dev->dev, "status %04x, change %04x, %s\n", portstatus,
@@ -5188,7 +5274,16 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 	if ((portstatus & USB_PORT_STAT_CONNECTION) && udev &&
 			udev->state != USB_STATE_NOTATTACHED) {
 		if (portstatus & USB_PORT_STAT_ENABLE) {
-			status = 0;		/* Nothing to do */
+			/* Device might have changed firmware (DFU or similar) */
+			descriptor = udev->descriptor;
+			if (usb_get_device_descriptor(udev, sizeof(udev->descriptor)) < 0) {
+				if (descriptors_changed(udev, &descriptor, udev->bos)) {
+					dev_dbg(&udev->dev, "device descriptor has changed\n");
+					udev->descriptor = descriptor;	/* for disconnect() calls */
+				} else {
+					status = 0; /* Nothing to do */
+				}
+			}
 #ifdef CONFIG_PM
 		} else if (udev->state == USB_STATE_SUSPENDED &&
 				udev->persist_enabled) {
@@ -5550,90 +5645,6 @@ void usb_hub_cleanup(void)
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

