Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD3A2CB90F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 13:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfJDLX6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 07:23:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54268 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730193AbfJDLX6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 07:23:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id i16so5432549wmd.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Oct 2019 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7eQoXTSPInOdrNco46Z8XL9GC6iF7b/HfpfpURVb2nA=;
        b=rCmr2afsf5Gf6lN3p3qYQikiP9CqhXZzAf8VwSi0lck+PlEMIomOez/268fNd7LfFl
         Rz99lgBkKxVhMcC4l5emx95WoGeO9CIZeh+HKh5xhGnN64OY0gsK9hom6Nu1S4a+Fitq
         tnFd/8mTuv/C1y+O5HyX8QqBIR7ahCV6ohZswq/matUXyMSy9wVsJOvKoKKlCzoVTDq+
         h9AHzdp3NV9WFe+AMT0j5DjiYrsgKT5gwNG5H0q+8+xd5vep1FxMDZQAztNHR2fIqseh
         ZazAKDHI8TaxHWhcM0NZCmIZxyFLLPbFaF8EgMwJ+q1P6unACIIMaGygTJecJWsIX6nZ
         SVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7eQoXTSPInOdrNco46Z8XL9GC6iF7b/HfpfpURVb2nA=;
        b=OGgrPorEA5NsTFS4whPI4Iyt/tyQrqgYNQUf1GjN3+VZlvGsX6mqsZ39IZfzNnNzTu
         d+qIxHn7XRZ9WC0+eerWouCuUutTQTeVUkRzH5TsaAbUL3jhe2iAncTX/HccYCezx16E
         O8gM1sXTaTTlLyUpGKiRVAGyAVPYT1R0s5El8vfiywE9jAcI/uM2LUuOyjgwfJrgzSgY
         Y5qsKQMOyXVu21gUIWTBkMdj5Sm3ng/GiOnW3eLsibrbbin3DMCW/HFFdwBzaubmctPs
         myaA21cV1ppp8plW5Hauy69LGHaD9WFqdXgSTF12/vMjCY2tC1wq+Jkx5SeKRKZRSqVe
         ihwg==
X-Gm-Message-State: APjAAAXgTZFSvJ1Yr/7TQUutHRdItWg6rVY4lYCbI2eNJzpssrSZVfYI
        80cWjbccSgpt5lyxq0Y1XchRHMqO7b4=
X-Google-Smtp-Source: APXvYqy0dM8OnUOnEnKjYA9LmpgVnWZ68BjI2kNKrezyeiCVbxOojU4wiyb6AuaIZdttnQ8o/i43kA==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr10857056wmk.84.1570188235333;
        Fri, 04 Oct 2019 04:23:55 -0700 (PDT)
Received: from dhe-pc (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.gmail.com with ESMTPSA id e9sm16527546wme.3.2019.10.04.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 04:23:54 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
X-Google-Original-From: David Heinzelmann <dhe@dhe-pc>
Date:   Fri, 4 Oct 2019 15:23:41 +0200
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     David Heinzelmann <heinzelmann.david@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20191004132341.GA22292@dhe-pc>
References: <20190930072624.GA24182@dhe-pc>
 <Pine.LNX.4.44L0.1909301016100.1477-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1909301016100.1477-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

thank you for the feedback! I hope this time everything is in order.
However, the correct error description is somewhat difficult for me.

Here is the third version:

From 58634d035508b621025da1d866179b59ed0ae37a Mon Sep 17 00:00:00 2001
From: David Heinzelmann <heinzelmann.david@gmail.com>
Date: Fri, 4 Oct 2019 12:28:36 +0200
Subject: [PATCH v3] usb: hub: Check device descriptor before resusciation

If a port connection-change occurs, the connection should not be
resusciated without a prior check if the port connection is enabled.

Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>
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


